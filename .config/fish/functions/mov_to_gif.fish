function mov_to_gif
    ffmpeg -i in.mov -vf "fps=10,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 1 output_1.gif
end
