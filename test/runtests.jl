using SimpleDirectMediaLayer
const SDL2 = SimpleDirectMediaLayer
using Base.Test

include("lib/SDL.jl")

if is_apple()
    include("lib/SDL_ttf.jl")
    include("lib/SDL_mixer.jl")
end

# Integration tests
@testset "example1" begin
    include(joinpath("..","src","examples","example1_cairo.jl"))
    @test example1() == 1
    SDL2.Quit()
end
