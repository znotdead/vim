syn keyword pythonReserved  self
syn keyword pythonBoolean  True False None
syn keyword pythonBuiltinObj NotImplemented Ellipsis
syn match pythonDecorator "^@.*$"
syn keyword pythonStatement  try except finally
if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
 
  HiLink pythonExClass  Exception
  HiLink pythonBoolean    Boolean
  delcommand HiLink
endif

