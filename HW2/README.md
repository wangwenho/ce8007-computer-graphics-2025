# HW2

## Grading

### Fundamentals
| # | Content | Score | Finished |
|---|---------|-------|----------|
| 1 | Correctly implement the 3 transformation matrices. | 20% | ✅ |
| 2 | Correctly implement pnpoly. | 25% | ✅ |
| 3 | Correctly implement the bounding box. | 20% | ✅ |
| 4 | Correctly implement Sutherland Hodgman Algorithm. | 35% | ✅ |

### Bonus
| # | Content | Score | Finished |
|---|---------|-------|----------|
| 1 | Successfully implement SSAA. | 1.5 Semester Score | ✅ |

---

## Implementation Details

### 1. Transformation Matrices
- Implement the translation matrix.
  - [`makeTrans()`](./Matrix4.pde)
- Implement the scaling matrix.
  - [`makeScale()`](./Matrix4.pde)
- Implement the rotation matrix.
  - [`makeRotX()`](./Matrix4.pde)
  - [`makeRotY()`](./Matrix4.pde)
  - [`makeRotZ()`](./Matrix4.pde)

![gif](./assets/demo_1.gif)

---

### 2. Pnpoly
- Implement the pnpoly(ray-casting algorithm) to determine if a point is inside a polygon.
  - [`pnpoly()`](./util.pde)

---

### 3. Bounding Box
- Implement the bounding box algorithm to find the axis-aligned bounding box of a polygon.
  - [`findBoundBox()`](./util.pde)

---

### 4. Sutherland Hodgman Algorithm
- Implement the Sutherland Hodgman algorithm to clip a polygon against a convex clipping window.
  - [`Sutherland_Hodgman_algorithm()`](./util.pde)

![gif](./assets/demo_2.gif)

---

### Bonus. SSAA
- Implement Super Sampling Anti-Aliasing (SSAA) to improve rendering quality.
  - [`Shape.drawShape()`](./Shape.pde)

In line 22 of `Shape.drawShape()`, replace the original code:
```java
for(int i = int(minmax[0].x);i<=minmax[1].x;i++){
    for(int j = int(minmax[0].y);j<=minmax[1].y;j++){
        if(pnpoly(i,j,t_pos)){
            drawPoint(i,j,color(100));
        }
    }
}
```

with the following code to implement 4x SSAA:

```java
for(int i = int(minmax[0].x);i<=minmax[1].x;i++){
    for(int j = int(minmax[0].y);j<=minmax[1].y;j++){
        // Initialize coverage count
        int count = 0;

        // 4x supersampling
        float[][] offsets = {{0.25,0.25},{0.75,0.25},{0.25,0.75},{0.75,0.75}};
        for(int k=0; k<4; k++){
            float sx = i + offsets[k][0];
            float sy = j + offsets[k][1];
            if(pnpoly(sx, sy, t_pos)){
                count++;
            }
        }

        // Draw the pixel with anti-aliasing
        if(count > 0){
            int c = lerpColor(color(250), color(100), count/4.0);
            drawPoint(i, j, c);
        }
    }
}
```

## References

### Online Articles
- [Sutherland–Hodgman algorithm](https://en.wikipedia.org/wiki/Sutherland–Hodgman_algorithm)
- [Supersampling](https://en.wikipedia.org/wiki/Supersampling)

### YouTube Videos
- [Math for Game Developers: Why do we use 4x4 Matrices in 3D Graphics?](https://youtu.be/Do_vEjd6gF0?si=ktVbapxgmtOycc40)
- [Checking if a point is inside a polygon is RIDICULOUSLY simple (Ray casting algorithm) - Inside code](https://youtu.be/RSXM9bgqxJM?si=EhPK27d02Ahtb1I2)
- [Sutherland-Hodgman Polygon Clipping Algorithm](https://youtu.be/S091lKYWbSs?si=3kh2rk4uhglesyU2)
- [What is Anti-Aliasing? - (InfoTopic)](https://youtu.be/iqdVZr-TEHI?si=ajn6wC-bRQ9fWHwr)
