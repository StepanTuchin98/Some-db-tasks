using Entities;
using INetwork.DLL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NetworkDLL
{
    public class NetworkDao : INetworkDao
    {
        private string connectionString = "Data Source=DESKTOP-60HJP9E;Initial Catalog=Atelier;Integrated Security=True";

        public NetworkDao()
        {
        }

        public void DeleteOrder(int? IdUser, int? IDOrder)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DeleteOrder", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDUser", IdUser);
                cmd.Parameters.AddWithValue("@IDOrder", IDOrder);

                connection.Open();

                cmd.ExecuteNonQuery();
                LoggerUtil.getLog("Logger").Info("Order was successfully deleted!");
            }
        }

        public void Edit(Client client)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("EditClient", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", client.Name);
                cmd.Parameters.AddWithValue("@Surname", client.Surname);
                cmd.Parameters.AddWithValue("@Patronymic", ((object)client.Patronymic) ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Phone", ((object)client.Phone) ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Password", client.Password);
                cmd.Parameters.AddWithValue("@Login", client.Login);
                cmd.Parameters.AddWithValue("@IDClient", client.IDClient);

                connection.Open();

                cmd.ExecuteNonQuery();
            }
            LoggerUtil.getLog("Logger").Info($"User with login={client.Login} successfully changed personal info!");
        }

        public Client GetByLogin(string username)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetByLogin", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Login", username);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                Client u = null;
                if (reader.Read())
                {
                    u = new Client
                    {
                        IDClient = (int?)reader["IDClient"],
                        Name = (string)reader["Name"],
                        Surname = (string)reader["Surname"],
                        Patronymic = reader["Patronymic"].Equals(DBNull.Value) ? null : (string)reader["Patronymic"],
                        Phone = reader["Phone"].Equals(DBNull.Value) ? null : (string)reader["Phone"],
                        Login = username
                    };
                }
                LoggerUtil.getLog("Logger").Info($"User with login={username} was taken from db!");
                return u;
            }
        }

        public string[] GetRoles(string username)
        {
            var result = new List<string>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetUsetRoles", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", username);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    result.Add((string)reader["UserRole"]);
                }
            }
            return result.ToArray();
        }

        public bool IsUserInRole(string username, string roleName)
        {
            foreach (string r in GetRoles(username))
            {
                if (r.Equals(roleName))
                {
                    return true;
                }
            }
            return false;
        }

        public IEnumerable<ClientSearch> SearchByName(string Name)
        {
            var result = new List<ClientSearch>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SearchByName", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", ((object)Name) ?? DBNull.Value);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var f = new ClientSearch
                    {
                        IDClient = (int?)reader["IDClient"],
                        Name = (string)reader["Name"],
                        Surname = (string)reader["Surname"],
                        Patronymic = reader["Patronymic"].Equals(DBNull.Value) ? null : (string)reader["Patronymic"],
                        Phone = reader["Phone"].Equals(DBNull.Value) ? null : (string)reader["Phone"]
                    };
                    result.Add(f);
                }
            }
            return result;
        }

        public IEnumerable<ClientSearch> SearchBySurname(string Surname)
        {
            var result = new List<ClientSearch>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SearchBySurname", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Surname", ((object)Surname) ?? DBNull.Value);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var f = new ClientSearch
                    {
                        IDClient = (int?)reader["IDClient"],
                        Name = (string)reader["Name"],
                        Surname = (string)reader["Surname"],
                        Patronymic = reader["Patronymic"].Equals(DBNull.Value) ? null : (string)reader["Patronymic"],
                        Phone = reader["Phone"].Equals(DBNull.Value) ? null : (string)reader["Phone"]
                    };
                    result.Add(f);
                }
            }
            return result;
        }

        public IEnumerable<ClientSearch> SearchByPhone(string Phone)
        {
            var result = new List<ClientSearch>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SearchByPhone", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Phone", ((object)Phone) ?? DBNull.Value);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var f = new ClientSearch
                    {
                        IDClient = (int?)reader["IDClient"],
                        Name = (string)reader["Name"],
                        Surname = (string)reader["Surname"],
                        Patronymic = reader["Patronymic"].Equals(DBNull.Value) ? null : (string)reader["Patronymic"],
                        Phone = reader["Phone"].Equals(DBNull.Value) ? null : (string)reader["Phone"]
                    };
                    result.Add(f);
                }
            }
            return result;
        }

        public int AddClient(ClientStart client)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("AddClient", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", client.Name);
                cmd.Parameters.AddWithValue("@Surname", client.Surname);
                cmd.Parameters.AddWithValue("@Patronymic", ((object)client.Patronymic) ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Client_Size_Clothes", ((object)client.SizeClothes) ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Client_Size_Boots", ((object)client.SizeBoots) ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Phone", ((object)client.Phone) ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Password", client.Password);
                cmd.Parameters.AddWithValue("@Login", client.Login);
                var id = new SqlParameter
                {
                    Direction = System.Data.ParameterDirection.Output,
                    ParameterName = "@Id",
                    DbType = System.Data.DbType.Int32
                };
                cmd.Parameters.Add(id);

                connection.Open();

                cmd.ExecuteNonQuery();
                LoggerUtil.getLog("Logger").Info($"Some new user with login = {client.Login}!");
                return (int)id.Value;
            }
        }

        public Client LogIn(string login, string password)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("LogIn", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Login", login);
                cmd.Parameters.AddWithValue("@Password", password);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                Client u = null;
                if (reader.Read())
                {
                    u = new Client
                    {
                        IDClient = (int?)reader["IDClient"],
                        Name = (string)reader["Name"],
                        Surname = (string)reader["Surname"],
                        Patronymic = reader["Patronymic"].Equals(DBNull.Value) ? null : (string)reader["Patronymic"],
                        Phone = reader["Phone"].Equals(DBNull.Value) ? null : (string)reader["Phone"]
                    };
                }
                LoggerUtil.getLog("Logger").Info($"User with login={login} logged in app!");
                return u;
            }
        }

        public Client GetById(int? id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetClientById", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDClient", id);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                Client u = null;
                if (reader.Read())
                {
                    u = new Client
                    {
                        IDClient = (int?)reader["IDClient"],
                        Name = (string)reader["Name"],
                        Surname = (string)reader["Surname"],
                        Patronymic = reader["Patronymic"].Equals(DBNull.Value)? null: (string)reader["Patronymic"],
                        Phone = reader["Phone"].Equals(DBNull.Value) ? null : (string)reader["Phone"],
                        Login = (string)reader["Login"]
                    };
                }
                return u;
            }
        }

        public void DeleteOrders()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DeleteOrders", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                cmd.ExecuteNonQuery();
                LoggerUtil.getLog("Logger").Info("All messages was successfully deleted!");
            }
        }

        public void DeleteClients()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DeleteClients", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                cmd.ExecuteNonQuery();
                LoggerUtil.getLog("Logger").Info("All users was successfully deleted!");
            }
        }

        public IEnumerable<OrderDTO> GetAllOrders()
        {
            var result = new List<OrderDTO>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllOrders", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var m = new OrderDTO
                    {
                        IDOrder = (int?)reader["IDOrder"],
                        IDClient = (int?)reader["IDClient"],
                        BootsSize = (int?)reader["Size_Boots"],
                        ClothesSize = (string)reader["Size_Clothes"],
                        Surname = (string)reader["Surname"],
                        Name = (string)reader["custromer_Name"],
                        ModelName= (string)reader["Name"],
                        Phone = (string)reader["Phone"],
                        StartDate = (DateTime)reader["StartDate"],
                        EndDate = (DateTime)reader["EndDate"],
                        Cost = (decimal)reader["Cost"],
                    };

                    result.Add(m);
                }
            }
            return result.OrderBy(x=>x.IDOrder).AsEnumerable();
        }

        public IEnumerable<Client> GetAllClients()
        {
            var result = new List<Client>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllClients", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var m = new Client
                    {
                        IDClient = (int?)reader["IDClient"],
                        Name = (string)reader["Name"],
                        Surname = (string)reader["Surname"],
                        Patronymic = reader["Patronymic"].Equals(DBNull.Value) ? null : (string)reader["Patronymic"],
                        Phone = reader["Phone"].Equals(DBNull.Value) ? null : (string)reader["Phone"],
                        Login = (string)reader["Login"],
                        Password = (string)reader["Password"]
                    };

                    result.Add(m);
                }
            }
            return result.AsEnumerable();
        }

        public IEnumerable<Order> GetAllOrdersUs(string username)
        {
            var result = new List<Order>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllOrdersUs", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Login", username);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    var m = new Order
                    {
                        IDOrder = (int?)reader["IDOrder"],
                        IDClient = (int?)reader["IDClient"],
                        ID_Size_Boots = (int?)reader["ID_Size_Boots"],
                        ID_Size_Clothes = (int?)reader["ID_Size_Clothes"],
                        IDWork = 1,
                        StartDate = (DateTime)reader["StartDate"],
                        EndDate = (DateTime)reader["EndDate"],
                        Cost = (decimal)reader["Cost"],
                    };
                    result.Add(m);
                }
            }
            return result.AsEnumerable();
        }

        public IEnumerable<string> GetListModels()
        {
            var result = new List<string>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetListModels", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    result.Add((string)reader["Name"]);
                }
            }
            return result.AsEnumerable();
        }

        public void AddOrder(OrderDTO order, string username)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("AddOrder", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StartDate", order.StartDate);
                cmd.Parameters.AddWithValue("@EndDate", order.EndDate);
                cmd.Parameters.AddWithValue("@Cost", order.Cost);
                cmd.Parameters.AddWithValue("@Login", username);

                connection.Open();

                cmd.ExecuteNonQuery();
                LoggerUtil.getLog("Logger").Info("Order was successfully added!");
            }
        }

        public void DeleteClientById(int? idUser)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DeleteClientById", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDClient", idUser);

                connection.Open();

                cmd.ExecuteNonQuery();
                LoggerUtil.getLog("Logger").Info("Client was successfully deleted!");
            }
        }
    }
}