namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class nha_cung_cap
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public nha_cung_cap()
        {
            san_pham = new HashSet<san_pham>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(255)]
        public string ten { get; set; }

        [StringLength(255)]
        public string dia_chi { get; set; }

        [StringLength(255)]
        public string sdt { get; set; }

        [StringLength(255)]
        public string email { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<san_pham> san_pham { get; set; }
    }
}
