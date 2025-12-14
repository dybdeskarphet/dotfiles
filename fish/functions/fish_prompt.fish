function fish_prompt
  set_color -o
  echo -n (prompt_pwd)
  set_color normal
  if fish_is_root_user
    echo -n " #"
  else
    echo -n " \$"
  end
  set_color -o "#d8c3ab"
  echo -n "  "
  set_color normal
end
