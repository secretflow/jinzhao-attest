load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

def occlum_cc_library(
        linkopts = [],
        copts = [],
        deps = [],
        **kargs):
    cc_library(
        linkopts = linkopts,
        copts = ["-DENV_TYPE_OCCLUM"] + copts,
        deps = ["@com_github_openssl_openssl//:openssl"] + deps,
        **kargs
    )