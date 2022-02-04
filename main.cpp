#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <iostream>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

int main(int argc, char *argv[]){
    SDL_Window*     window = NULL; //SDL Window
    SDL_Surface*    screenSurface = NULL; //SDL Drawing Surface
    
    if(SDL_Init(SDL_INIT_VIDEO) < 0){
        std::cout << "SDL could not initialize! SDL Error: " << SDL_GetError() << std::endl;
        return 1;
    }
    //create Window
    window = SDL_CreateWindow(
            "SDL Tutorial FindSDL2.cmake Module works",
            SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
            SCREEN_WIDTH, SCREEN_HEIGHT,
            0);
    if(window == NULL){
        std::cout << "Window could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    //Get screenSurface from opened window
    screenSurface = SDL_GetWindowSurface(window);

    //Fill Window with a white Screen
    SDL_FillRect(screenSurface, NULL, SDL_MapRGB(screenSurface->format, 0xFF, 0xFF, 0xFF));
    SDL_UpdateWindowSurface(window);

    //Main Game Loop
    bool quit = false;
    SDL_Event e;
    while(!quit){
        //Event Polling
        while(SDL_PollEvent(&e)){
            //Close Window on QUIT Event
            if(e.type == SDL_QUIT){
                quit = true;
            }
        }
    }

    //Quit
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}
