def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        return ["legacy", "zdict_builder"]  # Default features
    return [f.strip() for f in features_config.split(",") if f.strip()]