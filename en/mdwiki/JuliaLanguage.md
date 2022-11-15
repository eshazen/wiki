# JuliaLanguage
## Help

Type `?x` for help on x.

## Types

 * *Integer*: Int8, Uint8... UInt128
 * *Real*: Float16, Float32, Float64

`typeof(x)` returns a *!DataType* which renders as one of the above

`typemin(T)` and `typemax(T)` return min/max values

`eps(x)` returns floating point precision at x

`nextfloat(x)` and `prevfloat(x)` return (x+eps(x)) and (x-eps(x))

`zero(type)` and `one(type)` produce representation of zero and 1

## Constants

 * *Integer*: 0b1100, 0o177, 0xabcd, 1234, -1234
 * *Real*: 2.5e-4 (Float64), 2.5f-4 (Float32)
 * *Rational*: `2//3` (extract parts with `numerator()` and `denominator`
 * *Complex*: `1 + 2im`
 * *Char*: `'A'`
 * *String*: `"Hello"` or byte-array `b"abc"`

## Expressions

Things like `2x` and `2(x-1)^2` work as you might expect.

Integer division is \div<tab> or "÷"

{>>>} is logical shift

bitwise xor is \xor or "⊻"

Vector operators precede with "." as ` [1,2,3] .* 5`

Conversion with `Int64(3.000)` but must use `Int64(round(3.001))`

### Strings

Strings allow indexing `s[1]` or `s[begin]`, BUT NOTE first character is `s[1]`.  Also range `s[1:3]`.

NOTE that indexes may not be sequential due to Unicode.  See https://docs.julialang.org/en/v1/manual/strings/

Operator `*` concatenates strings, as does `string(s1,s2,s3...)`

Interpolation of any variable as in `"$stuff $bother"` is supported.  Any expression may be interpolated using `"$(expr)"`.

Use triple-quotes for multi-line strings.

### Regular Expressions

Very powerful and complete!  See https://docs.julialang.org/en/v1/manual/strings/#Regular-Expressions

```
  re = r"^(\d+)\s*(\d+)"
  m = match( re, "123 456")
```

`typeof(m)` is "Nothing" for no match

`m.captures` is array of captured values

### Functions

```
  function f(x,y)
    x+y
  end
```

-or-

`  f(x,y) = x+1 `

Functions and binding is a very complex topic in julia!

### Dictionaries

```
  D = Dict( 'a'=>2, 'b'=>3)       # construct
  haskey( D, 'a')                 # check for a key
  true
  D['z'] = 99                     # add a new entry
  delete!( D, 'z')                # delete an entry
  for k in sort(collect(keys(D))) # iterate over keys in order
```


### The printf problem

There's a macro @printf which works, but doesn't take a variable as a format string.

```
  using Printf
  @printf "value: 0x%08x\n", 1234
```

Here's an alternative:

```
  using Printf
  f = Printf.format"%s 0x%06x\n"
  Printf.format( f, "hello", 1234)
  "hello 0x0004d2\\n"
```

### Plots

Install gnuplot:

`   [ add Gnuplot `

Then

```
  using Gnuplot
  y = Vector{Float64}()
  for x = range(0, 2*pi, length=32)
    push!(y,sin(x))
  end
  @gp y "with linesp"
  println("hit return")
  readline()
```

Save to PDF:
```
  save(term="pdfcairo",output="plot.pdf")
```

### CSV files

```
  using CSV
  df = CSV.File( "file.csv", normalizename=true)
  for row in df
    println( row.Quantity)          # Quantity is a column name from the header
  end
  fields = String.( keys( df[1]))   # get list of column names
```


