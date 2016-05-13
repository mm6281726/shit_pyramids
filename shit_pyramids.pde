/*******
/* Copyright (c) 2016 Michael Madden
/* shit_pyramids
/******/

PVector[] grid;
color pink;

Pyramid[] pyramids;
int maxPyramids = 16;
int totalPyramids = 0;

PImage img;

void setup(){
  size(displayWidth,displayHeight, P3D);
  pyramids = new Pyramid[maxPyramids];
  
  img = loadImage("19.jpg");
  img.resize(width, height);
}

void draw(){
  if(totalPyramids < maxPyramids && Math.round(random(frameCount)) % 2 == 0){
    pyramids[totalPyramids] = new Pyramid();
    totalPyramids++;
  }
  
  
  background(img);
  //background(0);
  
  lights();
  float fov = PI/3.0;
  float cameraZ = (height/2.0)/tan(fov/2.0);
  
  perspective(fov, float(width)/float(height), 
              cameraZ/10.0, cameraZ*10.0);
  int count = 0;
  while(count < totalPyramids){
    pyramids[count].draw();
    count++;
  }
}