if exists('g:sniphpets_symfony_autoload')
    finish
endif

let g:sniphpets_symfony_autoload = 1

fun! sniphpets#symfony#bundle_namespace(...)
    let fqn = a:0 > 0 ? a:1 : sniphpets#fqn()
    return substitute(matchstr(fqn, '^.*Bundle\\'), '\\$', '', '')
endf

" Returns bundle name
fun! sniphpets#symfony#bundle(...)
    let fqn = a:0 > 0 ? a:1 : sniphpets#fqn()
    return substitute(matchstr(fqn, '\v([^\\]+)Bundle\\'), 'Bundle\\$', '', '')
endf
