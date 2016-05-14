class Pyramid {
  float x, y;
  float angle;
  float movementSpeed;
  float spin;
  float spinSpeed;  
  int position;
  String direction;
  
  float randomizer;

  final static String RIGHT = "Right";
  final static String LEFT = "LEFT";
  final color gold = color(212, 174, 55);

  Pyramid(int pos) {
    randomizer = frameCount+10000;
    angle = sin(randomizer)+1;
    
    boolean decisioner = randomizer % 241 == 0;
    x = decisioner ? 0.0 :  width;
    y = sin(frameCount)*height;
    direction = decisioner ? RIGHT : LEFT;
    
    position = pos;
    
    movementSpeed = (angle+1)*0.01;
    
    spinSpeed = angle*0.01;
    spin = frameCount;
  }

  void draw() {
    spin += spinSpeed;
    
    x = direction == RIGHT ? x + movementSpeed : x - movementSpeed;
    y = y + sin(frameCount)*movementSpeed;
    
    specular(51, 51, 51);
    
    //translate(x/4, y/4, sin(frameCount));
    //rotateX(PI/2*angle);
    //rotateZ(spin*-PI/6);
    //translate(x/4, y/4, sin(frameCount));
    noStroke();

    beginShape(TRIANGLE);    
    fill(gold);
    vertex(-100, -100, -100);
    vertex( 100, -100, -100);
    vertex(   0, 0, 100);

    fill(gold);
    vertex( 100, -100, -100);
    vertex( 100, 100, -100);
    vertex(   0, 0, 100);

    fill(gold);
    vertex( 100, 100, -100);
    vertex(-100, 100, -100);
    vertex(   0, 0, 100);

    fill(gold);
    vertex(-100, 100, -100);
    vertex(-100, -100, -100);
    vertex(   0, 0, 100);
    
    fill(gold);
    vertex(-100, 100, -100);
    vertex(-100, -100, -100);
    vertex( 100, 100, -100);
    
    fill(gold);
    vertex(-100, -100, -100);
    vertex( 100, 100, -100);
    vertex( 100, -100, -100);
    endShape();
    
    translate(x/4, y/4, sin(frameCount));
    rotateX(PI/2*angle);
    rotateZ(spin*-PI/6);
    //translate(x/4, y/4, sin(frameCount));
  }
}