# NAME

Apache2::Filter::Minifier::JavaScript - JavaScript minifying output filter for mod\_perl

# SYNOPSIS

```perl
<LocationMatch "\.js$">
    PerlOutputFilterHandler   Apache2::Filter::Minifier::JavaScript

    # if you need to supplement MIME-Type list
    PerlSetVar                JsMimeType  text/json

    # if you want to explicitly specify the minifier to use
    #PerlSetVar               JsMinifier  JavaScript::Minifier::XS
    #PerlSetVar               JsMinifier  JavaScript::Minifier
    #PerlSetVar               JsMinifier  MY::Minifier::function
</LocationMatch>
```

# DESCRIPTION

`Apache2::Filter::Minifier::JavaScript` is a Mod\_perl2 output filter which
minifies JavaScript using `JavaScript::Minifier` or
`JavaScript::Minifier::XS`.

Only JavaScript documents are minified, all others are passed through
unaltered.  `Apache2::Filter::Minifier::JavaScript` comes with a list of
several known acceptable MIME-Types for JavaScript documents, but you can
supplement that list yourself by setting the `JsMimeType` PerlVar
appropriately (use `PerlSetVar` for a single new MIME-Type, or `PerlAddVar`
when you want to add multiple MIME-Types).

Given a choice, using `JavaScript::Minifier::XS` is preferred over
`JavaScript::Minifier`, but we'll use whichever one you've got available.  If
you want to explicitly specify which minifier you want to use, set the
`JsMinifier` PerlVar to the name of the package/function that implements the
minifier.  Minification functions are expected to accept a single parameter
(the JavaScript to be minified) and to return the minified JavaScript on
completion.  If you specify a package name, we look for a `minify()` function
in that package.

## Caching

Minification does require additional CPU resources, and it is recommended that
you use some sort of cache in order to keep this to a minimum.

Being that you're already running Apache2, though, here's some examples of a
mod\_cache setup:

Disk Cache

```
# Cache root directory
CacheRoot /path/to/your/disk/cache
# Enable cache for "/js/" location
CacheEnable disk /js/
```

Memory Cache

```
# Cache size: 4 MBytes
MCacheSize 4096
# Min object size: 128 Bytes
MCacheMinObjectSize 128
# Max object size: 512 KBytes
MCacheMaxObjectSize 524288
# Enable cache for "/js/" location
CacheEnable mem /js/
```

# METHODS

- handler($filter)

    JavaScript minification output filter.

# AUTHOR

Graham TerMarsch (cpan@howlingfrog.com)

Many thanks to Geoffrey Young for writing `Apache::Clean`, from which several
things were lifted. :)

# COPYRIGHT

Copyright (C) 2007, Graham TerMarsch.  All Rights Reserved.

This is free software; you can redistribute it and/or modify it under the same
license as Perl itself.

# SEE ALSO

- [JavaScript::Minifier](https://metacpan.org/pod/JavaScript%3A%3AMinifier)
- [JavaScript::Minifier::XS](https://metacpan.org/pod/JavaScript%3A%3AMinifier%3A%3AXS)
- [Apache2::Filter::Minifier::CSS](https://metacpan.org/pod/Apache2%3A%3AFilter%3A%3AMinifier%3A%3ACSS)
- [Apache::Clean](https://metacpan.org/pod/Apache%3A%3AClean)
