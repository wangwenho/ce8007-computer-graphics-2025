public class PhongVertexShader extends VertexShader {
    Vector4[][] main(Object[] attribute, Object[] uniform) {
        Vector3[] aVertexPosition = (Vector3[]) attribute[0];
        Vector3[] aVertexNormal = (Vector3[]) attribute[1];
        Matrix4 MVP = (Matrix4) uniform[0];
        Matrix4 M = (Matrix4) uniform[1];
        Vector4[] gl_Position = new Vector4[3];
        Vector4[] w_position = new Vector4[3];
        Vector4[] w_normal = new Vector4[3];

        for (int i = 0; i < gl_Position.length; i++) {
            gl_Position[i] = MVP.mult(aVertexPosition[i].getVector4(1.0));
            w_position[i] = M.mult(aVertexPosition[i].getVector4(1.0));
            w_normal[i] = M.mult(aVertexNormal[i].getVector4(0.0));
        }

        Vector4[][] result = { gl_Position, w_position, w_normal };

        return result;
    }
}

public class PhongFragmentShader extends FragmentShader {
    Vector4 main(Object[] varying) {
        // Vector3 position = (Vector3) varying[0];
        // Vector3 w_position = (Vector3) varying[1];
        // Vector3 w_normal = (Vector3) varying[2];
        // Vector3 albedo = (Vector3) varying[3];
        // Vector3 kdksm = (Vector3) varying[4];
        // Light light = basic_light;
        // Camera cam = main_camera;

        // TODO HW4
        // In this section, we have passed in all the variables you need.
        // Please use these variables to calculate the result of Phong shading
        // for that point and return it to GameObject for rendering

        Vector3 position = (Vector3) varying[0];
        Vector3 w_position = (Vector3) varying[1];
        Vector3 w_normal = (Vector3) varying[2];
        Vector3 albedo = (Vector3) varying[3];
        Vector3 kdksm = (Vector3) varying[4];
        Light light = basic_light;
        Camera cam = main_camera;

        // Normalize vectors
        Vector3 N = w_normal.unit_vector();
        Vector3 L = light.transform.position.sub(w_position).unit_vector();
        Vector3 V = cam.transform.position.sub(w_position).unit_vector();
        Vector3 R = N.mult(2 * Vector3.dot(N, L)).sub(L).unit_vector();

        // Calculate components
        Vector3 ambient = albedo.mult(0.1);
        float diff = max(Vector3.dot(N, L), 0.0);
        Vector3 diffuse = albedo.mult(kdksm.x * diff * light.intensity);
        float spec = pow(max(Vector3.dot(R, V), 0.0), kdksm.z);
        Vector3 specular = new Vector3(1.0, 1.0, 1.0).mult(kdksm.y * spec * light.intensity);

        // Combine components
        Vector3 final_color = ambient.add(diffuse).add(specular);
        final_color.x = constrain(final_color.x, 0.0, 1.0);
        final_color.y = constrain(final_color.y, 0.0, 1.0);
        final_color.z = constrain(final_color.z, 0.0, 1.0);

        return new Vector4(final_color.x, final_color.y, final_color.z, 1.0);

        // return new Vector4(0.0, 0.0, 0.0, 1.0);
    }
}

public class FlatVertexShader extends VertexShader {
    Vector4[][] main(Object[] attribute, Object[] uniform) {
        // Vector3[] aVertexPosition = (Vector3[]) attribute[0];
        // Matrix4 MVP = (Matrix4) uniform[0];
        // Vector4[] gl_Position = new Vector4[3];

        // TODO HW4
        // Here you have to complete Flat shading.
        // We have instantiated the relevant Material, and you may be missing some
        // variables.
        // Please refer to the templates of Phong Material and Phong Shader to complete
        // this part.

        // Note: Here the first variable must return the position of the vertex.
        // Subsequent variables will be interpolated and passed to the fragment shader.
        // The return value must be a Vector4.

        Vector3[] aVertexPosition = (Vector3[]) attribute[0];
        Vector3[] aVertexNormal = (Vector3[]) attribute[1];
        Matrix4 MVP = (Matrix4) uniform[0];
        Matrix4 M = (Matrix4) uniform[1];
        Vector4[] gl_Position = new Vector4[3];
        Vector4[] w_position = new Vector4[3];
        Vector4[] w_normal = new Vector4[3];

        // Calculate face normal and position
        Vector3 p0 = M.mult(aVertexPosition[0].getVector4(1.0)).xyz();
        Vector3 p1 = M.mult(aVertexPosition[1].getVector4(1.0)).xyz();
        Vector3 p2 = M.mult(aVertexPosition[2].getVector4(1.0)).xyz();
        Vector3 face_normal = Vector3.cross(Vector3.sub(p1, p0), Vector3.sub(p2, p0)).unit_vector();
        
        // Choose face position as the first vertex position
        Vector3 face_position = p0;

        // Set same normal and position for all vertices
        for (int i = 0; i < 3; i++) {
            gl_Position[i] = MVP.mult(aVertexPosition[i].getVector4(1.0));
            w_position[i] = new Vector4(face_position, 1.0); // 全部設一樣
            w_normal[i] = new Vector4(face_normal, 0.0);     // 全部設一樣
        }

        Vector4[][] result = { gl_Position, w_position, w_normal };
        return result;

        // for (int i = 0; i < gl_Position.length; i++) {
        //     gl_Position[i] = MVP.mult(aVertexPosition[i].getVector4(1.0));
        // }

        // Vector4[][] result = { gl_Position };

        // return result;
    }
}

