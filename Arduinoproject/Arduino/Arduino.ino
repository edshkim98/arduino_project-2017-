#define sensor  //write ur pin number down
#define R0 10000.0
#define n 4220.0 //coefficient of thermistor
#define T0 298 //room temperature 25 celcius degree in kelvin
void setup() 
{
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() 
{
  // put your main code here, to run repeatedly:
  int reading = analogRead(sensor);
  float sensorV = (reading*5.0)/1024.0; //changes the value of reading (0-1023) to the value of voltage(0-5)
  float sensorR =((5.0* R0)/ sensorV) - R0;
  float kelvinT = 1.0 / ((1.0 / T0) + (1.0 /n)* log(sensorR / R0)); //using Stein Hart equation to calculate temperature
  float celsiusT = kelvinT-273.0; //changes kelvin to celcius
  Serial.print("Temperature: ");
  Serial.println(celsiusT);
  delay(500);
  
}
