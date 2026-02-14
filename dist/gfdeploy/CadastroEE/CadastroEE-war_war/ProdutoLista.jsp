<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body class="container">
        <h1>Listagem de Produtos</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a>
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Preco</th>
                    <th scope="col">Opções</th>
                </tr> 
            </thead>
            <tbody>
                <% List<Produto> produtos = (List<Produto>)request.getAttribute("produtos"); %>
                <% for (Produto produto : produtos) {%>
                <tr>
                    <th scope="row"><%= produto.getIdProduto() %></th>
                    <td><%= produto.getNome() %></td>
                    <td><%= produto.getQuantidade() %></td>
                    <td><%= produto.getPrecoVenda() %></td>
                    <td>
                        <a href="ServletProdutoFC?acao=formAlterar&id=<%= produto.getIdProduto() %>" class="btn btn-primary btn-sm">Alterar</a> 
                        <a href="ServletProdutoFC?acao=excluir&id=<%= produto.getIdProduto() %>" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
