test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

set -g fish_user_paths "/Users/peter/.bin" $fish_user_paths
set -g fish_user_paths "/usr/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/node@16" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sphinx-doc/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/python@3.8/bin" $fish_user_paths
set -g fish_user_paths "/Users/peter/.git-fuzzy/bin/" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/elasticsearch@6/bin" $fish_user_paths

set -gx LDFLAGS "-L/usr/local/opt/node@16/lib -L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/node@16/include -I/usr/local/opt/openssl/include"

set -U __done_min_cmd_duration 10000
