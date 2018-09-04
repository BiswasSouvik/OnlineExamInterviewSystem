/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateAdmin()
{
    var username=document.forms["form2"]["useradmin"].value;
    var password=document.forms["form2"]["passadmin"].value;
    var validusername=/[a-zA-Z0-9]$/;
    var validpassword=/[a-zA-Z0-9-_.!@#$%^&*()+=,""''][8]$/;
     if(!(validpassword.test(password)))
     {
		     alert("enter valid Password");
                     document.form2.passadmin.focus();
 		     return false;
      }
        if(!(validusername.test(username)))
	{
                      alert("enter valid Username");
                      document.form2.useradmin.focus();
                      return false;
        }
    return true;
}

