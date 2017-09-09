float f(float x) {
    // y = mx + b
    return 0.3 * x + 0.2;
}

class Point {
    float x;
    float y;
    float bias = 1;
    int label;

    void getRightLabel() {
        label = y > f(x) ? 1 : -1;
    }

    Point(float x_, float y_) {
        x = x_;
        y = y_;

        getRightLabel();
    }

    Point() {
        x = random(-1,1);
        y = random(-1,1);

        getRightLabel();
    }

    float pixelX() {
        return map(x, -1, 1, 0, width);
    }

    float pixelY() {
        return map(y, -1, 1, height, 0);        
    }

    void show() {
        stroke(0);
        if (label == 1) {
            fill(255);
        } else {
            fill(0);
        }

        ellipse(pixelX(), pixelY(), 32, 32);
    }

}