# Information for this Version from this Website
# https://gitlab.kitware.com/cmake/community/-/wikis/doc/tutorials/How-To-Find-Libraries

# try to find package as it is
# find_package(SDL2)

# SDL2 include directory 
find_path(
    SDL2_INCLUDE_DIR
    NAMES "SDL.h"
    PATHS "../lib"
    PATH_SUFFIXES "SDL2")

find_library(
    SDL2_LIBRARY_SDL2
    NAMES "SDL2"
    PATHS "../lib/SDL2/bin"
    )

find_library(
    SDL2_LIBRARY_SDL2image
    NAMES "SDL2_image"
    PATHS "../lib/SDL2/bin"
    )

if(WIN32)
    find_library(
        SDL2_LIBRARY_main
        NAMES "SDL2main"
        PATHS "../lib/SDL2/bin"
        )
    # might have to add -mingw windows library when compiling on windows
endif()

set (SDL2_LIBRARY 
    ${SDL2_LIBRARY_SDL2}
    ${SDL2_LIBRARY_SDL2image}
    ${SDL2_LIBRARY_main}
    )

# include for the following function
include(FindPackageHandleStandardArgs)
# Check for the Variables if all variables are set, find_package will succeed 
find_package_handle_standard_args(SDL2  DEFAULT_MSG
    SDL2_LIBRARY SDL2_INCLUDE_DIR)

# set up Variables to be used in CMake Script
set (SDL2_INCLUDE_DIRS ${SDL2_INCLUDE_DIR})
set (SDL2_LIBRARIES ${SDL2_LIBRARY})



