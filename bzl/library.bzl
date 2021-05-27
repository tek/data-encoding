load(
    "@obazl_rules_ocaml//ocaml:rules.bzl",
    "ocaml_module",
    "ocaml_library",
    "ocaml_ns_library",
    "ocaml_signature",
    "ppx_module",
    "ppx_library",
)

def sig_module(name, struct, sig, sig_src, ppx=False, **kw):
    module = ppx_module if ppx else ocaml_module
    ocaml_signature(name = sig, src = sig_src, **kw)
    module(name=name, struct=struct, sig=sig, **kw)

def lib(modules, name="lib", deps=[], ppx=False, ns=False, **kw):
    library = ppx_library if ppx else (ocaml_ns_library if ns else ocaml_library)
    for (mod_name, mod, sig, sig_src, mod_deps) in modules:
        sig_module(mod_name, mod, sig, sig_src, deps=mod_deps+deps, ppx=ppx, **kw)
    module_targets = [n for (n, m, s, ss, d) in modules]
    library(
        name = name,
        submodules = module_targets,
        visibility = ["//visibility:public"],
    )

def simple_lib(modules, **kw):
    targets = [(m, m + ".ml", m + "_sig", m + ".mli", deps) for (m, deps) in modules]
    return lib(targets, **kw)

def module_set(name, modules, deps = [], **kw):
    for (mod_name, mod_deps) in modules:
        ocaml_module(name=mod_name, struct=mod_name + ".ml", deps = mod_deps + deps, **kw)
    module_targets = [n for (n, d) in modules]
    ocaml_library(
        name = name,
        modules = module_targets,
    )
