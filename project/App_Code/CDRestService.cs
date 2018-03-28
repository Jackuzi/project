using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

public class CDRestService : ICDRestService
{
   

    public List<objData> GetData()
        
    {
        // code works
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

    public List<objData> GetSearchResults(String name)
    {

       
        List<objData> objDatas = new List<objData>();
        DataClassesDataContext objDatabaseDataContext = new DataClassesDataContext();
        var records = (from data in objDatabaseDataContext.CdTables orderby data.Name, data.Type select data);
        if (!String.IsNullOrWhiteSpace(name))
        {
            foreach (var record in records)
            {

                if (record.Name.Equals(name))
                {
                    objDatas.Add(new objData
                    {
                        Id = record.Id.ToString(),
                        Name = record.Name.ToString(),
                        AuthorName = record.AuthorName.ToString(),
                        Type = record.Type.ToString(),
                        DateAdded = record.DateAdded.ToString(),

                    });
                }


                // show results in console
                System.Diagnostics.Debug.WriteLine(record.Name);
            }
        }
        
      
        return objDatas;



    }
    public string PostSampleMethod(Stream data)
    {
        // convert Stream Data to StreamReader
        StreamReader reader = new StreamReader(data);
        // Read StreamReader data as string
        string xmlString = reader.ReadToEnd();
        string returnValue = xmlString;
        // return the XMLString data
        return returnValue;
    }
    public string GetSampleMethod(string strUserName)
    {
        StringBuilder strReturnValue = new StringBuilder();
        // return username prefixed as shown below
        strReturnValue.Append(string.Format
        ("You have entered userName as {0}", strUserName));
        return strReturnValue.ToString();
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
