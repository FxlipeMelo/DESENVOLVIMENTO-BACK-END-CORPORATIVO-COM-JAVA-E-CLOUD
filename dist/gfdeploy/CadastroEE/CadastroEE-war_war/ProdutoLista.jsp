<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listagem de Produtos</h1>
        <a href="ServletProdutoFC?acao=formIncluir">Novo Produto</a>
        <table>
            <thead>
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
                        <a href="ServletProdutoFC?acao=formAlterar&id=<%= produto.getIdProduto() %>">Alterar</a> 
                        <a href="ServletProdutoFC?acao=excluir&id=<%= produto.getIdProduto() %>">Excluir</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
