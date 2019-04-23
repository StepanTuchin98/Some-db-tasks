using Entities;
using INetwork.BLL;
using NetworkBLL;
using NetworkDLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NetworkMVC.Controllers
{
    public class MainPageController : Controller
    {

        private readonly INetworkLogic networkLogic;

        public MainPageController()
        {
            this.networkLogic = new NetworkLogic();
        }

        // GET: MainPage
        
        [HttpGet]
        public ActionResult SingUp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SingUp(ClientStart user)
        {
            if (ModelState.IsValid)
            {
                networkLogic.AddClient(user);
                return Redirect($"~/LogInLogOut/Login");
            }
            else
            {
                LoggerUtil.getLog("Logger").Info("New user wasnt added cause bad model!");
                return View();
            }
        }

        [Authorize]
        [HttpGet]
        public ActionResult Index()
        {
            return View(networkLogic.GetByLogin(User.Identity.Name));
        }

        [Authorize]
        [HttpGet]
        public ActionResult EditPersonInfo()
        {
            return View(networkLogic.GetByLogin(User.Identity.Name));
        }

        [Authorize]
        [HttpGet]
        public ActionResult CreateNew()
        {
            ViewBag.ListModels = networkLogic.GetListModels();
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult CreateNew(OrderDTO orderDTO)
        {
            networkLogic.AddOrder(orderDTO, User.Identity.Name);
            return Redirect("Orders");
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditPersonInfo(Client u)
        {
            if (ModelState.IsValid)
            {
                networkLogic.Edit(u);
                return Redirect("Index");
            }
            else
            {
                LoggerUtil.getLog("Logger").Info("Editing was refused cause bad model!");
                return View();
            }
        }

        [Authorize]
        [HttpGet]
        public ActionResult Orders()
        {
            return View(networkLogic.GetAllOrdersUs(User.Identity.Name));
        }

        [Authorize(Roles ="admin")]
        [HttpGet]
        public ActionResult GetAllUsers()
        {
            return View(networkLogic.GetAllClients());
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult GetAllOrders()
        {
            return View(networkLogic.GetAllOrders());
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult DeleteUsers()
        {
            if (Request["Delete"] != null)
            {
                networkLogic.DeleteClients();
            }

            return Redirect("GetAllUsers");
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult DeleteOrders()
        {
            if (Request["Delete"] != null)
            {
                networkLogic.DeleteOrders();
            }

            return Redirect("GetAllOrders");
        }
    }
}