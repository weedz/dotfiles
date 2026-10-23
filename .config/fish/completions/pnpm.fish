###-begin-pnpm-completion-###
function __pnpm_completion
  set -lx SHELL fish
  set -lx COMP_LINE (commandline -cp)
  set -lx COMP_POINT (string length -- $COMP_LINE)
  set -l tokens (commandline -opc)
  set -l current (commandline -ct)
  if test (count $tokens) -eq 0
    set -a tokens "$current"
  else if test "$tokens[-1]" != "$current"
    set -a tokens "$current"
  end
  pnpm completion-server -- $tokens
end
complete -c pnpm -f -a "(__pnpm_completion)"
complete -c pn -f -a "(__pnpm_completion)"
###-end-pnpm-completion-###
