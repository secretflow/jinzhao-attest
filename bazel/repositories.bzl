load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

SECRETFLOW_GIT = "https://github.com/secretflow"

def gen_bazel_version():
    bazel_version_repository(
        name = "bazel_version",
    )

def _store_bazel_version(repository_ctx):
    # for fix grpc compile
    repository_ctx.file("bazel_version.bzl", "bazel_version = \"{}\"".format(native.bazel_version))
    repository_ctx.file("BUILD.bazel", "")

bazel_version_repository = repository_rule(
    implementation = _store_bazel_version,
)

def jinzhao_attest_dependencies():
    _rules_foreign_cc()
    _com_github_grpc_grpc()
    _com_github_rules_proto_grpc()
    _com_github_openssl_openssl()
    _com_github_curl()
    _com_github_madler_zlib()
    _com_github_rapidjson()
    _com_github_cppcodec()

def _rules_foreign_cc():
    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "bcd0c5f46a49b85b384906daae41d277b3dc0ff27c7c752cc51e43048a58ec83",
        strip_prefix = "rules_foreign_cc-0.7.1",
        urls = [
            "https://github.com/bazelbuild/rules_foreign_cc/archive/0.7.1.tar.gz",
        ],
    )

def _com_github_grpc_grpc():
    maybe(
        http_archive,
        name = "com_github_grpc_grpc",
        sha256 = "e18b16f7976aab9a36c14c38180f042bb0fd196b75c9fd6a20a2b5f934876ad6",
        strip_prefix = "grpc-1.45.2",
        type = "tar.gz",
        patches = ["@jinzhao_attest//bazel:patches/grpc-v1.45.2.patch"],
        patch_args = ["-p1"],
        urls = [
            "https://github.com/grpc/grpc/archive/refs/tags/v1.45.2.tar.gz",
        ],
    )

def _com_github_rules_proto_grpc():
    maybe(
        http_archive,
        name = "rules_proto_grpc",
        type = "tar.gz",
        sha256 = "7954abbb6898830cd10ac9714fbcacf092299fda00ed2baf781172f545120419",
        strip_prefix = "rules_proto_grpc-3.1.1",
        urls = [
            "https://github.com/rules-proto-grpc/rules_proto_grpc/archive/refs/tags/3.1.1.tar.gz",
        ],
    )

def _com_github_openssl_openssl():
    maybe(
        http_archive,
        name = "com_github_openssl_openssl",
        sha256 = "dac036669576e83e8523afdb3971582f8b5d33993a2d6a5af87daa035f529b4f",
        type = "tar.gz",
        strip_prefix = "openssl-OpenSSL_1_1_1l",
        urls = [
            "https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1l.tar.gz",
        ],
        build_file = "@jinzhao_attest//bazel:openssl.BUILD",
    )

def _com_github_curl():
    maybe(
        http_archive,
        name = "com_github_curl",
        build_file = "@jinzhao_attest//bazel:curl.BUILD",
        sha256 = "e9c37986337743f37fd14fe8737f246e97aec94b39d1b71e8a5973f72a9fc4f5",
        strip_prefix = "curl-7.60.0",
        urls = [
            "https://github.com/curl/curl/releases/download/curl-7_60_0/curl-7.60.0.tar.gz",
        ],
    )

def _com_github_madler_zlib():
    maybe(
        http_archive,
        name = "zlib",
        build_file = "@jinzhao_attest//bazel:zlib.BUILD",
        strip_prefix = "zlib-1.2.11",
        sha256 = "629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff",
        type = ".tar.gz",
        urls = [
            "https://github.com/madler/zlib/archive/refs/tags/v1.2.11.tar.gz",
        ],
    )

def _com_github_rapidjson():
    maybe(
        http_archive,
        name = "com_github_rapidjson",
        sha256 = "bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e",
        strip_prefix = "rapidjson-1.1.0",
        build_file = "@jinzhao_attest//bazel:rapidjson.BUILD",
        type = "tar.gz",
        urls = [
            "https://github.com/Tencent/rapidjson/archive/v1.1.0.tar.gz",
        ],
    )

def _com_github_cppcodec():
    maybe(
        http_archive,
        name = "cppcodec",
        type = "tar.gz",
        sha256 = "0edaea2a9d9709d456aa99a1c3e17812ed130f9ef2b5c2d152c230a5cbc5c482",
        strip_prefix = "cppcodec-0.2",
        build_file = "@jinzhao_attest//bazel:cppcodec.BUILD",
        urls = [
            "https://github.com/tplgy/cppcodec/archive/refs/tags/v0.2.tar.gz",
        ],
    )
