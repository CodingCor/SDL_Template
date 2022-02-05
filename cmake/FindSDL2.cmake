# Information for this Version from this Website

# SDL2 include directory 
find_path(
    SDL2_TMP_INCLUDE_DIR
    NAMES SDL2/SDL.h
    HINTS "${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2/include/"
    )

# Finding all Libraries
find_library(
    SDL2_TMP_LIBRARY_SDL2
    NAMES "SDL2"
    PATHS "${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2/bin"
    )

find_library(
    SDL2_TMP_LIBRARY_SDL2image
    NAMES "SDL2_image"
    PATHS "${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2/bin"
    )

# For Windows the SDL2_main lib is needed
if(WIN32)
    # Also link to mingw32 if using mingw
    if(MINGW)
        set(SDL2_TMP_LIBRARY_MINGW "mingw32")
    endif()
    find_library(
        SDL2_TMP_LIBRARY_main
        NAMES "SDL2main"
        PATHS "${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2/bin"
        )
endif()

# Add all Libraries in correct Order
set (SDL2_TMP_LIBRARY 
    ${SDL2_TMP_LIBRARY_MINGW}
    ${SDL2_TMP_LIBRARY_main}
    ${SDL2_TMP_LIBRARY_SDL2}
    ${SDL2_TMP_LIBRARY_SDL2image}
    )

# include for the following function
include(FindPackageHandleStandardArgs)
# Check for the Variables if all variables are set, find_package will succeed 
find_package_handle_standard_args(SDL2  DEFAULT_MSG
    SDL2_TMP_LIBRARY SDL2_TMP_INCLUDE_DIR)

# set up Variables to be used in CMake Script
set (SDL2_INCLUDE_DIRS ${SDL2_TMP_INCLUDE_DIR})
set (SDL2_LIBRARIES ${SDL2_TMP_LIBRARY})



