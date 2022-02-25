namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class thongtin_nd
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public thongtin_nd()
        {
            nguoi_dung = new HashSet<nguoi_dung>();
        }

        public int id { get; set; }

        public int id_nd { get; set; }

        public int gio_tinh { get; set; }

        [Required]
        [StringLength(50)]
        public string sdt { get; set; }

        [Required]
        [StringLength(255)]
        public string dia_chi { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngay_sinh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<nguoi_dung> nguoi_dung { get; set; }
    }
}
