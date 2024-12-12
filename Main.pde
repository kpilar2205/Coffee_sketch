import processing.sound.*;
SoundFile file;

// Refactored code with classes
PImage kitchenBackground, back, bottom, top, button, coffee, windowMidday, windowMorning, windowNight;
PImage[] windows; 
int imageSwitcher = 0; 
int seconds = 5000; 
int lastSwitchTime = 0; 

Kitchen kitchen;
CoffeeMachine coffeeMachine;

void setup() {
  size(1280, 720);

  // Load images
  kitchenBackground = loadImage("kitchen_background.png");
  
  //coffeemachine
  back = loadImage("coffeeMachine/back.png");
  bottom = loadImage("coffeeMachine/bottom.png");
  top = loadImage("coffeeMachine/top.png");
  button = loadImage("coffeeMachine/button.png");
  coffee = loadImage("coffeeMachine/coffee.png");
  
  
  //Windows
  windows = new PImage[3];
  windows[0] = loadImage("window/windowMidday.png");
  windows[1] = loadImage("window/windowMorning.png");
  windows[2] = loadImage("window/windowNight.png");
  
  

  // coffee machine and kitchen
  kitchen = new Kitchen(kitchenBackground);
  coffeeMachine = new CoffeeMachine(10, back, bottom, top, button, coffee);
  
  // coffee sound
  file = new SoundFile(this, "pouringCoffee.wav");

}

void draw() {
  kitchen.display();
  coffeeMachine.display();
    // Window Image changes every 5 seconds
  if (millis() - lastSwitchTime > seconds) {
    imageSwitcher = (imageSwitcher + 1) % windows.length; // Cycle through images
    lastSwitchTime = millis(); 
  }

  // Display the current image
  image(windows[imageSwitcher], 0, 0, width, height);
}

void mousePressed() {
  coffeeMachine.handleMouseClick(mouseX, mouseY);
}
