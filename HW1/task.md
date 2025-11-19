# tasks

## Line algorithm
Difficulty : ★

```java
util::CGLine(float x1, float y1, float x2, float y2)
```

Given start point $(x_1,y_1)$ and endpoint $(x_2,y_2)$, draw a straight line connecting them.

You can use `drawPoint(x, y, color)` to draw a pixel on the screen at coordinate $(x,y)$ with specified color.

Once you have completed, the line button, polygon button, and pencil button will become functional.

---

## Circle Algorithm
Difficulty : ★

```java
util::CGCircle(float x, float y, float r)
```

Given center point $(x,y)$ and its radius $r$, draw a circle.
You can use `drawPoint(x, y, color)` to draw a pixel on the screen at coordinate $(x,y)$ with specified color.

Once you have completed, the circle button will become functional.

---

## Ellipse Algorithm

Difficulty : ★★

```java
util::CGEllipse(float x, float y,float r1, float r2) 
```

Given a center point $(x,y)$ and its major axis $r_1$, minor axis $r_2$, draw an ellipse.

You can use `drawPoint(x, y, color)` to draw a pixel on the screen at coordinate $(x,y)$ with specified color.

Once you have completed, the ellipse button will become functional.

---

## Bézier Curve Algorithm
Difficulty : ★★

```java
util::CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector4 p4)
```

Given start point $p_1$, endpoint $p_4$, control point $p_2$, $p_3$, draw a bezier curve (or other curve).

You can use `drawPoint(x, y, color)` to draw a pixel on the screen at coordinate $(x,y)$ with specified color.

Once you have completed, the curve button will become functional.

---

## Eraser
Difficulty : ★

```java
util::CGEraser(Vector3 p1, Vector3 p2)
```

Given an area defined by points $p_1$ and $p_2$, clicking the mouse will clear the content of that area.

You can use `drawPoint(x, y, color)` to draw a pixel on the screen at coordinate $(x,y)$ with specified color.

Once you have completed, the eraser button will become functional.

---

## Bonus: Use your imagination
Difficulty : -

Add some features that were not present in this assignment.Feel free to add any additional features without violating the rules.

For example, you can implement:
- a color palette
- more cool and good shanpes
- sprays