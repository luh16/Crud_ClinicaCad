using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MvcCad.Models
{
    public class Pessoa
    {
        [Display (Name = "id de registro")]

        [Required(ErrorMessage = "Informe o numero do registro")]
        public int MedicoId { get; set; }

        [Required(ErrorMessage ="Informe o nome")]
        public string Nome { get; set; }
        [Required(ErrorMessage = "Informe o CRM")]
        public int CRM { get; set; }
        [Required(ErrorMessage = "Informe o Telefone")]
        public int Telefone { get; set; }
        [Required(ErrorMessage = "Informe o Estado em que mora")]
        public string Cidade { get; set; }
        [Required(ErrorMessage = "informe (UF)  ")]
        public string Uf { get; set; }
        [Required(ErrorMessage = "Insira duas especialidades")]
        public string Especialidade { get; set; }

    }
}