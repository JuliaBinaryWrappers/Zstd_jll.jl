# Autogenerated wrapper script for Zstd_jll for powerpc64le-linux-gnu
export zstd, libzstd, zstdmt

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `zstd`
const zstd_splitpath = ["bin", "zstd"]

# This will be filled out by __init__() for all products, as it must be done at runtime
zstd_path = ""

# zstd-specific global declaration
function zstd(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(zstd_path)
    end
end


# Relative path to `libzstd`
const libzstd_splitpath = ["lib", "libzstd.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libzstd_path = ""

# libzstd-specific global declaration
# This will be filled out by __init__()
libzstd_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libzstd = "libzstd.so.1"


# Relative path to `zstdmt`
const zstdmt_splitpath = ["bin", "zstdmt"]

# This will be filled out by __init__() for all products, as it must be done at runtime
zstdmt_path = ""

# zstdmt-specific global declaration
function zstdmt(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(zstdmt_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Zstd")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global zstd_path = normpath(joinpath(artifact_dir, zstd_splitpath...))

    push!(PATH_list, dirname(zstd_path))
    global libzstd_path = normpath(joinpath(artifact_dir, libzstd_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libzstd_handle = dlopen(libzstd_path)
    push!(LIBPATH_list, dirname(libzstd_path))

    global zstdmt_path = normpath(joinpath(artifact_dir, zstdmt_splitpath...))

    push!(PATH_list, dirname(zstdmt_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

