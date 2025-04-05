def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        # Default features from Cargo.toml if none specified
        return ["proc-macro"]
    return [f.strip() for f in features_config.split(",") if f.strip()]

def get_rustc_flags():
    """
    Get rustc flags based on features.
    """
    flags = []
    
    # Add semver_exempt flag for docs.rs compatibility if needed
    semver_exempt = read_config("proc_macro2", "semver_exempt", "")
    if semver_exempt:
        flags.append("--cfg")
        flags.append("procmacro2_semver_exempt")
    
    return flags