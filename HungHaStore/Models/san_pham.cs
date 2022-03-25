namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class san_pham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public san_pham()
        {
            chitiet_hd = new HashSet<chitiet_hd>();
            dat_hang = new HashSet<dat_hang>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(255)]
        public string ten { get; set; }

        public int id_loai_sp { get; set; }

        public int gia_tien { get; set; }

        public int giam_gia { get; set; }

        [Required]
        [StringLength(255)]
        public string mo_ta { get; set; }

        public int? id_kho { get; set; }

        public int? id_ncc { get; set; }

        [StringLength(255)]
        public string hinh_anh { get; set; }

        public int luot_xem { get; set; }

        [Column(TypeName = "date")]
        public DateTime tg_tao { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<chitiet_hd> chitiet_hd { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<dat_hang> dat_hang { get; set; }

        public virtual kho kho { get; set; }

        public virtual loai_sp loai_sp { get; set; }

        public virtual nha_cung_cap nha_cung_cap { get; set; }
    }
}
