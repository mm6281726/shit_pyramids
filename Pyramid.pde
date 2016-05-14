class Pyramid {
  float x, y;
  float w, h;
  float angle;
  float movementSpeed;
  float spin;
  float spinSpeed;  
  int position;
  String direction;
  PImage texture;

  float randomizer;

  final static String RIGHT = "Right";
  final static String LEFT = "LEFT";
  final color gold = color(212, 174, 55);

  Pyramid(int pos) {
    randomizer = Math.abs(frameCount+10000);
    angle = sin(randomizer)+1;

    boolean decisioner = randomizer % 2 == 0;
    x = (sin(frameCount) * width)/4;
    y = (sin(frameCount) * height)/4;
    direction = decisioner ? RIGHT : LEFT;

    w = 100 * angle;
    h = -100 * angle;
    
    if(w < 25){
      w = 25;
    }
    
    if(h > 100){
      h = 100;
    }

    position = pos;

    movementSpeed = (angle+1)*(0.5/(position+1));

    spinSpeed = (angle)*(0.05/(position+1));
    spin = tan(frameCount);

    //texture = loadImage("logo1.jpg");
  }

  void draw() {
    spin += spinSpeed;

    x = direction == RIGHT ? x + movementSpeed : x - movementSpeed;
    y = y + sin(randomizer)*movementSpeed;

    specular(51, 51, 51);

    translate(width/2, height/2, 0);
    rotateX(PI/2*angle);
    rotateZ(spin*-PI/6);    
    noStroke();
    //textureMode(IMAGE);

    beginShape(TRIANGLE);
    fill(gold);    
    //texture(texture);
    vertex(h, h, h);
    vertex( w, h, h);
    vertex(   0, 0, w);

    vertex( w, h, h);
    vertex( w, w, h);
    vertex(   0, 0, w);

    vertex( w, w, h);
    vertex(h, w, h);
    vertex(   0, 0, w);

    vertex(h, w, h);
    vertex(h, h, h);
    vertex(   0, 0, w);

    vertex(h, w, h);
    vertex(h, h, h);
    vertex( w, w, h);

    vertex(h, h, h);
    vertex( w, w, h);
    vertex( w, h, h);
    endShape();

    float z =  sin(frameCount)-1;
    translate(x/2, y/2, z);
    //rotateX(PI/2*(angle/20));
    rotateZ((spin/20)*-PI/6);
  }
}