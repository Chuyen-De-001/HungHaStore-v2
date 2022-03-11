namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class loai_sp
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public loai_sp()
        {
            san_pham = new HashSet<san_pham>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(255)]
        public string ten { get; set; }

        [StringLength(255)]
        public string mo_ta { get; set; }

        [Column(TypeName = "date")]
        public DateTime tg_tao { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<san_pham> san_pham { get; set; }
    }
}
