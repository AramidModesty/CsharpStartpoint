void main(){
  Cuadrado cuadrado = Cuadrado();
  cuadrado.lado = 5;
  cuadrado.base = 10;
  //Valor de ejemplo, un cuadrado no tiene valores distintos
  //para los lados.
  print("Area del cuadrado: ${cuadrado.area}");
  print("Perimetro del cuadrado: ${cuadrado.perimetro}");
  print("El lado del cuadrado es: ${cuadrado.base}"); 
}
class Rectangulo{
  double? base;
  double? altura;//dart retorna rapido con get => val;
  double get area => base! * altura!;
  double get perimetro => 2 * (base! + altura!);
  Rectangulo({this.base, this.altura});//Constructor ejemplo.
}
class Cuadrado extends Rectangulo{//subclase de rectangulo.
  set lado(double value){
    base = value;
    altura = value;
  }
  Cuadrado({double? lado}): super(base: lado, altura: lado);

}