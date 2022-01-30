# CMAKE Standard Settings
cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Variables
set(BUILDNAME SDL_TEMPLATE)

# Project Declaration here 
project (SDL_TEMPLATE VERSION 1.0)

# Add all cmake Modules
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(sdl2)

# SET SOURCE Files from /src here
set(SOURCES 
    main.cpp
    ) 

# compile executable here
add_executable(${BUILDNAME} ${SOURCES})

# Include all Header files from /include
target_include_directories(${BUILDNAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

# link SDL2 to programm
target_include_directories(${BUILDNAME} PUBLIC ${SDL2_INCLUDE})
target_link_libraries(${BUILDNAME} PUBLIC ${SDL2_LIBRARIES})

