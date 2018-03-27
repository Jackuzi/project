using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    //Connection String  
    string cs = "Data Source=.;Initial Catalog=Database;User ID=sa;Integrated Security=true;";
    SqlConnection con;
    SqlDataAdapter adapt;
    DataTable dt;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        /*con = new SqlConnection(cs);
        con.Open();
        adapt = new SqlDataAdapter("select * from Table", con);
        dt = new DataTable();
        adapt.Fill(dt);
        ListView1.DataSource = dt;
        con.Close();
        */
        CDRestService c = new CDRestService();
        c.GetData();
        
    }

    

    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {

    }




    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        con = new SqlConnection(cs);
        con.Open();
        adapt = new SqlDataAdapter("select * from Table where Name like '" + TextBox1.Text + "%'", con);
        dt = new DataTable();
        adapt.Fill(dt);
        ListView1.DataSource = dt;
        con.Close();
    }
}