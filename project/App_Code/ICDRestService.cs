using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.IO;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICDRestService" in both code and config file together.
[ServiceContract]
public interface ICDRestService
{
    [OperationContract]
    [WebInvoke(Method = "GET",
               ResponseFormat = WebMessageFormat.Json,
               UriTemplate = "GetData")]
    List<objData> GetData();

    [OperationContract]
    [WebInvoke(Method ="GET",
              ResponseFormat = WebMessageFormat.Json,
              UriTemplate = "GetSearchResults/{name}")]
    List<objData> GetSearchResults(string name);


    [OperationContract(Name = "GetSampleMethod")]
    [WebGet(UriTemplate = "GetSampleMethod/inputStr/{name}")]
    string GetSampleMethod(string name);

    [OperationContract(Name = "PostSampleMethod")]
    [WebInvoke(Method = "POST",
         UriTemplate = "PostSampleMethod/New")]
    string PostSampleMethod(Stream data);





}
