using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        messagePanel.Visible = false;
        PanelWarning.Visible = false;
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
            
        }else if (exists == true)
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


}