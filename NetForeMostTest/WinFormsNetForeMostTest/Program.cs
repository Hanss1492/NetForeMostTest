using Microsoft.EntityFrameworkCore;
using System.Configuration;
using WinFormsNetForeMostTest.DataAcess.Utils;

namespace WinFormsNetForeMostTest
{
    internal static class Program
    {

        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            // Obtener la cadena de conexi�n desde tu archivo de configuraci�n
            string connectionString = ConfigurationManager.ConnectionStrings["NetForeMostTestContext"].ConnectionString;

            // Inicializar la configuraci�n de la aplicaci�n
            AppConfig.Initialize(connectionString);
            ApplicationConfiguration.Initialize();
            Application.Run(new Principal());
        }
    }
}