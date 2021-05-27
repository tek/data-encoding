load("@obazl_rules_ocaml//ocaml:providers.bzl", "OpamConfig", "BuildConfig")

# if this is empty, OBazl fails
opam_pkgs = {
  "json-data-encoding": [],
}

opam = OpamConfig(
    version = "2.0",
    builds = {
        "4.12": BuildConfig(
            default = True,
            switch = "4.12",
            compiler = "4.12",
            packages = opam_pkgs,
            install = True,
        ),
    }
)
