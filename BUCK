load("@prelude//rust:cargo_package.bzl", "cargo")

cargo.rust_binary(
    name = "buck2-rust-third-party",
    edition = "2021",
    srcs = glob(["src/**/*.rs"]),
    crate_root = "src/main.rs",
    deps = [
        # zstd-sys
        "//third-party/rust/crates/zstd-sys/2.0.13+zstd.1.5.6:zstd-sys",
        "//third-party/rust/crates/zstd-sys/2.0.14+zstd.1.5.7:zstd-sys",
        # ---

        # zstd-safe
        "//third-party/rust/crates/zstd-safe/7.2.1:zstd-safe",

        # cfg-if
        "//third-party/rust/crates/cfg-if/1.0.0:cfg-if",
        # ---

        # libc
        "//third-party/rust/crates/libc/0.2.169:libc",
        # ---

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
    ],
    visibility = ["PUBLIC"],
)
