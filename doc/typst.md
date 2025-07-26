# Typst for Mathematical Documents

Typst is a modern typesetting system that excels at creating documents with extensive mathematical content. This guide focuses on practical techniques for generating PDFs with complex mathematical formulas.

## Basic Math Mode

Mathematical expressions are enclosed in dollar signs:

```typst
$ sum_(k=1)^n k = (n(n+1))/2 $
$ f(x) = (x + 1) / x $
$ delta "if" x <= 5 $
```

Inline math: `$x^2$` and display math:
```typst
$ F_n = round(1 / sqrt(5) phi.alt^n), quad
  phi.alt = (1 + sqrt(5)) / 2 $
```

## Advanced Mathematical Notation

### Fractions and Complex Expressions
```typst
$ (a + b)^2 = a^2 + 2 a b + b^2 $
$ sum^10_(i=1) 1/i = integral_1^infinity 1/x dx $
```

### Matrices
```typst
$ mat(
  1, 2, ..., 10;
  2, 2, ..., 10;
  dots.v, dots.v, dots.down, dots.v;
  10, 10, ..., 10;
) $
```

### Cases and Piecewise Functions
```typst
$ f(x, y) := cases(
  1 "if" (x dot y)/2 <= 0,
  2 "if" x "is even",
  3 "if" x in NN,
  4 "else",
) $
```

### Subscripts and Superscripts
```typst
$x^2$              // Superscript
$x_2$              // Subscript  
$x_(a -> epsilon)$ // Complex subscript
```

## Document Setup for Math-Heavy Content

### Basic Page Configuration
```typst
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2.5cm),
)
#set text(
  font: "New Computer Modern",
  size: 11pt
)
#set par(justify: true, leading: 0.55em)
```

### Math-Specific Settings
```typst
// Better spacing around equations
#show math.equation: set block(above: 1.2em, below: 1.2em)

// Consistent numbering for equations
#set math.equation(numbering: "(1)")
```

## Practical Example: Mathematical Document

```typst
#set page(width: 10cm, height: auto)
#set heading(numbering: "1.")

= Fibonacci Sequence Analysis

The Fibonacci sequence is defined through the recurrence relation:
$ F_n = F_(n-1) + F_(n-2) $

It can also be expressed in closed form:
$ F_n = round(1 / sqrt(5) phi.alt^n), quad
  phi.alt = (1 + sqrt(5)) / 2 $

#let count = 8
#let nums = range(1, count + 1)
#let fib(n) = (
  if n <= 2 { 1 }
  else { fib(n - 1) + fib(n - 2) }
)

The first #count numbers of the sequence are:

#align(center, table(
  columns: count,
  ..nums.map(n => $F_#n$),
  ..nums.map(n => str(fib(n))),
))
```

## Tables with Mathematical Content

```typst
#table(
  columns: (auto, auto, 1fr),
  table.header[Formula][Description][Value],
  [$pi$], [Circle constant], [3.14159...],
  [$e$], [Euler's number], [2.71828...],
  [$phi$], [Golden ratio], [1.61803...],
)
```

## Compilation Commands

Generate PDF from command line:
```bash
typst compile document.typ
typst watch document.typ  # Auto-recompile on changes
```

## Tips for Math-Heavy Documents

1. **Use consistent notation**: Define custom functions for repeated mathematical expressions
2. **Leverage Typst's scripting**: Generate tables and sequences programmatically
3. **Organize complex formulas**: Break long equations across multiple lines
4. **Reference equations**: Use labels `<eq:name>` and references `@eq:name`
5. **Optimize for readability**: Use appropriate spacing and alignment

This focused approach makes Typst particularly powerful for academic papers, research notes, and technical documentation requiring extensive mathematical notation.