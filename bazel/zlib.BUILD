load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "zlib",
    cache_entries = {
        "CMAKE_POSITION_INDEPENDENT_CODE": "ON",
    },
    generate_args = ["-GNinja"],
    lib_source = ":all_srcs",
    out_static_libs = ["libz.a"],
)
