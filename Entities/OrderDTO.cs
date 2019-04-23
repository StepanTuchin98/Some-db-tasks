using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class OrderDTO
    {

        [Required]
        public int? IDOrder { get; set; }
        [Required]
        public int? IDClient { get; set; }

        [Required]
        [Range(typeof(DateTime), "1/1/1900", "1/1/2025", ErrorMessage = "Date is out of Range")]
        public DateTime? StartDate { get; set; }
        [Required]
        [Range(typeof(DateTime), "1/1/1900", "1/1/2025", ErrorMessage = "Date is out of Range")]
        public DateTime? EndDate { get; set; }

        [Required]
        public decimal? Cost { get; set; }

        public int? BootsSize { get; set; }

        public string ClothesSize { get; set; }

        public string ModelName { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Invalid name length")]
        public string Name { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Invalid surname length")]
        public string Surname { get; set; }

        [RegularExpression(@"^\+[2-9]\d{3}\d{3}\d{4}$", ErrorMessage = "Number Format +xxxxxxxxxxx")]
        public string Phone { get; set; }

        public OrderDTO(int? iDOrder, int? iDClient, DateTime? startDate, DateTime? endDate, decimal? cost, int? bootsSize, string clothesSize, string modelName, string name, string surname, string phone)
        {
            IDOrder = iDOrder;
            IDClient = iDClient;
            StartDate = startDate;
            EndDate = endDate;
            Cost = cost;
            BootsSize = bootsSize;
            ClothesSize = clothesSize;
            ModelName = modelName;
            Name = name;
            Surname = surname;
            Phone = phone;
        }

        public OrderDTO()
        {
        }

        public override bool Equals(object obj)
        {
            var dTO = obj as OrderDTO;
            return dTO != null &&
                   EqualityComparer<int?>.Default.Equals(IDOrder, dTO.IDOrder) &&
                   EqualityComparer<int?>.Default.Equals(IDClient, dTO.IDClient) &&
                   EqualityComparer<DateTime?>.Default.Equals(StartDate, dTO.StartDate) &&
                   EqualityComparer<DateTime?>.Default.Equals(EndDate, dTO.EndDate) &&
                   EqualityComparer<decimal?>.Default.Equals(Cost, dTO.Cost) &&
                   EqualityComparer<int?>.Default.Equals(BootsSize, dTO.BootsSize) &&
                   ClothesSize == dTO.ClothesSize &&
                   ModelName == dTO.ModelName &&
                   Name == dTO.Name &&
                   Surname == dTO.Surname &&
                   Phone == dTO.Phone;
        }

        public override int GetHashCode()
        {
            var hashCode = 1187588641;
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(IDOrder);
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(IDClient);
            hashCode = hashCode * -1521134295 + EqualityComparer<DateTime?>.Default.GetHashCode(StartDate);
            hashCode = hashCode * -1521134295 + EqualityComparer<DateTime?>.Default.GetHashCode(EndDate);
            hashCode = hashCode * -1521134295 + EqualityComparer<decimal?>.Default.GetHashCode(Cost);
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(BootsSize);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(ClothesSize);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(ModelName);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Name);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Surname);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Phone);
            return hashCode;
        }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}
