if exists('g:sniphpets_symfony_autoload')
    finish
endif

let g:sniphpets_synfony_autoload = 1

fun! sniphpets#symfony#resolve_bundle_namespace(...)
    let fqn = a:0 > 0 ? a:1 : sniphpets#resolve_fqn()
    return substitute(matchstr(fqn, '^.*Bundle\\'), '\\$', '', '')
endf

fun! sniphpets#symfony#resolve_bundle_name(...)
    let fqn = a:0 > 0 ? a:1 : sniphpets#resolve_fqn()
    return substitute(matchstr(fqn, '\v([^\\]+)Bundle\\'), 'Bundle\\$', '', '')
endf
