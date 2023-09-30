//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Delicious_Food.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Comments = new HashSet<Comment>();
            this.OrderDetails = new HashSet<OrderDetail>();
        }
    
        public string proID { get; set; }
        public Nullable<int> pdcID { get; set; }
        public Nullable<int> typeID { get; set; }
        public string proName { get; set; }
        public string proSize { get; set; }
        public string proPrice { get; set; }
        public Nullable<int> proDiscount { get; set; }
        public string proPhoto { get; set; }
        public string proUpdateDate { get; set; }
        public string proDescription { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual Producer Producer { get; set; }
        public virtual ProductType ProductType { get; set; }
        public virtual Rate Rate { get; set; }
    }
}