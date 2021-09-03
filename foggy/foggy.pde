//A Sharma
//Feb.26.2019
/*
 My Processing Assignment: Foggy
 To get the program running you must get the sound library by "The Processing Foundation".
 Enjoy the program.
 -----------------------INTERACTION-------------------------
 Press "s" to stop the clouds, and press "g" to get them to move again.
 To interact using the mouse, right click on the moon to make the stars dissapear
 and left click the moon again to make them reappear. 
 -----------------------ELEMENTS----------------------------
 Clouds -- MOVING
 Stars -- MOVING
 Mountains -- CUSTOM SHAPES
 Hills
 Shadows
 Water
 Moon
 People
 Grass
 -----------------------SHAPES------------------------------
 Ellipses -- Hills
 Triangles - Shades of water
 Rectangle - Water
 Lines - Gradient
 -----------------------COLORS------------------------------
 I used a gradient for all my background colors, which
 uses slightly different shades to create a gradient. That
 should count for more than 3 colors.
 ------------------------------------------------------------
 */
 
// create variables for the added x values of the clouds.
int cloud1 = 0;
int cloud2 = 0;
int cloud3 = 0;
int cloud4 = 0;
int cloud5 = 0;
// set the speed of the clouds to 1.
int cloudSpeed = 1;
// create an image for the stars.
PImage stars;
//set the boolean values to the toggle stars to false.
boolean toggleStars = false;
//set the boolean value of toggleCloud to true.
boolean toggleCloud = true;
//import sound 
import processing.sound.*;
SoundFile file;

void setup() {
  //set the size of the canvas.
  size(800, 600);
  //load in the sound file and play the song.
  file = new SoundFile(this, "Repurika.wav");
  //loop the song
  file.loop();
  //make the screen size resizable to counter the glitch
   surface.setResizable(true);

}

