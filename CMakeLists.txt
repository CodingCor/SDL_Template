# CMAKE Standard Settings
cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#export compile commands 
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# Variables
set(BUILDNAME SDL_TEMPLATE)

# Project Declaration here 
project (SDL_TEMPLATE VERSION 1.0)

# Add all cmake Modules
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
#include(sdl2)
find_package(SDL2)

# SET SOURCE Files from /src here
set(SOURCES 
    main.cpp
    ) 

# compile executable here
add_executable(${BUILDNAME} ${SOURCES})

# Include all Header files from /include
target_include_directories(${BUILDNAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

# link SDL2 to programm
target_include_directories(${BUILDNAME} PUBLIC ${SDL2_INCLUDE_DIRS})
target_link_libraries(${BUILDNAME} PUBLIC ${SDL2_LIBRARIES})

# Comment: To ship the game in a self contained package use rpath
# set(CMAKE_BUILD_RPATH $ORIGIN)

# Linker Options needed for Windows Builds
if(WIN32)
    target_link_options(${BUILDNAME} PRIVATE -mwin32 -mwindows)
endif()
    

