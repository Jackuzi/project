<%@ Page Title="Admin Tools" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AdminTools.aspx.cs" Inherits="Contact" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" BorderStyle="None">
        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                Manage CD Collection
            </HeaderTemplate>
            <ContentTemplate>
                 <asp:BulletedList ID="BulletedList3" runat="server" Width="300px" BulletStyle="Circle" Font-Bold="True" Font-Size="Larger">
                    <asp:ListItem>Manage the database data</asp:ListItem>
                </asp:BulletedList>          
                 <br />
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CdTables" ></asp:LinqDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="LinqDataSource1" ForeColor="Black" Width="550px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="DateAdded" DataFormatString="{0:d}" HeaderText="DateAdded" SortExpression="DateAdded" />
                </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:BulletedList ID="BulletedList1" runat="server" Width="300px" BulletStyle="Circle" Font-Bold="True" Font-Size="Larger">
                    <asp:ListItem>Add new CD to the database</asp:ListItem>
                </asp:BulletedList>
                
                   <asp:FormView ID="FormView1" runat="server" DataSourceID="LinqDataSource1" Height="100px" Width="579px" >
            
                       <ItemTemplate>
                           <asp:TextBox ID="nameBox" runat="server" ToolTip="Enter CD Title"></asp:TextBox>
                             <ajaxToolkit:DropShadowExtender ID="nameBox_DropShadowExtender" runat="server" BehaviorID="nameBox_DropShadowExtender" TargetControlID="nameBox" />
                             <ajaxToolkit:TextBoxWatermarkExtender ID="nameBox_TextBoxWatermarkExtender" runat="server" BehaviorID="nameBox_TextBoxWatermarkExtender" TargetControlID="nameBox" WatermarkText="Name" />
                             <asp:TextBox ID="authorBox" runat="server"></asp:TextBox>
                           <ajaxToolkit:DropShadowExtender ID="authorBox_DropShadowExtender" runat="server" BehaviorID="authorBox_DropShadowExtender" TargetControlID="authorBox" />
                           <ajaxToolkit:TextBoxWatermarkExtender ID="authorBox_TextBoxWatermarkExtender" runat="server" BehaviorID="authorBox_TextBoxWatermarkExtender" TargetControlID="authorBox" WatermarkText="Author" />
                           <asp:DropDownList ID="dropDownMovieList" runat="server" Width="111px">
                                  <asp:ListItem value="value">Movie</asp:ListItem>
                                  <asp:ListItem value="value">Music</asp:ListItem>
                           </asp:DropDownList>
                           <ajaxToolkit:DropShadowExtender ID="DropDownMovieList_DropShadowExtender" runat="server" BehaviorID="DropDownList1_DropShadowExtender" TargetControlID="DropDownMovieList" />
                           <ajaxToolkit:DropDownExtender ID="DropDownMovieList_DropDownExtender" runat="server" BehaviorID="DropDownList1_DropDownExtender" DynamicServicePath="" TargetControlID="DropDownMovieList">
                           </ajaxToolkit:DropDownExtender>
                           <asp:Button ID="Button1" runat="server" Text="Add" Width="95px" OnClick="Button1_Click" />
                           <ajaxToolkit:DropShadowExtender ID="Button1_DropShadowExtender" runat="server" BehaviorID="Button1_DropShadowExtender" TargetControlID="Button1" />
                           <ajaxToolkit:AnimationExtender ID="Button1_AnimationExtender" runat="server" BehaviorID="Button1_AnimationExtender" TargetControlID="Button1">
                           </ajaxToolkit:AnimationExtender>
                           <ajaxToolkit:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" BehaviorID="Button1_RoundedCornersExtender" TargetControlID="Button1" />
                       </ItemTemplate>
                      
                </asp:FormView>


                 <br />
                <asp:Panel ID="messagePanel" runat="server" Visible="False">
                <div class="alert alert-success alert-dismissible fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success!</strong> Record added.
  </div>
</asp:Panel>
                 <asp:Panel ID="PanelWarning" runat="server" Visible="False">
                <div class="alert alert-danger alert-dismissible fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Error!</strong> Record already exists in the database.
  </div>
</asp:Panel>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
                        <HeaderTemplate>
                Add/Remove Users
            </HeaderTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                        <HeaderTemplate>
                Blocked Users
            </HeaderTemplate>
        </ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>

</asp:Content>
