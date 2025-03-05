"""Build configuration module for zstd-sys crate.

This module provides functionality for configuring Rust features and standard library
support for the zstd-sys crate build process. It handles feature flag management and
platform-specific configurations.
"""

def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        return ["legacy", "zdict_builder"]  # Default features
    return [f.strip() for f in features_config.split(",") if f.strip()]


def get_std_feature():
    """Determines whether the std feature should be enabled based on target platform.
    
    Checks the target architecture and OS to decide if the standard library feature
    should be enabled. Currently enables std for wasm32 architecture or hermit OS.
    
    ```rust
    let target_arch =
        std::env::var("CARGO_CFG_TARGET_ARCH").unwrap_or_default();
    let target_os = std::env::var("CARGO_CFG_TARGET_OS").unwrap_or_default();

    if target_arch == "wasm32" || target_os == "hermit" {
        cargo_print(&"rustc-cfg=feature=\"std\"");
    }
    ```

    Returns:
        A list containing "std" if the feature should be enabled, empty list otherwise.
    """
    arch = read_config("target", "arch", "")
    os = read_config("target", "os", "")
    
    # Enable std feature for wasm32 or hermit OS targets
    if arch == "wasm32" or os == "hermit":
        return ["std"]
    return []

def zstd_features(features: list[str]) -> list[str]:
    """Generates zstd compilation flags based on enabled features.
    
    Takes a list of enabled features and returns corresponding zstd compilation flags.
    Handles features like multithreading, legacy support, thin mode, and assembly
    optimizations.

    Args:
        features: List of enabled feature strings to configure zstd compilation

    Returns:
        List of C compilation flags needed for the requested features
    """
    flags = []
    if "zstdmt" in features:
        flags.append("-DZSTD_MULTITHREAD")
    if "legacy" in features:
        flags += ["-DZSTD_LEGACY_SUPPORT=1", "-Izstd/lib/legacy"]
    if "thin" in features:
        flags += [
            "-DHUF_FORCE_DECOMPRESS_X1",
            "-DZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT",
            "-DZSTD_NO_INLINE",
            "-DZSTD_STRIP_ERROR_STRINGS",
            "-DDYNAMIC_BMI2=0",
        ]
    if "no_asm" in features:
        flags.append("-DZSTD_DISABLE_ASM")
    return flags