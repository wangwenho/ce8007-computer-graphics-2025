# tasks

## Translation Matrix
Difficulty : ★

```java
Matrix4::makeTrans(Vector3 t)
```

Given a vector $t$, return the transformation matrix representation of translation $t$.

Once you finish the function, you will be able to move your polygon in the inspector.

Our matrix representation is

$$
\begin{bmatrix}
    m[0] & m[1] & m[2] & m[3] \\
    m[4] & m[5] & m[6] & m[7] \\
    m[8] & m[9] & m[10] & m[11] \\
    m[12] & m[13] & m[14] & m[15]
\end{bmatrix}
$$

---

## Rotation Matrix (Z-axis)
Difficulty : ★

```java
Matrix4::makeRotZ(float a)
```

Given a scalar $a$, return the transformation matrix representation of rotation factor $a$ (around z-axis).Once you finish the function, you will be able to rotate your polygon in the inspector.

There is no need for implementing x and y rotation for now, as it will have no effect.

---

## Scaling Matrix
Difficulty : ★

```java
Matrix4::makeScale(Vector3 s)
```

Given a vector $s$, return the transformation matrix representation of scaling vector $s$.Once you finish the function, you will be able to scale your polygon in the inspector.

---

## Is the point inside a shape?
Difficulty : ★★

```java
util::pnpoly(float x, float y, Vector3[] vertexes)
```

Given a point $(x,y)$ and an array of vertices, please implement an algorithm that determines whether the point is inside the polygon defined by the vertices.

Once you have completed the `pnpoly` function, the polygon will be filled with color.

---

## Find the boundary of a polygon
Difficulty : ★

```java
util::findBoundBox(Vector3[] v)
```

Given a point $(x,y)$ and an array of vertices, return the bounding box that surrounding the polygon.Once you have completed the function, the renderer will be accelerated.

---

## Keep the polygon inside the canvas
Difficulty : ★★☆

```java
util::Sutherland_Hodgman_algorithm(Vector3[] points,Vector3[] boundary)
```

Given array of vertices representing a shape and an array of vertices representing a boundary. Return the vertices of the new shape sliced by the boundary.Once you have completed the `Sutherland_Hodgman_algorithm`, the shape will not be drawn outside the canvas.

---

## Bonus: SSAA (Super-Sampling for Anti-Aliasing)
(Optional)Difficulty : ★★★

You may notice that when we zoom in on an image, the edges of the image appear jagged. We can solve this problem using super-sampling, by sampling each pixel 2 * 2 times and comparing the results before and after (here, we don't need to consider sample reuse between pixels). It's important to note that for each sample within a pixel, its own depth value must be maintained. In other words, each pixel needs to maintain a sample list.

In the end, if implemented correctly, your triangles should not have abnormal black edges.