using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace HungHaStore.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<chitiet_hd> chitiet_hd { get; set; }
        public virtual DbSet<dat_hang> dat_hang { get; set; }
        public virtual DbSet<hoa_don> hoa_don { get; set; }
        public virtual DbSet<kho> khoes { get; set; }
        public virtual DbSet<loai_sp> loai_sp { get; set; }
        public virtual DbSet<nguoi_dung> nguoi_dung { get; set; }
        public virtual DbSet<nha_cung_cap> nha_cung_cap { get; set; }
        public virtual DbSet<san_pham> san_pham { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<hoa_don>()
                .HasMany(e => e.chitiet_hd)
                .WithRequired(e => e.hoa_don)
                .HasForeignKey(e => e.id_hd)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<kho>()
                .HasMany(e => e.san_pham)
                .WithOptional(e => e.kho)
                .HasForeignKey(e => e.id_kho);

            modelBuilder.Entity<loai_sp>()
                .HasMany(e => e.san_pham)
                .WithRequired(e => e.loai_sp)
                .HasForeignKey(e => e.id_loai_sp)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<nguoi_dung>()
                .Property(e => e.sdt)
                .IsFixedLength();

            modelBuilder.Entity<nguoi_dung>()
                .HasMany(e => e.hoa_don)
                .WithOptional(e => e.nguoi_dung)
                .HasForeignKey(e => e.id_nd);

            modelBuilder.Entity<nha_cung_cap>()
                .HasMany(e => e.san_pham)
                .WithOptional(e => e.nha_cung_cap)
                .HasForeignKey(e => e.id_ncc);

            modelBuilder.Entity<san_pham>()
                .HasMany(e => e.chitiet_hd)
                .WithRequired(e => e.san_pham)
                .HasForeignKey(e => e.id_sp)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<san_pham>()
                .HasMany(e => e.dat_hang)
                .WithRequired(e => e.san_pham)
                .HasForeignKey(e => e.id_sp)
                .WillCascadeOnDelete(false);
        }
    }
}
