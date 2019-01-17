# Quick Start

## Getting Started

You will need to have [Nimble](https://github.com/nim-lang/nimble) installed and
[Nim](https://nim-lang.org/) 0.19.2 or above.

```shell
nimble install nimgl

```

After that you can access all the bindings by importing them like.

```nim
import nimgl/<binding>
```

## Example Code

The following code spawns a green window with an OpenGL 3.2 Core context. It
also registers a key proc to callback when a key event is called.

```nim
import nimgl/[glfw, opengl]

proc keyProc(window: GLFWWindow, key: GLFWKey, scancode: int32, action: GLFWKeyAction, mods: GLFWKeyMod): void {.cdecl.} =
  if key == keyESCAPE and action == kaPress:
    window.setWindowShouldClose(true)

proc main() =
  assert glfwInit()

  glfwWindowHint(whContextVersionMajor, 3)
  glfwWindowHint(whContextVersionMinor, 2)
  glfwWindowHint(whOpenglForwardCompat, GLFW_TRUE)
  glfwWindowHint(whOpenglProfile, GLFW_OPENGL_CORE_PROFILE)
  glfwWindowHint(whResizable, GLFW_FALSE)

  var w: GLFWWindow = glfwCreateWindow(800, 600, "NimGL", nil, nil)
  if w == nil:
    quit(-1)

  discard w.setKeyCallback(keyProc)
  w.makeContextCurrent()

  assert glInit()

  while not w.windowShouldClose:
    glfwPollEvents()
    glClearColor(0.68f, 1f, 0.34f, 1f)
    glClear(GL_COLOR_BUFFER_BIT)
    w.swapBuffers()

  w.destroyWindow()
  glfwTerminate()

main()
```
