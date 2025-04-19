def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        # Default features from Cargo.toml
        return ["derive", "parsing", "printing", "clone-impls", "proc-macro"]
    return [f.strip() for f in features_config.split(",") if f.strip()]