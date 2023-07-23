



using Apheleon.Models;
using Apheleon.repository;
using Apheleon.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//conexion a la base de datos mediante entityframework y inyeccion de dependencias

//la connection string sera ocultada en un archivo de configuracion en un futuro muy cercano
string? connectionString ="Server=26.18.85.39;Database=apheleondb;UID=root;PWD=Anashei1212;";
builder.Services.AddDbContext<AppDbContext>(options => options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));
builder.Services.AddScoped<RepositotyStudents>();
builder.Services.AddScoped<UsersAdmin>();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
 app.UseHttpLogging();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
