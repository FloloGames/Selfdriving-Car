class Road {
  float width_;
  int laneCount;
  Road(float width_, int laneCount) {
    this.width_ = width_;
    this.laneCount = laneCount;
  }
  void draw() {
    fill(120);
    noStroke();
    rect(width_/2, height/2, width_, height+1);

    stroke(255);
    strokeWeight(5);
    for (int i = 0; i <= laneCount; i++) {
      float x = lerp(width_*0.97, width_-width_*0.97, (float)i/laneCount);
      line(x, 0, x, height);
    }
  }
}
