def get_rustc_flags():
    """
    Determine rustc flags based on target platform.
    
    This mimics the build.rs logic which only sets the library search path
    when the target is x86_64-pc-windows-msvc.
    """
    # Get target platform from config
    target = read_config("rust", "target", "")
    
    # Only add link search path for x86_64-pc-windows-msvc target
    if target == "x86_64-pc-windows-msvc":
        return [
            "-L",
            "native=lib",
        ]
    return []