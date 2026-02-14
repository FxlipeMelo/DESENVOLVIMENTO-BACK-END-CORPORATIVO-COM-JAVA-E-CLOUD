<%@page import="cadastroee.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body class="container">
        <h1>Dados do Produto</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <form action="ServletProdutoFC" method="post" class="form">
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
            <div class="mb-3">
                <label class="form-label">Nome:</label>
                <input  type="text" name="nome" value="<%= produto != null ? produto.getNome() : "" %>" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Quantidade:</label>
                <input type="number" name="quantidade" value="<%= produto != null ? produto.getQuantidade(): "" %>" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Preço de Venda:</label>
                <input type="number" name="precoVenda" value="<%= produto != null ? produto.getPrecoVenda() : "" %>" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary"><%= produto != null ? "Alterar Produto" : "Adicionar Produto" %></button>
        </form>
        
        
    </body>
</html>
