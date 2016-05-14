/*******
/* Copyright (c) 2016 Michael Madden
/* shit_pyramids
/******/

PVector[] grid;
color pink;

Pyramid[] pyramids;
int maxPyramids = 500;
int totalPyramids = 0;

float cameraSwitchFrames = 24;

PImage img;

void setup(){
  size(displayWidth,displayHeight, P3D);
  pyramids = new Pyramid[maxPyramids];
  
  img = loadImage("19.jpg");
  img.resize(width, height);
  
  //while(totalPyramids < maxPyramids){
  //  createPyramids();
  //}
}

void draw(){  
  if(Math.round(random(frameCount)) % 3 == 0){
    createPyramids();
  }
  
  background(img);
  //background(0);
  
  setupLighting();
  setupCamera();
   
  int count = 0;
  while(count < totalPyramids){
    pyramids[count].draw();
    count++;
  }  
}

void setupCamera(){
  //float cameraSwitch = frameCount % cameraSwitchFrames;
  //if(cameraSwitch < cameraSwitchFrames - (cameraSwitchFrames/3)*2){
    float fov = PI/3.0;
    float cameraZ = (height/2.0)/tan(fov/2.0) * 2;
  
    perspective(fov, float(width)/float(height), 
              cameraZ/10.0, cameraZ*10.0);
  //}else if(cameraSwitch < cameraSwitchFrames - (cameraSwitchFrames/3)){
    //ortho(-width/2, width/2, -height/2, height/2);
  //}
}

void setupLighting(){
  //lights();
  ambientLight(128, 128, 128);
  directionalLight(128, 128, 128, 0, 0, -1);
  lightFalloff(1, 0, 0);
  lightSpecular(204, 204, 204);
  pointLight(128, 128, 128, 35, 20, 36);
}

void createPyramids(){
  if(totalPyramids < maxPyramids){
     pyramids[totalPyramids] = new Pyramid(totalPyramids);
     totalPyramids++;
  }
}

void keyReleased(){
  if(key == '1'){
    recalibratePyramids();
  }
}

void recalibratePyramids(){
  pyramids = new Pyramid[maxPyramids];
  totalPyramids = 0;
}