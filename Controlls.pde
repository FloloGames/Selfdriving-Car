public class Controlls {
  boolean left, right, forward, backwards;
  Controlls() {
    registerMethod("keyEvent", this);
  }
  public void keyEvent(KeyEvent event) {
    if (!keyRepeatEnabled && event.isAutoRepeat()) return;

    //keyEvent = event;
    char key2 = event.getKey();
    int keyCode_ = event.getKeyCode();

    switch (event.getAction()) {
    case KeyEvent.PRESS:
      this.keyPressed(key2, keyCode_);
      break;
    case KeyEvent.RELEASE:
      this.keyReleased(key2, keyCode_);
      break;
    case KeyEvent.TYPE:
      this.keyTyped(key2, keyCode_);
      break;
    }
  }
  void keyPressed(char key_, int keyCode_) {
    if (keyCode_ == UP || key_ == 'w') {
      forward = true;
    } else if (keyCode_ == DOWN || key_ == 's') {
      backwards = true;
    }
    if (keyCode_ == LEFT || key_ == 'a') {
      left = true;
    } else if (keyCode_ == RIGHT || key_ == 'd') {
      right = true;
    }
  }
  void keyReleased(char key_, int keyCode_) {
    if (keyCode_ == UP || key_ == 'w') {
      forward = false;
    } else if (keyCode_ == DOWN || key_ == 's') {
      backwards = false;
    }
    if (keyCode_ == LEFT || key_ == 'a') {
      left = false;
    } else if (keyCode_ == RIGHT || key_ == 'd') {
      right = false;
    }
  }
  void keyTyped(char key_, int keyCode_) {
  }
}
