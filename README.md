![logo](media/logo.png ':size=200')
## Nim Game Library

[![circleci](https://circleci.com/gh/lmariscal/nimgl.svg?style=svg)](https://circleci.com/gh/lmariscal/nimgl)
[![stars](https://img.shields.io/github/stars/lmariscal/nimgl.svg?style=social&logo=github&label=Stars)](https://github.com/lmariscal/nimgl)
[![buy coffee](https://img.shields.io/badge/buy%20coffee-donate-orange.svg?style=flat-square)](https://buymeacoff.ee/lmariscal)
![last commit](https://img.shields.io/github/last-commit/lmariscal/nimgl.svg?style=flat-square)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](https://github.com/lmariscal/nimgl/blob/master/LICENSE)
[![docs](https://img.shields.io/badge/docs-passing-ff69b4.svg?style=flat-square)](https://nimgl.org/docs/nimgl.html)

NimGL (Nim Game Library) is a collection of bindings for popular APIs, mostly used in computer graphics.

This collection of bindings is heavily inspired by LWJGL3, it enables low level access and it is not a framework, so we highly encourage you to use other game engines if you don't have experience working with low level graphic developments.
We try to keep this bindings as similar to the originals but we do have some usefull toolkits or some variations on functions to help with development.

NimGL is open source and is under the MIT License, we highly encourage every developer that uses it to make improvements and fork them here.

_NimGL is under heavy development so expect drastic changes and improvements_

### Install

You will need nimble to install this library.

```shell
nimble install nimgl
```

After that you can access all the bindings by importing them like.

```nim
import nimgl/<binding>
```

It is currently being developed and tested on

* Windows 10
* Mac High Sierra
* Linux Ubuntu 18.04

### Contribute

I'm only one person and I use this library almost daily for school and personal
projects. If you are missing some extension, procedures, bindings or anything
related, feel free to PR any feature or open an issue with the specification and
if you can some links to the docs so I can have an idea on how to implement it. +
Thank you so much :tada:

Read the [Contribution Guide](https://github.com/lmariscal/nimgl/blob/master/CONTRIBUTING.adoc) for more information.

### Bindings Currently Supported

| Library                 | Description                                                                                                                                                        |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [GLFW](/glfw)           | It provides a simple API for creating windows, contexts and surfaces, receiving input and events.                                                                  |
| [OpenGL](/opengl)       | Open Graphics Library is a cross-language, cross-platform application programming interface for rendering 2D and 3D vector graphics. NimGL supports modern OpenGL. |
| [ImGui](/imgui)         | Bloat-free graphical user interface library (WIP)                                                                                                                  |
| [stb_image](/stb#Image) | Image loading/decoding library (WIP)                                                                                                                               |

### How it Looks

An example that spawns a green window:

```nim
import nimgl/[glfw, opengl]

proc keyProc(window: GLFWWindow, key: GLFWKey, scancode: int32, action: GLFWKeyAction, mods: GLFWKeyMod): void {.cdecl.} =
  if key == keyESCAPE and action == kaPress:
    window.setWindowShouldClose(true)

proc main() =
  assert glfwInit()

  glfwWindowHint(whContextVersionMajor, 4)
  glfwWindowHint(whContextVersionMinor, 1)
  glfwWindowHint(whOpenglForwardCompat, GLFW_TRUE)
  glfwWindowHint(whOpenglProfile, GLFW_OPENGL_CORE_PROFILE)
  glfwWindowHint(whResizable, GLFW_FALSE)

  var w: GLFWWindow = glfwCreateWindow(800, 600, "NimGL", nil, nil)
  if w == nil:
    quit(-1)

  w.setKeyCallback(keyProc)
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
