(lang dune 3.12)
(using menhir 2.1)

(name proofwriter)

(generate_opam_files true)

(source
 (github deangolan/deangolan.github.io))

(authors "Dean Golan")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name proofwriter)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends js_of_ocaml js_of_ocaml-ppx))
