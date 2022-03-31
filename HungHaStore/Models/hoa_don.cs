namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Threading.Tasks;

    public partial class hoa_don
    {
        public const int TRANG_THAI_XU_LY = 0;
        public const int TRANG_THAI_HOPAN_THANH = 1;

        public const int TRANG_THAI_YEU_CAU_HUY = 2;
        public const int TRANG_THAI_HUY = 3;

        public const int THANH_TOAN_COD = 0;
        public const int THANH_TOAN_ONLINE = 1;
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public hoa_don()
        {
            chitiet_hd = new HashSet<chitiet_hd>();
        }

        public int id { get; set; }

        public int? id_nd { get; set; }

        public int trang_thai { get; set; }

        public int tong_tien { get; set; }

        [Required]
        [StringLength(255)]
        public string ten_nguoi_nhan { get; set; }

        [Required]
        [StringLength(255)]
        public string dia_chi_nhan { get; set; }

        public int phuong_thuc { get; set; }

        [Required]
        [StringLength(255)]
        public string sdt_nhan { get; set; }

        [Column(TypeName = "date")] 
        public DateTime tg_tao { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<chitiet_hd> chitiet_hd { get; set; }

        public virtual nguoi_dung nguoi_dung { get; set; }

        internal static Task<object> ToListAsync()
        {
            throw new NotImplementedException();
        }
    }
}
