using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VentasNur.BRL;

public partial class Producto_DetalleProducto : System.Web.UI.Page
{
    public int ProductoId
    {
        set { ProductoIdHiddenField.Value = value.ToString(); }
        get
        {
            int productoId = 0;
            try
            {
                productoId = Convert.ToInt32(ProductoIdHiddenField.Value);
            }
            catch (Exception ex)
            {
                
            }
            return productoId;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ProcesarParametros();
        }
    }

    private void ProcesarParametros()
    {
        if(Request.QueryString["ProductoId"] != null && !string.IsNullOrEmpty(Request.QueryString["ProductoId"]))
        {
            try
            {
                ProductoId = Convert.ToInt32(Request.QueryString["ProductoId"]);
            }
            catch (Exception ex)
            {
                
            }
        }
        if (ProductoId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(ProductoId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int productoId)
    {
        try
        {
            Producto obj = ProductoBRL.GetProductoById(productoId);
            NombreTextBox.Text = obj.Nombre;
            PrecioTextBox.Text = obj.Precio.ToString(CultureInfo.InvariantCulture);
            StockTextBox.Text = obj.Stock.ToString();

        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener el Producto";
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;
        try
        {
            decimal precio = Convert.ToDecimal(PrecioTextBox.Text, CultureInfo.InvariantCulture);
            int stock = Convert.ToInt32(StockTextBox.Text);

            int productoId = this.ProductoId;
            Producto obj = new Producto()
            {
                ProductoId = productoId,
                Nombre = NombreTextBox.Text,
                Precio = precio,
                Stock = stock
            };

            if (productoId > 0)
                ProductoBRL.UpdateProducto(obj);
            else
                ProductoBRL.InsertProducto(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar el producto";
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListProductos.aspx");

    }
}