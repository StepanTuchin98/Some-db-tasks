using Entities;
using INetwork.BLL;
using INetwork.DLL;
using NetworkDLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NetworkBLL
{
    public class NetworkLogic : INetworkLogic
    {

        private INetworkDao NetworkDao;


        public NetworkLogic()
        {
            NetworkDao = new NetworkDao();
        }

        public void DeleteOrder(int? IdUser, int? IDOrder)
        {
            NetworkDao.DeleteOrder(IdUser, IDOrder);
        }

        public void Edit(Client user)
        {
            NetworkDao.Edit(user);
        }

        public Client GetById(int? id)
        {
            return NetworkDao.GetById(id);
        }

        public IEnumerable<Order> GetAllOrdersUs(string username)
        {
            return NetworkDao.GetAllOrdersUs(username);
        }

        public Client GetByLogin(string username)
        {
            return NetworkDao.GetByLogin(username);
        }

        public string[] GetRoles(string username)
        {
            return NetworkDao.GetRoles(username);
        }

        public bool IsUserInRole(string username, string roleName)
        {
            return NetworkDao.IsUserInRole(username, roleName);
        }

        public Client LogIn(string login, string password)
        {
            return NetworkDao.LogIn(login, password);
        }

        public IEnumerable<ClientSearch> SearchByName(string Name)
        {
            return NetworkDao.SearchByName(Name);
        }

        public IEnumerable<ClientSearch> SearchBySurname(string Surname)
        {
            return NetworkDao.SearchBySurname(Surname);
        }

        public IEnumerable<ClientSearch> SearchByPhone(string Phone)
        {
            return NetworkDao.SearchByPhone(Phone);
        }

        public int AddClient(ClientStart user)
        {
            return NetworkDao.AddClient(user);
        }

        public void DeleteClients()
        {
            NetworkDao.DeleteClients();
        }

        public void DeleteOrders()
        {
            NetworkDao.DeleteOrders();
        }

        public IEnumerable<Client> GetAllClients()
        {
            return NetworkDao.GetAllClients();
        }

        public IEnumerable<OrderDTO> GetAllOrders()
        {
            return NetworkDao.GetAllOrders();
        }

        public IEnumerable<string> GetListModels()
        {
            return NetworkDao.GetListModels();
        }

        public void AddOrder(OrderDTO order, string username)
        {
            NetworkDao.AddOrder(order, username);
        }

        public void DeleteClientById(int? idUser)
        {
            NetworkDao.DeleteClientById(idUser);
        }
    }
}