<%-- *************************************************************************** --%>
<%-- Date	    Name	   Description                                           --%>
<%-- ------------------------------------------------------------------------------%>
<%-- 04/26/2020 Josh       Initial implementation of Disks entry page            --%>
<%-- 05/01/2020 Josh       Added ListView to add, upd & del disks                --%>
<%-- 05/11/2020 Josh       Added validation for ID fields on edit and insert     --%>
<%-- *************************************************************************** --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Disks.aspx.cs" Inherits="DiskInv.Disks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    &nbsp;</p>
<p style="font-size: 18px; font-weight:bold;">
    Disks</p>
<p>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="disk_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#DCDCDC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#999999;color: #000000;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel1" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="disk_nameTextBox" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="release_dateTextBox" ValidationGroup="Edit" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Must be a valid date" ControlToValidate="release_dateTextBox" Type="Date" ValidationGroup="Edit" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="genre_idTextBox" ValidationGroup="Edit" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="ID must be 1-5" Type="Integer" ValidationGroup="Insert" MaximumValue="5" MinimumValue="1" Display="Dynamic" ControlToValidate="genre_idTextBox"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="status_idTextBox" ValidationGroup="Edit" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="ID must be 1 or 2" Type="Integer" ValidationGroup="Insert" MaximumValue="2" MinimumValue="1" Display="Dynamic" ControlToValidate="status_idTextBox"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="disk_type_idTextBox" ValidationGroup="Edit" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="ID must be 1 or 2" Type="Integer" ValidationGroup="Insert" MaximumValue="2" MinimumValue="1" Display="Dynamic" ControlToValidate="disk_type_idTextBox"></asp:RangeValidator>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #000000;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="disk_nameTextBox" ValidationGroup="Insert" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="release_dateTextBox" ValidationGroup="Insert" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Must be a valid date" ControlToValidate="release_dateTextBox" Type="Date" ValidationGroup="Insert" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required" ControlToValidate="genre_idTextBox" ValidationGroup="Insert" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="ID must be 1-5" Type="Integer" ValidationGroup="Insert" MaximumValue="5" MinimumValue="1" Display="Dynamic" ControlToValidate="genre_idTextBox"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required" ControlToValidate="status_idTextBox" ValidationGroup="Insert" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="ID must be 1 or 2" Type="Integer" ValidationGroup="Insert" MaximumValue="2" MinimumValue="1" Display="Dynamic" ControlToValidate="status_idTextBox"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required" ControlToValidate="disk_type_idTextBox" ValidationGroup="Insert" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="ID must be 1 or 2" Type="Integer" ValidationGroup="Insert" MaximumValue="2" MinimumValue="1" Display="Dynamic" ControlToValidate="disk_type_idTextBox"></asp:RangeValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#FFFFFF;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #000000;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">disk_id</th>
                                <th runat="server">disk_name</th>
                                <th runat="server">release_date</th>
                                <th runat="server">genre_id</th>
                                <th runat="server">status_id</th>
                                <th runat="server">disk_type_id</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
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
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryJNConnectionString %>" DeleteCommand="sp_del_disk" InsertCommand="sp_ins_disk" SelectCommand="SELECT [disk_id], [disk_name], [release_date], [genre_id], [status_id], [disk_type_id] FROM [disk] ORDER BY [disk_name]" UpdateCommand="sp_upd_disk" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>
