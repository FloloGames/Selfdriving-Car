class Ray {
  PVector start, end;
  Ray() {
    start = new PVector();
    end = new PVector();
  }
  Ray(PVector start, PVector end) {
    this.start = start;
    this.end = end;
  }
  Ray(PVector start, float angle, float length) {
    this.start = start;
    end = new PVector(car.pos.x-sin(angle)*length, car.pos.y-cos(angle)*length);
  }
  void update(float startx, float starty, float angle, float length) {
    start.set(startx, starty);
    end.set(car.pos.x-sin(angle)*length, car.pos.y-cos(angle)*length);
  }
  void draw() {
    stroke(255, 0, 0);
    strokeWeight(2);
    line(start.x, start.y, end.x, end.y);
  }
  CollisionPoint[] collisions(Ray... rays) {
    ArrayList<CollisionPoint> collisions = new ArrayList<CollisionPoint>();
    for (int i = 0; i < rays.length; i++) {
      Ray ray = rays[i];
      CollisionPoint touch = getIntersection(start, end, ray.start, ray.end);
      if (touch == null)
        continue;
      collisions.add(touch);
    }

    return collisions.toArray(new CollisionPoint[collisions.size()]);
  }
  CollisionPoint getIntersection(PVector A, PVector B, PVector C, PVector D) {
    float tTop = (D.x-C.x)*(A.y-C.y)-(D.y-C.y)*(A.x-C.x);
    float uTop = (C.y-A.y)*(A.x-B.x)-(C.x-A.x)*(A.y-B.y);
    float bottom = (D.y-C.y)*(B.x-A.x)-(D.x-C.x)*(B.y-A.y);

    if (bottom != 0) {
      float t = tTop/bottom;
      float u = uTop/bottom;
      if (t >= 0 && t <= 1 && u >= 0 && u <= 1) {
        float x = lerp(A.x, B.x, t);
        float y = lerp(A.y, B.y, t);
        float offset = t;
        return new CollisionPoint(x, y, offset);
      }
    }
    return null;
  }
}
class CollisionPoint {
  float x, y, offset;
  CollisionPoint(float x, float y, float offset) {
    this.x = x;
    this.y = y;
    this.offset = offset;
  }
}
