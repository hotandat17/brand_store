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
    
    public partial class Producer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Producer()
        {
            this.Products = new HashSet<Product>();
        }
    
        public int pdcID { get; set; }
        public string pdcName { get; set; }
        public string pdcPhone { get; set; }
        public string pdcEmail { get; set; }
        public string pdcAddress { get; set; }
        public string pdcPhoto { get; set; }
        public string pdcInfo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }
    }
}
