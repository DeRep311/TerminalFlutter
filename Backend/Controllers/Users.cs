using Apheleon.Models;
using Apheleon.Services;
using Microsoft.AspNetCore.Mvc;

namespace Apheleon.Controllers;


[Route("/api")]
[ApiController]

public class Users : ControllerBase
{  
    
    private readonly UsersAdmin _usersAdmin;
    public Users(UsersAdmin usersAdmin)
    {
        _usersAdmin = usersAdmin;
    }
  

    
 [HttpPost("Login")]


    public async Task<ActionResult<OperationResult<Students>>> Login (UserLogin userLogin){
        Console.WriteLine(userLogin.Cedula);
        var User= await _usersAdmin.Login(userLogin);
        if (User.isSuccessful)
        {
            return Ok(User.data);
        }
        else
        {
            return BadRequest(User.message);
        }
    }


}

