using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace HungHaStore.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=MyDB")
        {
        }

        public virtual DbSet<chitiet_hd> chitiet_hd { get; set; }
        public virtual DbSet<hoa_don> hoa_don { get; set; }
        public virtual DbSet<loai_sp> loai_sp { get; set; }
        public virtual DbSet<nguoi_dung> nguoi_dung { get; set; }
        public virtual DbSet<san_pham> san_pham { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<thongtin_nd> thongtin_nd { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<hoa_don>()
                .HasMany(e => e.chitiet_hd)
                .WithRequired(e => e.hoa_don)
                .HasForeignKey(e => e.id_hd)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<loai_sp>()
                .HasMany(e => e.san_pham)
                .WithRequired(e => e.loai_sp)
                .HasForeignKey(e => e.id_loai_sp)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<nguoi_dung>()
                .HasMany(e => e.hoa_don)
                .WithRequired(e => e.nguoi_dung)
                .HasForeignKey(e => e.id_nd)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<san_pham>()
                .HasMany(e => e.chitiet_hd)
                .WithRequired(e => e.san_pham)
                .HasForeignKey(e => e.id_sp)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<thongtin_nd>()
                .HasMany(e => e.nguoi_dung)
                .WithRequired(e => e.thongtin_nd)
                .HasForeignKey(e => e.id_thong_tin_nd)
                .WillCascadeOnDelete(false);
        }
    }
}
