# frozen_string_literal: true

def step(description)
  description = "-- #{description} "
  description = description.ljust(80, '-')
  puts
  puts "\e[32m#{description}\e[0m"
end

def lvim_exists?
  File.exist?(File.expand_path('~/.local/share/lunarvim'))
end

def brew(package)
  sh "brew install #{package}"
end

def asdf(package)
  sh "asdf plugin add #{package}"
  sh "asdf install #{package} latest"
  sh "asdf global #{package} latest"
end

def backup_config(from, to)
  backup = File.expand_path("#{Dir.pwd}/.orig")

  return unless File.exist?(to) || File.symlink?(to)

  if File.symlink?(to)
    link_from = File.readlink(to)
    return if link_from == from

    rm to
  else
    mkdir backup unless File.exist?(backup)
    mv to, backup, verbose: true
  end
end

def link_config(name, config_dir = '.config')
  from = File.expand_path("#{Dir.pwd}/#{name}")
  to = File.expand_path("~/#{config_dir}/#{name}")
  backup_config from, to
  ln_s from, to, verbose: true
end

def zsh_sources(name)
  source = "[[ -f \"~/.config/zsh/#{name}.zsh\" ]] && . \"~/.config/zsh/#{name}.zsh\""
  File.open(File.expand_path('~/.zshrc'), 'a+') do |file|
    puts file.readlines
    file.write(source) unless file.readlines.include?(source)
  end
end

task :brew do
  step 'Install Alacritty'
  brew 'alacritty'

  step 'Install NVIM'
  brew 'nvim'

  step 'Install ASDF'
  brew 'asdf'

  step 'Install lsd'
  brew 'lsd'

  step 'Install gnu-sed'
  brew 'gnu-sed'

  step 'Install starship'
  brew 'starship'

  step 'Install tmux'
  brew 'tmux'
end

task :asdf do
  step 'Configure ASDF for python node and rust'
  asdf 'python'
  asdf 'ruby'
  asdf 'nodejs'
  asdf 'rust'
end

task :default do
  step 'Git Submodule'
  sh 'git submodule update --init'

  step 'Check brew exist...'
  sh 'brew --version'
  Rake::Task['brew'].invoke
  Rake::Task['asdf'].invoke

  step 'Install Nightly LunarVim'
  unless lvim_exists?
    sh 'curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | sh'
  end
  step 'Cleaning up old LunarVim'
  sh 'rm -rf ~/.local/share/lunarvim.old'
  sh 'rm -rf ~/.cache/lvim.old'

  step 'Linking config'
  link_config 'alacritty'
  link_config 'lsd'
  link_config 'zsh'
  link_config 'lvim'
  link_config 'tmux'
  link_config '.zshrc', '.'
end
