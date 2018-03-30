using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using project;
using Microsoft.AspNet.Identity.Owin;
using System.Net;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            

            //var currentUser = manager.FindByName(user.UserName);
            var roleresult = manager.AddToRole(user.Id, "User");
            manager.Update(user);

            manager.UpdateSecurityStampAsync(user.Id);
            


            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            // user automatically gets user role
            //Admin tools allows to change roles, to add another admin

        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}