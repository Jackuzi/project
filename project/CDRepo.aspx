<%@ Page Title="CD Repositories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CDRepo.aspx.cs" Inherits="About" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>
    <h3>Search for a CD of your choice</h3>
    <div>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="258px" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorNameLabel" runat="server" Text='<%# Eval("AuthorName") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AuthorNameTextBox" runat="server" Text='<%# Bind("AuthorName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AuthorNameTextBox" runat="server" Text='<%# Bind("AuthorName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorNameLabel" runat="server" Text='<%# Eval("AuthorName") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server">Name</th>
                                <th runat="server">AuthorName</th>
                                <th runat="server">Type</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorNameLabel" runat="server" Text='<%# Eval("AuthorName") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
        </asp:ListView>
        <ajaxToolkit:DropDownExtender ID="ListView1_DropDownExtender" runat="server" BehaviorID="ListView1_DropDownExtender" TargetControlID="ListView1">
        </ajaxToolkit:DropDownExtender>
        <ajaxToolkit:DropShadowExtender ID="ListView1_DropShadowExtender" runat="server" BehaviorID="ListView1_DropShadowExtender" TargetControlID="ListView1" Rounded="True" TrackPosition="True">
        </ajaxToolkit:DropShadowExtender>

</div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" OnSelecting="LinqDataSource1_Selecting" Select="new (Name, AuthorName, Type)" TableName="CdTables" OrderBy="Type"></asp:LinqDataSource>
</asp:Content>
