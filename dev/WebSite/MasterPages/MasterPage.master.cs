﻿using App.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isValidVersion = false;
        try
        {
            isValidVersion = VersionUtilities.AppIsValidVersion();
        }
        catch (Exception ex)
        {
            Session["ErrorMessage"] = ex.Message;
            Response.Redirect("~/Error.aspx");
        }

        if (!isValidVersion)
        {
            Session["ErrorMessage"] = "La version de la Aplicacion no es la misma que la version de la Base de Datos.";
            Response.Redirect("~/Error.aspx");
            return;
        }
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (!IsPostBack)
        {


            string scripts = "<script type='text/javascript' src='" +
                ResolveUrl("~/Scripts/jquery-3.2.1.slim.min.js") +
                "'></script>";

            scripts += "<script type='text/javascript' src='" +
                ResolveUrl("~/Scripts/popper.min.js") +
                "'></script>";

            scripts += "<script type='text/javascript' src='" +
                ResolveUrl("~/Scripts/bootstrap.min.js") +
                "'></script>";
            ScriptsLiteral.Text = scripts;
        }

    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["UserId"] = null;
        Response.Redirect("~/Login.aspx");
    }
}
