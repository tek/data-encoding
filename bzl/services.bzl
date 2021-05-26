load("//:bzl/library.bzl", "lib")

def services(name, ext):
    native.genrule(
        name = "gen_" + name,
        srcs = ["services." + ext, "uri_services_raw.ml"],
        outs = [name + ".ml"],
        cmd = "$(location //config:exe) $(location services." + ext + ") > $@ && cat $(location uri_services_raw.ml) >> $@",
        tools = ["//config:exe"],
    )

def services_lib(name, services_name):
    services(services_name, name)
    lib(name = name, modules = [(services_name, "gen_" + services_name)], deps = ["//lib:lib-uri"])
