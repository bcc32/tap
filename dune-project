(lang dune 1.10)
(using fmt 1.0)

(generate_opam_files true)

(name tap)
(version 0.1)
(license MIT)
(maintainers "Aaron L. Zeng <me@bcc32.com>")
(authors "Aaron L. Zeng <me@bcc32.com>")
(source (github bcc32/tap))
(documentation "https://github.com/bcc32/tap")

(package
 (name tap)
 (depends
  (ocaml (>= 4.04.2))
  (base (>= v0.12.0))
  (stdio (>= v0.12.0)))
 (synopsis "Test Anything Protocol for OCaml")
 (description "
TAP, the Test Anything Protocol, is a simple text-based interface between
testing modules in a test harness. TAP started life as part of the test harness
for Perl but now has implementations in C, C++, Python, PHP, Perl, Java,
JavaScript, and others.
"))
