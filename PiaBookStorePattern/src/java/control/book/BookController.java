/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control.book;

import dao.book.BookDAO;
import entity.book.Book;
import entity.builder.book.BookBuildable;
import entity.builder.book.BookBuilder;
import entity.builder.book.BookSearchBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Duy Buffet
 */
@WebServlet(name = "BookController", urlPatterns = {"/BookController"})
public class BookController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action").trim();
            HttpSession session = request.getSession(true);
            BookDAO bookDao = new BookDAO();

            switch (action) {
                case "search":
                    ArrayList<Book> result = null;
                    Book book = null;
                    BookBuildable bookBuildable = null;
                    String title = (String)request.getParameter("title");
                    String author = (String)request.getParameter("author");
                    String category = (String)request.getParameter("category");
                    
                    // Build Book step by step
                        // start the construction process
                    BookBuilder builder = null;
                    builder = new BookSearchBuilder();
                    builder.addAuthor(author);
                    builder.addCategory(category);
                    builder.addTitle(title);
                    
                        // get book
                    bookBuildable = builder.getBook();
                    bookBuildable.produce();
                    book = bookBuildable.getBook();
                    
                    // search
                    result = bookDao.searchBook(book);
                    session.setAttribute("SearchResult", result);
                    response.sendRedirect(request.getContextPath() + "/index.jsp?action=search");
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "index.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
