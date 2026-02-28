using System.Linq.Expressions;
using System.Runtime.InteropServices.Marshalling;

namespace HelloWorld{
    class Program(){
        static void Main()
        {
            var objProg=new Program();
            Console.WriteLine("Type your name");
            var name=Console.ReadLine();
            Console.WriteLine($"Hello {name}");
            var yourKey=objProg.KeyTester();
        }
        private System.ConsoleKey KeyTester()
        {
        try{
            var controller=Console.ReadKey().Key;
            if(controller.Equals('A')){
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
}