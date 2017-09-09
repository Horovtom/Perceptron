Perceptron brain;
Point[] points = new Point[100];
boolean finished = false;
int trainingIndex = 0;

void setup() {
    size(800, 800);
    brain = new Perceptron(3);
    for (int i = 0; i < points.length; i++) {
        points[i] = new Point();
    }
}

void drawDivisionLine() {
    stroke(0);
    Point p1 = new Point(-1, f(-1));
    Point p2 = new Point(1, f(1));
    line(p1.pixelX(),p1.pixelY(), p2.pixelX(), p2.pixelY());
}

void drawThinkingLine() {
    stroke(0);    
    Point p1 = new Point(-1, brain.guessY(-1));
    Point p2 = new Point(1, brain.guessY(1));
    line(p1.pixelX(),p1.pixelY(), p2.pixelX(), p2.pixelY());
}

void draw() {
    background(255);

    drawDivisionLine();
    drawThinkingLine();

    boolean allRight = true;
    for (Point pt : points) {
        pt.show();
    }

    for (Point pt : points) {
        float[] inputs = {pt.x, pt.y, pt.bias};
        int target = pt.label;
        //brain.train(inputs, target);

        int guess = brain.guess(inputs);
        if (guess == target) {
            fill(0,255,0);
        } else {
            allRight = false;
            fill(255,0,0); 
        }
        noStroke();
        ellipse(pt.pixelX(), pt.pixelY(), 16, 16);
        
    }
    
    if (allRight && !finished) {
        println(brain.weights);
        finished = true;
    }

    Point training = points[trainingIndex];
    float[] inputs = {training.x, training.y, training.bias};
    int target = training.label;
    brain.train(inputs, target);
    trainingIndex++;
    if (trainingIndex == points.length) {
        trainingIndex = 0;
    }
}

void mousePressed() {
    for (Point pt :points) {
        float[] inputs = {pt.x, pt.y};
        int target = pt.label;
        brain.train(inputs, target);
    }
    println(brain.weights);
}