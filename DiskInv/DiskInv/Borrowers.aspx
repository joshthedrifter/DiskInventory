<%-- **************************************************************************** --%>
<%-- Date	    Name	   Description                                            --%>
<%-- -------------------------------------------------------------------------------%>
<%-- 04/26/2020 Josh       Initial implementation of borrowers entry page         --%>
<%-- **************************************************************************** --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Borrowers.aspx.cs" Inherits="DiskInv.Borrowers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        Please enter borrower information &amp; click Submit</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="txtFirst" runat="server">First Name</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirst" ErrorMessage="First name is required." InitialValue="First Name" ViewStateMode="Inherit" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirst" ErrorMessage="Please enter a first name." Display="Dynamic" ></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txtLast" runat="server">Last Name</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLast" Display="Dynamic" ErrorMessage="Last name is required." InitialValue="Last Name"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLast" Display="Dynamic" ErrorMessage="Please enter a last name."></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txtPhone" runat="server">999-999-9999</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Use this format: XXX-XXX-XXXX." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone number is required" InitialValue="999-999-9999"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please enter a phone number."></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    </p>
    <p>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>
</asp:Content>
