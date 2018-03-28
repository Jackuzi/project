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
        //CDRestService c = new CDRestService();
       // c.GetData();

    }

    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
      /*  String searchName = TextBox1.Text;


        CDRestService cd = new CDRestService();
        cd.GetData();
        System.Diagnostics.Debug.WriteLine(cd.GetData());

        List<objData> objDatas = new List<objData>();
        DataClassesDataContext objDatabaseDataContext = new DataClassesDataContext();
        var records = (from data in objDatabaseDataContext.CdTables.Where(Name=>Name.Equals(searchName)) orderby data.Name, data.Type select data );
        foreach (var record in records)
        {
            objDatas.Add(new objData
            {
                Id = record.Id.ToString(),
                Name = record.Name.ToString(),
                AuthorName = record.AuthorName.ToString(),
                Type = record.Type.ToString(),
                DateAdded = record.DateAdded.ToString(),
            });

            ListView1.DataBind();

        }*/
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        
        List<objData> foundList = new List<objData>();
        System.Diagnostics.Debug.WriteLine("hereeee");
        String searchName = TextBox1.Text;
        System.Diagnostics.Debug.WriteLine(searchName);

        List<objData> objDatas = new List<objData>();
        DataClassesDataContext objDatabaseDataContext = new DataClassesDataContext();
        var records = (from data in objDatabaseDataContext.CdTables orderby data.Name, data.Type select data);
        CDRestService cd = new CDRestService();
        List<objData> myList = cd.GetData();
        myList.Clear();
        foreach (var record in records)
        {
            /*var matchingvalues = myList
         .Where(data => data.Name.Contains(searchName));*/

            if (record.Name.Equals(searchName)) { 
           System.Diagnostics.Debug.WriteLine("Found: "+record.Name + " "+record.AuthorName);
                
                myList.Add(new objData
                {
                    Id = record.Id.ToString(),
                    Name = record.Name.ToString(),
                    AuthorName = record.AuthorName.ToString(),
                    Type = record.Type.ToString(),
                    DateAdded = record.DateAdded.ToString(),
                });
                

            }
           
        };
                
                //ListView1.DataSource = myList;
                ListView1.DataBind();

    }
    }
