if has("autocmd")
  au BufRead,BufNewFile *.mw             set filetype=mediawiki
  au BufRead,BufNewFile *.wiki           set filetype=mediawiki
  au BufRead,BufNewFile *.mediawiki      set filetype=mediawiki
  au BufRead,BufNewFile *.wikipedia.org* set filetype=mediawiki
  au BufRead,BufNewFile *.wikibooks.org* set filetype=mediawiki
  au BufRead,BufNewFile *.wikimedia.org* set filetype=mediawiki
endif
