<%@ Page Title="" Language="C#" MasterPageFile="~/AlgonquinMasterPage2.master" AutoEventWireup="true" CodeFile="Lab5.aspx.cs" Inherits="Lab5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Ottawa Restaurant Reviews</h1>
    <asp:Label runat="server" ID="lblSearchRestaurant">
        Search for Restaurant with Rating above:
    </asp:Label>
    <asp:TextBox runat="server" ID="txtSearchRestaurant"></asp:TextBox>
    <asp:Button runat="server" ID="btnSearchRestaurant" Text="Search"/>
    <br />
    <div id="reviews" runat="server"></div>
</asp:Content>

