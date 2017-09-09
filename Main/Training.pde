class Point {
    float x;
    float y;
    int label;

    Point() {
        x = random(width);
        y = random(height);

        label = x > y ? 1 : -1;
    }

    void show() {
        stroke(0);
        if (label == 1) {
            fill(255);
        } else {
            fill(0);
        }

        ellipse(x, y, 32, 32);
    }

}