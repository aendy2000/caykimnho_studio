//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace caykimnho_studio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cart
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cart()
        {
            this.Cart_Detail = new HashSet<Cart_Detail>();
        }
    
        public int ID { get; set; }
        public Nullable<int> ID_User { get; set; }
        public Nullable<int> Total_Product { get; set; }
        public Nullable<decimal> Total_Price { get; set; }
        public Nullable<int> First_Product_ID { get; set; }
        public string First_Product_Name { get; set; }
        public string First_Product_Images { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart_Detail> Cart_Detail { get; set; }
        public virtual Products Products { get; set; }
        public virtual User User { get; set; }
    }
}
