if exists('g:sniphpets_symfony_controller_autoload')
    finish
endif

let g:sniphpets_symfony_controller_autoload = 1

" Resolve templates path for the current controller
" For example:
" XBundle\Controller\Admin\BlogController -> 'XBundle:Admin/Blog:'
" AppBundle\Controller\BlogController -> 'admin/blog/' (see best practices)
fun! sniphpets#symfony#controller#resolve_templates_path(...)
    let fqn = a:0 > 1 ? a:1 : sniphpets#fqn()

    let bundle = matchstr(fqn, '[^\\]\+Bundle')

    let path = sniphpets#symfony#controller#full_name(fqn)

    if bundle == sniphpets#settings('symfony_app_bundle')
        let path = substitute(sniphpets#camel_to_snake(path), '/_', '/', 'g')
        let path = path . '/'
    else
        let path = printf('%s:%s:', bundle, path)
    endif

    return path
endf

" Resolve base path for the current controller
" For example:
" App\Controller\Admin\UserProfileController -> @Route("/admin/user-profile")
fun! sniphpets#symfony#controller#base_path(...)
    let fqn = a:0 > 1 ? a:1 : sniphpets#fqn()
    let path = sniphpets#symfony#controller#full_name(fqn)

    let base_path = sniphpets#camel_to_snake(path, '-')

    return base_path
endf

"@Deprecated use sniphpets#symfony#controller#base_path
fun! sniphpets#symfony#controller#resolve_route(...)
    return call('sniphpets#symfony#controller#base_path', a:000)
endf

" Resolve route name prefix for the current controller
" For example:
" AppBundle\Admin\UserProfileController -> 'admin_user_profile_',
fun! sniphpets#symfony#controller#resolve_route_name_prefix(...)
    let fqn = a:0 > 1 ? a:1 : sniphpets#fqn()

    let route_prefix = sniphpets#settings('symfony_route_prefix')
    let parts_delimiter = sniphpets#settings('symfony_route_parts_delimiter', '_')

    let path = sniphpets#symfony#controller#full_name(fqn)
    let parts = map(split(path, '/'), 'sniphpets#camel_to_snake(v:val)')
    let route = join(parts, parts_delimiter) . parts_delimiter

    if route_prefix != ''
        let route = route_prefix . parts_delimiter . route
    endif

    return route
endf

" Returns 'full' controller name
" For example:
" AppBundle\Controller\Admin\BlogController -> 'Admin/Blog'
fun! sniphpets#symfony#controller#full_name(fqn)
    let path = strpart(a:fqn, stridx(a:fqn, '\Controller\') + 12)
    let path = strpart(path, 0, strlen(path) - 10)
    let path = tr(path, '\', '/')

    return path
endf

" Returns template path for current (closest) action
fun! sniphpets#symfony#controller#template()
    let fqn = sniphpets#fqn()

    let controller_path = sniphpets#camel_to_snake(sniphpets#symfony#controller#full_name(fqn))
    let template = sniphpets#camel_to_snake(sniphpets#method())
    let extension = get(g:, 'sniphpets_symfony_template_extension', 'html.twig')

    return printf('%s/%s.%s', controller_path, template, extension)
endf
