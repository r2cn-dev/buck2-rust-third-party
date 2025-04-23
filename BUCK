load("@prelude//rust:cargo_package.bzl", "cargo")

cargo.rust_binary(
    name = "rust-third-party",
    edition = "2021",
    srcs = glob(["src/**/*.rs"]),
    crate_root = "src/main.rs",
    deps = [
        # ---
        "//third-party/rust/crates/deno-x86_64-pc-windows-msvc/0.23.0:deno-x86_64-pc-windows-msvc",
        "//third-party/rust/crates/windows_x86_64_msvc/0.53.0:windows_x86_64_msvc",
        "//third-party/rust/crates/windows_x86_64_gnullvm/0.53.0:windows_x86_64_gnullvm",
        "//third-party/rust/crates/windows_x86_64_gnu/0.53.0:windows_x86_64_gnu",
        "//third-party/rust/crates/windows_i686_msvc/0.53.0:windows_i686_msvc",
        "//third-party/rust/crates/windows_i686_gnullvm/0.53.0:windows_i686_gnullvm",
        "//third-party/rust/crates/windows_i686_gnu/0.53.0:windows_i686_gnu",
        "//third-party/rust/crates/windows_aarch64_msvc/0.53.0:windows_aarch64_msvc",
        "//third-party/rust/crates/windows_aarch64_gnullvm/0.53.0:windows_aarch64_gnullvm",
        "//third-party/rust/crates/winapi-i686-pc-windows-gnu/0.4.0:winapi-i686-pc-windows-gnu",
        "//third-party/rust/crates/winapi-x86_64-pc-windows-gnu/0.4.0:winapi-x86_64-pc-windows-gnu",
        "//third-party/rust/crates/winapi/0.3.9:winapi", # --config rust.features=everything,impl-debug,impl-default --config rust.target=i686-pc-windows-gnu
        # ---

        # openssl-
        "//third-party/rust/crates/openssl/0.10.68:openssl",
        # ---
    ],
    visibility = ["PUBLIC"],
)
