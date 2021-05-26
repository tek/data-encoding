load("@obazl_rules_ocaml//ocaml:providers.bzl", "OpamConfig", "BuildConfig")

opam_pkgs = {
  # "ocaml": ">= 4.04.0",
  # "dune": ">=  1.2.0",
  # "ounit": "with-test & >=  1.0.2",
  # "ppx_sexp_conv": "with-test & >=  v0.9.0",
  "stringext": ["1.4.0"],
  "angstrom": ["0.14.0"]
}

opam = OpamConfig(
    version = "2.0",
    builds = {
        "1": BuildConfig(
            default = True,
            switch = "4.12",
            compiler = "4.12",
            packages = opam_pkgs,
            install = True,
        ),
    }
)
