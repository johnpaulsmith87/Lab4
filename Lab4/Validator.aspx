<%@ Page Title="" Language="C#" MasterPageFile="~/AlgonquinMasterPage2.master" AutoEventWireup="true" CodeFile="Validator.aspx.cs" Inherits="Validator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


            <asp:Panel runat="server" ID="pnlUploadXml" Visible="true">
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="XML Schema: "></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload runat="server" ID="fupXMLSchema" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="XML Document: "></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload runat="server" ID="fupXMLDocument" />
                        </td>
                    </tr>
                </table>
                <div>
                    <asp:Button runat="server" ID="btnValidate" OnClick="btnValidate_Click" Text="Validate" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlResults" runat="server">
                <div>
                    <asp:Label runat="server" ID="lblResults"></asp:Label>
                </div>
                <asp:Table CssClass="table" runat="server" ID="tblErrors" Visible="false">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell Text="Type"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Text="Line#"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Text="Column#"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Text="Error Message"> </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>

            </asp:Panel>
</asp:Content>

