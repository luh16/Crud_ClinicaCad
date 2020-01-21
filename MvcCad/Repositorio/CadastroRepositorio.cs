using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using MvcCad.Models;

namespace MvcCad.Repositorio
{
    public class CadastroRepositorio
    {
        private SqlConnection _con;
        private void Connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConexaoSqlserver"].ToString();
            _con = new SqlConnection(constr);

        }


        //Add um medico - receita  
        public bool AdicionarMedico(Pessoa NomeObj)
        {
            Connection();

            int i;


            using (SqlCommand command = new SqlCommand("IncluirCadastro", _con))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Nome", NomeObj.Nome);
                command.Parameters.AddWithValue("@CRM", NomeObj.CRM);
                command.Parameters.AddWithValue("@Telefone", NomeObj.Telefone);
                command.Parameters.AddWithValue("@Cidade", NomeObj.Cidade);
                command.Parameters.AddWithValue("@Uf", NomeObj.Uf);
                command.Parameters.AddWithValue("@Especialidade", NomeObj.Especialidade);
                _con.Open();

                i = command.ExecuteNonQuery();

            }

            _con.Close();
            return i >= i;
        }



        //Obter Cadastro

        public List<Pessoa> ObterCadastro()
        {

            Connection();
            List<Pessoa> pessoaList = new List<Pessoa>();
            using (SqlCommand command = new SqlCommand("ObterCadastro", _con))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                _con.Open();

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Pessoa pessoa = new Pessoa()
                    {
                        MedicoId = Convert.ToInt32(reader["MedicoId"]),
                        Nome = Convert.ToString(reader["Nome"]),
                        CRM = Convert.ToInt32(reader["CRM"]),
                        Telefone = Convert.ToInt32(reader["Telefone"]),
                        Cidade = Convert.ToString(reader["Cidade"]),
                        Uf = Convert.ToString(reader["Uf"]),
                        Especialidade = Convert.ToString(reader["Especialidade"])

                    };
                    pessoaList.Add(pessoa);
                }
                _con.Close();
                return pessoaList;
            }

        }

        //Alterar Cadastro

        public bool AlterarCadastro(Pessoa NomeObj)
        {
            Connection();

            int i;


            using (SqlCommand command = new SqlCommand("AlterarCadastro", _con))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MedicoId", NomeObj.MedicoId);
                command.Parameters.AddWithValue("@Nome", NomeObj.Nome);
                command.Parameters.AddWithValue("@CRM", NomeObj.CRM);
                command.Parameters.AddWithValue("@Telefone", NomeObj.Telefone);
                command.Parameters.AddWithValue("@Cidade", NomeObj.Cidade);
                command.Parameters.AddWithValue("@Uf", NomeObj.Uf);
                command.Parameters.AddWithValue("@Especialidade", NomeObj.Especialidade);
                _con.Open();

                i = command.ExecuteNonQuery();

            }

            _con.Close();
            return i >= i;
        }

        //Excluir Cadastro
        public bool ExcluirCadastro(int id )
        {
            Connection();

            int i;


            using (SqlCommand command = new SqlCommand("ExcluirCadastro", _con))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MedicoId", id);
                
                _con.Open();

                i = command.ExecuteNonQuery();

            }

            _con.Close();
            if(i >= 1)
            {
                return true;
            }
            return false;
        }


    }


}