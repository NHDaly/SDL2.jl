cd(joinpath(Pkg.dir(),"SDL2/src/"))

Mix_CloseAudio();  # Harmless if not already open, but open crashes if called twice.
succ = Mix_OpenAudio(Int32(22050), MIX_DEFAULT_FORMAT, Int32(2), Int32(1024) )

#Load the music
aud_files = "examples/audio_example/"
music = Mix_LoadMUS( "$aud_files/beat.wav" );
if (music == C_NULL)
    #error
end
scratch = Mix_LoadWAV( "$aud_files/scratch.wav" );
high = Mix_LoadWAV( "$aud_files/high.wav" );
med = Mix_LoadWAV( "$aud_files/medium.wav" );
low = Mix_LoadWAV( "$aud_files/low.wav" );


Mix_PlayChannel( Int32(-1), med, Int32(0) )
Mix_PlayMusic( music, Int32(-1) )
Mix_PauseMusic()
Mix_ResumeMusic()
