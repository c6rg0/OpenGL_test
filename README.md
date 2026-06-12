# README
- This is a GLFW/OpenGL learning project,
- tutorial link: [learnopengl.com](https://learnopengl.com/).

# Build instructions
*NOTE: this will only compile on a UNIX/-like operating system.*

## With nix (the easy way):
1. Have git and nix installed,
2. `$ git clone https://github.com/c6rg0/OpenGL_test.git && cd OpenGL_test`
2. `$ nix build`

## Manually:
1. Have git installed,
2. `$ git clone https://github.com/c6rg0/OpenGL_test.git && cd OpenGL_test`
3. Read the flake.nix and install all dependencies in "nativeBuildInputs" and "buildInputs",
4. and use the command in "buildPhase" to compile the project.

