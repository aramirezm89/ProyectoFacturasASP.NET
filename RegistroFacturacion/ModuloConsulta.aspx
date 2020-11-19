<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="ModuloConsulta.aspx.cs" Inherits="RegistroFacturacion.ModuloConsulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
          <header>
        <div class="container header">
            <h1 style="text-align:center;margin-top:20px;margin-bottom:30px;">Consulta tu factura</h1>
        </div>
    </header>

  </div>
 <div class="container" style="margin-top:40px">
     <div class="row">
        <div class="col-5" >
            <asp:Label ID="lblFiltroNomFactura" AssociatedControlID="txtFiltroNumFactura" runat="server" Text="Filtro N°Factura"></asp:Label>
             <asp:TextBox ID="txtFiltroNumFactura" runat="server"></asp:TextBox>
             <asp:Button ID="btnFiltroNumFactura" CssClass="btn btn-primary" OnClick="btnFiltroNumFactura_Click" runat="server" Text="Button" />
        </div>
        <div class="col-7" >
            <asp:Label ID="lblFechaEntrada" AssociatedControlID="txtFechaEntrada" runat="server" Text="Fecha Inicio"></asp:Label>
             <asp:TextBox ID="txtFechaEntrada" TextMode="Date"   runat="server"></asp:TextBox>
             <asp:Label ID="LablblFechaFin" AssociatedControlID="txtFechaFin" runat="server" Text="Fecha Fin"></asp:Label>
             <asp:TextBox ID="txtFechaFin" TextMode="Date"   runat="server"></asp:TextBox>
             <asp:Button ID="btnFiltroFecha"  CssClass="btn btn-primary" OnClick="btnFiltroFecha_Click" runat="server" Text="Filtrar" />
            
        </div>

    </div>
 </div>
    
   
   <div class="container-fluid" style="margin-top:30px">
        <asp:GridView ID="GridView1" RowStyle-Wrap="false" CssClass="table table-striped table-bordered" runat="server"></asp:GridView>
   </div>

    <div class="container">
        <header>
            <h1 style="text-align:center"> Monto total  de Facturas por periodo de fecha</h1>
        </header>
           <asp:GridView ID="gvTotales" CssClass="table table-striped table-bordered"  runat="server"></asp:GridView>
    </div>
 
   
</asp:Content>
