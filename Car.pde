class Car {
  final float MaxSpeed = 3;
  final float friciton = 0.05;
  final float acceleration = 0.3;

  Controlls controlls;

  Sensor sensor;
  PVector pos;
  float width_, height_;
  float speed = 0;
  float angle = 0;


  Car(float x, float y, float width_, float height_) {
    sensor = new Sensor(this);
    controlls = new Controlls();
    pos = new PVector(x, y);
    this.width_ = width_;
    this.height_ = height_;
  }
  Car(float x, float y, float width_, float height_, boolean isControllable) {
    sensor = new Sensor(this);
    if (isControllable)
      controlls = new Controlls();
    pos = new PVector(x, y);
    this.width_ = width_;
    this.height_ = height_;
  }
  void draw() {
    push();
    translate(pos.x, pos.y);
    rotate(angle);
    fill(0);
    noStroke();
    rect(0, 0, width_, height_);
    fill(255);
    rect(0, -height_/2, width_, height_/5, 10, 10, 0, 0);
    pop();
    sensor.draw();
  }
  void update() {
    move();
    sensor.update();
  }
  void move() {
    if (controlls == null)
      return;
    if (controlls.forward) {
      speed += acceleration;
    } else if (controlls.backwards) {
      speed -= acceleration;
    }

    if (speed > 0) {
      speed -= friciton;
    } else if (speed < 0) {
      speed += friciton;
    }

    if (abs(speed) < friciton) {
      speed = 0;
    }

    if (speed != 0) {
      int flip = speed > 0 ? 1 : -1;

      if (controlls.left) {
        angle -= 0.03 * flip;
      } else if (controlls.right) {
        angle += 0.03 * flip;
      }
    }

    speed = constrain(speed, -MaxSpeed/2, MaxSpeed);

    pos.x += sin(-angle) * -speed;
    pos.y += cos(-angle) * -speed;
  }
  Ray[] createPolygon() {
    Ray[] rays = new Ray[4];

    float rad = sqrt(pow(width_/2, 2) + pow(height_/2, 2));
    float alpha = atan2(width_, height_);

    PVector backRight = new PVector(pos.x + sin(-angle+alpha) * rad, pos.y + cos(-angle+alpha) * rad);
    PVector backLeft = new PVector(pos.x + sin(-angle-alpha) * rad, pos.y + cos(-angle-alpha) * rad);
    PVector frontRight = new PVector(pos.x - sin(-angle-alpha) * rad, pos.y - cos(-angle-alpha) * rad);
    PVector frontLeft = new PVector(pos.x - sin(-angle+alpha) * rad, pos.y - cos(-angle+alpha) * rad);

    rays[0] = new Ray(backRight, backLeft);
    rays[1] = new Ray(backLeft, frontLeft);
    rays[2] = new Ray(frontLeft, frontRight);
    rays[3] = new Ray(frontRight, backRight);

    return rays;
  }
}
