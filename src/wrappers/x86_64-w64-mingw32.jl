# Autogenerated wrapper script for Zstd_jll for x86_64-w64-mingw32
export libzstd, zstd, zstdmt

JLLWrappers.@generate_wrapper_header("Zstd")
JLLWrappers.@declare_library_product(libzstd, "libzstd-1.dll")
JLLWrappers.@declare_executable_product(zstd)
JLLWrappers.@declare_executable_product(zstdmt)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libzstd,
        "bin\\libzstd-1.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        zstd,
        "bin\\zstd.exe",
    )

    JLLWrappers.@init_executable_product(
        zstdmt,
        "bin\\zstdmt.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
