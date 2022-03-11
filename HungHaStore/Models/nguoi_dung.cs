namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
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
        [DisplayName("Tài khoản")]
        public string tai_khoan { get; set; }

        [Required]
        [StringLength(255)]
        [DisplayName("Mật khẩu")]
        public string mat_khau { get; set; }

        [Required]
        [StringLength(255)]
        [DisplayName("Email")]
        public string email { get; set; }

        [Column(TypeName = "date")]
        [DisplayName("Ngày sinh")]
        public DateTime? ngay_sinh { get; set; }

        [StringLength(11)]
        [DisplayName("SĐT")]
        public string sdt { get; set; }

        [StringLength(255)]
        [DisplayName("Địa chỉ")]
        public string dia_chi { get; set; }

        [DisplayName("Giới tính")]
        public int? gioi_tinh { get; set; }

        [DisplayName("Quyền")]
        public int quyen { get; set; }

        [Column(TypeName = "date")]
        public DateTime tg_tao { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<hoa_don> hoa_don { get; set; }
    }
}
