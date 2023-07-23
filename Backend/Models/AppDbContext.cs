using Microsoft.EntityFrameworkCore;


namespace Apheleon.Models
{
    public class AppDbContext : DbContext
    {

//conexion a la base de datos mediante entityframework
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }
        public DbSet<Students> student { get; set; }
    }
}