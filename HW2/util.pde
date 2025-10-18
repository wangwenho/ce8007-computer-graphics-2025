public void CGLine(float x1, float y1, float x2, float y2) {
    // TODO HW1
    // Please paste your code from HW1 CGLine.

    CGLine_Midpoint(x1, y1, x2, y2);
}

void CGLine_Midpoint(float x1_float, float y1_float, float x2_float, float y2_float) {
    // Midpoint Line Algorithm Implementation

    // Convert to integer for pixel coordinates
    int x1 = (int)x1_float;
    int y1 = (int)y1_float;
    int x2 = (int)x2_float;
    int y2 = (int)y2_float;

    // Calculate differences and steps
    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);
    
    // Determine the direction of the line
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;

    // Check if the line is steep
    boolean interchange = false;
    if (dy > dx) {
        int temp = dx;
        dx = dy;
        dy = temp;
        interchange = true;
    }

    // Initialize the decision parameter
    int p = 2 * dy - dx;
    
    // Starting point
    int x = x1;
    int y = y1;

    // Draw the line
    for (int i = 0; i <= dx; i++) {
        drawPoint(x, y, color(0));

        if (p >= 0) {
            if (interchange) {
                x += sx;
            } else {
                y += sy;
            }
            p -= 2 * dx;
        }
        
        if (interchange) {
            y += sy;
        } else {
            x += sx;
        }
        p += 2 * dy;
    }
}

public boolean outOfBoundary(float x, float y) {
    if (x < 0 || x >= width || y < 0 || y >= height)
        return true;
    return false;
}

public void drawPoint(float x, float y, color c) {
    int index = (int) y * width + (int) x;
    if (outOfBoundary(x, y))
        return;
    pixels[index] = c;
}

public float distance(Vector3 a, Vector3 b) {
    Vector3 c = a.sub(b);
    return sqrt(Vector3.dot(c, c));
}

boolean pnpoly(float x, float y, Vector3[] vertexes) {
    // TODO HW2 
    // You need to check the coordinate p(x,v) if inside the vertices. 
    // If yes return true, vice versa.

    return false;
}

public Vector3[] findBoundBox(Vector3[] v) {
    
    
    // TODO HW2 
    // You need to find the bounding box of the vertices v.
    // r1 -------
    //   |   /\  |
    //   |  /  \ |
    //   | /____\|
    //    ------- r2

    Vector3 recordminV = new Vector3(0);
    Vector3 recordmaxV = new Vector3(999);
    Vector3[] result = { recordminV, recordmaxV };
    return result;

}

public Vector3[] Sutherland_Hodgman_algorithm(Vector3[] points, Vector3[] boundary) {
    ArrayList<Vector3> input = new ArrayList<Vector3>();
    ArrayList<Vector3> output = new ArrayList<Vector3>();
    for (int i = 0; i < points.length; i += 1) {
        input.add(points[i]);
    }

    // TODO HW2
    // You need to implement the Sutherland Hodgman Algorithm in this section.
    // The function you pass 2 parameter. One is the vertexes of the shape "points".
    // And the other is the vertices of the "boundary".
    // The output is the vertices of the polygon.

    output = input;

    Vector3[] result = new Vector3[output.size()];
    for (int i = 0; i < result.length; i += 1) {
        result[i] = output.get(i);
    }
    return result;
}
