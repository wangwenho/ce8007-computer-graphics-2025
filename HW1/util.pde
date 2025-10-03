public void CGLine(float x1, float y1, float x2, float y2) {
    // TODO HW1
    // You need to implement the "line algorithm" in this section.
    // You can use the function line(x1, y1, x2, y2); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    // For instance: drawPoint(114, 514, color(255, 0, 0)); signifies drawing a red
    // point at (114, 514).

    /*
     stroke(0);
     noFill();
     line(x1,y1,x2,y2);
    */

    // CGLine_BuildIn(x1, y1, x2, y2);
    CGLine_Midpoint(x1, y1, x2, y2);
    // CGLine_Bresenham(x1, y1, x2, y2);
}

void CGLine_BuildIn(float x1, float y1, float x2, float y2) {
    // Built-in Line Function Implementation

    stroke(0);
    noFill();
    line(x1, y1, x2, y2);
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

void CGLine_Bresenham(float x1_float, float y1_float, float x2_float, float y2_float) {
    // Bresenham's Line Algorithm Implementation
    
    // Convert to integer for pixel coordinates
    int x1 = (int)x1_float;
    int y1 = (int)y1_float;
    int x2 = (int)x2_float;
    int y2 = (int)y2_float;

    // Calculate differences and steps
    int dx = Math.abs(x2 - x1);
    int dy = Math.abs(y2 - y1);
    
    // Determine the direction of the line
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;

    // Initialize the error term
    int err = dx - dy;

    // Draw the line
    while (true) {
        drawPoint(x1, y1, color(0));

        if (x1 == x2 && y1 == y2) {
            break;
        }
        
        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x1 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y1 += sy;
        }
    }
}

public void CGCircle(float x, float y, float r) {
    // TODO HW1
    // You need to implement the "circle algorithm" in this section.
    // You can use the function circle(x, y, r); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    circle(x,y,r*2);
    */

    // CGCircle_BuildIn(x, y, r);
    CGCircle_Midpoint(x, y, r);
}

void CGCircle_BuildIn(float x, float y, float r) {
    // Built-in Circle Function Implementation

    stroke(0);
    noFill();
    circle(x, y, r * 2);
}

void CGCircle_Midpoint(float x, float y, float r) {
    // Midpoint Circle Algorithm Implementation
    
    // Convert to integer for pixel coordinates
    int cx = (int)x;
    int cy = (int)y;
    int radius = (int)r;
    
    // Initial points and decision parameter
    int px = 0;
    int py = radius;
    int d = 1 - radius;

    // Draw the circle
    while (px < py) {
        drawCirclePoints(cx, cy, px, py);
        
        if (d < 0) {
            d = d + 2 * px + 1;
        } else {
            py--;
            d = d + 2 * px - 2 * py + 1;
        }
        px++;
    }
}

void drawCirclePoints(int cx, int cy, int x, int y) {
    // Helper function to draw 8 symmetric points of circle

    drawPoint(cx + x, cy + y, color(0));
    drawPoint(cx - x, cy + y, color(0));
    drawPoint(cx + x, cy - y, color(0));
    drawPoint(cx - x, cy - y, color(0));
    drawPoint(cx + y, cy + x, color(0));
    drawPoint(cx - y, cy + x, color(0));
    drawPoint(cx + y, cy - x, color(0));
    drawPoint(cx - y, cy - x, color(0));
}

public void CGEllipse(float x, float y, float r1, float r2) {
    // TODO HW1
    // You need to implement the "ellipse algorithm" in this section.
    // You can use the function ellipse(x, y, r1,r2); to verify the correct answer.
    // However, remember to comment out the function before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    ellipse(x,y,r1*2,r2*2);
    */

    CGEllipse_BuildIn(x, y, r1, r2);
    // CGEllipse_Midpoint(x, y, r1, r2);
    
}

void CGEllipse_BuildIn(float x, float y, float r1, float r2) {
    // Built-in Ellipse Function Implementation

    stroke(0);
    noFill();
    ellipse(x, y, r1 * 2, r2 * 2);
}

