using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INetwork.BLL
{
    public interface INetworkLogic
    {

        int AddClient(ClientStart user);

        void AddOrder(OrderDTO order, string username);

        void DeleteOrder(int? IdUser, int? IDOrder);

        IEnumerable<ClientSearch> SearchByName(string Name);

        IEnumerable<ClientSearch> SearchBySurname(string Surname);

        IEnumerable<ClientSearch> SearchByPhone(string Phone);

        IEnumerable<Order> GetAllOrdersUs(string username);

        Client GetByLogin(string username);

        Client GetById(int? id);

        void Edit(Client user);

        bool IsUserInRole(string username, string roleName);

        string[] GetRoles(string username);

        Client LogIn(string login, string password);

        void DeleteOrders();

        void DeleteClients();

        IEnumerable<Client> GetAllClients();

        IEnumerable<OrderDTO> GetAllOrders();

        IEnumerable<string> GetListModels();

        void DeleteClientById(int? idUser);
    }
}