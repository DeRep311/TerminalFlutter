using System;
using Apheleon.repository;
using Microsoft.AspNetCore.Mvc;

namespace Apheleon.Services{
 public class UsersAdmin
{
    //Inyecion de 
    private readonly RepositotyStudents _repository;
    public UsersAdmin(RepositotyStudents repository)
    {
        _repository = repository;
    }

    

    public async Task<OperationResult<Students>> Login (UserLogin userLogin)
    {
       //solicita el usuario de la base de datos mediante el repositorio
        Students? User= await _repository.GetSingleStudent(userLogin);

        if (User== null)
        {   
            //si el usuario no existe retorna un mensaje de error    
                return new OperationResult<Students>
        {
            isSuccessful = false,
            message = "Usuario no encontrado"
        };
        }
        else
        {
            //si el usuario existe compara el pin

            if (User.Pin == userLogin.Pin)
            {
                //si el pin es correcto retorna el usuario
                return new OperationResult<Students>
        {
            isSuccessful = true,
            data = User
        };
            }
            else
            {   return new OperationResult<Students>{
                isSuccessful = false,
                message = "Pin incorrecto"
            };
            }
        }
       
        
    }
    
}}