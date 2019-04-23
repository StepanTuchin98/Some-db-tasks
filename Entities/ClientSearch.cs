using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ClientSearch
    {
        public ClientSearch()
        {
        }

        public ClientSearch(int? iDClient, string name, string surname, string patronymic, string phone)
        {
            IDClient = iDClient;
            Name = name;
            Surname = surname;
            Patronymic = patronymic;
            Phone = phone;
        }

        public int? IDClient { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Invalid name length")]
        public string Name { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Invalid surname length")]
        public string Surname { get; set; }

        [StringLength(50, MinimumLength = 2, ErrorMessage = "Invalid patronymic length")]
        public string Patronymic { get; set; }

        [RegularExpression(@"^\+[2-9]\d{3}\d{3}\d{4}$", ErrorMessage = "Number Format +xxxxxxxxxxx")]
        public string Phone { get; set; }

        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}