# HW1

## Grading

### Fundamentals

| # | Content | Score | Finished |
|---|---------|-------|----------|
| 1 | Correctly implement the line algorithm | 25% | ✅ |
| 2 | Correctly implement the circle algorithm | 25% | ✅ |
| 3 | Correctly implement the ellipse algorithm | 15% | ✅ |
| 4 | Correctly implement the curve algorithm | 15% | ✅ |
| 5 | Correctly implement the eraser | 20% | ✅ |

### Bonus

| # | Content | Score | Finished |
|---|---------|-------|----------|
| 1 | Add some features that were not present in this assignment. | 1.5 Semester Score | ❌ |

---

## Implementation Details

### 1. Line Algorithm
- Use Midpoint line algorithm to draw lines.
  - [`CGLine_Midpoint()`](./util.pde)
- Use Bresenham's line algorithm to draw lines.
  - [`CGLine_Bresenham()`](./util.pde)

![gif](assets/line.gif)

![gif](assets/polygon.gif)

![gif](assets/pencil.gif)

---

### 2. Circle Algorithm
- Use Midpoint circle algorithm to draw circles.
  - [`CGCircle_Midpoint()`](./util.pde)

![gif](assets/circle.gif)

---

### 3. Ellipse Algorithm
- Use Midpoint ellipse algorithm to draw ellipses.
  - [`CGEllipse_Midpoint()`](./util.pde)

![gif](assets/ellipse.gif)

---

### 4. Curve Algorithm
- Use Bernstein polynomials to draw curves.
  - [`CGCurve_Bernstein()`](./util.pde)
- Use De Casteljau's algorithm to draw curves.
  - [`CGCurve_DeCasteljau()`](./util.pde)

![gif](assets/curve.gif)

---

### 5. Eraser
- Use white rectangle to cover the area.
  - [`CGEraser()`](./util.pde)

![gif](assets/eraser.gif)

---

## References

### Online Articles
- [Bresenham's line algorithm](https://en.wikipedia.org/wiki/Bresenham's_line_algorithm)
- [Midpoint circle algorithm](https://en.wikipedia.org/wiki/Midpoint_circle_algorithm)
- [Midpoint ellipse drawing algorithm](https://www.geeksforgeeks.org/dsa/midpoint-ellipse-drawing-algorithm/)
- [De Casteljau's algorithm](https://en.wikipedia.org/wiki/De_Casteljau's_algorithm)
- [Splines and Bézier Curves and their application in Video Games](https://www.gameludere.com/2021/05/13/splines-and-bezier-curves-and-their-application-in-video-games/)

### YouTube Videos
- [Bresenham's Line Algorithm - Demystified Step by Step](https://www.youtube.com/watch?v=CceepU1vIKo)
- [Xiaolin Wu's Line Algorithm - Rasterizing Lines with Anti-Aliasing](https://youtu.be/f3Rs20k-hcI?si=TE6w_xqBzCXUgEm9)
- [How Your Computer Draws Lines](https://www.youtube.com/watch?v=8gIhNSAXYcQ)
- [The Midpoint Circle Algorithm Explained Step by Step](https://www.youtube.com/watch?v=hpiILbMkF9w)
- [The Beauty of Bézier Curves](https://youtu.be/aVwxzDHniEw?si=nJNpBHflBWGhet_3)
- [The Continuity of Splines](https://www.youtube.com/watch?v=jvPPXbo87ds)
- [How Computers Draw Curves - Bézier Curves Explained](https://youtu.be/ABBknLY1L4o?si=PJXH_XKN8pI7RFQF)