#module SDL2

#export SDL_WINDOW_SHOWN, SDL_CreateWindow

# package code goes here

println(Pkg.dir())
cd(Pkg.dir()*"/SDL2/src/")

libDir = Pkg.dir()*"/SDL2/lib"
const libSDL = "$libDir/libSDL2.dylib"
const SDL_ttf = "$libDir/libSDL2_ttf.dylib"
const SDL_mixer = "$libDir/libSDL2_ttf.dylib"

include("lib/SDL.jl")
include("lib/SDL_ttf.jl")
include("lib/SDL_ttf.jl")

SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, 16)
SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, 16)
SDL_Init(UInt32(SDL_INIT_VIDEO))

TTF_Init()

#win = SDL_CreateWindow("Hello World!", Int32(100), Int32(100), Int32(800), Int32(600), Int32(SDL_WINDOW_SHOWN))
#SDL_SetWindowResizable(win,true)
#
#renderer = SDL_CreateRenderer(win, Int32(-1), Int32(SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC))

import Base.unsafe_convert
unsafe_convert(::Type{Ptr{SDL_RWops}}, s::String) = SDL_RWFromFile(s, "rb")
SDL_LoadBMP(src::String) = SDL_LoadBMP_RW(src,Int32(1))

#bkg = SDL_Color(200, 200, 200, 255)
#
#font = TTF_OpenFont("../assets/fonts/FiraCode/ttf/FiraCode-Regular.ttf", 14)
##font = TTF_OpenFont("../assets/fonts/Bitstream-Vera-Sans-Mono/VeraMono.ttf", 23)
#
#txt = "@BinDeps.install Dict([ (:glib, :libglib) ])"
#
#text = TTF_RenderText_Blended(font, txt, SDL_Color(20,20,20,255))
#tex = SDL_CreateTextureFromSurface(renderer,text)
#
#fx,fy = Int[1], Int[1]
#TTF_SizeText(font, txt, pointer(fx), pointer(fy))
#fx,fy = fx[1],fy[1]
#
##img = SDL_LoadBMP("LB2951.jpg")
##tex = SDL_CreateTextureFromSurface(ren, img)
##SDL_FreeSurface(img)
#
#for i = 1:200
#    x,y = Int[1], Int[1]
#
#    # Set render color to red ( background will be rendered in this color )
#    SDL_SetRenderDrawColor(renderer, 200, 200, 200, 255)
#    SDL_RenderClear(renderer)
#
#    SDL_PumpEvents()
#    SDL_GetMouseState(pointer(x), pointer(y))
#
#    rect = SDL_Rect(1,1,200,200)
#
#    SDL_SetRenderDrawColor(renderer, 20, 50, 105, 255)
#    SDL_RenderDrawLine(renderer,0,0,100,100)
#
#    SDL_RenderFillRect(renderer, pointer_from_objref(rect) )
#    SDL_RenderCopy(renderer, tex, C_NULL, pointer_from_objref(SDL_Rect(x[1],y[1],fx,fy)))
#
#    SDL_RenderPresent(renderer)
#    sleep(0.001)
#end
##SDL_Quit()

#end # module
