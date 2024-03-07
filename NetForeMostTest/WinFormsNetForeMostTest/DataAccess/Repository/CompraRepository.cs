using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsNetForeMostTest.DataAccess.Models;
using WinFormsNetForeMostTest.DataAcess.Utils;

namespace WinFormsNetForeMostTest.DataAccess.Repository;

public class CompraRepository
{
    private readonly NetForeMostTestContext _dbContext;

    public CompraRepository(NetForeMostTestContext dbContext)
    {
        _dbContext = dbContext;
    }
    public void RegistrarCompra(int productoID, int cantidadComprada, decimal precioUnitario)
    {
        // Crear una nueva instancia de Compra
        Compra nuevaCompra = new Compra
        {
            ProductoID = productoID,
            CantidadComprada = cantidadComprada,
            PrecioUnitario = precioUnitario
        };

        // Agregar la nueva compra al DbSet de Compras
        _dbContext.Compras.Add(nuevaCompra);

        // Guardar los cambios en la base de datos
        _dbContext.SaveChanges();
    }
}
