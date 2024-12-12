// Kitchen Assets
class Kitchen {
  PImage background;

  Kitchen(PImage background) {
    this.background = background;
  }

  void display() {
    background(255);
    image(this.background, 0, 0, width, height);
  }
}
