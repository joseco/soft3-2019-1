using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VentasNur.Model;

namespace VentasNur.BRL
{
    public class UsuarioBRL
    {

        public static Usuario GetUsuarioByUserName(string username)
        {
            if (string.IsNullOrEmpty(username))
                throw new ArgumentException("Username no puede ser nulo o vacio");

            UsuarioDSTableAdapters.UsusarioTableAdapter adapter = new UsuarioDSTableAdapters.UsusarioTableAdapter();
            UsuarioDS.UsusarioDataTable table = adapter.GetUsuarioByUsername(username);

            if(table == null || table.Rows.Count > 1)
            {
                throw new Exception("La consulta retornó un numero incorrecto de filas");
            }
            if (table.Rows.Count == 0)
                return null ;
            UsuarioDS.UsusarioRow row = table[0];
            return new Usuario()
            {
                Username = row.username,
                Id = row.userId,
                NombreCompleto = row.nombreCompleto,
                Password = row.password
            };
        }

    }
}