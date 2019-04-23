using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace Entities
{
    public class Client : ClientSearch
    {
        public Client()
        {
        }

        public Client(string login, string password)
        {
            Login = login;
            Password = password;
        }

        public Client(int? iDClient, string name, string surname, string patronymic, string phone) : base(iDClient, name, surname, patronymic, phone)
        {
        }

        public Client(int? iDClient, string name, string surname, string patronymic, string phone, string login, string password) : base(iDClient, name, surname, patronymic, phone)
        {
            Login = login;
            Password = password;
        }

        [Required]
        [StringLength(35, MinimumLength = 2, ErrorMessage = "Invalid lastname length")]
        public string Login { get; set; }

        [Required]
        [StringLength(35, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public override bool Equals(object obj)
        {
            var client = obj as Client;
            return client != null &&
                   base.Equals(obj) &&
                   Login == client.Login &&
                   Password == client.Password;
        }

        public override int GetHashCode()
        {
            var hashCode = -1348923680;
            hashCode = hashCode * -1521134295 + base.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Login);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Password);
            return hashCode;
        }
    }
}

