using Microsoft.EntityFrameworkCore;
using System.Data.SqlClient;
using WinFormsNetForeMostTest.DataAccess.Models;
using WinFormsNetForeMostTest.DataAcess.Utils;

namespace WinFormsNetForeMostTest.DataAccess.Repository;

public class ProductoRepository
{

    private readonly NetForeMostTestContext _dbContext;

    public ProductoRepository(NetForeMostTestContext dbContext)
    {
        _dbContext = dbContext;
    }

    public Producto ObtenerProductoPorNombre(string nombreProducto)
    {
        return _dbContext.Productos.FirstOrDefault(p => p.ProductoNombre == nombreProducto);
    }


    public void ActualizarCantidadDisponible(int productoID, int cantidadComprada)
    {
        var producto = _dbContext.Productos.Find(productoID);
        if (producto != null)
        {
            producto.CantidadDisponible += cantidadComprada;
            _dbContext.SaveChanges();
        }
        else
        {
            throw new Exception("Producto no encontrado.");
        }
    }

}
