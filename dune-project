(lang dune 3.12)
(using menhir 2.1)

(name proofwriter)

(generate_opam_files false)

(source
 (github deangolan/deangolan.github.io))

(authors "Dean Golan")

(license BSD-3-Clause)

(package
 (name proofwriter)
 (synopsis "Simple webpage for verifying propositional logic proofs.")
 (depends js_of_ocaml js_of_ocaml-ppx))
