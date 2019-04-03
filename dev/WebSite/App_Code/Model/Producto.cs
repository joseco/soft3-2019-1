using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Producto
/// </summary>
public class Producto
{

    public int ProductoId { get; set; }
    public string Nombre { get; set; }
    public decimal Precio { get; set; }
    public int Stock { get; set; }

    public Producto()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}