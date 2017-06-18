#lang scribble/manual
@require[@for-label[literify
                    racket/base
                    racket/format]]

@title{literify}
@author{kludev gmail}

@defmodule[literify]

Default Scribble or scribble/lp2 doesn't allow you to have some code both displayed
and executed at the same time. This library provides several forms to enable
this functionality.

For example, putting the below lines in your scribble document not only displays
it, but also executes it. Displaying and executing code is done by @code{code/eval}:

@racketblock[
\@code/eval[
  (define name "Mike")
  (define age 12)]]

Then later in the document, you can display the code and its output by using
@code{code/print}, @code{code/display}, or @code{code/write}:

@racketblock[
\@code/print[
  (string-append "hello " name)]]

@defform[(code/eval expr ...)]{
  Displays @racket[expr ...] and also evaluates them in the current context.
  If the expressions returns a value, the value will attempted to be rendered
  in the document. If it cannot be rendered, e.g., if it's not a string or
  pictures, the document will fail to be generated.

  This form is usually used to defining valuables, functions, structs, etc. It
  can also be used to display pictures.

  If you want to display the result of some expression, use @racket[code/format] and
  its derivatives.
}

@defform[(code/format formatter expr ...)
         #:contracts ([formatter (any -> string?)])]{
  Displays @racket[expr ...] and also evaluates them. The output of the expressions
  will be formatted by @racket[formatter] and displayed.
}

The below forms are derived from @racket[code/format] and use @racket[~a],
@racket[~v], and @racket[~s] as the @racket[formatter] respectively.

@defform[(code/display expr ...)]
@defform[(code/print expr ...)]
@defform[(code/write expr ...)]
