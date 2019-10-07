using BinaryProvider # requires BinaryProvider 0.3.0 or later

# Parse some basic command-line arguments
const verbose = "--verbose" in ARGS
const prefix = Prefix(get([a for a in ARGS if a != "--verbose"], 1, joinpath(@__DIR__, "usr")))

# These are the binary objects we care about
products = [
    LibraryProduct(prefix, ["libSDL2", "SDL2"], :libsdl2),
]

dependencies = [
    "build_X11.v1.6.8.jl",
    "build_SDL2.v2.0.10.jl"
]

for dependency in dependencies
    # These packages are available only on Linux and FreeBSD
    platform_key_abi() isa Union{MacOS,Windows} &&
        occursin(r"^build_X11", dependency) &&
        continue

    # it's a bit faster to run the build in an anonymous module instead of
    # starting a new julia process

    # Build the dependencies
    Mod = @eval module Anon end
    Mod.include(dependency)
end

# Finally, write out a deps.jl file
write_deps_file(joinpath(@__DIR__, "deps.jl"), products)
