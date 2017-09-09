Perceptron brain;
Point[] points = new Point[100];
boolean finished = false;
int trainingIndex = 0;

void setup() {
    size(800, 800);
    brain = new Perceptron();
    for (int i = 0; i < points.length; i++) {
        points[i] = new Point();
    }
}

void draw() {
    background(255);
    stroke(0);
    line(0,0, width, height);
    boolean allRight = true;
    for (Point pt : points) {
        pt.show();
    }

    for (Point pt : points) {
        float[] inputs = {pt.x, pt.y};
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
        ellipse(pt.x, pt.y, 16, 16);
        
    }
    
    if (allRight && !finished) {
        println(brain.weights);
        finished = true;
    }

    Point training = points[trainingIndex];
    float[] inputs = {training.x, training.y};
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