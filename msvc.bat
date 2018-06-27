call "%MSVC_SETUP_PATH%" %MSVC_SETUP_ARG%

cd %APPVEYOR_BUILD_FOLDER%
md SDL-install & cd SDL-install
md include & md include\SDL
md lib
powershell Invoke-WebRequest -OutFile SDL.zip -Uri https://www.libsdl.org/release/SDL-devel-1.2.15-VC.zip
powershell Invoke-WebRequest -OutFile SDL_mixer.zip -Uri https://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-devel-1.2.12-VC.zip
powershell Invoke-WebRequest -OutFile SDL_ttf.zip -Uri https://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-devel-2.0.11-VC.zip
unzip SDL.zip
move SDL-1.2.15\include\*.h include\SDL\
move SDL-1.2.15\lib\x64\*.* lib\
unzip SDL_mixer.zip
move SDL_mixer-1.2.12\include\*.h include\SDL\
move SDL_mixer-1.2.12\lib\x64\*.* lib\
unzip SDL_ttf.zip
move SDL_ttf-2.0.11\include\*.h include\SDL\
move SDL_ttf-2.0.11\lib\x64\*.* lib\

cd %APPVEYOR_BUILD_FOLDER%
md GL-install & cd GL-install
md include & md include\GL
md lib
powershell Invoke-WebRequest -OutFile GLEW.zip -Uri https://github.com/nigels-com/glew/releases/download/glew-2.1.0/glew-2.1.0-win32.zip
unzip GLEW.zip
move glew-2.1.0\include\GL\* include\GL\
move glew-2.1.0\lib\Release\x64\* lib\

cd %APPVEYOR_BUILD_FOLDER%
cl /std:c++latest /W2 /WX /EHsc langen.cpp
.\langen.exe > language-data.cpp
cl /std:c++latest /W2 /WX /EHsc /I GL-install\include /I SDL-install\include /DWINDOWS=1 /DCAP_SDLGFX=0 /DCAP_PNG=0 hyper.cpp
