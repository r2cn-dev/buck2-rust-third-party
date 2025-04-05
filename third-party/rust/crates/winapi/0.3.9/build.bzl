def get_rust_features():
    """
    Get comma-separated features from config and convert to a list.
    """
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        return []
    return [f.strip() for f in features_config.split(",") if f.strip()]

def get_target_platform():
    """
    Get the current target platform for conditional logic.
    """
    return read_config("rust", "target", "")

def is_windows_target():
    """
    Check if the current target is a Windows platform.
    Similar to the build.rs check: target.get(2) == Some(&"windows")
    """
    target = get_target_platform()
    return target.split("-")[2:3] == ["windows"] if len(target.split("-")) >= 3 else False

def get_winapi_env():
    """
    Get environment variables for winapi build.
    """
    env = {}
    
    # Check if WINAPI_NO_BUNDLED_LIBRARIES is set
    no_bundled = read_config("winapi", "no_bundled_libraries", "")
    if no_bundled:
        env["WINAPI_NO_BUNDLED_LIBRARIES"] = no_bundled
    
    # Check if WINAPI_STATIC_NOBUNDLE is set
    static_nobundle = read_config("winapi", "static_nobundle", "")
    if static_nobundle:
        env["WINAPI_STATIC_NOBUNDLE"] = static_nobundle
    
    # Add environment variables for each feature
    # This mimics the build.rs behavior where it checks CARGO_FEATURE_X
    for feature in get_rust_features():
        upper_feature = feature.upper()
        env[f"CARGO_FEATURE_{upper_feature}"] = "1"
    
    # Always add CARGO_FEATURE_EVERYTHING if "everything" is in features
    if "everything" in get_rust_features():
        env["CARGO_FEATURE_EVERYTHING"] = "1"
    
    return env

def get_target_deps():
    """
    Get target-specific dependencies, similar to Cargo.toml.
    """
    target = get_target_platform()
    deps = []
    
    # i686-pc-windows-gnu dependency
    if target == "i686-pc-windows-gnu":
        deps.append("//third-party/rust/crates/winapi-i686-pc-windows-gnu/0.4.0:winapi-i686-pc-windows-gnu")
    
    # x86_64-pc-windows-gnu dependency
    if target == "x86_64-pc-windows-gnu":
        deps.append("//third-party/rust/crates/winapi-x86_64-pc-windows-gnu/0.4.0:winapi-x86_64-pc-windows-gnu")
    
    return deps