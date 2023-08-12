#include <ESP8266WiFi.h>
#include <WiFiClient.h>

const char* ssid = "LINK";
const char* password = "10025039()";
const char* host = "192.168.0.39";
const int port = 12345;

int pinLed1 = 16;
int pulsador1=2;
int pulsador2=4;
int val = 0; //val se emplea para almacenar el estado del boton
int state = 0; // 0 LED apagado, mientras que 1 encendido
int old_val = 0; 
int old_val2 = 0;

void setup() {
  Serial.begin(115200);
  delay(10);

  pinMode(pinLed1, OUTPUT);
  pinMode(pulsador1, INPUT);
  pinMode(pulsador2, INPUT); 
  // Conectar al WiFi
  Serial.println();
  Serial.println();
  Serial.print("Conectando a ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi conectado");
  Serial.println("IP obtenida: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  val = digitalRead(pulsador1);
  int val2 = digitalRead(pulsador2);

  if(val != old_val){
    if(val == HIGH){
      OpenDoorSecuence();
    }
    old_val = val;
  }

  if(val2 != old_val2){
    if(val2 == HIGH){
      closeDoorSecuence();
    }
    old_val2 = val2;
  }
}
// El LED se enciende 2 veces cuando la puerta se cierre
void closeDoorSecuence(){
  digitalWrite(pinLed1, HIGH);
  delay(500);
  digitalWrite(pinLed1, LOW);
  delay(500);
  digitalWrite(pinLed1, HIGH);
  delay(500);
  digitalWrite(pinLed1, LOW);
  delay(500);
    sendCommands("closeDoor");
}

// EL lED se enciende una vez para abrir la puerta.
void OpenDoorSecuence(){
  digitalWrite(pinLed1, HIGH);
  delay(500);
  digitalWrite(pinLed1, LOW);
  delay(500);
    sendCommands("openDoor");
}

void sendCommands(const char* command){
  Serial.print("Conectando a ");
  Serial.println(host);

  WiFiClient client;
  if (!client.connect(host, port)) {
    Serial.println("Conexión fallida");
    delay(1000);
    return;
  }

  // Envía un comando para abrir la puerta
  client.println(command);
  delay(500);

  // Recibe la respuesta del servidor
  while (client.available()) {
    String response = client.readStringUntil('\r');
    Serial.println(response);
  }

  delay(1000);
}


