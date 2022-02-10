function dashes {
  # check either virtualenv or condaenv variables
  local python_env="${VIRTUAL_ENV:-$CONDA_DEFAULT_ENV}"

  # if there is a python virtual environment and it is displayed in
  # the prompt, account for it when returning the number of dashes
  if [[ -n "$python_env" && "$PS1" = \(* ]]; then
    echo "$(( COLUMNS - ${#python_env} - 3 ))"
  else
    echo $COLUMNS
  fi
}

PS1="%F{239}%\${(l.\$(dashes)..-.)}%F{075}
%F{104}%~\$(git_prompt_info) %F{190}%(!.#.») %F{075}% "
PS2="%{$fg[red]%}» %F{075}"


RPS1="%(?..%{$fg[red]%}%? ↵%F{015})"
if (( $+functions[virtualenv_prompt_info] )); then
  RPS1+='$(virtualenv_prompt_info)'
fi
RPS1+=" %F{239}%n@%m%F{015}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{075} (%F{078}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{214}*%F{015}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{075})%F{015}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" %F{075}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%F{015}"