# Nim Game Library

## About

NimGL (Nim Game Library) is a collection of bindings for popular APIs, mostly used in computer graphics.

This collection of bindings is heavily inspired by LWJGL3, it enables low level access and it is not a framework, so we highly encourage you to use other game engines if you don’t have experience working with low level graphics developments.

We try to keep this bindings as similar to the originals but we do have some usefull toolkits or some variations on procedures to help with development and suit it to the language.

## How to Install?
You will need to have [Nimble](https://github.com/nim-lang/nimble) installed and
[Nim](https://nim-lang.org/) 0.19.2 or above.

```shell
nimble install nimgl

```

After that you can access all the bindings by importing them like.

```nim
import nimgl/<binding>
```

Currently being developed and tested on:

* Windows 10
* Mac High Sierra
* Linux Ubuntu 18.04

It should work in other systems, but the ones listed above are "guaranteed" to
work.

## Bindings

### GLFW
GLFW is an Open Source, multi-platform library for OpenGL, OpenGL ES and Vulkan development on the desktop. It provides a simple API for creating windows, contexts and surfaces, receiving input and events.

### OpenGL
Open Graphics Library is a cross-language, cross-platform application programming interface for rendering 2D and 3D vector graphics. The API is typically used to interact with a graphics processing unit, to achieve hardware-accelerated rendering.

### ImGui
Dear ImGui is a bloat-free graphical user interface library for C++. It outputs optimized vertex buffers that you can render anytime in your 3D-pipeline enabled application. It is fast, portable, renderer agnostic and self-contained (no external dependencies).

### STB Image
Image loading/decoding from file/memory: JPG, PNG, TGA, BMP, PSD, GIF, HDR, PIC.

## License

NimGL is using the [MIT](https://github.com/lmariscal/nimgl/blob/master/LICENSE) license.

To learn more we recommend visiting
[choosealicense.com](https://choosealicense.com/licenses/mit/).
