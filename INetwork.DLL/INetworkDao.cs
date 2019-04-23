using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INetwork.DLL
{
    public interface INetworkDao
    {
        int AddClient(ClientStart user);

        void DeleteOrder(int? IdUser, int? IdOrder);

        IEnumerable<ClientSearch> SearchByName(string Name);

        IEnumerable<ClientSearch> SearchBySurname(string Surname);

        IEnumerable<ClientSearch> SearchByPhone(string Phone);

        Client GetByLogin(string username);

        Client GetById(int? id);

        void Edit(Client user);

        string[] GetRoles(string username);

        bool IsUserInRole(string username, string roleName);

        Client LogIn(string login, string password);

        void DeleteOrders();

        void DeleteClients();

        IEnumerable<OrderDTO> GetAllOrders();

        IEnumerable<Client> GetAllClients();

        IEnumerable<Order> GetAllOrdersUs(string username);

        IEnumerable<string> GetListModels();

        void AddOrder(OrderDTO order, string username);

        void DeleteClientById(int? idUser);
    }
}
