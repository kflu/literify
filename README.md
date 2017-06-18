# literify

```racket
 (require literify) package: literify
```

Default Scribble or scribble/lp2 doesn’t allow you to have some code
both displayed and executed at the same time. This library provides
several forms to enable this functionality.

For example, putting the below lines in your scribble document not only
displays it, but also executes it. Displaying and executing code is done
by `code/eval`:

```racket
@code/eval[           
  (define name "Mike")
  (define age 12)]    
```

Then later in the document, you can display the code and its output by
using `code/print`, `code/display`, or `code/write`:

```racket
@code/print[                    
  (string-append "hello " name)]
```

```racket
(code/eval expr ...)
```

Displays `expr ...` and also evaluates them in the current context. If
the expressions returns a value, the value will attempted to be rendered
in the document. If it cannot be rendered, e.g., if it’s not a string or
pictures, the document will fail to be generated.

This form is usually used to defining valuables, functions, structs,
etc. It can also be used to display pictures.

If you want to display the result of some expression, use `code/format`
and its derivatives.

```racket
(code/format formatter expr ...)
                                
  formatter : (any -> string?)  
```

Displays `expr ...` and also evaluates them. The output of the
expressions will be formatted by `formatter` and displayed.

The below forms are derived from `code/format` and use `~a`, `~v`, and
`~s` as the `formatter` respectively.

```racket
(code/display expr ...)
```

```racket
(code/print expr ...)
```

```racket
(code/write expr ...)
```
