
namespace caykimnho_studio.Models
{
    using System;
    using System.Collections.Generic;
    public partial class ShoppingCart
    {
        public ShoppingCart()
        {
            this.ShoppingCartDetail = new HashSet<ShoppingCartDetail>();
        }

        public int ID { get; set; }
        public int Total_Product { get; set; }
        public decimal Total_Price { get; set; }
        public int First_Product_ID { get; set; }
        public string First_Product_Name { get; set; }
        public string First_Product_Images { get; set; }

        public virtual ICollection<ShoppingCartDetail> ShoppingCartDetail { get; set; }
    }
}