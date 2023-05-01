Road road;

Car car;

Sensor sensor;

Ray testRay;

void setup() {
  size(1080, 720);
  rectMode(CENTER);
  frameRate(70);
  road = new Road(width, 10);
  car = new Car(100, 100, 30, 50);
  sensor = new Sensor(car);
  testRay = new Ray(new PVector(300, 700), new PVector(950, 200));
}
void draw() {
  background(100);
  push();
  translate(width/2-road.width_/2, 0);
  fill(0);
  noStroke();
  circle(0, 0, 10);//draw zeroPoint

  car.update();
  //road.draw();
  car.draw();

  pop();
  sensor.update();
  sensor.draw();

  testRay.draw();

  drawDebug();
}
void drawDebug() {
  fill(255);
  textSize(22);
  textAlign(LEFT, TOP);
  text("FPS: " + round(frameRate), 0, 0);
}
@Override
  void focusLost() {
  if (frameCount < 100)
    return;
  println("Focuts lost");
  exit();
}
