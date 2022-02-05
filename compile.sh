if [[ $1 == "Release" ]]; then
    echo "Release Build"
    cmake -S . -B build/Release -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build build/Release
    ln -sf build/Release/compile_commands.json compile_commands.json
else
    echo "Debug Build"
    cmake -S . -B build/Debug -G Ninja
    cmake --build build/Debug
    ln -sf build/Debug/compile_commands.json compile_commands.json
fi
