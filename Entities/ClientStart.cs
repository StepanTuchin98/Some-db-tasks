using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ClientStart : Client
    {
        public ClientStart()
        {
        }

        public ClientStart(int? sizeBoots, string sizeClothes)
        {
            SizeBoots = sizeBoots;
            SizeClothes = sizeClothes;
        }

        public ClientStart(string login, string password) : base(login, password)
        {
        }

        public ClientStart(int? iDClient, string name, string surname, string patronymic, string phone) : base(iDClient, name, surname, patronymic, phone)
        {
        }

        public ClientStart(int? iDClient, string name, string surname, string patronymic, string phone, string login, string password) : base(iDClient, name, surname, patronymic, phone, login, password)
        {
        }

        [Required]
        public int? SizeBoots { get; set; }

        [Required]
        public string SizeClothes { get; set; }

        public override bool Equals(object obj)
        {
            var start = obj as ClientStart;
            return start != null &&
                   base.Equals(obj) &&
                   EqualityComparer<int?>.Default.Equals(SizeBoots, start.SizeBoots) &&
                   SizeClothes == start.SizeClothes;
        }

        public override int GetHashCode()
        {
            var hashCode = -2008973049;
            hashCode = hashCode * -1521134295 + base.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(SizeBoots);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(SizeClothes);
            return hashCode;
        }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}
