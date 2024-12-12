// Coffee Machine Assets
class CoffeeBean {
  float x, y;
  boolean active;

  CoffeeBean() {
    reset();
  }
  
  // coffee dissapears at this coordinate
  void reset() {
    x = random(327, 459);
    y = random(-100, 0);
    active = false;
  }
  
  // coffee spawns at this coordinate
  void activate() {
    x = random(300, 340);
    y = random(305, 230);
    active = true;
  }
  
  // display coffee beans falling
  void fall() {
    if (active) {
      y += 3;
      if (y > 445 && y < 470) {
        active = false; 
      }
    }
  }
  
  // draw the coffee machine
  void display() {
    if (active) {
      fill(139, 69, 19);
      ellipse(x, y, 10, 15);
    }
  }
}

// coffee machine
class CoffeeMachine {
  PImage back, bottom, top, button, coffee;
  CoffeeBean[] beans;
  boolean coffeeFalling = false;
  int beansInCup = 0;

  // Button properties
  int buttonX = 384;
  int buttonY = 245;
  int buttonWidth = 53;
  int buttonHeight = 32;
  
  // coffee machine assets
  CoffeeMachine(int beanCount, PImage back, PImage bottom, PImage top, PImage button, PImage coffee) {
    this.back = back;
    this.bottom = bottom;
    this.top = top;
    this.button = button;
    this.coffee = coffee;
    
    // Initialize beans
    beans = new CoffeeBean[beanCount];
    for (int i = 0; i < beanCount; i++) {
      beans[i] = new CoffeeBean();
    }
  }

  void display() {
    image(back, 0, 0, width, height);
    image(bottom, 0, 0, width, height);
    image(top, 0, 0, width, height);
    
    //coffee continuously falls
    if (coffeeFalling) {
      for (CoffeeBean bean : beans) {
        bean.fall();
        bean.display();
      }
    }

    image(top, 0, 0, width, height);
    image(button, 0, 0, width, height);
    image(coffee, 0, 0, width, height);

    // framerate
    if (frameCount % 10 == 0) {
      activateBean();
    }
  }
  
  // when button pressed play coffePouring.wav file and start coffee falling animation
  void handleMouseClick(int mouseX, int mouseY) {
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
        mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
          file.play();
      coffeeFalling = !coffeeFalling;
    }
  }

  void activateBean() {
    for (CoffeeBean bean : beans) {
      if (!bean.active) {
        bean.activate();
        break;
      }
    }
  }
}
