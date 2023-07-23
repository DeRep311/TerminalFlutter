

using System.ComponentModel.DataAnnotations;

public class Students : Users
{   
    [Key]
    public int Cedula { get; set; }

    public int Pin { get; set; }
    public int? Telefono { get; set; }

    public string? Nombre_Completo { get; set; }

    public string? Direccion { get; set; }

    public int? Curso { get; set; }

}