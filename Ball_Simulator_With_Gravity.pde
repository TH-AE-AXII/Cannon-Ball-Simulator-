int canvasWidth;
int canvasHeight;

float simMinWidth = 20.0;
float cScale;
float simWidth;
float simHeight;

PVector gravity = new PVector(0.0, -10.0);
float timeStep = 1.0 / 60.0;

Ball ball = new Ball();

void setup() {
  // Set the sketch to full screen
  fullScreen();

  // Calculate scale and simulation dimensions based on full screen size
  cScale = min(width, height) / simMinWidth;
  simWidth = width / cScale;
  simHeight = height / cScale;
}

void draw() {
  background(255);

  // Draw ball
  fill(255, 0, 0);
  ellipse(cX(ball.pos.x), cY(ball.pos.y), cScale * ball.radius * 2, cScale * ball.radius * 2);

  // Update physics simulation
  simulate();
}

float cX(float x) {
  return x * cScale;
}

float cY(float y) {
  return height - y * cScale;
}

void simulate() {
  // Apply gravity to the ball's velocity
  ball.vel.add(PVector.mult(gravity, timeStep));
  // Update ball position
  ball.pos.add(PVector.mult(ball.vel, timeStep));

  // Collision detection with boundaries
  if (ball.pos.x < 0.0) {
    ball.pos.x = 0.0;
    ball.vel.x = -ball.vel.x;
  }
  if (ball.pos.x > simWidth) {
    ball.pos.x = simWidth;
    ball.vel.x = -ball.vel.x;
  }
  if (ball.pos.y < 0.0) {
    ball.pos.y = 0.0;
    ball.vel.y = -ball.vel.y;
  }
}
