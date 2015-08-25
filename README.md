This bundle contains two packages, `ctablestack` and `luatexbase`. Both are
designed to augument the LuaTeX support provided by the LaTeX kernel
(and available in plain as `ltluatex.tex`). The `ctablestack` package provides
the concept of a push/pop stack for category code tables. The `luatexbase`
package emulates an older package of the same name, most of which has been
directly incorporated into the kernel but where small (interface) segments
are now deprecated but still required to be available as code is modified
to use the new interfaces.
