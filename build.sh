cmake -S . -B build/Debug
cmake --build build/Debug
ln -sf build/Debug/compile_commands.json compile_commands.json
