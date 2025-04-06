def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        return []
    return [f.strip() for f in features_config.split(",") if f.strip()]


def get_conditional_deps():
    """
    Get dependencies based on enabled features.
    """
    deps = []
    features = get_rust_features()
    
    # Add serde and serde_derive if serde1 feature is enabled
    if "serde1" in features:
        deps.append("//third-party/rust/crates/serde/1.0.60:serde")
        deps.append("//third-party/rust/crates/serde_derive/1.0.218:serde_derive")
    
    return deps