void draw() {
  // This portion of the code creates a gradient background
  // Create variables for the two colors that I will shift into and the other variables required.
  color c1, c2;
  int y = 0;
  float n = map(y, 0, height, 0, 1);
  c1 = color(130, 2, 250);
  c2 = color(27, 1, 64);
  /*
   Create a for loop. It makes lines that change color and create a gradient.
   The y value will increase until it is equal to the height of the window and then it
   will stop the loop.
   */
  for (y = 0; y < height; y++) {
    //create a variable for the new color of the line
    color newC = lerpColor(c2, c1, n);
    //Set the border of the line color to the new color.
    stroke(newC); 
    //Create a line for every color change to create a gradient. 
    line(0, y, width, y);
    //Increase the n value to change the new color value.
    n+= 0.0018;
  }
  /*This ends the gradient background section in the code. 
   
   */
  //This starts the water section.
  noStroke();
  //create a rectangle to represent the water.
  fill(82, 65, 163);
  rect(0, 496, 800, 104);  
  //create two triangles that represent the shaded water.
  fill(19, 19, 92);
  triangle(0, 496, 441, 508, 0, 800 );
  triangle(800, 600, 674, 496, 800, 496);
  //This ends the water section.
  //This starts the sky section.
  //Load in the mountain function.
  drawMountains();
  //load in the star picture
  stars = loadImage("starfire.png");
  //create an if statement that checks weather or not to display the stars.
  if (toggleStars == false) {
    //if the toggleStars is false then display the stars.
    //they also only display these stars at this size when frameCount is less thant 19.
    if (frameCount >= 0 && frameCount < 19) { 
      stars.resize(14, 16);
      image(stars, 360, 224);
      image(stars, 90, 109);
      image(stars, 170, 40);
      image(stars, 485, 62);
      image(stars, 323, 20);
      image(stars, 738, 203);
      stars.resize(10, 12);
      image(stars, 416, 103);
      image(stars, 505, 204);
      image(stars, 384, 196);
      image(stars, 230, 222);
      stars.resize(8, 9);
      image(stars, 24, 14);
      image(stars, 529, 103);
      image(stars, 394, 304);
      image(stars, 47, 304);
      //if the frameCount is greater than 19 and less than 38 it changes the sizes of the stars.
    } else if (frameCount > 19 && frameCount <= 38) {
      stars.resize(10, 12);
      image(stars, 360, 224);
      image(stars, 90, 109);
      image(stars, 170, 40);
      image(stars, 485, 62);
      image(stars, 323, 20);
      image(stars, 738, 203);
      stars.resize(8, 9);
      image(stars, 416, 103);
      image(stars, 505, 204);
      image(stars, 384, 196);
      image(stars, 230, 222);
      stars.resize(14, 16);
      image(stars, 24, 14);
      image(stars, 529, 103);
      image(stars, 394, 304);
      image(stars, 47, 304);
    }
    //sets the framecount back to 0 if the frameCount is higher than 38, so the sizes can reset, creating a shining effect.
    if (frameCount == 38) {
      frameCount = 0;
    }
    //if toggleStars is true then it wont display stars.
  } else if (toggleStars == true) {
  }
  //load in the moon picture and display it near the top corner.
  PImage moon;
  moon = loadImage("moon.png");
  image(moon, 300, -180);
  //load in the cloud picture and resize it
  PImage clouds;
  clouds = loadImage("pasted image 1.png");
  clouds.resize(320, 140);
  //create one cloud at a location and make its x value decrease.
  image(clouds, -150 + cloud1, 50);
  //add a dilate filter on the rest of the clouds for better appearance on them.
  clouds.filter(DILATE);
  //load in the other 3 clouds all with decreasing x values.
  image(clouds, 10 + cloud2, 250);
  image(clouds, 520 + cloud3, 190);
  image(clouds, 610 + cloud4, 190);
  //create an if statement that determines if the cloud is moving or not.
  if (keyPressed) {
    //if you press the s key on your keyboard the clouds will stop moving by setting toggleCloud to false.
    if (key == 's') {
      toggleCloud = false;
    //if you press the g key on your keyboard the clouds will continue to move again by setting toggleCloud to true.
    } else if (key == 'g') {
      toggleCloud = true;
    }
  }
  //If statement checks to see if toggle cloud is true or not and depending on the boolean sets the speed of the cloud accordingly.
  if (toggleCloud == true) {
    cloudSpeed = 1;
  } else {
    cloudSpeed = 0;
  }
  //make the added x values based off of the cloud speed.
  cloud1 -= cloudSpeed;
  cloud2 -= cloudSpeed;
  cloud3 -= cloudSpeed;
  cloud4 -= cloudSpeed;
  cloud5 -= cloudSpeed;
  //Load in the small cloud
  PImage sCloud;
  sCloud = loadImage("22 (4).png");
  //Display it and give it a variable x value so it can move right to left.
  image(sCloud, 430 + cloud5, 0);
  //These if statements make it so the subtracted x values change to different values, this prevents the clouds from wandering off into nothingness after they exceed the border and instead look like they are shifting back in from the right.
  if (cloud1 == -170) {
    cloud1 = 950;
  }
  //this one does the same thing with the second cloud
  if (cloud2 == -330) {
    cloud2 = 790;
  }
  //does the same thing with the third cloud
  if (cloud3 == -840) {
    cloud3 = 280;
  }
  //does the same thing with the fourth cloud
  if (cloud4 == -930) {
    cloud4 = 190;
  }
  //does the same thing with the fifth cloud
  if (cloud5 == -598) {
    cloud5 = 632;
  }
  //They all come back in from the right after they cross the same amount of distance, making them all equal distant apart each time and give off the feel that it is all one pic of different clouds that is shifting, when they are all individual.
  //This ends the sky section.
  //This starts the foreground section.
  //create 3 circles to mimic hills.
  noStroke();
  ellipse(109, 627, 404, 94);
  ellipse(772, 601, 394, 156);
  ellipse(520, 629, 555, 151);
  //load in a grass picture for the grass on the hills. 
  PImage grass1;
  grass1 = loadImage("grass5.png");
  //set its location.
  image(grass1, 0, -13);
  fill(100);
  rect(800, 0, 1000,1000);
  rect(0, 600, 1000,1000);
}
//seperate function to keep code clean and not confusing for my eyes.
void drawMountains() {
  //create a crazy custom shape of a mountain, the reason for the billion number of vertexes was I wanted a very pixelated mountain that wasnt even looking.
  beginShape();
  fill(0);
  strokeWeight(5);
  stroke(26, 22, 82);
  strokeWeight(5);
  vertex(185, 507);
  vertex(441, 507);
  vertex(441, 502);
  vertex(433, 502);
  vertex(431, 498);
  vertex(424, 498);
  vertex(421, 499);
  vertex(420, 494);
  vertex(375, 494);
  vertex(374, 490);
  vertex(338, 490);
  vertex(336, 484);
  vertex(311, 484);
  vertex(310, 480);
  vertex(298, 480);
  vertex(297, 473);
  vertex(279, 473);
  vertex(279, 469);
  vertex(271, 469);
  vertex(271, 464);
  vertex(271, 464);
  vertex(273, 464);
  vertex(263, 459);
  vertex(257, 459);
  vertex(257, 457);
  vertex(225, 455);
  vertex(224, 449);
  vertex(219, 449);
  vertex(219, 452);
  vertex(216, 452);
  vertex(216, 449);
  vertex(206, 449);
  vertex(206, 456);
  vertex(193, 455);
  vertex(193, 459);
  vertex(185, 459);
  vertex(185, 463);
  vertex(182, 463);
  vertex(182, 467);
  vertex(184, 467);
  endShape();
  //create another crazy mountain this time bigger.
  beginShape();
  vertex(256, 525);
  vertex(0, 522);
  vertex(0, 394);
  vertex(12, 394);
  vertex(14, 399);
  vertex(25, 399);
  vertex(26, 406);
  vertex(32, 406);
  vertex(32, 410);
  vertex(46, 410);
  vertex(47, 416);
  vertex(71, 417);
  vertex(71, 413);
  vertex(91, 413);
  vertex(91, 417);
  vertex(95, 417);
  vertex(95, 424);
  vertex(100, 423);
  vertex(100, 427);
  vertex(113, 427);
  vertex(113, 432);
  vertex(121, 431);
  vertex(121, 433);
  vertex(125, 433);
  vertex(126, 437);
  vertex(147, 438);
  vertex(147, 441);
  vertex(157, 441);
  vertex(156, 447);
  vertex(167, 447);
  vertex(167, 452);
  vertex(173, 454);
  vertex(173, 457);
  vertex(178, 458);
  vertex(178, 463);
  vertex(181, 463);
  vertex(181, 471);
  vertex(191, 471);
  vertex(192, 476);
  vertex(196, 476);
  vertex(196, 481);
  vertex(204, 482);
  vertex(204, 487);
  vertex(209, 487);
  vertex(209, 494);
  vertex(215, 493);
  vertex(214, 498);
  vertex(229, 498);
  vertex(229, 502);
  vertex(235, 502);
  vertex(235, 510);
  vertex(241, 510);
  vertex(241, 514);
  vertex(249, 514);
  vertex(257, 520);
  vertex(257, 526);
  endShape();
  //one more mountain small this time.
  beginShape();
  vertex(676, 494);
  vertex(676, 488);
  vertex(695, 488);
  vertex(695, 482);
  vertex(717, 482);
  vertex(717, 478);
  vertex(725, 477);
  vertex(725, 472);
  vertex(734, 472);
  vertex(734, 468);
  vertex(740, 467);
  vertex(740, 463);
  vertex(758, 463);
  vertex(758, 458);
  vertex(769, 458);
  vertex(769, 454);
  vertex(782, 454);
  vertex(782, 448);
  vertex(790, 447);
  vertex(790, 443);
  vertex(799, 444);
  vertex(799, 495);
  vertex(676, 494);
  endShape();
}
//This function is used to make the stars dissapear and reappear based on where you click and what button you click.
void mousePressed() {
  //if the mouse button clicked was the left one and the mouse pointer was somewhere in the moon then it would make the stars reappear if they were turned off.
  if (mouseButton == LEFT && dist(686, 103, mouseX, mouseY) <= 50) {
    toggleStars = false;
    //sets the framecount to 0 because the stars dont appear if the framcount is any greater than 38
    frameCount = 0;
    //else if the mouse button clicked is the right one in the moon, the stars dissapear.
  } else if (mouseButton == RIGHT && dist(686, 103, mouseX, mouseY) <= 50) {
    toggleStars = true;
    //sets the framecount to 0 because the stars dont appear if the framcount is any greater than 38
    frameCount = 0;
  }
}
