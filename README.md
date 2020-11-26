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
    "cortex-debug.JLinkGDBServerPath": "C:/Program Files (x86)/SEGGER/JLink/JLinkGDBServerCL.exe",
    "cortex-debug.armToolchainPath": "C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update/bin",
    "cmake.cmakePath": "C:\\Program Files\\CMake\\bin\\cmake.exe",
    "[makefile]": {
        "editor.renderWhitespace": "all"
    },
    "[cmake]": {
        "editor.tabSize": 2
    },
    "cmakeFormat.args": ["uh... still working on it"],
    "C_Cpp.default.cppStandard": "c++17",
    "C_Cpp.default.cStandard": "c11",
    "C_Cpp.default.intelliSenseMode": "clang-arm",
    "C_Cpp.updateChannel": "Insiders",
    "cmake.configureOnOpen": false,
    "cmake.generator": "Ninja",
    "cmake.configureArgs": [
        "-DENABLE_CLANG_TIDY:BOOL=TRUE"
    ],
    "clang-tidy.lintOnSave": false,
    "clang-tidy.buildPath": "${workspaceFolder}/build"
}
```

TODO:  
Research `ms-vscode.cpptools-extension-pack`
