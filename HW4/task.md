# Tasks

## Barycentric Coordinates
Difficulty : ★★★☆

```java
util::barycentric(Vector3 P, Vector4[] verts)
```

For this task, you need to calculate the barycentric coordinates of the point.Given a the three vertices inside a triangle

$A,B,C$(which is passed in as Vector4$AW,BW,CW$ but at the beginning of the code we have converted back to Vector3 for you) and a point P inside the triangle, please interpret these values as the barycentric coordinates α,β,γ of that triangle.

The GameObject will use this function to interpolate the values returned from the vertex shader and pass them to the fragment shader.

Please note, since we are using perspective coordinates, when calculating barycentric coordinates you should perform Perspective-Correct Interpolation on the results; otherwise your answer might be incorrect.

---

## Phong Shading
Difficulty : ★★★★☆

```java
Material::PhongMaterial
ColorShader::PhongVertexShader
ColorShader::PhongFragmentShader
```

In this part, we are going to start writing our own shader.

For Phong shader, we have demonstrated how to use and pass relevant variables, We also have prepared the variables you might need (world coordinates, world normal vectors, light sources, camera positions, point attribute, etc.)

Please use these values to calculate the lighting at that point and return to the GameObject for rendering.

If you need additional requirements, you can modify the code in Material or other part as well, just remember to mention in your report, and follow the rules of course.

Once you finished it, you can see the light interact with the object.

---

## Flat Shading

Difficulty : ★★★★☆

```java
Material::FlatMaterial
ColorShader::FlatVertexShader
ColorShader::FlatFragmentShader
```

Now please complete flat shading.

We have provided basic framework. Please follow the example of Phong Shading, pass in the necessary objects to implement Flat shading.

Tracing the framework code is required. Make sure to do that and write down your discovery in your report.

---

## Gouraud Shading
Difficulty : ★★★★☆

```java
Material::GouraudMaterial
ColorShader::GouraudVertexShader
ColorShader::GouraudFragmentShader
```

Keep going!\
Now please complete Gouraud shading.

What's the difference between these 3 shading methods?