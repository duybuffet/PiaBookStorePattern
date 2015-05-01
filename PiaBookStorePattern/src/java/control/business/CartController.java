/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.business;

import dao.book.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.book.Book;
import entity.business.Cart;

/**
 *
 * @author Duy Buffet
 */
@WebServlet(name = "CartController", urlPatterns = "/CartController")
public class CartController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            String action = request.getParameter("action").trim();
            Cart cartObj = null;
            if (session.getAttribute("cart") != null) {
                cartObj = (Cart) session.getAttribute("cart");
            } else {
                cartObj = new Cart();
            }

            switch (action) {
                case "add":
                    int bookId = Integer.parseInt(request.getParameter("id"));
                    Book b = new BookDAO().getBookById(bookId);

                    if (b != null) {
                        cartObj.addToCart(b);
                        session.setAttribute("cart", cartObj);
                        response.sendRedirect("index.jsp?action=cart");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                    break;

                case "update":
                    if (cartObj != null) {
                        HashMap<Integer, Integer> listBook = cartObj.getListBook();
                        System.out.println(listBook.size());
                        Iterator it = listBook.entrySet().iterator();
                        while (it.hasNext()) {
                            Map.Entry pair = (Map.Entry) it.next();
                            Book book = new BookDAO().getBookById((Integer) pair.getKey());
                            cartObj.changeQuantity(book, Integer.parseInt(request.getParameter("qtt" + book.getBookId())));
                        }
                        response.sendRedirect("index.jsp?action=cart");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                    break;

                case "delete":
//                    System.out.println(cartObj.toString());
                    if (cartObj != null) {
                        System.out.println("case delete != null");
                        
                        response.sendRedirect("index.jsp?action=cart");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                    }
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
