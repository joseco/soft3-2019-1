using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VentasNur.BRL
{
    /// <summary>
    /// Summary description for ProductoBRL
    /// </summary>
    public class ProductoBRL
    {
        public ProductoBRL()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static List<Producto> GetProductos()
        {
            ProductoDSTableAdapters.ProductoTableAdapter adapter = new ProductoDSTableAdapters.ProductoTableAdapter();
            ProductoDS.ProductoDataTable table = adapter.GetProductos();

            List<Producto> list = new List<Producto>();
            foreach (var row in table)
            {
                Producto obj = GetProductoFromRow(row);
                list.Add(obj);
            }
            return list;
        }

        public static Producto GetProductoById(int productoId)
        {
            if (productoId <= 0)
                throw new ArgumentException("El productoId no puede ser menor o igual que cero");
            
            ProductoDSTableAdapters.ProductoTableAdapter adapter = new ProductoDSTableAdapters.ProductoTableAdapter();
            ProductoDS.ProductoDataTable table = adapter.GetProductoById(productoId);
            
            if(table == null || table.Rows.Count != 1)
            {
                throw new Exception("La table obtenida no tiene el numero correcto de filas");
            }
            Producto obj = GetProductoFromRow(table[0]);
            return obj;
        }

        public static int InsertProducto(Producto obj)
        {
            if (obj == null)
                throw new ArgumentException("El objeto a insertar no puede ser nulo");

            if (string.IsNullOrEmpty(obj.Nombre))
                throw new ArgumentException("El nombre no puede ser nulo o vacio");

            if (obj.Precio <= 0)
                throw new ArgumentException("El precio no puede ser menor o igual que ceo");

            if (obj.Stock < 0)
                throw new ArgumentException("El stock no puede ser negativo");

            int? id = null; 
            ProductoDSTableAdapters.ProductoTableAdapter adapter = new ProductoDSTableAdapters.ProductoTableAdapter();
            adapter.Insert(obj.Nombre, obj.Precio, obj.Stock, ref id);

            if (id == null || id.Value <= 0)
                throw new Exception("La llave primaria no se generó correctamente");

            return id.Value;
        }

        public static void UpdateProducto(Producto obj)
        {
            if (obj == null)
                throw new ArgumentException("El objeto a insertar no puede ser nulo");

            if(obj.ProductoId <= 0)
                throw new ArgumentException("El productoId no puede ser menor o igual que cero");

            if (string.IsNullOrEmpty(obj.Nombre))
                throw new ArgumentException("El nombre no puede ser nulo o vacio");

            if (obj.Precio <= 0)
                throw new ArgumentException("El precio no puede ser menor o igual que cero");

            if (obj.Stock < 0)
                throw new ArgumentException("El stock no puede ser negativo");
            
            ProductoDSTableAdapters.ProductoTableAdapter adapter = new ProductoDSTableAdapters.ProductoTableAdapter();
            adapter.Update(obj.Nombre, obj.Precio, obj.Stock, obj.ProductoId);
        }

        public static void DeleteProducto(int productoId)
        {
            if (productoId <= 0)
                throw new ArgumentException("El productoId no puede ser menor o igual que cero");

            ProductoDSTableAdapters.ProductoTableAdapter adapter = new ProductoDSTableAdapters.ProductoTableAdapter();
            adapter.Delete(productoId);
        }

        private static Producto GetProductoFromRow(ProductoDS.ProductoRow row)
        {
            return new Producto()
            {
                Nombre = row.nombre,
                ProductoId = row.productoId,
                Precio = row.precio,
                Stock = row.stock
            };
        }

    }
}