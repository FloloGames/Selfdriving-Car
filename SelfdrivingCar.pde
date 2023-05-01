Road road;

Car car;
Car testCar;

Ray testRay;

void setup() {
  size(1080, 720);
  rectMode(CENTER);
  frameRate(144);
  road = new Road(width, 10);
  car = new Car(width/2, height/2, 30, 50);
  testCar = new Car(width/2, height/3, 30, 50, false);

  testRay = new Ray(new PVector(300, 700), new PVector(950, 200));
}
void draw() {
  background(100);
  push();
  translate(width/2-road.width_/2, 0);
  fill(0);
  noStroke();
  circle(0, 0, 10);//draw zeroPoint

  car.draw();
  car.update();
  //road.draw();
  testCar.draw();

  pop();



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
