using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VentasNur.Model
{
    public class Usuario
    {

        private int id;

        public int Id
        {
            set { id = value; }
            get { return id; }
        }

        public string NombreCompleto { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }



    }
}