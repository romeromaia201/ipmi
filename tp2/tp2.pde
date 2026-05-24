int pantalla = 0;
int tiempoLimite = 6000;
int tiempoGuardado = 0;

float animacionY = 480;
float animacionX = 0; 
float opacidad = 0;
float escala = 0;

PFont PORTAL;
PImage img1, img2, img3, img4, img5, img6;

void setup() {
  size(640, 480);
  
  img1=loadImage("portal1.png");
  img2=loadImage("portal2.png");
  img3=loadImage("portal3.png");
  img4=loadImage("portal4.png");
  img5=loadImage("portal5.png");
  img6=loadImage("portal6.png");
  PORTAL= loadFont("SegoeUI-Semibold-48.vlw");
  
  textFont(PORTAL);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0); 
  
  // definiendo algunos parametros! -----------------------------------------------------------------------------
  
  if (pantalla < 5) {
    if (millis() - tiempoGuardado > tiempoLimite) {
      pantalla++;
      tiempoGuardado = millis(); 
      animacionX = 0;
      animacionY = 480;
      opacidad = 0;
      escala = 0;
    }
  }

// definiendo cada pantalla :3 ----------------------------------------------------------------------------------

  if (pantalla == 0) {
    pantallaUno();
  } else if (pantalla == 1) {
    pantallaDos();
  } else if (pantalla == 2) {
    pantallaTres();
  } else if (pantalla == 3) {
    pantallaCuatro();
  } else if (pantalla == 4) {
    pantallaCinco(); 
  } else if (pantalla == 5) {
    pantallaFinal();
  }
}

// a partir de aca voy a definir las animaciones y el contenido de cada pantalla --------------------------------

void pantallaUno() {
  image(img1, 0, 0, 640, 480);
  fill(0, 150); 
  noStroke();
  rectMode(CENTER);
  rect(width/2, 240, 480, 150); 
  fill(255);
  textSize(20);
  text("Portal 2 es un videojuego de puzzles \nen primera persona donde debes escapar de \nun gigantesco y misterioso laboratorio", animacionX, 240); // descubri que utilizar \n baja el texto sin necesidad de hacer todo un texto nuevo :D
  
  if (animacionX < width/2) {
    animacionX += 5;
  }
}

void pantallaDos() {
  image(img2, 0, 0, 640, 480);
  fill(0, 150); 
  noStroke();
  rectMode(CENTER);
  rect(width/2, 240, 600, 150); 
  fill(255);
  textSize(25);
  text("La mecánica principal consiste en abrir \nportales en las paredes para teletransportarte \ny resolver acertijos usando la física", width/2, animacionY);
  
  if (animacionY > 240) {
    animacionY -= 5; 
  }
}

void pantallaTres() {
  image(img3, 0, 0, 640, 480);
  fill(0, 150); 
  noStroke();
  rectMode(CENTER);
  rect(width/2, 240, 500, 150); 
  fill(255, opacidad); 
  textSize(22);
  text("El juego destaca por su narrativa llena \nde humor negro, liderada por inteligencias \nartificiales sarcásticas que controlan el lugar", width/2, 240);
  
  if (opacidad < 255) {
    opacidad += 5; 
  }
}

void pantallaCuatro() {
  image(img4, 0, 0, 640, 480);
  fill(0, 150); 
  noStroke();
  rectMode(CENTER);
  rect(width/2, 240, 450, 200); 
  fill(255);
  textSize(escala); 
  text("Además de la historia principal, \nincluye un modo cooperativo único donde \ndos robots deben coordinarse para \nsuperar los desafíos", width/2, 240);
  
  if (escala < 20) { 
    escala += 1.2;   
  }
}

void pantallaCinco() { 
  image(img5, 0, 0, 640, 480);
  fill(0, 150); 
  noStroke();
  rectMode(CENTER);
  rect(width/2, 240, 400, 125); 
  fill(255, opacidad);
  textSize(20);
  text("Es considerado una obra maestra de la \nindustria por su diseño inteligente \nque hace sentir brillante al jugador", width/2, 240);
  
  if (opacidad < 255) {
    opacidad += 5;
  }
}

void pantallaFinal() {
  image(img6, 0, 0, 640, 480);
  
  fill(255);
  
  // este if solo existe para hacer una animacion bonita con el boton de reinicio
  if (mouseX > 240 && mouseX < 400 && mouseY > 275 && mouseY < 325) {
    fill(252, 147, 3);
  } else {
    fill(64, 169, 254);
  }

  rectMode(CENTER);
  rect(width/2, 300, 160, 50, 28); 
  
  fill(255);
  textSize(20);
  text("REINICIAR", width/2, 300);
  rectMode(CORNER);
}

// estos son los parametros que utilizamos en la clase de el paint para poder hacer que el boton funcione
void mousePressed() {
  if (pantalla == 5 && mouseX > 240 && mouseX < 400 && mouseY > 275 && mouseY < 325) {
    pantalla = 0;                
    tiempoGuardado = millis();  
    animacionX = 0;
    animacionY = 480;
    opacidad = 0;
    escala = 0;
  }
}
