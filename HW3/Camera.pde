public class Camera {
    Matrix4 projection = new Matrix4();
    Matrix4 worldView = new Matrix4();
    int wid;
    int hei;
    float near;
    float far;
    Transform transform;

    Camera() {
        wid = 256;
        hei = 256;
        worldView.makeIdentity();
        projection.makeIdentity();
        transform = new Transform();
    }

    Matrix4 inverseProjection() {
        Matrix4 invProjection = Matrix4.Zero();
        float a = projection.m[0];
        float b = projection.m[5];
        float c = projection.m[10];
        float d = projection.m[11];
        float e = projection.m[14];
        invProjection.m[0] = 1.0f / a;
        invProjection.m[5] = 1.0f / b;
        invProjection.m[11] = 1.0f / e;
        invProjection.m[14] = 1.0f / d;
        invProjection.m[15] = -c / (d * e);
        return invProjection;
    }

    Matrix4 Matrix() {
        return projection.mult(worldView);
    }

    void setSize(int w, int h, float n, float f) {
        // wid = w;
        // hei = h;
        // near = n;
        // far = f;
        
        // TODO HW3
        // This function takes four parameters, which are 
        // the width of the screen, the height of the screen
        // the near plane and the far plane of the camera.
        // Where GH_FOV has been declared as a global variable.
        // Finally, pass the result into projection matrix.

        // Set the camera parameters
        wid = w;
        hei = h;
        near = n;
        far = f;

        // Calculate aspect ratio and field of view in radians
        float aspect = (float)w / (float)h;
        float fovRad = radians(GH_FOV);
        float tanHalfFov = tan(fovRad / 2.0);

        // Create the perspective projection matrix
        projection = Matrix4.Zero();
        projection.m[0] = 1.0f / (aspect * tanHalfFov);
        projection.m[5] = 1.0f / tanHalfFov;
        projection.m[10] = (far + near) / (far - near);
        projection.m[11] = (2.0f * far * near) / (far - near);
        projection.m[14] = -1.0f;
        projection.m[15] = 0.0f;

        // projection = Matrix4.Identity();
    }

    void setPositionOrientation(Vector3 pos, float rotX, float rotY) {

    }

    void setPositionOrientation(Vector3 pos, Vector3 lookat) {
        // TODO HW3
        // This function takes two parameters, which are the position of the camera and
        // the point the camera is looking at.
        // We uses topVector = (0,1,0) to calculate the eye matrix.
        // Finally, pass the result into worldView matrix.

        // Calculate the basis vectors
        Vector3 up = new Vector3(0, 1, 0);
        Vector3 z = Vector3.sub(lookat, pos).unit_vector();
        Vector3 x = Vector3.cross(up, z).unit_vector();
        Vector3 y = Vector3.cross(z, x).unit_vector();

        Matrix4 view = Matrix4.Identity();

        // Set rotation part
        view.m[0] = x.x;
        view.m[1] = y.x;
        view.m[2] = -z.x;
        view.m[4] = x.y;
        view.m[5] = y.y;
        view.m[6] = -z.y;
        view.m[8] = x.z;
        view.m[9] = y.z;
        view.m[10] = -z.z;

        // Set translation part
        view.m[12] = -Vector3.dot(x, pos);
        view.m[13] = -Vector3.dot(y, pos);
        view.m[14] = -Vector3.dot(z, pos);

        worldView = view;

        // worldView = Matrix4.Identity();
    }
}
