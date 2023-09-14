using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace caykimnho_studio.Models
{
    public class Carts
    {
        public int ID { get; set; }
        public int ID_Products { get; set; }
        public int ID_Color { get; set; }
        public int ID_Size { get; set; }
        public string Product_Name { get; set; }
        public string Product_Color { get; set; }
        public string Product_Size { get; set; }
        public int Product_Quantity { get; set; }
        public decimal Product_Price { get; set; }
        public decimal Product_Import_Price { get; set; }
        public decimal Product_Sale { get; set; }
        public DateTime Add_Date { get; set; }
    }
}