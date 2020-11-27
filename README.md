# nRF52-DK Starter Project

Template for working with nRF52-DK

To get started:

```sh
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE="../cmake/toolchain-arm-none-eabi.cmake" -G Ninja ..
cmake --build .
```

Recommended vscode extensions:

* ms-vscode.cpptools
* twxs.cmake
* ms-vscode.cmake-tools
* dan-c-underwood.arm
* marus25.cortex-debug
* notskm.clang-tidy
* keroc.hex-fmt
* zixuanwang.linkerscript

Recommended extension settings:

```json
{
    "[makefile]": {
        "editor.renderWhitespace": "all"
    },
    "[cmake]": {
        "editor.tabSize": 2
    },
    "cortex-debug.JLinkGDBServerPath": "C:/Program Files (x86)/SEGGER/JLink/JLinkGDBServerCL.exe", // Windows
    "cortex-debug.JLinkGDBServerPath": "/usr/bin/JLinkGDBServerExe", // Linux
    "cortex-debug.armToolchainPath": "C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update/bin", // Windows
    "cortex-debug.armToolchainPath": "/home/4a42/gcc-arm-none-eabi-9-2020-q2-update/bin/", // Linux
    "cmakeFormat.args": ["uh... still working on it"],
    "cmake.cmakePath": "C:\\Program Files\\CMake\\bin\\cmake.exe", // Windows
    "cmake.cmakePath": "/usr/local/bin/cmake", // Linux
    "C_Cpp.default.cppStandard": "c++17",
    "C_Cpp.default.cStandard": "c11",
    "C_Cpp.default.intelliSenseMode": "clang-arm",
    "C_Cpp.updateChannel": "Insiders",
    "cmake.configureOnOpen": false,
    "cmake.generator": "Ninja Multi-Config",
    "cmake.configureArgs": [
        "-DENABLE_CLANG_TIDY:BOOL=TRUE"
    ],
    "clang-tidy.lintOnSave": false,
    "clang-tidy.buildPath": "${workspaceFolder}/build"
}
```

TODO:

* Research `ms-vscode.cpptools-extension-pack`
* cmake-format seems to be broken ever since I upgraded to python 3.9
* investigate compiling+developing on Linux
* output object file size
* look into github actions
* try creating a clang toolchain file
* JLinkGDBServerExe: cannot connect to X server
