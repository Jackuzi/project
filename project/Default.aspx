<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Internet Scripting Project</h1>
        <p class="lead">Banner ID: B00273592</p>

    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Browse CD repositories</h2>
            <p>
                This Application lets user to browse CD repositories, create accounts, remove users, manipulate database data. 
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/CDRepo">Find your CD &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Log in </h2>
            <p>
                Please log in if you have an account
            </p>
            <p>
                <a class="btn btn-default" href="/Account/Login">Log in &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Register</h2>
            <p>
                Don't have an account?. Please register for free :)
            </p>
            <p>
                <a class="btn btn-default" href="/Account/Register">Register &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
