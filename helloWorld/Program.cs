using System.Dynamic;
using System.Globalization;
using System.Linq.Expressions;
using System.Runtime.InteropServices.Marshalling;
using System.Xml;
/*Data type*/
// The next code is made by Aramid for when asking user to input values
var valInt = new validateNum<int>();
var objControl = new systemControl();
Console.WriteLine("Type your name");
var name = Console.ReadLine() ?? "";
Console.WriteLine($"Hello {name}, please press a key");
var yourKey = objControl.KeyTester();
Console.WriteLine($"Your key is {yourKey}");
Console.WriteLine("Type your age");
var age=0;
var age = int.Parse(Console.ReadLine() ?? "0");
Console.WriteLine("Type your birthday in the format of MM/DD/YYYY");
var birthday = DateOnly.Parse(Console.ReadLine() ?? "01/01/2000");
var person = new Persona(name, age, birthday) { Name = name };

class validateNum <type> where type:struct{
    // Sample method, the thing <var> is for generic variables and the "where"
    // statement makes the type only receive struct type, being every number like character.
    public type input(string text="", type lInf=null, type lSup=null, string error="Not valid number")//Like the one from python
    {
        type val=null;
        bool condition=true;
        while(val==null || !condition){//While the user doesn't put in a valid value
            try{
                Console.WriteLine(text);
                type val= type(Console.ReadLine());
            }
            catch
            {
                Console.Write(error);
            }
        if(lInf!=null) condition=lInf;
        if(lSup!=null) lowerThan(val,lSup);
        }
        return val;
    }
}
namespace HelloWorld
{
    class systemControl()
    {
        public System.ConsoleKey KeyTester()
        {
            try
            {
                var controller = Console.ReadKey().Key;
                if (controller.Equals('A'))
                {
                    Console.WriteLine("a has been pressed successfully");
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
    class Persona()
    {
        
        /* In C#, the variables that cannot be nulled are put as required
        there is a big change in the writting style because of this
        get; set;
        instead of
        public void setAtt(type att){
            this.Att=att
        }
        public type getAtt(){
            return Att
        }
        */
        public required string Name { get; set; }
        public int Age { get; set; }
        public DateOnly Birthday { get; set; }
        public Persona(string name, int age, DateOnly birthday) : this()
        {
            this.Name = name ?? "";
            this.Age = age;
            this.Birthday = birthday;
        }

        public int Age { get; set; }
        public DateOnly Birthday { get; set; }
    }
    class TecnicalPersona : Persona
    {
        public string JobTitle { get; set; }
        public string Company { get; set; }
        public TecnicalPersona(string name, int age, DateOnly birthday, string jobTitle, string company) : base(name, age, birthday)
        {
            this.JobTitle = jobTitle;
            this.Company = company;
        }
        public object technicalPersona()
        {
            string Name=Console.ReadLine() ?? "";
            int Age=int.Parse(Console.ReadLine() ?? "0");
            DateOnly Birthday=DateOnly.Parse(Console.ReadLine() ?? "01/01/2000");
            string JobTitle=Console.ReadLine() ?? "";
            string Company=Console.ReadLine() ?? "";
            TecnicalPersona objTechnicalPersona = new(Name, Age, Birthday, JobTitle, Company) { Name = Name };
            return objTechnicalPersona;
        }
    }
    interface IControl
    {
        System.ConsoleKey KeyTester();
    }
}