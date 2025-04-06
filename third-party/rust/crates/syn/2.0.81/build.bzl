def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        # Default features from Cargo.toml
        return ["derive", "parsing", "printing", "clone-impls", "proc-macro"]
    return [f.strip() for f in features_config.split(",") if f.strip()]

def get_conditional_deps():
    """
    Get conditional dependencies based on enabled features.
    """
    deps = [
        "//third-party/rust/crates/proc-macro2/1.0.83:proc-macro2",
        "//third-party/rust/crates/unicode-ident/1.0:unicode-ident",
    ]
    
    features = get_rust_features()
    
    # Add quote dependency if printing feature is enabled
    if "printing" in features:
        deps.append("//third-party/rust/crates/quote/1.0.35:quote")
    
    return deps