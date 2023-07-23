using Apheleon.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Apheleon.repository
{
    public class RepositotyStudents
        {
            //Inyecion de la base de datos

        private readonly AppDbContext _db;

        public RepositotyStudents(AppDbContext db)
        {
            _db = db;
        }


//metodos del crud, necesita ser transportado a una interfaz codigo en proceso

        // public void AddStudent(Students student)
        // {


        //     _db.student.Add(student);
        //     _db.SaveChanges();

        // }

        // public void DeleteStudent(int cedula)
        // {
        //     Students student = _db.student.Find(cedula);
        //     _db.student.Remove(student);
        //     _db.SaveChanges();
        // }

        // public void UpdateStudent(Students student)
        // {
        //     _db.Entry(student).State = EntityState.Modified;
        //     _db.SaveChanges();
        // }


//metodo para obtener un usuario especifico mediante su primary key en este caso la cedula
        public async Task<Students?> GetSingleStudent(UserLogin userLogin)
        {
            Students? User = await _db.student.FindAsync(userLogin.Cedula);
            Console.WriteLine(User);
            return User;
        }

//metodo para obtener todos los usuarios de la base de datos
        public IEnumerable<Students> GetStudents()
        {
            return _db.student.ToList();
        }





    }
}