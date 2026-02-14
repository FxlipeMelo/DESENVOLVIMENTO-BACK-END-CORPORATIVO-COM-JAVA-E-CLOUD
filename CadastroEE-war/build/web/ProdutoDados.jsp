<%@page import="cadastroee.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Dados do Produto</h1>
        
        <form action="ServletProdutoFC" method="post">
            <% 
                Produto produto = (Produto) request.getAttribute("produto"); 
                String acao = "incluir";
                if (produto != null && produto.getIdProduto() != null) {
                    acao = "alterar"; 
                }
            %>
            
            <input type="hidden" name="acao" value="<%= acao %>">
            <% if (acao.equals("alterar")) { %>
                <input type="hidden" name="id" value="<%= produto.getIdProduto() %>"/>
            <% } %>
            <p>
                <label>Nome:</label>
                <input  type="text" name="nome" value="<%= produto != null ? produto.getNome() : "" %>"/>
            </p>
            <p>
                <label>Quantidade:</label>
                <input type="number" name="quantidade" value="<%= produto != null ? produto.getQuantidade(): "" %>"/>
            </p>
            <p>
                <label>Preço de Venda:</label>
                <input type="number" name="precoVenda" value="<%= produto != null ? produto.getPrecoVenda() : "" %>"/>
            </p>
            <button type="submit"><%= produto != null ? "Alterar Produto" : "Adicionar Produto" %></button>
        </form>
        
        
    </body>
</html>
