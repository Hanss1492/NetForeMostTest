using WinFormsNetForeMostTest.DataAccess.Models;
using WinFormsNetForeMostTest.DataAcess.Utils;

namespace WinFormsNetForeMostTest.DataAccess.Repository;

public class VentaRepository
{
    private readonly NetForeMostTestContext _dbContext;

    public VentaRepository(NetForeMostTestContext dbContext)
    {
        _dbContext = dbContext;
    }
    public void RegistrarVenta(int productoID, int cantidadVendida)
    {
        try
        {
            using (var transaction = _dbContext.Database.BeginTransaction())
            {
                try
                {
                    // Crear una nueva instancia de Venta
                    Venta nuevaVenta = new Venta
                    {
                        ProductoID = productoID,
                        CantidadVendida = cantidadVendida
                    };

                    // Agregar la nueva venta al DbSet de Ventas
                    _dbContext.Ventas.Add(nuevaVenta);

                    // Guardar los cambios en la base de datos
                    _dbContext.SaveChanges();

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw new Exception("Error al registrar la venta.", ex);
                }
            }
        }
        catch (Exception ex)
        {
            // Manejar cualquier error y mostrar un mensaje al usuario
            Console.WriteLine($"Error al registrar la venta: {ex.Message}");
            throw;
        }
    }
}
