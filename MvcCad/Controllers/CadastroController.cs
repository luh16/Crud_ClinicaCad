using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcCad.Models;
using MvcCad.Repositorio;

namespace MvcCad.Controllers
{
    public class CadastroController : Controller
    {
        // GET: Cadastro
        private CadastroRepositorio _Repositorio;

        [HttpGet]
        public ActionResult ObterCadastro()
        {
            _Repositorio = new CadastroRepositorio();

            ModelState.Clear();
            return View(_Repositorio.ObterCadastro());
        }
        [HttpGet]
        public ActionResult IncluirCadastro()
        {
            return View();

        }

        [HttpPost]
        public ActionResult IncluirCadastro(Pessoa pessoaObj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _Repositorio = new CadastroRepositorio();
                    if (_Repositorio.AdicionarMedico(pessoaObj))
                    {
                        ViewBag.Mensagem = "Medico cadastrado com sucesso";

                    }
                }
                return View();
            }
            catch (Exception)
            {
                return View("ObterCadastro");
            }
        }

        
        public ActionResult AlterarCadastro(int id)
        {
            _Repositorio = new CadastroRepositorio();
            return View(_Repositorio.ObterCadastro().Find(m => m.MedicoId == id));

        }

        [HttpPost]
        public ActionResult AlterarCadastro(int id, Pessoa pessoaObj)
        {
            try
            {
                _Repositorio = new CadastroRepositorio();
                _Repositorio.AlterarCadastro(pessoaObj);
                return RedirectToAction("ObterCadastro");
            }
            catch (Exception)
            {

                return View("ObterCadastro");
            }
        }

        public ActionResult ExcluirCadastro(int id)
        {
            try
            {
                _Repositorio = new CadastroRepositorio();
                if(_Repositorio.ExcluirCadastro(id))
                {
                    ViewBag.Mensagem = "Cadastro excluido com sucesso";
                }
                return RedirectToAction("ObterCadastro");
            }
            catch (Exception)
            {

                return RedirectToAction("ObterCadastro");
            }
        }


    }
}