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

        # autocfg
        "//third-party/rust/crates/autocfg/1.4.0:autocfg",

        # equivalent
        "//third-party/rust/crates/equivalent/1.0.2:equivalent",

        # fny
        "//third-party/rust/crates/fnv/1.0.7:fnv",

        # rustc-std-workspace-core
        "//third-party/rust/crates/rustc-std-workspace-core/1.0.1:rustc-std-workspace-core",

        # lexopt
        "//third-party/rust/crates/lexopt/0.3.0:lexopt",

        # opaque-debug
        "//third-party/rust/crates/opaque-debug/0.3.1:opaque-debug",

        # anstyle
        # Example: `buck2 run //third-party/rust/crates/anstyle/1.0.10:dump-style`
        "//third-party/rust/crates/anstyle/1.0.10:anstyle",
        "//third-party/rust/crates/anstyle/1.0.10:dump-style",

        # zstd-sys
        "//third-party/rust/crates/zstd-sys/2.0.13+zstd.1.5.6:zstd-sys",
        "//third-party/rust/crates/zstd-sys/2.0.14+zstd.1.5.7:zstd-sys",
        # ---

        # zstd-safe
        "//third-party/rust/crates/zstd-safe/7.2.1:zstd-safe",

        # cfg-if
        "//third-party/rust/crates/cfg-if/1.0.0:cfg-if",
        # ---

        # time-core
        "//third-party/rust/crates/time-core/0.1.4:time-core",

        # libc
        "//third-party/rust/crates/libc/0.2.169:libc",
        # ---

        # tinyvec_macros
        "//third-party/rust/crates/tinyvec_macros/0.1.1:tinyvec_macros",

        # try-lock
        "//third-party/rust/crates/try-lock/0.2.5:try-lock",

        # untrusted
        "//third-party/rust/crates/untrusted/0.9.0:untrusted",

        # utf8parse
        "//third-party/rust/crates/utf8parse/0.2.2:utf8parse",

        # openssl-probe
        "//third-party/rust/crates/openssl-probe/0.1.6:openssl-probe",

        # pin-utils
        "//third-party/rust/crates/pin-utils/0.1.0:pin-utils",

        # quick-error
        "//third-party/rust/crates/quick-error/2.0.1:quick-error",

        # scopeguard
        "//third-party/rust/crates/scopeguard/1.2.0:scopeguard",

        # static_assertions
        "//third-party/rust/crates/static_assertions/1.1.0:static_assertions",

        # syn
        # "//third-party/rust/crates/syn/2.0.81",
        # ---

        # Serde
        # "//third-party/rust/crates/serde/1.0.60:serde",
        # ---

        # Serde_derive
        # "//third-party/rust/crates/serde_derive/1.0.218:serde_derive",
        # ---

        # foreign-types
        "//third-party/rust/crates/foreign-types/0.3.2:foreign-types",
        # ---

        # foreign-types-shared/
        "//third-party/rust/crates/foreign-types-shared/0.1.1:foreign-types-shared",
        "//third-party/rust/crates/foreign-types-shared/0.3.1:foreign-types-shared",
        # ---

        # once_cell
        "//third-party/rust/crates/once_cell/1.20.3:once_cell",
        "//third-party/rust/crates/once_cell/1.20.3:once_cell-alloc",
        "//third-party/rust/crates/once_cell/1.20.3:once_cell-std",
        "//third-party/rust/crates/once_cell/1.20.3:once_cell-unstable",
        # "//third-party/rust/crates/once_cell/1.20.3:once_cell-parking_lot",
        "//third-party/rust/crates/once_cell/1.20.3:once_cell-critical-section",
        # "//third-party/rust/crates/once_cell/1.20.3:once_cell-polyfill",
        # "//third-party/rust/crates/once_cell/1.20.3:once_cell-portable-atomic",
        # ---

        # parking_lot_core
        # "//third-party/rust/crates/parking_lot_core/0.9.10:parking_lot_core",
        # ---

        # critical-section
        "//third-party/rust/crates/critical-section/1.1.3:critical-section",
        "//third-party/rust/crates/critical-section/1.1.3:critical-section-std",
        "//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-bool",
        "//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-none",
        "//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-u8",
        "//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-u16",
        "//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-u32",
        "//third-party/rust/crates/critical-section/1.1.3:critical-section-restore-state-u64",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-std",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-restore-state-bool",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-restore-state-none",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-restore-state-u8",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-restore-state-u16",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-restore-state-u32",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-restore-state-u64",
        "//third-party/rust/crates/critical-section/1.2.0:critical-section-restore-state-usize",
        # ---

        # portable-atomic
        # "//third-party/rust/crates/portable-atomic/1.8.0:portable-atomic",

        # Shlex
        "//third-party/rust/crates/shlex/1.3.0:shlex",
        "//third-party/rust/crates/shlex/1.3.0:shlex-no-std",
        # ---

        # version_check
        "//third-party/rust/crates/version_check/0.9.5:version_check",
    ],
    visibility = ["PUBLIC"],
)
