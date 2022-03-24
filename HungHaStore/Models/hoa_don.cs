namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class hoa_don
    {
        public const int TRANG_THAI_XU_LY = 0;
        public const int TRANG_THAI_HOPAN_THANH = 1;

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public hoa_don()
        {
            chitiet_hd = new HashSet<chitiet_hd>();
        }

        public int id { get; set; }

        public int id_nd { get; set; }

        public int trang_thai { get; set; }

        public string ten_nguoi_nhan { get; set; }

        public string dia_chi_nhan { get; set; }

        public string sdt_nhan { get; set; }

        public int tong_tien { get; set; }

        [Column(TypeName = "date")]
        public DateTime tg_tao { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<chitiet_hd> chitiet_hd { get; set; }

        public virtual nguoi_dung nguoi_dung { get; set; }
    }
}