void CGEllipse_Midpoint(float x, float y, float r1, float r2) {
    // Midpoint Ellipse Algorithm Implementation
    // ! Check the correctness of this function
    
    // Convert to integer for pixel coordinates
    int cx = (int)x;
    int cy = (int)y;
    int rx = (int)r1;
    int ry = (int)r2;

    // Precompute squares and constants
    int rx2 = rx * rx;
    int ry2 = ry * ry;
    int twoRx2 = 2 * rx2;
    int twoRy2 = 2 * ry2;
    
    // Initial points and decision parameter
    int px = 0;
    int py = twoRx2 * ry;
    int p = (int)(ry2 - (rx2 * ry) + (0.25 * rx2));

    // Region 1
    while (twoRy2 * px < twoRx2 * py) {
        drawEllipsePoints(cx, cy, px, py);

        if (p < 0) {
            p += twoRy2 * (px + 1);
        } else {
            py--;
            p += twoRy2 * (px + 1) - twoRx2 * (py + 1);
        }
        px++;
    }

    // Region 2
    p = (int)(ry2 * (px + 0.5) * (px + 0.5) + rx2 * (py - 1) * (py - 1) - rx2 * ry2);
    while (py >= 0) {
        drawEllipsePoints(cx, cy, px, py);

        if (p > 0) {
            p -= twoRx2 * (py - 1);
        } else {
            px++;
            p += twoRy2 * (px + 1) - twoRx2 * (py - 1);
        }
        py--;
    }
}

void drawEllipsePoints(int cx, int cy, int x, int y) {
    // Helper function to draw 4 symmetric points of ellipse

    drawPoint(cx + x, cy + y, color(0));
    drawPoint(cx - x, cy + y, color(0));
    drawPoint(cx + x, cy - y, color(0));
    drawPoint(cx - x, cy - y, color(0));
}

public void CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
    // TODO HW1
    // You need to implement the "bezier curve algorithm" in this section.
    // You can use the function bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x,
    // p4.y); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    bezier(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y,p4.x,p4.y);
    */
    
    // CGCurve_BuildIn(p1, p2, p3, p4);
    CGCurve_Bernstein(p1, p2, p3, p4);
    // CGCurve_DeCasteljau(p1, p2, p3, p4);
}

void CGCurve_BuildIn(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
    // Built-in Bezier Function Implementation

    stroke(0);
    noFill();
    bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
}

void CGCurve_Bernstein(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
    // Bezier Curve Algorithm Implementation using Bernstein Polynomials
    
    int steps = 1000;
    
    for (int i = 0; i <= steps; i++) {
        float t = (float)i / steps;
        
        // Calculate bezier point using the formula:
        // B(t) = (1-t)³P₁ + 3(1-t)²tP₂ + 3(1-t)t²P₃ + t³P₄
        float u = 1 - t;
        float tt = t * t;
        float uu = u * u;
        float uuu = uu * u;
        float ttt = tt * t;
        
        // Calculate x and y coordinates
        float x = uuu * p1.x + 3 * uu * t * p2.x + 3 * u * tt * p3.x + ttt * p4.x;
        float y = uuu * p1.y + 3 * uu * t * p2.y + 3 * u * tt * p3.y + ttt * p4.y;
        
        drawPoint(x, y, color(0));
    }
}
void CGCurve_DeCasteljau(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
    // Bezier Curve Algorithm Implementation using De Casteljau's Algorithm
    
    int steps = 1000;
    
    for (int i = 0; i <= steps; i++) {
        float t = (float)i / steps;
        
        // Linear interpolations
        Vector3 A = p1.mult((1 - t)).add(p2.mult(t));
        Vector3 B = p2.mult((1 - t)).add(p3.mult(t));
        Vector3 C = p3.mult((1 - t)).add(p4.mult(t));
        
        Vector3 D = A.mult((1 - t)).add(B.mult(t));
        Vector3 E = B.mult((1 - t)).add(C.mult(t));
        
        Vector3 P = D.mult((1 - t)).add(E.mult(t));
        
        drawPoint(P.x, P.y, color(0));
    }
}

public void CGEraser(Vector3 p1, Vector3 p2) {
    // TODO HW1
    // You need to erase the scene in the area defined by points p1 and p2 in this
    // section.
    // p1 ------
    // |       |
    // |       |
    // ------ p2
    // The background color is color(250);
    // You can use the mouse wheel to change the eraser range.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    
    // Eraser Algorithm - Fill rectangular area with background color
    int x1 = (int)min(p1.x, p2.x);
    int y1 = (int)min(p1.y, p2.y);
    int x2 = (int)max(p1.x, p2.x);
    int y2 = (int)max(p1.y, p2.y);
    
    // Fill the rectangular area with background color
    for (int y = y1; y <= y2; y++) {
        for (int x = x1; x <= x2; x++) {
            drawPoint(x, y, color(250));
        }
    }
}

public void drawPoint(float x, float y, color c) {
    stroke(c);
    point(x, y);
}

public float distance(Vector3 a, Vector3 b) {
    Vector3 c = a.sub(b);
    return sqrt(Vector3.dot(c, c));
}
