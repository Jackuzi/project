using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

public class CDRestService : ICDRestService
{
    [WebInvoke(Method = "GET",
               ResponseFormat = WebMessageFormat.Json,
               UriTemplate = "")]

    public List<objData> GetData()
        
    {
        // code works
        System.Diagnostics.Debug.WriteLine("hereeee");

        List<objData> objDatas = new List<objData>();   
        DataClassesDataContext objDatabaseDataContext = new DataClassesDataContext();
        var records = (from data in objDatabaseDataContext.CdTables orderby data.Name, data.Type select data);
        foreach(var record in records)
        {
            objDatas.Add(new objData {
                Id = record.Id.ToString(),
                Name = record.Name.ToString(),
                AuthorName = record.AuthorName.ToString(),
                Type = record.Type.ToString(),
                DateAdded = record.DateAdded.ToString(),
                
            });
            // show results in console
            System.Diagnostics.Debug.WriteLine(record.Name);
        }
        return objDatas;
    }
}
    public class objData
    {
        public String Id { get; set; }
        public string Name { get; set; }
        public string AuthorName { get; set; }
        public string Type { get; set; }
        public string DateAdded { get; set; }
    
}
