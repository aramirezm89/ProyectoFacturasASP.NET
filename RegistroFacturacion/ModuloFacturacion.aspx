<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="ModuloFacturacion.aspx.cs" Inherits="RegistroFacturacion.ModuloFacturacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
    
    <div class="container">
          <header>
        <div class="container header">
            <h1 style="text-align:center;margin-top:20px">Ingreso Factura</h1>
        </div>
    </header>
         <div class="row" style="margin-top:40px">
     
            <div class="col">
                <asp:TextBox ID="txtNumeroFactura" CssClass="form-control" runat="server" placeholder="Numero Factura" ></asp:TextBox>
              
            </div>
            <div class="col">
                <asp:TextBox ID="txtTipofactura" runat="server" CssClass="form-control" placeholder="Tipo Factura"></asp:TextBox>
             
            </div>
        </div>
       <div class="row" style="margin-top:10px">
           <div class="col">
                 <asp:Label ID="lblEmpresa" AssociatedControlID="dpSelecEmpresa" runat="server" Text="Rut Empresa:"></asp:Label>
               <asp:DropDownList ID="dpSelecEmpresa" runat="server"></asp:DropDownList>
             
           </div>
           <div class="col">
               <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control" placeholder="Razon Social"></asp:TextBox>
              
           </div>
        </div>

        <div class="row" style="margin-top:10px">
             <div class="col">
                 <asp:Label ID="lblCLi" AssociatedControlID="dpCliente" runat="server" Text="Id Cliente:"></asp:Label>
                 <asp:DropDownList ID="dpCliente" runat="server"></asp:DropDownList>
            </div>
            <div class="col">
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control" placeholder="Fecha Emision"></asp:TextBox>
                
            </div>
        </div>
       <div class="row" style="margin-top:10px">
           <div class="col">
               <asp:TextBox ID="txtCondicionPago" runat="server" CssClass="form-control" placeholder="Codiccion de Pago"></asp:TextBox>
              
           </div>
           <div class="col">
               <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control" placeholder="Estado Factura" Text="no_emitida" ReadOnly="true"></asp:TextBox>
              
           </div>
       </div>
        <asp:Button style="margin-top:10px" ID="btnEncabezado" OnClick="btnEncabezado_Click" CssClass="btn btn-primary" runat="server" Text="Registrar Encabezado" />

    </div>
   
    


  


     <div class="container">
          <header>
        <div class="container header">
            <h1 style="text-align:center;margin-top:20px">Ingrese detalle de la factura</h1>
        </div>
    </header>
         <div class="row" style="margin-top:40px">
     
            <div class="col">
                  <asp:Label ID="lblNumeroFactura" AssociatedControlID="dpNumeroFactura" runat="server" Text="Numero Factura:"></asp:Label>
                <asp:DropDownList ID="dpNumeroFactura" AutoPostBack="false" runat="server"></asp:DropDownList>
            </div>
            <div class="col">
                  <asp:Label ID="lblProducto" AssociatedControlID="dpProducto" runat="server" Text="Producto:"></asp:Label>
                <asp:DropDownList ID="dpProducto" runat="server"></asp:DropDownList>
            </div>
        </div>
       <div class="row" style="margin-top:10px">
           <div class="col">
               <asp:TextBox ID="txtCantidadProducto" runat="server" CssClass="form-control" placeholder="Cantidad"></asp:TextBox>
              
             
           </div>
           <div class="col">
               <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="Precio"></asp:TextBox>
              
             
           </div>
        </div>

        <div class="row" style="margin-top:10px">
             <div class="col">
                 <asp:TextBox ID="txtMontoTotal" placeholder="Total" ReadOnly="true" runat="server"></asp:TextBox>
            </div>
            <div class="col">
              <asp:TextBox ID="txtNeto" placeholder="Monto Neto" ReadOnly="true" runat="server"></asp:TextBox>          
            </div>
            <div class="col">
              <asp:TextBox ID="txtIva" placeholder="IVA" ReadOnly="true" runat="server"></asp:TextBox>          
            </div>
        </div>
      
   </div>
    
             <asp:Button  style="margin-top:20px;margin-left:200px;margin-bottom:20px;" ID="btnRegistroDetalle" OnClick="btnRegistroDetalle_Click" CssClass ="btn btn-primary" runat="server"  Text="Registrar Detalle" />

   <div class="container" style="margin-bottom:30px">
      <header>
        <div class="container header">
            <h1 style="text-align:center;margin-top:20px">Emitir o Anular Factura</h1>
        </div>
    </header>

         <div class="row" style="margin-top:40px">
     
            <div class="col">
                <asp:TextBox ID="txtEmitirFactura" placeholder="Numero Factura" runat="server"></asp:TextBox>
                <asp:Button ID="btnEmitirFactura" CssClass="btn btn-primary" OnClick="btnEmitirFactura_Click" runat="server" Text="Emitir Factura" />
            </div>
            <div class="col">
                 <asp:TextBox ID="txtAnularFactura" placeholder="Numero Factura" runat="server"></asp:TextBox>
                <asp:Button ID="btnAnularFactura" CssClass="btn btn-primary" OnClick="btnAnularFactura_Click" runat="server" Text="Anular Factura" />
            </div>
        </div>
   </div>
        
</asp:Content>
