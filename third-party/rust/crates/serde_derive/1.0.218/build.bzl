def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        return []  # No default features in Cargo.toml
    return [f.strip() for f in features_config.split(",") if f.strip()]