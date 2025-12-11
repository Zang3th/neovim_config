return {
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    root_markers = {
        "CMakeLists.txt",
        ".git",
    },
    settings = {
        cmake = {
            buildDirectory = "Build",
        },
    },
}
