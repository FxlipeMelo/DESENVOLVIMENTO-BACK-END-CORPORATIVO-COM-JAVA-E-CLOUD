/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Felipe
 */
@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/ServletProdutoFC"})
public class ServletProdutoFC extends HttpServlet {

    @EJB
    ProdutoFacadeLocal facade;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String destino = "ProdutoLista.jsp";
        
        if (acao == null) {
            acao = "listar";
        }
        
        switch (acao) {
            case "listar":
                List<Produto> produtos = facade.findAll();
                request.setAttribute("produtos", produtos);
                destino = "ProdutoLista.jsp";
                break;
            case "formIncluir":
                destino = "ProdutoDados.jsp";
                break;
            case "formAlterar":
                String idStr = request.getParameter("id");
                int id = Integer.parseInt(idStr);
                Produto produto = facade.find(id);
                request.setAttribute("produto", produto);
                destino = "ProdutoDados.jsp";
                break;
            case "excluir":
                int idExcluir = Integer.parseInt(request.getParameter("id"));
                Produto produtoExcluir = facade.find(idExcluir);
                if (produtoExcluir != null) {
                    facade.remove(produtoExcluir);
                }
                List<Produto> listaAtualizada = facade.findAll();
                request.setAttribute("produtos", listaAtualizada);
                destino = "ProdutoLista.jsp";
                break;
            case "alterar":
                int idAlterar = Integer.parseInt(request.getParameter("id"));
                Produto produtoAlterar = facade.find(idAlterar);
                
                String nome = request.getParameter("nome");
                String quantidadeStr = request.getParameter("quantidade");
                String precoVendaStr = request.getParameter("precoVenda");
                produtoAlterar.setNome(nome);
                produtoAlterar.setQuantidade(Integer.parseInt(quantidadeStr));
                produtoAlterar.setPrecoVenda(Integer.parseInt(precoVendaStr));
                facade.edit(produtoAlterar);
                List<Produto> listaAlterar = facade.findAll();
                request.setAttribute("produtos", listaAlterar);
                destino = "ProdutoLista.jsp";
                break;
            case "incluir":
                Produto produtoIncluir = new Produto();
                String nomeIncluir = request.getParameter("nome");
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                int precoVenda = Integer.parseInt(request.getParameter("precoVenda"));
                produtoIncluir.setNome(nomeIncluir);
                produtoIncluir.setQuantidade(quantidade);
                produtoIncluir.setPrecoVenda(precoVenda);
                facade.create(produtoIncluir);
                List<Produto> listaIncluir = facade.findAll();
                request.setAttribute("produtos", listaIncluir);
                destino = "ProdutoLista.jsp";
                break;
            default:
                List<Produto> padrao = facade.findAll();
                request.setAttribute("produtos", padrao);
                destino = "ProdutoLista.jsp";
                break;
        }
        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
