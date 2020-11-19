<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="MantenedorProductos.aspx.cs" Inherits="RegistroFacturacion.MantenedorProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class =" container" >
        <header>
        <div class="container header">
            <h1 style="text-align:center;margin-top:20px">Mantenedor de Productos</h1>
        </div>
    </header>
   
   <div class="row" style="margin-top:40px">
     
            <div class="col">
                <asp:TextBox ID="txtCodProducto" CssClass="form-control" runat="server" placaholder="Codigo Producto" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodProducto" ErrorMessage="Campo obligatorio" ></asp:RequiredFieldValidator>
            </div>
            <div class="col">
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeholder="Descripcion Producto"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            </div>
        </div>
       <div class="row">
           <div class="col">
               <asp:TextBox ID="txtUM" runat="server" CssClass="form-control" placeholder="Unidad Medida"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUM" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
           </div>
           <div class="col">
               <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="Precio Unitario"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
           </div>
       </div>

       <div class="container">
           <asp:Button ID="btnProducto" OnClick="btnProducto_Click" CssClass="btn btn-primary botonProductos" style="margin-top:30px;margin-bottom:20px;" runat="server" Text="Registrar"  />
       </div>

        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server"  ></asp:GridView>
   </div>
     
        
  

   
</asp:Content>
