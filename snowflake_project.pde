ArrayList <Flake> mySnowflake; //GLOBAL! EVERYTHING HAS ACCESS TO IT
int numberSpokes = 6;
//int flakeNum = 50;
Flake myFlake;
void setup() {
  size(500, 500);
  translate(width/2, height/2);
  mySnowflake = new ArrayList<Flake> ();
  //for (int i = 0; i < flakeNum; i++) {
  //  myFlake = new Flake();
  //  mySnowflake.add(myFlake);
  //}
  myFlake = new Flake();
  mySnowflake.add(myFlake);
  if(getLastElement().x >= width) {
    noLoop();
  }
  
}
void draw() {
  translate(width/2, height/2);
  //rotate();
  background(255);
  if (!myFlake.ended || !myFlake.stuck) {
    myFlake.move();
  }
  if (myFlake.update()) {
    myFlake = new Flake();
    if(getLastElement().x >= width/2 - getLastElement().fS) {
      noLoop();
    }
    mySnowflake.add(myFlake);
  }
  for (int i = 0; i < numberSpokes; i++) {
      rotate(PI/3);
      showFlakes();
  }
  //use the get() and the size() method to get the last flake in the arrayList
}

Flake getLastElement() {
  int sizeSnowflake = mySnowflake.size()-1;
  Flake lastElement = mySnowflake.get(sizeSnowflake);
  return lastElement;
  //return mySnowflake..get(mySnowflake.size());
}

void showFlakes() {
  for (Flake f : mySnowflake) {
    f.show();
  }
}