public class FlatFragmentShader extends FragmentShader {
    Vector4 main(Object[] varying) {
        // Vector3 position = (Vector3) varying[0];
        // TODO HW4
        // Here you have to complete Flat shading.
        // We have instantiated the relevant Material, and you may be missing some
        // variables.
        // Please refer to the templates of Phong Material and Phong Shader to complete
        // this part.

        // Note : In the fragment shader, the first 'varying' variable must be its
        // screen position.
        // Subsequent variables will be received in order from the vertex shader.
        // Additional variables needed will be passed by the material later.

        Vector3 position = (Vector3) varying[0];
        Vector3 w_position = (Vector3) varying[1];
        Vector3 w_normal = (Vector3) varying[2];
        Vector3 albedo = (Vector3) varying[3];
        Vector3 kdksm = (Vector3) varying[4];
        Light light = basic_light;
        Camera cam = main_camera;

        // Average normal for flat shading
        Vector3 N = w_normal.unit_vector();
        Vector3 L = light.transform.position.sub(w_position).unit_vector();
        Vector3 V = cam.transform.position.sub(w_position).unit_vector();
        Vector3 R = N.mult(2 * Vector3.dot(N, L)).sub(L).unit_vector();

        // Calculate components
        Vector3 ambient = albedo.mult(0.1);
        float diff = max(Vector3.dot(N, L), 0.0);
        Vector3 diffuse = albedo.mult(kdksm.x * diff * light.intensity);
        float spec = pow(max(Vector3.dot(R, V), 0.0), kdksm.z);
        Vector3 specular = new Vector3(1.0, 1.0, 1.0).mult(kdksm.y * spec * light.intensity);

        // Combine components
        Vector3 final_color = ambient.add(diffuse).add(specular);
        final_color.x = constrain(final_color.x, 0.0, 1.0);
        final_color.y = constrain(final_color.y, 0.0, 1.0);
        final_color.z = constrain(final_color.z, 0.0, 1.0);

        return new Vector4(final_color.x, final_color.y, final_color.z, 1.0);

        // return new Vector4(0.0, 0.0, 0.0, 1.0);
    }
}

public class GouraudVertexShader extends VertexShader {
    Vector4[][] main(Object[] attribute, Object[] uniform) {
        // Vector3[] aVertexPosition = (Vector3[]) attribute[0];
        // Matrix4 MVP = (Matrix4) uniform[0];

        // Vector4[] gl_Position = new Vector4[3];

        // TODO HW4
        // Here you have to complete Gouraud shading.
        // We have instantiated the relevant Material, and you may be missing some
        // variables.
        // Please refer to the templates of Phong Material and Phong Shader to complete
        // this part.

        // Note: Here the first variable must return the position of the vertex.
        // Subsequent variables will be interpolated and passed to the fragment shader.
        // The return value must be a Vector4.

        Vector3[] aVertexPosition = (Vector3[]) attribute[0];
        Vector3[] aVertexNormal = (Vector3[]) attribute[1];
        Vector3 albedo = (Vector3) attribute[2];
        Matrix4 MVP = (Matrix4) uniform[0];
        Matrix4 M = (Matrix4) uniform[1];
        Vector4[] gl_Position = new Vector4[3];
        Vector4[] colors = new Vector4[3];

        // Calculate color at each vertex
        for (int i = 0; i < gl_Position.length; i++) {
            gl_Position[i] = MVP.mult(aVertexPosition[i].getVector4(1.0));
            Vector3 w_pos = M.mult(aVertexPosition[i].getVector4(1.0)).xyz();
            Vector3 w_norm = M.mult(aVertexNormal[i].getVector4(0.0)).xyz().unit_vector();
            Vector3 L = basic_light.transform.position.sub(w_pos).unit_vector();
            Vector3 V = main_camera.transform.position.sub(w_pos).unit_vector();
            Vector3 R = w_norm.mult(2 * Vector3.dot(w_norm, L)).sub(L).unit_vector();

            Vector3 ambient = albedo.mult(0.1); // 用 albedo
            float diff = max(Vector3.dot(w_norm, L), 0.0);
            Vector3 diffuse = albedo.mult(0.5 * diff * basic_light.intensity); // 用 albedo
            float spec = pow(max(Vector3.dot(R, V), 0.0), 20);
            Vector3 specular = new Vector3(1.0, 1.0, 1.0).mult(0.5 * spec * basic_light.intensity);

            Vector3 final_color = ambient.add(diffuse).add(specular);
            final_color.x = constrain(final_color.x, 0.0, 1.0);
            final_color.y = constrain(final_color.y, 0.0, 1.0);
            final_color.z = constrain(final_color.z, 0.0, 1.0);
            colors[i] = new Vector4(final_color.x, final_color.y, final_color.z, 1.0);
        }

        Vector4[][] result = { gl_Position, colors };
        return result;

        // for (int i = 0; i < gl_Position.length; i++) {
        //     gl_Position[i] = MVP.mult(aVertexPosition[i].getVector4(1.0));

        // }

        // Vector4[][] result = { gl_Position };

        // return result;
    }
}

public class GouraudFragmentShader extends FragmentShader {
    Vector4 main(Object[] varying) {
        // Vector3 position = (Vector3) varying[0];

        // TODO HW4
        // Here you have to complete Gouraud shading.
        // We have instantiated the relevant Material, and you may be missing some
        // variables.
        // Please refer to the templates of Phong Material and Phong Shader to complete
        // this part.

        // Note : In the fragment shader, the first 'varying' variable must be its
        // screen position.
        // Subsequent variables will be received in order from the vertex shader.
        // Additional variables needed will be passed by the material later.

        Vector3 position = (Vector3) varying[0];
        Vector4 final_color = (Vector4) varying[1];
        return final_color;

        // return new Vector4(0.0, 0.0, 0.0, 1.0);
    }
}
