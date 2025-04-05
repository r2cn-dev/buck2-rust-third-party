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