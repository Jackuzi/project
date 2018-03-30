<%@ Page Title="CD Repositories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CDRepo.aspx.cs" Inherits="About" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>
    <h3>Search for a CD of your choice</h3>
    <div style="height: 516px">
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="258px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <ajaxToolkit:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" runat="server" BehaviorID="TextBox1_TextBoxWatermarkExtender" TargetControlID="TextBox1" WatermarkText="Name" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2;color: #284775;">
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
                <tr style="background-color: #FFCC66;color: #000080;">
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
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                <tr style="background-color: #FFFBD6;color: #333333;">
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
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
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
                        <td runat="server" style="text-align: center;background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
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
        <ajaxToolkit:RoundedCornersExtender ID="ListView1_RoundedCornersExtender" runat="server" BehaviorID="ListView1_RoundedCornersExtender" TargetControlID="ListView1" />
        <ajaxToolkit:DropDownExtender ID="ListView1_DropDownExtender" runat="server" BehaviorID="ListView1_DropDownExtender" TargetControlID="ListView1">
        </ajaxToolkit:DropDownExtender>
        <ajaxToolkit:DropShadowExtender ID="ListView1_DropShadowExtender" runat="server" BehaviorID="ListView1_DropShadowExtender" TargetControlID="ListView1" Rounded="True" TrackPosition="True"></ajaxToolkit:DropShadowExtender>

    </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" OnSelecting="LinqDataSource1_Selecting" Select="new (Name, AuthorName, Type)" TableName="CdTables" OrderBy="Type"></asp:LinqDataSource>
</asp:Content>
