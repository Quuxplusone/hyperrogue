#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([hyperrogue], [10.4g])
AC_LANG([C++])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
CXXFLAGS=""
AC_CONFIG_SRCDIR([hyperpoint.cpp])
#AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX

# Check for which host we are on and setup a few things
# specifically based on the host
AC_CANONICAL_HOST
AM_CONDITIONAL(DARWIN, test ["${host_os#*darwin}" != "$host_os"])

AM_CONDITIONAL(LINUX, test ["${host_os#*linux}" != "$host_os"])

AM_CONDITIONAL(MINGW, test ["${host_os#*mingw}" != "$host_os"])
export wincppflags=""
AS_IF( test ["${host_os#*mingw}" != "$host_os"], [export EXEEXT=".exe"],[])

# Checks for libraries.
AC_CHECK_HEADERS([GL/gl.h], [
  AC_SEARCH_LIBS([glBegin], [GL opengl32], [], AC_MSG_ERROR([OpenGL library was not found]))
], [
  AC_CHECK_HEADERS([OpenGL/gl.h], [
  ], [
    AC_MSG_ERROR([OpenGL was not found])
  ])
])
# FIXME: Replace `main' with a function in `-lSDL':
AC_CHECK_LIB([SDL], [main], [], AC_MSG_ERROR([SDL library was not found]))
# FIXME: Replace `main' with a function in `-lSDL_mixer':
AC_CHECK_LIB([SDL_mixer], [main], [], AC_MSG_ERROR([SDL_mixer library was not found]))
# FIXME: Replace `main' with a function in `-lSDL_gfx':
AC_CHECK_LIB([SDL_gfx], [main], [], [AS_IF( test ["${host_os#*mingw}" != "$host_os"], [export wincppflags=$wincppflags" dll/SDL_gfx.dll" && AC_MSG_RESULT([Building for windows, ignoring])] ,AC_MSG_ERROR([SDL_gfx library was not found]))])
# FIXME: Replace `main' with a function in `-lSDL_ttf':
AC_CHECK_LIB([SDL_ttf], [main], [], [AS_IF( test ["${host_os#*mingw}" != "$host_os"], [export wincppflags=$wincppflags" dll/SDL_ttf.dll" && AC_MSG_RESULT([Building for windows, ignoring])] ,AC_MSG_ERROR([SDL_ttf library was not found]))])
# Test for libpng
AC_SEARCH_LIBS([png_create_info_struct], [png], [], AC_MSG_ERROR([png library was not found]))
# Test for glew
AC_SEARCH_LIBS([glewInit], [GLEW glew32], [], AC_MSG_ERROR([Glew library was not found]))

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h unistd.h])
AC_CHECK_HEADERS([SDL/SDL.h], [], AC_MSG_ERROR([SDL/SDL.h header was not found]))
#AC_CHECK_HEADERS([SDL/SDL_gfx.h], [], [AC_MSG_ERROR([SDL/SDL_gfx.h header was not found])])
AC_CHECK_HEADERS([SDL/SDL_mixer.h], [], AC_MSG_ERROR([SDL/SDL_mixer.h header was not found]))
AC_CHECK_HEADERS([SDL/SDL_ttf.h], [], AS_IF( test ["${host_os#*mingw}" != "$host_os"], [] ,AC_MSG_ERROR([SDL/SDL_ttf.h header was not found])))

AC_SUBST([wincppflags])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
