using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using project;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        messagePanel.Visible = false;
        PanelWarning.Visible = false;

        UserManager userManager = new UserManager();
        List<project.ApplicationUser> userList = new List<project.ApplicationUser>();
        userList = userManager.Users.ToList();
        var users = from user in userList select new { user.UserName, user.Roles, user.Id };
        GridView2.DataBind();
        System.Diagnostics.Debug.WriteLine(userList);

    }
    public static List<string> GetRole()
    {
        var roleStore = new RoleStore<IdentityRole>();
        var roleManeger = new RoleManager<IdentityRole>(roleStore);
        var IdentityRolelist = roleManeger.Roles.ToList();

        List<string> rolelist = new List<string>();
        foreach (var role in IdentityRolelist)
        {
            rolelist.Add(role.Name);
        }
        return rolelist;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListDictionary insertParameters = new ListDictionary();

        TextBox name = FormView1.FindControl("nameBox") as TextBox;
        TextBox author = FormView1.FindControl("authorBox") as TextBox;
        DropDownList type = FormView1.FindControl("DropDownMovieList") as DropDownList;

        //check if data exists already

        bool exists = false;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            String valueName = GridView1.Rows[i].Cells[1].Text.ToString();
            if ((valueName.Equals(name.Text)))
            {
                //record exists
                exists = true;
                //ShowPopUpMsg("Name already exists in the database. Please check details in 'name' field");

                break;
            }
            else
            {
                exists = false;
                //record not exists    
            }

        }
        //insert if valid
        if (exists == false)
        {
            insertParameters.Add("Name", name.Text);
            insertParameters.Add("AuthorName", author.Text);
            insertParameters.Add("Type", type.SelectedItem.Text);
            insertParameters.Add("DateAdded", DateTime.Now.ToShortDateString());

            LinqDataSource1.Insert(insertParameters);

            GridView1.DataBind();
            insertParameters.Clear();
            messagePanel.Visible = true;
            messagePanel.Dispose();

        }
        else if (exists == true)
        {
            PanelWarning.Visible = true;
            PanelWarning.Dispose();
        }

    }

    //unused javascript alert
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        LinqDataSource1.DataBind();
        GridView1.DataBind();
    }

    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesDataContext ctx = new DataClassesDataContext();
        String search = TextBox1.Text;
        var source = ctx.CdTables;
        e.Result = source.Where(c => c.Name.Contains(search));
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        String username = GridView2.Rows[GridView2.SelectedIndex].Cells[0].Text;
        System.Diagnostics.Debug.WriteLine(username);

        messagePanel0.Visible = true;

        

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = TextBox2.Text };
        IdentityResult result = manager.Create(user, TextBox3.Text);

        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            //var currentUser = manager.FindByName(user.UserName);
            var roleresult = manager.AddToRole(user.Id, DropDownList1.SelectedValue.ToString());
            manager.Update(user);
           // manager.UpdateSecurityStampAsync(user.Id);
            Panel1.Visible = true;
            GridView2.DataBind();
            
        }
        else
        {
            //ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }

}

public class UserDto
{
    public string UserName { set; get; }
    public List<string> Roles { set; get; }
}