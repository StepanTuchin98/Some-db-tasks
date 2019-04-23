using Entities;
using INetwork.BLL;
using NetworkBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace NetworkMVC.Views
{
    public class MessageController : Controller
    {

        private readonly INetworkLogic networkLogic;

        public MessageController()
        {
            this.networkLogic = new NetworkLogic();
        }

        // GET: Message
        [Authorize]
        [HttpGet]
        public ActionResult Index(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            return View(GetMs(networkLogic.GetByLogin(User.Identity.Name).IDClient, id));
        }

        [Authorize]
        [HttpPost]
        public ActionResult Index([Bind(Include = "idFriend, message")] int? idFriend, string message)
        {
            if (idFriend == null)
            {
                
            }
            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        }

        [Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult GetAllMessages()
        {
            return View(networkLogic.GetAllOrders());
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult DeleteMessages()
        {
            if (Request["Delete"] != null)
            {
                networkLogic.DeleteOrders();
            }

            return Redirect("GetAllMessages");
        }

        private IEnumerable<Order> GetMs(int? id, int? idFriend)
        {
            var ms = new List<Order>();

            return ms.AsEnumerable();
        }

    }
}