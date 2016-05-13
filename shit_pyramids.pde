/*******
/* Copyright (c) 2016 Michael Madden
/* shit_pyramids
/******/

PVector[] grid;
color pink;

Pyramid[] pyramids;
int maxPyramids = 1;
int totalPyramids = 0;

void setup(){
  size(displayWidth,displayHeight, P3D);
  pyramids = new Pyramid[maxPyramids];
  pyramids[totalPyramids] = new Pyramid();
}

void draw(){
  if(totalPyramids < maxPyramids && frameCount % 24 == 0){
    pyramids[totalPyramids] = new Pyramid();
    totalPyramids++; 
  }
  
  background(0);
  
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