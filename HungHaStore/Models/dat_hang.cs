namespace HungHaStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class dat_hang
    {
        public int id { get; set; }

        [Required]
        [StringLength(255)]
        public string email { get; set; }

        public int id_sp { get; set; }

        [Column(TypeName = "date")]
        public DateTime tg_tao { get; set; }

        public virtual san_pham san_pham { get; set; }
    }
}
