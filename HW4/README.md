# HW4

## Grading

### Fundamentals
| # | Content | Score | Finished |
|---|---------|-------|----------|
| 1 | Correctly implement the barycentric. | 25% | ✅ |
| 2 | Correctly implement Phong Shading. | 25% | ✅ |
| 3 | Correctly implement Flat Shading. | 25% | ✅ |
| 4 | Correctly implement Gouraud Shading. | 25% | ✅ |

### Bonus
| # | Content | Score | Finished |
|---|---------|-------|----------|
| 1 | Successfully implement Texture Shading OR Done something COOL AND GOOD. | 1.5 Semester Score | ❌ |

---

## Implementation Details

### 1. Barycentric
- Implement the barycentric coordinates with perspective-correct interpolation.
  - [`util::barycentric()`](./util.pde)

---

### 2. Phong Shading
- Implement Phong shading in the shader.
  - [`Material::PhongMaterial`](./Material.pde)
  - [`ColorShader::PhongVertexShader`](./ColorShader.pde)
  - [`ColorShader::PhongFragmentShader`](./ColorShader.pde)

Phong shading calculates the color of each pixel based on the light source, view direction, and surface normal at that pixel.

It provides a more realistic rendering of shiny surfaces compared to flat shading.

![gif](./assets/phong_shading.gif)

---

### 3. Flat Shading
- Implement Flat shading in the shader.
  - [`Material::FlatMaterial`](./Material.pde)
  - [`ColorShader::FlatVertexShader`](./ColorShader.pde)
  - [`ColorShader::FlatFragmentShader`](./ColorShader.pde)

Flat shading calculates the color of a polygon based on the normal of the entire polygon, resulting in a faceted look.

It is computationally less intensive than Phong shading.

![gif](./assets/flat_shading.gif)

---

### 4. Gouraud Shading
- Implement Gouraud shading in the shader.
  - [`Material::GouraudMaterial`](./Material.pde)
  - [`ColorShader::GouraudVertexShader`](./ColorShader.pde)
  - [`ColorShader::GouraudFragmentShader`](./ColorShader.pde)

Gouraud shading calculates the color at each vertex and then interpolates these colors across the surface of the polygon.

It provides a smoother appearance than flat shading but can miss specular highlights.

![gif](./assets/gouraud_shading.gif)

---

### Bonus: Texture Shading OR Something COOL AND GOOD

## References

### Online Articles
- [Shading: Flat vs. Gouraud vs. Phong](https://www.baeldung.com/cs/shading-flat-vs-gouraud-vs-phong)
- [Shading - Computer Graphics from Scratch](https://gabrielgambetta.com/computer-graphics-from-scratch/13-shading.html)


### YouTube Videos
- [Phong, Gouraud, Flat, and Toon shading in OpenGL](https://youtu.be/dHfu3VkoZ5U?si=6Bq4u4OOeEQS9CWG)
- [The Math of Computer Graphics - TEXTURES and SAMPLERS](https://youtu.be/DuQDx0ZIxa8?si=HUctd8ZxqqHeQEtM)