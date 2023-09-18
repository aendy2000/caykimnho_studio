
namespace caykimnho_studio.Models
{
    using System;
    using System.Collections.Generic;
    public partial class ShoppingCartDetail
    {
        public int ID { get; set; }
        public int ID_Cart { get; set; }
        public int ID_Products { get; set; }
        public string Product_Name { get; set; }
        public string Product_Color { get; set; }
        public string Product_Size { get; set; }
        public int Product_Quantity { get; set; }
        public decimal Product_Price { get; set; }
        public decimal Product_Import_Price { get; set; }
        public decimal Product_Sale { get; set; }
        public System.DateTime Add_Date { get; set; }
        public int ID_Color { get; set; }
        public int ID_Size { get; set; }
        public string Product_Images { get; set; }

        public virtual ShoppingCart ShoppingCart { get; set; }
        public virtual Colors Colors { get; set; }
        public virtual Products Products { get; set; }
        public virtual Size Size { get; set; }
    }
}