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

  Pyramid() {
    randomizer = frameCount+10000;
    angle = sin(randomizer)+1;
    
    boolean decisioner = randomizer % 2 == 0;
    x = decisioner ? -5.0 :  width + 5.0;
    y = sin(frameCount)*height;
    direction = decisioner ? RIGHT : LEFT;
    
    movementSpeed = (angle+1)/100;
    
    spinSpeed = angle*0.1;
    spin = frameCount;
  }

  void draw() {
    spin += spinSpeed;
    
    x = direction == RIGHT ? x + movementSpeed : x - movementSpeed;
    y = y + sin(frameCount)*angle;
    
    translate(x, y, 0);
    rotateX(PI/2*angle);
    rotateZ(spin*-PI/6);
    noStroke();

    beginShape(TRIANGLE);
    
    fill(212, 174, 55);
    vertex(-100, -100, -100);
    vertex( 100, -100, -100);
    vertex(   0, 0, 100);

    fill(212, 174, 55);
    vertex( 100, -100, -100);
    vertex( 100, 100, -100);
    vertex(   0, 0, 100);

    fill(212, 174, 55);
    vertex( 100, 100, -100);
    vertex(-100, 100, -100);
    vertex(   0, 0, 100);

    fill(212, 174, 55);
    vertex(-100, 100, -100);
    vertex(-100, -100, -100);
    vertex(   0, 0, 100);
    
    fill(212, 174, 55);
    vertex(-100, 100, -100);
    vertex(-100, -100, -100);
    vertex( 100, 100, -100);
    
    fill(212, 174, 55);
    vertex(-100, -100, -100);
    vertex( 100, 100, -100);
    vertex( 100, -100, -100);
    endShape();
  }
}