namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class chitiet_hd
    {
        public int id { get; set; }

        public int id_hd { get; set; }

        public int id_sp { get; set; }

        public int gia_tien { get; set; }

        public int so_luong { get; set; }

        [Required]
        [StringLength(255)]
        public string ten_sp { get; set; }

        public virtual hoa_don hoa_don { get; set; }

        public virtual san_pham san_pham { get; set; }
    }
}
