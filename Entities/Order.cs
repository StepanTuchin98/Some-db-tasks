using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Order
    {
        public Order()
        {
        }

        public Order(int? iDOrder, int? iDClient, int? iD_Size_Boots, int? iD_Size_Clothes, int? iDWork, DateTime? startDate, DateTime? endDate, decimal? cost)
        {
            IDOrder = iDOrder;
            IDClient = iDClient;
            ID_Size_Boots = iD_Size_Boots;
            ID_Size_Clothes = iD_Size_Clothes;
            IDWork = iDWork;
            StartDate = startDate;
            EndDate = endDate;
            Cost = cost;
        }

        [Required]
        public int? IDOrder { get; set; }
        [Required]
        public int? IDClient { get; set; }
        [Required]
        public int? ID_Size_Boots { get; set; }
        [Required]
        public int? ID_Size_Clothes { get; set; }
        [Required]
        public int? IDWork { get; set; }
        [Required]
        [Range(typeof(DateTime), "1/1/1900", "1/1/2025", ErrorMessage = "Date is out of Range")]
        public DateTime? StartDate { get; set; }
        [Required]
        [Range(typeof(DateTime), "1/1/1900", "1/1/2025", ErrorMessage = "Date is out of Range")]
        public DateTime? EndDate { get; set; }

        [Required]
       public decimal? Cost { get; set; }

        public override bool Equals(object obj)
        {
            var order = obj as Order;
            return order != null &&
                   EqualityComparer<int?>.Default.Equals(IDOrder, order.IDOrder) &&
                   EqualityComparer<int?>.Default.Equals(IDClient, order.IDClient) &&
                   EqualityComparer<int?>.Default.Equals(ID_Size_Boots, order.ID_Size_Boots) &&
                   EqualityComparer<int?>.Default.Equals(ID_Size_Clothes, order.ID_Size_Clothes) &&
                   EqualityComparer<int?>.Default.Equals(IDWork, order.IDWork) &&
                   EqualityComparer<DateTime?>.Default.Equals(StartDate, order.StartDate) &&
                   EqualityComparer<DateTime?>.Default.Equals(EndDate, order.EndDate) &&
                   EqualityComparer<decimal?>.Default.Equals(Cost, order.Cost);
        }

        public override int GetHashCode()
        {
            var hashCode = -1681669766;
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(IDOrder);
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(IDClient);
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(ID_Size_Boots);
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(ID_Size_Clothes);
            hashCode = hashCode * -1521134295 + EqualityComparer<int?>.Default.GetHashCode(IDWork);
            hashCode = hashCode * -1521134295 + EqualityComparer<DateTime?>.Default.GetHashCode(StartDate);
            hashCode = hashCode * -1521134295 + EqualityComparer<DateTime?>.Default.GetHashCode(EndDate);
            hashCode = hashCode * -1521134295 + EqualityComparer<decimal?>.Default.GetHashCode(Cost);
            return hashCode;
        }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}