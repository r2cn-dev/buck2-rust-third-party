def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        # Default feature is "std" as per Cargo.toml
        return ["std"]
    return [f.strip() for f in features_config.split(",") if f.strip()]

def get_rustc_flags():
    """
    Generate rustc flags based on rustc version.
    This mimics the functionality of the build.rs script.
    """
    flags = []
    
    # Get rustc minor version from config
    rustc_minor = int(read_config("serde", "rustc_minor", "0"))
    
    # 128-bit integers stabilized in Rust 1.26
    if rustc_minor >= 26:
        flags.extend(["--cfg", "integer128"])
    
    # Non-zero integers stabilized in Rust 1.28
    if rustc_minor >= 28:
        flags.extend(["--cfg", "num_nonzero"])
    
    return flags

def get_conditional_deps():
    """
    Get conditional dependencies based on enabled features.
    """
    deps = []
    features = get_rust_features()
    
    # Add serde_derive dependency if derive feature is enabled
    if "derive" in features:
        deps.append("//third-party/rust/crates/serde_derive/1.0.218:serde_derive")
    
    return deps