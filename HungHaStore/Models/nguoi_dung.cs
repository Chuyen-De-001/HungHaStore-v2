namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class nguoi_dung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public nguoi_dung()
        {
            hoa_don = new HashSet<hoa_don>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(255)]
        public string tai_khoan { get; set; }

        [Required]
        [StringLength(255)]
        public string mat_khau { get; set; }

        [Required]
        [StringLength(255)]
        public string email { get; set; }

        [StringLength(255)]
        public string ho_ten { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ngay_sinh { get; set; }

        [StringLength(11)]
        public string sdt { get; set; }

        [StringLength(255)]
        public string dia_chi { get; set; }

        public int? gioi_tinh { get; set; }

        public int quyen { get; set; }

        [Column(TypeName = "date")]
        public DateTime tg_tao { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<hoa_don> hoa_don { get; set; }
    }
}
