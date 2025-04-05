def get_rustc_flags():
    """
    Determine rustc flags based on target platform.
    
    This mimics the build.rs logic which only sets the library search path
    when the target is i686-pc-windows-gnu and WINAPI_NO_BUNDLED_LIBRARIES is not set.
    """
    # Get target platform from config
    target = read_config("rust", "target", "")
    no_bundled = read_config("winapi", "no_bundled_libraries", "")
    
    # Only add link search path for i686-pc-windows-gnu target
    # when WINAPI_NO_BUNDLED_LIBRARIES is not set
    if target == "i686-pc-windows-gnu" and no_bundled == "":
        return [
            "-L",
            "native=lib",
        ]
    return []