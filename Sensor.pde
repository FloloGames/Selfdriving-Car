class Sensor {
  Car car;
  int rayCount = 10;
  float rayLength = 150;
  float raySpread = PI/2;

  Ray[] rays;
  Sensor(Car car) {
    rays = new Ray[rayCount];
    for (int i = 0; i < rayCount; i++) {
      rays[i] = new Ray();
    }

    this.car = car;
  }
  void update() {
    for (int i = 0; i < rayCount; i++) {
      float rayAngle = lerp(raySpread/2, -raySpread/2, (float)i/(rayCount-1)) - car.angle;
      rays[i].update(car.pos.x, car.pos.y, rayAngle, rayLength);
    }
    CollisionPoint[] collisions = testRay.collisions(rays);
    for (CollisionPoint p : collisions) {
      stroke(255, 0, 0);
      strokeWeight(20);
      point(p.x, p.y);
    }
  }
  void draw() {
    for (Ray ray : rays) {
      ray.draw();
    }
  }
}
