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

    }

    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesDataContext ctx = new DataClassesDataContext();
        String search = TextBox1.Text;
        var source = ctx.CdTables;
        e.Result = source.Where(c => c.Name.Contains(search));
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        LinqDataSource1.DataBind();
        ListView1.DataBind();

    }
}
