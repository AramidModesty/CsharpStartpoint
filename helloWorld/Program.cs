using System.ComponentModel;
using System.Dynamic;
using System.Globalization;
using System.Linq.Expressions;
using System.Runtime.InteropServices.Marshalling;
using System.Xml;
using HiValidator;
/*Data int*/
// The next code is made by Aramid for when asking user to input values

namespace HiValidator
{
    class validateInt{
    // Sample method, the thing <var> is for generic variables and the "where"
    // statement makes the int only receive struct int, being every number like character.
        public bool IsInRange(int val, int lInf, int lSup)
        {
            return lInf<val && val<lSup;
        }
        public int ReadInt()
        {
            bool isValid=false;
            int age=0;
            while (!isValid)
            {
                var read = Console.ReadLine();
                isValid=int.TryParse(read,out int poss);
                if(!isValid) Console.WriteLine($"You have written, {poss} which is not valid");
                age=poss;
            }
             return age;
        }
        public DateOnly ReadDate()
        {
            bool isValid=false;
            DateOnly date=new DateOnly();
            while (!isValid)
            {
                var read = Console.ReadLine();
                isValid=DateOnly.TryParse(read,out DateOnly poss);
                if(!isValid) Console.WriteLine($"You have written, {poss} which is not valid");
                date=poss;
            }
             return date;
        }
    }

}
namespace HelloWorld//By optativa
{
    class HelloWorld
    {
        public static void Main()
        {
            systemControl control = new();
            Console.WriteLine("Tap a key to test the system control");
            System.ConsoleKey key=control.KeyTester();
            Console.WriteLine("Hello, this is the second recording of Optativa");
            var valid=new validateInt();
            Console.WriteLine("Write your name");
            var name = Console.ReadLine() ?? "";
            Console.WriteLine("Write your age");
            int age=valid.ReadInt();
            Console.WriteLine("int your birthday in the format of MM/DD/YYYY");
            var birthday = valid.ReadDate();
            var person = new Persona
            {
                Name=name,
                Age=age,
                Birthday=birthday
            };
            Console.WriteLine($"Hello {person.Name}, you are {person.Age}" +
            $"years old and your birthday is on {person.Birthday.ToString("MM/dd/yyyy")}");


        }
    }
    class systemControl()
    {
        public System.ConsoleKey KeyTester()
        {
            try
            {
                var controller = Console.ReadKey().Key;
                if (controller.Equals('A'))
                {
                    Console.WriteLine("A has been pressed successfully");
                }
                else
                {
                    Console.WriteLine($"You have pressed {controller} key\n"
                    + $"To string is equal to {controller.ToString()}");
                }
                return controller;
            }
            catch
            {
                Console.WriteLine("Illegal key or runnning from the dev console. Returning placeholder");
            }
            return System.ConsoleKey.B;
        }
    }
    class Persona
    {
        /* In C#, the variables that cannot be nulled are put as required
        there is a big change in the writting style because of this
        get; set;
        instead of
        public void setAtt(int att){
            this.Att=att
        }
        public int getAtt(){
            return Att
        }
        */
        public required string Name { get; set; }
        public int Age { get; set; }
        public DateOnly Birthday { get; set; }
    }
    class TecnicalPersona : Persona
    {
        public string JobTitle { get; set; }
        public string Company { get; set; }
        public object readTechnicalPersona()
        {
            string Name=Console.ReadLine() ?? "";
            int Age=int.Parse(Console.ReadLine() ?? "0");
            DateOnly Birthday=DateOnly.Parse(Console.ReadLine() ?? "01/01/2000");
            string JobTitle=Console.ReadLine() ?? "";
            string Company=Console.ReadLine() ?? "";
            TecnicalPersona objTechnicalPersona = new() //Abreviatura
            {
                Name=Name,
                Age=Age,
                Birthday=Birthday,
                JobTitle=JobTitle,
                Company=Company
            };
            return objTechnicalPersona;
        }
    }
    interface IControl
    {
        System.ConsoleKey KeyTester();
    }
}