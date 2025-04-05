def get_rust_features():
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        # Default features from Cargo.toml if none specified
        return ["proc-macro"]
    return [f.strip() for f in features_config.split(",") if f.strip()]

def get_proc_macro2_features():
    """
    Get features for proc-macro2 dependency based on our own features.
    """
    features = get_rust_features()
    proc_macro2_features = []
    
    # Add proc-macro feature to proc-macro2 if we have it
    if "proc-macro" in features:
        proc_macro2_features.append("proc-macro")
    
    return proc_macro2_features