﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsNetForeMostTest.DataAccess.Models;
using WinFormsNetForeMostTest.DataAccess.Repository;
using WinFormsNetForeMostTest.DataAcess.Utils;

namespace WinFormsNetForeMostTest.BusinessLogic
{
    public class CompraManager
    {
        private readonly ProductoRepository _productoRepository;
        private readonly CompraRepository _compraRepository;
        private readonly NetForeMostTestContext _dbContext;

        public CompraManager(NetForeMostTestContext dbContext)
        {
            _dbContext = dbContext;
            _productoRepository = new ProductoRepository(dbContext);
            _compraRepository = new CompraRepository(dbContext);
        }

        public void RegistrarCompra(string nombreProducto, int cantidadComprada, decimal precioUnitario)
        {
            try
            {
                // Verificar si el producto existe en la base de datos
                Producto producto = _productoRepository.ObtenerProductoPorNombre(nombreProducto);

                if (producto == null)
                {
                    throw new Exception("El producto no existe en el inventario.");
                }

                // Registrar la compra en la base de datos
                _compraRepository.RegistrarCompra(producto.ProductoID, cantidadComprada, precioUnitario);

                // Actualizar la cantidad disponible del producto en el inventario
                _productoRepository.ActualizarCantidadDisponible(producto.ProductoID, cantidadComprada);
            }
            catch (Exception ex)
            {
                // Manejar cualquier error y mostrar un mensaje al usuario
                Console.WriteLine($"Error al registrar la compra: {ex.Message}");
                throw;
            }
        }
    }
}
