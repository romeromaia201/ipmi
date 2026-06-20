// https://www.youtube.com/watch?v=BZsCrLOTsJo

PImage opart;

// ------ unas variables globales de control para las interacciones de el opart :p ---------------------

float movimientoFondo = 0;   // Controla el desplazamiento vertical
float movimientoCentro = 0;  // Controla el desplazamiento horizontal
float tamanoCentro = 240;    // Tamaño base del centro

boolean cambiarColor = false;    // Interruptor para activar el cambio de color con la 'C'
color colorAleatorio = color(0); // Guardará el color loco que elija random()
boolean escalarConMouse = false; // Si se apretó la 'F', activa cambiar el tamaño y congela el movimiento

void setup() {
  size(800, 400);
  opart = loadImage("opart.png");
}

void draw() {
  background(255);

  image(opart, 0, 0, 400, 400);
  
// ---------interaccion para cuando se presiona el mouse -------------

  if (mousePressed) {

    if (escalarConMouse) {
      mapearTamano(mouseY);
    } else {
      float distancia = dist(mouseX, mouseY, 600, 200);
      movimientoCentro = map(distancia, 0, 400, 0, 30);
      movimientoFondo = map(mouseY, 0, 400, 0, 40);
    }
  }
  
  dibujarFondo();
  dibujarCentro();
  
}

// ----------- funcion que modifica el tamaño -----------
void mapearTamano(float posicionY) {
  tamanoCentro = map(posicionY, 0, 400, 160, 320);
}

// ----------- esta funcion retorna un color -----------
color obtenerColor(color colorOriginal) {
  // Si se activó la tecla 'C' y el bloque actual es negro, le ponemos el color random
  if (cambiarColor && colorOriginal == color(0)) {
    return colorAleatorio;
  }
  return colorOriginal;
}

// ----------- Función para dibujar los rectángulos del fondo ---------------

void dibujarFondo() {
  noStroke();
  int columnas = 10;
  int filas = 40;

  float anchoRect = 400.0 / columnas;
  float altoRect = 400.0 / filas;

  for (int c = 0; c < columnas; c++) {
    for (int f = 0; f < filas; f++) {
      float x = 400 + (c * anchoRect);
      float y = f * altoRect;
      
// -------- movimiento vertical ----------

      if (c % 2 != 0) {
        y = y - movimientoFondo;
      } else {
        y = y + movimientoFondo;
      }
// ------ color de las filas ----------------

      if (c % 2 == 0) {
        if (f % 2 == 0) fill(obtenerColor(color(0)));
        else fill(obtenerColor(color(255)));
      } else {
        if (f % 2 == 0) fill(obtenerColor(color(255)));
        else fill(obtenerColor(color(0)));
      }

      rect(x, y, anchoRect, altoRect);
    }
  }
}

// ------------- Función para dibujar rectángulos del centro ------------------------

void dibujarCentro() {
  
  noStroke();

  int filasCentro = 6;
  int columnasCentro = 24;

  float anchoRectCentro = tamanoCentro / columnasCentro;
  float altoRectCentro = tamanoCentro / filasCentro;

  float centroX = 600 - (tamanoCentro / 2);
  float centroY = 200 - (tamanoCentro / 2);

  for (int f = 0; f < filasCentro; f++) {
    for (int c = 0; c < columnasCentro; c++) {

      float x = centroX + (c * anchoRectCentro);
      float y = centroY + (f * altoRectCentro);

// ------- para que se muevan horizontalmente ahora pero las filas de el centro ------------

      if (f % 2 == 0) {
        x = x + movimientoCentro;
      } else {
        x = x - movimientoCentro;
      }

      pushMatrix();
      translate(x, y);

      if (f % 2 == 0) {
        if (c % 2 == 0) fill(obtenerColor(color(0)));
        else fill(obtenerColor(color(255)));
      } else {
        if (c % 2 == 0) fill(obtenerColor(color(255)));
        else fill(obtenerColor(color(0)));
      }

      rect(0, 0, anchoRectCentro, altoRectCentro);
      popMatrix();
    }
  }
}

// --- eventos de teclado :3 ---
void keyPressed() {
  
// ------------------- Tecla 'F' para activar si se agranda o no con el mouse presionado ------------------------

  if (key == 'f' || key == 'F') {
    escalarConMouse = !escalarConMouse;
  }

// ---------------  Tecla 'C'para caambiar a un color aleatorio todos los rectangulos negros  -------------------

  if (key == 'c' || key == 'C') {
    cambiarColor = true; // Se queda siempre activado el modo color
    colorAleatorio = color(random(255), random(255), random(255)); // Elige un color nuevo cada vez
  }


// --------------- Tecla 'R' reinicia ABSOLUTAMENTE TODO a los valores originales exactos -------------------------

  if (key == 'r' || key == 'R') {
    movimientoFondo = 0;
    movimientoCentro = 0;
    tamanoCentro = 240;
    cambiarColor = false;
    escalarConMouse = false;
    colorAleatorio = color(0);
  }
}
