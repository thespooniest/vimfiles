if exists("current_compiler")
    finish
endif

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let current_compiler = "jslint"
CompilerSet errorformat=%f:%l:%c:\ %trror:\ %m,%A%f:%l:\ %trror:\ %m,%Z%p^,%C%.%#,%-G%.%#
