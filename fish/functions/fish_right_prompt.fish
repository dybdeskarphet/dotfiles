function fish_right_prompt
  if test $status -eq 0
      set status_symbol (set_color blue)(set_color normal)
  else
      set status_symbol (set_color yellow)$status(set_color normal)" "(set_color red)(set_color normal)
  end

  set time (date "+%H:%M:%S")

  echo -n "$status_symbol "
  echo -n $time
  set_color -o yellow
  echo -n (fish_git_prompt)
  set_color normal
end
