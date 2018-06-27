set PATH=C:\%MSYS2_DIR%\%MSYSTEM%\bin;C:\%MSYS2_DIR%\usr\bin;%PATH%
pacman --noconfirm --noprogressbar -Syu
pacman --noconfirm --noprogressbar -Sy base-devel automake autoconf
pacman --noconfirm --noprogressbar -Sy mingw-w64-x86_64-SDL mingw-w64-x86_64-SDL_gfx mingw-w64-x86_64-SDL_mixer mingw-w64-x86_64-SDL_ttf
pacman --noconfirm --noprogressbar -Sy mingw-w64-x86_64-glew
bash -c "autoreconf -vi"
bash -c "./configure"
bash -c "make"
