using Guestly.Models;
using Microsoft.EntityFrameworkCore;

namespace Guestly.Data
{
    public class GuestlyDbContext : DbContext
    {
        protected readonly IConfiguration _config;
        public GuestlyDbContext(DbContextOptions<GuestlyDbContext> options, IConfiguration config) : base(options)
        {
            _config = config;   
        }

        public DbSet<GuestInfo> GuestInfos { get; set; }
        public DbSet<AddressInfo> AddressInfos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<GuestInfo>()
                .HasOne(g => g.AddressInfo)
                .WithOne(a => a.GuestInfo)
                .HasForeignKey<AddressInfo>(a=>a.GuestInfoID);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("Data Source=LAPTOP-T42EBUN6;Initial Catalog=GuestlyDb;Integrated Security=True;TrustServerCertificate=True;");
        }
    }
}
