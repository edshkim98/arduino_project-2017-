import processing.serial.*;

  Serial myPort;        // The serial port
  int xPos = 1;         // horizontal position of the graph
  float inByte = 0;

  void setup () {
    
    size(800, 600); //setting the window size
    myPort = new Serial(this,"COM5", 9600);

    // don't generate a serialEvent() unless you get a newline character:
    myPort.bufferUntil('\n');
    background(0); //setting background colour
  }

  void draw () {
    // draw the line:
    stroke(280, 900, 355);
    line(xPos, height, xPos, height - inByte);

    // start from the beginning when the graph x-position exceeds the width of the window.
    if (xPos >= width) {
      xPos = 0;
      background(0);
    } else {
      // increase the horizontal position:
      xPos++;
    }
  }

  void serialEvent (Serial myPort) {
    String inString = myPort.readStringUntil('\n');

    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);
      // convert to an int and map to the screen height:
      inByte = float(inString);
      println(inByte);
      inByte = map(inByte, 15, 40, 0, height);
    }
  }