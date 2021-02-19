# nRF52-DK Starter Project

Template for working with nRF52-DK

To get started:

```sh
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE="../cmake/toolchain-arm-none-eabi.cmake" -G Ninja ..
cmake --build .
```

Installing include-what-you-use (TODO: confirm that this has no errors):

```cmd
cd "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Auxiliary/Build"
vcvars64.bat
cd C:/Tools/
git clone --config core.autocrlf=false https://github.com/llvm/llvm-project.git
cd llvm-project
git checkout llvmorg-11.1.0
mkdir build
cd build
cmake -G "Ninja" -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libcxx;libcxxabi;libunwind;lldb;compiler-rt;lld;polly" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_C_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29333/bin/Hostx64/x64/cl.exe" -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29333/bin/Hostx64/x64/cl.exe" ..
cmake --build .
cd C:/Tools/
git clone https://github.com/include-what-you-use/include-what-you-use.git iwyu
cd iwyu
git checkout 0.15
mkdir build
cd build
cmake -G "Ninja" -DCMAKE_C_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29333/bin/Hostx64/x64/cl.exe" -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29333/bin/Hostx64/x64/cl.exe" -DCMAKE_PREFIX_PATH="C:/Tools/llvm-project/build/" -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
cmake --build . --target install
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
    "cortex-debug.JLinkGDBServerPath": "/usr/bin/JLinkGDBServerCLExe", // Linux
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

NOTES:

marus25.cortex-debug is not supported via WSL. From <https://github.com/Marus/cortex-debug/issues/361>:

```txt
RisinT96 commented

Working with WSL can be tricky, as there are multiple problems:

JLinkGDBServerExe tries to open a GUI box with progress bars when it programs/erases the device, since WSL doesnt have a GUI (no X Server), the jlink software fails.
The solution is to use JLinkGDBServerCLExe, it's a CLI only version.

WSL doesn't have USB passthrough, meaning that even if you manage to launch JLinkGDBServerCLExe, you still won't be able to connect to your device.

The solution is to launch a J-link Remote Server on your windows host, and to launch JLinkGDBServerCLExe with a -ip xxx.xxx.xxx.xxx argument.

As a side note, Microsoft recently announced that they will be adding GUI support to WSL: https://devblogs.microsoft.com/commandline/whats-new-in-the-windows-subsystem-for-linux-september-2020/#gui-apps.
```

<https://www.adafruit.com/product/1947>
