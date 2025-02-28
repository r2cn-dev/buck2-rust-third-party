load("@prelude//rust:cargo_package.bzl", "cargo")

cargo.rust_binary(
    name = "buck2-rust-third-party",
    edition = "2021",
    srcs = glob(["src/**/*.rs"]),
    crate_root = "src/main.rs",
    deps = [
        "//third-party/rust/crates/libc/0.2.169:libc",
        "//third-party/rust/crates/shlex/1.3.0:shlex",
    ],
    visibility = ["PUBLIC"],
)
