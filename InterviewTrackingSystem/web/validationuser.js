/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateUser()
{
    document.write("ok");
             var MobileNumber=document.forms["form1"]["mobile"].value;
             var EmailId=document.forms["form1"]["emailid"].value;
             var Password=document.forms["form1"]["pwd"].value;
             var validmobile=/[7-9][1][0-9][9]$/;
             var validemailid=/[a-z0-9-._][@][1]+[.][1]+[a-zA-Z][3]$/;
             var validpassword=/[a-zA-Z0-9-_.!@#$%^&*()+=,""'']$/;
         if(firstname=="")
         {
             alert("Enter the First Name");
             document.form1.firstname.focus();
             return;
         }
         if(lastname=="")
         {
             alert("Enter the Last Name");
             document.form1.lastname.focus();
             return;
         }
         if(mobile=="")
         {
             alert("Enter the Mobile Number");
             document.form1.Mobile.focus();
             return;
         }
         if(isNaN(MobileNumber))
         {
              alert("enter valid mobile number");
              document.form1.MobileNumber.focus();
              return false;
         }
         if(pwd=="")
         {
             alert("Enter the Password");
             document.form1.pwd.focus();
             return;
         }
         if(!(validmobile.test(MobileNumber)))
	   {
                alert("enter valid Mobile Number");
   		document.form1.MobileNumber.focus();
 		return false;
           }
            if(!(validemailid.test(EmailId)))
           {
              alert("enter valid emailid number");
              document.form1.EmailId.focus();
              return false;
           }
           if(!(validpassword.test(Password)))
           {
                    alert("enter valid Passowrd..");
                    document.form1.pwd.focus();
                    return false;
           }
           if(Password.length()<8)
           {
               alert("password should contain atleast eight characters.. please do try again");
               document.form1.pwd.focus();
               return false;
           }
           return true;
}
