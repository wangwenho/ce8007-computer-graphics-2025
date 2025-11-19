# Tasks

## Rotation Matrix (Y-axis)
Difficulty : ★

```java
Matrix4::makeRotY(float a)
```

Given a scalar $a$, return the transformation matrix representation of rotation factor (around y-axis).

Note we use the different coordinate system with some other systems. As we adapt Y-axis to represent up and down, while some systems use z-axis.

---

## Rotation Matrix (X-axis)
Difficulty : ★

```java
Matrix4::makeRotX(float a)
```

Likewise. Try implement transformation matrix of rotating along x-axis.

Of those three rotation matrices, can you tell which is yaw, pitch and row?

---

## Model Transformation (Model Matrix)
Difficulty : ★☆

```java
GameObject::localToWorld()
```

Now we've got `transform.rotation`, `transform.scale` and `transform.position`, how to convert them into homogeneous space (model matrix), which is Matrix4?

Once you complete the steps above, you should be able to control the 3D models in the inspector.

---

## Camera Transformation (View Matrix)
Difficulty : ★★

```java
Camera::setPositionOrientation(Vector3 pos, Vector3 lookat)
```

Given the camera's position (pos) and the position it is looking at (`lookat`), complete the view(eye) matrix of the camera.

---

## Perspective Rendering (Projection Matrix)
Difficulty : ★★☆

```java
Camera::setSize(int w, int h, float n, float f)
```

This method is implement in the Camera class.You need to complete the projection matrix in this section.

Once you complete the steps above, you should be able to control the 3D models freely in the inspector.

---

## Depth Buffer
Difficulty : ★★

```java
util::getDepth(float x, float y, Vector3[] vertex)
```

Given a point $(x, y)$ and an array of vertices representing a face (Triangle).

You need to calculate the depth (z) on the triangle based on the positions x and y.

Once you have completed the getDepth function, the model will be painted with depth buffer.
The result might not be so obvious. Why?

---

## Camera Control
Difficulty : ★★

```java
HW3::cameraControl()
```

Here, you need to implement the functionality to control the camera.

You can choose either using the keyboard or mouse to move the camera.

This task is relatively flexible, you can implement the camera movement whatever you like.

---
## Backculling
Difficulty : ★★

```java
GameObject::debugDraw()
```

Notice we can still see the other side of the model, which shall be blocked by the face we are looking at.

To achieve this, you have to implement "backculling" in `GameObject::DebugDraw` function, you have implement an algorithm that culls the faces that are facing away from the camera. If a face is oriented away from the camera, it should be removed or skipped during the rendering stage.

---

## Bonus: 3D Clipping
Difficulty : ★★★

We can observer that the model will still be rendered outside of the canvas.

Here you will have to implement 3D clipping. you need to clip the line segments that extend beyond the boundaries in the clipping space.
You have to implement this functionality in GameObject class.

There are six planes in the clipping space that require clipping.