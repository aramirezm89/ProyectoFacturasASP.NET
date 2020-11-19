<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="RegistroFacturacion.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="text-align: center; margin-top: 20px;">
        <header>
            <h1>Bienvenido al sistema de facturacion AIEP</h1>
        </header>

        <div class="container" style="margin-top: 20px;margin-bottom:20px;margin-left:12px">
            <asp:Label ID="Label1" AssociatedControlID="txtFacturaSession" runat="server" Text="Contador Facturas session:"></asp:Label>
            <asp:TextBox ID="txtFacturaSession" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div  style="margin-top: 20px;margin-bottom:20px; margin-left:28px;">
            <asp:Label ID="Label2" AssociatedControlID="txtFacturasGlobal" runat="server" Text="Contador Facturas Global:"></asp:Label>
            <asp:TextBox ID="txtFacturasGlobal" ReadOnly="true" runat="server"></asp:TextBox>


        </div>

        <div  style="margin-top: 20px;margin-bottom:20px;margin-left:9px;">
            <asp:Label ID="Label3" runat="server" Text="Contador monto neto global:"></asp:Label>
            <asp:TextBox ID="txtMontoNetoGLobal" runat="server"></asp:TextBox>


        </div>
        <div  style="margin-top: 20px;margin-bottom:20px;">
            <asp:Label ID="Label4" runat="server" Text="COntador monto neto session:"></asp:Label>
            <asp:TextBox ID="txtMontoNetoSession" runat="server"></asp:TextBox>
        </div>

    </div>
</asp:Content>
