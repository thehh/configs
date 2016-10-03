if status --is-login
  set PATH $PATH /usr/bin /usr/sbin /usr/local/bin /usr/local/lib /bin /sbin /home/hhorta/Apps/android-studio/bin /opt/Android/Sdk/tools /opt/Android/Sdk/platform-tools /opt/Android/Sdk
end
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
set --export JAVA_HOME /usr/lib/jvm/java-8-oracle
set --export ANDROID_HOME /opt/Android/Sdk
set REACT_EDITOR

set fish_greeting

function fish_greeting
	fortune aLaApp
end

function getme
	axel -n $argv[1] -a $argv[2]
end

function REACT_EDITOR
	eval code
end

function android
	eval android
end

function multi
    terminator --layout=myLayout
end

function sudo --description 'Run command using sudo (use !! for last command)'
  if test (count $argv) -gt 0
      switch $argv[1]
          case '!!'
              if test (count $argv) -gt 1
                  set cmd "command sudo $history[1] $argv[2..-1]"
              else
                  set cmd "command sudo $history[1]"
              end
          case '*'
              set cmd "command sudo $argv"
      end
  else
      set cmd "command sudo fish"
  end
  eval $cmd
end