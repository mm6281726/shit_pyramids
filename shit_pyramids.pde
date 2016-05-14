/*******
/* Copyright (c) 2016 Michael Madden
/* shit_pyramids
/******/

PVector[] grid;
color pink;

Pyramid[] pyramids;
int maxPyramids = 1600;
int totalPyramids = 0;

//float cameraSwitchFrames = 24;

PImage img;

void setup(){
  size(displayWidth,displayHeight, P3D);
  pyramids = new Pyramid[maxPyramids];
  
  img = loadImage("19.jpg");
  img.resize(width, height);
}

void draw(){  
  if(totalPyramids < maxPyramids && Math.round(random(frameCount)) % 3 == 0){
   pyramids[totalPyramids] = new Pyramid(totalPyramids);
   totalPyramids++;
  }
  
  //lights();
  ambientLight(128, 128, 128);
  directionalLight(128, 128, 128, 0, 0, -1);
  lightFalloff(1, 0, 0);
  lightSpecular(204, 204, 204);
  pointLight(128, 128, 128, 35, 40, 36);
  background(img);
  //background(0);  
  
  //float cameraSwitch = frameCount % cameraSwitchFrames;
  //if(cameraSwitch < cameraSwitchFrames - (cameraSwitchFrames/3)*2){
    float fov = PI/3.0;
    float cameraZ = (height/2.0)/tan(fov/2.0);
  
    perspective(fov, float(width)/float(height), 
              cameraZ/10.0, cameraZ*10.0);
  //}else if(cameraSwitch < cameraSwitchFrames - (cameraSwitchFrames/3)){
    //ortho(-width/2, width/2, -height/2, height/2);
  //}
   
  int count = 0;
  while(count < totalPyramids){
    pyramids[count].draw();
    count++;
  }
}