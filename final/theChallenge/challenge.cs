/*
1. Positive Power
Descripción: Solicita al usuario un número y eleva este número al cuadrado
solo si es positivo.
Posibles resultados:
 Ingreso: 5 => Resultado: 25
 Ingreso: -4 => Resultado: Número negativo.
 Ingreso: 0 => Resultado: 0
2. Double or Triple
Descripción: Solicita al usuario dos números. Si el primero es mayor, devuelva
su doble, de lo contrario devuelva el triple del segundo.
Posibles resultados:
 Ingresos: 4, 3 => Resultado: 8
 Ingresos: 2, 5 => Resultado: 15
 Ingresos: 6, 6 => Resultado: 12
3. Root or Square
Descripción: Pide al usuario un número. Si es positivo, devuelve su raíz
cuadrada, de lo contrario, devuelve su cuadrado.
Posibles resultados:
 Ingreso: 9 => Resultado: 3
 Ingreso: -3 => Resultado: 9
 Ingreso: 0 => Resultado: 0
4. Circle Perimeter
Descripción: Pide al usuario el radio de un círculo y calcula su perímetro.
Posibles resultados:
 Ingreso: 5 => Resultado: 31.42
 Ingreso: 1 => Resultado: 6.28
 Ingreso: 7 => Resultado: 43.98
5. Midweek Day
Descripción: Solicita al usuario un número entre 1 y 7 y muestra el día de la
semana correspondiente, pero solo considerando los días laborables.
Posibles resultados:
 Ingreso: 1 => Resultado: Lunes
 Ingreso: 5 => Resultado: Viernes
 Ingreso: 6 => Resultado: Número fuera del rango laboral.
6. Tax Calculator
Descripción: Solicita al usuario su salario anual y, si este excede los 12000,
muestra el impuesto a pagar que es el 15% del excedente.
Posibles resultados:
 Ingreso: 13000 => Resultado: 150
 Ingreso: 10000 => Resultado: No debe impuestos.
 Ingreso: 20000 => Resultado: 1200
7. Remainder Finder
Descripción: Solicita dos números y muestra el residuo de la división del
primero entre el segundo.
Posibles resultados:
 Ingresos: 10, 3 => Resultado: 1
 Ingresos: 7, 2 => Resultado: 1
 Ingresos: 8, 4 => Resultado: 0
8. Sum of Evens
Descripción: Calcula y muestra la suma de los números pares entre 1 y 50.
Posibles resultados: (sin entrada)
 Resultado: 650
9. Fraction Difference
Descripción: Solicita al usuario los valores para dos fracciones y muestra la
diferencia entre esas fracciones.
Posibles resultados:
 Ingresos: 1/2, 1/3 => Resultado: 1/6
 Ingresos: 2/3, 1/2 => Resultado: 1/6
 Ingresos: 1/4, 1/4 => Resultado: 0
10. String Length
Descripción: Pide una palabra al usuario y muestra la longitud de esa palabra.
Posibles resultados:
 Ingreso: "casa" => Resultado: 4
 Ingreso: "computadora" => Resultado: 11
 Ingreso: "sol" => Resultado: 3
11. Average of Four
Descripción: Pide al usuario cuatro números y muestra el promedio.
Posibles resultados:
 Ingresos: 2, 4, 6, 8 => Resultado: 5
 Ingresos: 10, 20, 30, 40 => Resultado: 25
 Ingresos: 0, 1, 2, 3 => Resultado: 1.5
12. Smallest of Five
Descripción: Pide al usuario cinco números y muestra el más pequeño.
Posibles resultados:
 Ingresos: 1, 2, 3, 4, 5 => Resultado: 1
 Ingresos: 5, 4, 3, 2, 1 => Resultado: 1
 Ingresos: 10, 20, 5, 15, 25 => Resultado: 5
13. Vowel Counter
Descripción: Pide una palabra al usuario y devuelve el número de vocales en
esa palabra.
Posibles resultados:
 Ingreso: "murcielago" => Resultado: 5
 Ingreso: "sol" => Resultado: 1
 Ingreso: "casa" => Resultado: 2
14. Factorial Finder
Descripción: Pide un número al usuario y devuelve el factorial de ese número.
Posibles resultados:
 Ingreso: 5 => Resultado: 120
 Ingreso: 3 => Resultado: 6
 Ingreso: 4 => Resultado: 24
15. InRange Validator
Descripción: Pide un número al usuario y verifica si está en el rango de 10 a 20
(ambos incluidos).
Posibles resultados:
 Ingreso: 15 => Resultado: Está en el rango.
 Ingreso: 9 => Resultado: Fuera del rango.
 Ingreso: 21 => Resultado: Fuera del rango.
*/
namespace TheChallenge
{
    class Challenge
    {
        readonly validateInt valid=new();
        public void Run()
        {
            int opt = 0;

            while (opt != 16)
            {
                Console.WriteLine(getMenu());
                opt = valid.ReadInt();
                caseFinder(opt);
            }
        }
        public string getMenu(){
          return "1. Positive Power\n"+
          "2. Double or Triple\n"+
          "3. Root or Square\n"+
          "4. Circle Perimeter\n"+
          "5. Midweek Day\n"+
          "6. Tax Calculator\n"+
          "7. Remainder Finder\n"+
          "8. Sum of Evens\n"+
          "9. Fraction Difference\n"+
          "10. String Length\n"+
          "11. Average of Four\n"+
          "12. Smallest of Five\n"+
          "13. Vowel Counter\n"+
          "14. Factorial Finder\n"+
          "15. InRange Validator\n"+
          "16. Exit\n"+
          "Write the number of the challenge you want to execute";
        }
        public void caseFinder(int num){
          switch(num){
            case 1:
              positivePower();
              break;
            case 2:
              doubleOrTriple();
              break;
            case 3:
              rootOrSquare();
              break;
            case 4:
              circlePerimeter();
              break;
            case 5:
              midweekDay();
              break;
            case 6:
              taxCalculator();
              break;
            case 7:
              remainderFinder();
              break;
            case 8:
              sumOfEvens();
              break;
            case 9:
              fractionDifference();
              break;
            case 10:
              stringLength();
              break;
            case 11:
              averageOfFour();
              break;
            case 12:
              smallestOfFive();
              break;
            case 13:
              vowelCounter();
              break;
            case 14:
              factorialFinder();
              break;
            case 15:
              inRangeValidator();
              break;
            case 16:
              Console.WriteLine("Exiting...");
              break;
             default:
              Console.WriteLine("You have written an invalid number");
              break;
          }
        }
        public void positivePower(){
          Console.WriteLine("Write a number");
          int num=valid.ReadInt();
          if(num>0) Console.WriteLine($"The result is {num*num}");
          else if(num<0) Console.WriteLine("Negative number");
          else Console.WriteLine("The result is 0");
        }
        public void doubleOrTriple(){
          Console.WriteLine("Write the first number");
          int num1=valid.ReadInt();
          Console.WriteLine("Write the second number");
          int num2=valid.ReadInt();
          if(num1>num2) Console.WriteLine($"The result is {num1*2}");
          else Console.WriteLine($"The result is {num2*3}");
        }
        public void rootOrSquare(){
          Console.WriteLine("Write a number");
          int num=valid.ReadInt();
          if(num>0) Console.WriteLine($"The result is {Math.Sqrt(num)}");
          else if(num<0) Console.WriteLine($"The result is {num*num}");
          else Console.WriteLine("The result is 0");
        }
        public void circlePerimeter(){
          Console.WriteLine("Write the radius of the circle");
          int radius=valid.ReadInt();
          Console.WriteLine($"The result is {2*Math.PI*radius}");
        }
        public void midweekDay(){
          Console.WriteLine("Write a number between 1 and 7");
          int num=valid.ReadInt();
          switch(num){
            case 1:
              Console.WriteLine("Monday");
              break;
            case 2:
              Console.WriteLine("Tuesday");
              break;
            case 3:
              Console.WriteLine("Wednesday");
              break;
            case 4:
              Console.WriteLine("Thursday");
              break;
            case 5:
              Console.WriteLine("Friday");
              break;
             default:
              Console.WriteLine("Number out of range");
              break;
          }
        }
        public void taxCalculator(){/* Ingreso: 13000 => Resultado: 150
 Ingreso: 10000 => Resultado: No debe impuestos.
 Ingreso: 20000 => Resultado: 1200*/
          Console.WriteLine("Write your annual salary");
          int salary=valid.ReadInt();
          if(salary>12000) Console.WriteLine($"You have to pay {0.15*(salary-12000)} in taxes");
          else Console.WriteLine("You don't have to pay taxes");
        }
        public void remainderFinder(){
          Console.WriteLine("Write the first number");
          int num1=valid.ReadInt();
          Console.WriteLine("Write the second number");
          int num2=valid.ReadInt();
          Console.WriteLine($"The result is {num1%num2}");
        }
        public void sumOfEvens(){
          int sum=0;
          for(int i=1;i<=50;i++){
            if(i%2==0) sum+=i;
          }
          Console.WriteLine($"The result is {sum}");
        }
        public void fractionDifference(){
          Console.WriteLine("Write the first fraction in the format of a/b");
          var fraction1=Console.ReadLine()??"";
          Console.WriteLine("Write the second fraction in the format of a/b");
          var fraction2=Console.ReadLine()??"";
          var parts1=fraction1.Split('/');
          var parts2=fraction2.Split('/');
          try{
            int num1=int.Parse(parts1[0]);
            int den1=int.Parse(parts1[1]);
            int num2=int.Parse(parts2[0]);
            int den2=int.Parse(parts2[1]);
            int resultNum=num1*den2-num2*den1;
            int resultDen=den1*den2;
            Console.WriteLine($"The result is {resultNum}/{resultDen}");
          }catch{
            Console.WriteLine("You have written an invalid fraction");
          }
        }
        public void stringLength(){
          Console.WriteLine("Write a word");
          var word=Console.ReadLine()??"";
          Console.WriteLine($"The result is {word.Length}");
        }
        public void averageOfFour(){
          int sum=0;
          for(int i=1;i<=4;i++){
            Console.WriteLine($"Write the number {i}");
            sum+=valid.ReadInt();
          }
          Console.WriteLine($"The result is {sum/4}");
        }
        public void smallestOfFive(){
          int smallest=int.MaxValue;
          for(int i=1;i<=5;i++){
            Console.WriteLine($"Write the number {i}");
            int num=valid.ReadInt();
            if(num<smallest) smallest=num;
          }
          Console.WriteLine($"The result is {smallest}");
        }
        public void vowelCounter(){
          Console.WriteLine("Write a word");
          var word=Console.ReadLine()??"";
          int count=0;
          foreach(var letter in word){
            if("aeiouAEIOU".Contains(letter)) count++;
          }
          Console.WriteLine($"The result is {count}");
        }
        public void factorialFinder(){
          Console.WriteLine("Write a number");
          int num=valid.ReadInt();
          int result=1;
          for(int i=1;i<=num;i++){
            result*=i;
          }
          Console.WriteLine($"The result is {result}");
        }
        public void inRangeValidator(){
          Console.WriteLine("Write a number");
          int num = valid.ReadInt();
          if(num>=10 && num<=20) Console.WriteLine("The number is in the range");
          else Console.WriteLine("The number is out of the range");
        }
    }

    class validateInt
    {
        public int ReadInt()
        {
            bool isValid = false;
            int value = 0;

            while (!isValid)
            {
                var read = Console.ReadLine();
                isValid = int.TryParse(read, out int poss);
                if (!isValid)
                {
                    Console.WriteLine($"You have written '{read}', which is not valid. Try again.");
                }
                else
                {
                    value = poss;
                }
            }

            return value;
        }
    }
}
