function fish_right_prompt
  set -l exit_code $status
  if test $exit_code -eq 0
      set status_symbol (set_color "#7BD88F")(set_color normal)
  else
      set status_symbol (set_color "#FCE566")$exit_code(set_color normal)" "(set_color "#FC618D")(set_color normal)
  end

  set time (date "+%H:%M:%S")

  echo -n "$status_symbol "
  echo -n $time
  set_color -o "#FCE566"
  echo -n (fish_git_prompt)
  set_color normal
end
