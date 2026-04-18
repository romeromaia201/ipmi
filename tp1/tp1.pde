PImage miObraArquitectonica;

void setup(){
  size( 800, 400 );
    background( 31, 88, 119 );

  miObraArquitectonica = loadImage( "edificio.png" );
}

void draw(){

  image( miObraArquitectonica, 0, 0, 400, 400 );
  text("X: " + mouseX + " Y: " + mouseY, 10, 20);

//----------------------estructura base ----------------------

//edificio entero
fill( 249, 248, 244 );
noStroke();
 rect( 550, 146, 170, 220 );

//entrada
fill(11,1,10);
noStroke();
rect(516,290,34,400);

//sombra debajo de la puerta
fill(76, 73, 80);
noStroke();
rect(515, 276, 35, 18); 

//pared del lado de la puerta
noStroke();
fill( 249, 248, 244 );
rect( 495, 274, 20, 400 );

//piso de arriba
fill(234, 229, 226 );
rect(433,188,257,77);

//pared de adentro
fill(236, 231, 228);
rect( 453, 200, 221, 50);

//sombra abajo de el edificio
fill(0, 85);
triangle( 495, 289, 674, 289, 495, 368 );


//--------------------escaleras TnT ----------------------------------

//primera escalera y segunda escalera
fill(249, 248, 244);
noStroke();
quad( 510, 320, 566, 320, 800, 400, 502, 400 ); 
rect(400, 344, 800, 400);

//piso
fill(168, 151, 144);
rect(400, 380, 800, 400);

//primera escalera lineas
stroke(168, 151, 144);
strokeWeight(1.5);
line(510, 320, 566, 320);
line(509, 325, 580, 324);
line(508, 330, 600, 330);
line(507, 335, 620, 334);
line(506, 340, 640, 340);

//segunda escalera lineas
line(400, 344, 800, 344);
line(400, 350, 800, 350);
line(400, 355, 800, 355);
line(400, 360, 800, 360);
line(400, 365, 800, 365);
line(400, 370, 800, 370);
line(400, 375, 800, 375);

//--------------------detalles :33-----------------------------------

//sombra de el piso de arriba
fill(169, 157, 159);
noStroke();
quad(435,265,689,265,675,289,452,289 );

//sombras
fill(114, 131, 141);
noStroke();
quad( 553, 202, 675, 202, 675, 250, 467, 250);
rect( 530, 202, 130, 15 );
fill( 96, 96, 104 );
rect( 550, 202, 121, 15);
stroke( 146, 146, 154 );
strokeWeight(3);
line( 453, 200, 673, 200);
strokeWeight(4);
line(673, 200, 673, 248);

//ventana
fill( 37, 34, 41 );
strokeWeight(2);
stroke(10);
rect( 586, 218, 83, 30 );

//brillo de la ventana
fill(107, 153, 176, 80);
noStroke();
rect( 586, 233, 70, 17);

//lineas de la ventana
strokeWeight(2);
stroke(10);
line(607, 218, 607,248);
line(627, 218, 627, 248);
line( 647, 218, 647, 248);


}
