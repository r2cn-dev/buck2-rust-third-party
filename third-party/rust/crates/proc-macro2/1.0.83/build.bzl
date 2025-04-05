def get_rust_features():
    """
    Get comma-separated features from config and convert to a list.
    Default to proc-macro if none specified, matching Cargo.toml behavior.
    """
    features_config = read_config("rust", "features", "")
    
    if features_config == "":
        return ["proc-macro"]  # Default from Cargo.toml
    return [f.strip() for f in features_config.split(",") if f.strip()]

def get_rustc_flags():
    """
    Generate rustc flags based on configuration parameters.
    This mimics the functionality of the build.rs script.
    """
    flags = []
    features = get_rust_features()
    rustc_minor = int(read_config("proc_macro2", "rustc_minor", "9999"))
    semver_exempt = read_config("proc_macro2", "semver_exempt", "") != ""
    docs_rs = read_config("proc_macro2", "docs_rs", "") != ""
    rustc_bootstrap = read_config("proc_macro2", "rustc_bootstrap", "") != ""
    
    # Handle semver_exempt (set by either procmacro2_semver_exempt or DOCS_RS)
    if semver_exempt or docs_rs:
        flags.extend(["--cfg", "procmacro2_semver_exempt"])
    
    # Handle span_locations
    if semver_exempt or docs_rs or "span-locations" in features:
        flags.extend(["--cfg", "span_locations"])
    
    # Handle no_is_available
    if rustc_minor < 57:
        flags.extend(["--cfg", "no_is_available"])
    
    # Handle no_source_text
    if rustc_minor < 66:
        flags.extend(["--cfg", "no_source_text"])
    
    # Handle no_literal_byte_character and no_literal_c_string
    if rustc_minor < 79:
        flags.extend(["--cfg", "no_literal_byte_character"])
        flags.extend(["--cfg", "no_literal_c_string"])
    
    # Handle proc_macro feature condition
    if "proc-macro" not in features:
        return flags
    
    # Handle wrap_proc_macro
    proc_macro_span = rustc_bootstrap
    
    if proc_macro_span or not semver_exempt:
        flags.extend(["--cfg", "wrap_proc_macro"])
    
    # Handle proc_macro_span
    if proc_macro_span:
        flags.extend(["--cfg", "proc_macro_span"])
    
    # Handle super_unstable
    if semver_exempt and proc_macro_span:
        flags.extend(["--cfg", "super_unstable"])
    
    return flags

def get_env():
    """
    Set environment variables for the build.
    """
    env = {}
    
    # Set environment variables from config
    docs_rs = read_config("proc_macro2", "docs_rs", "")
    if docs_rs:
        env["DOCS_RS"] = docs_rs
    
    rustc_bootstrap = read_config("proc_macro2", "rustc_bootstrap", "")
    if rustc_bootstrap:
        env["RUSTC_BOOTSTRAP"] = rustc_bootstrap
    
    return env