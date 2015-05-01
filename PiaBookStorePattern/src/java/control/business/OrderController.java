/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.business;

import dao.business.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.business.Cart;
import entity.business.Order;
import entity.user.User;

/**
 *
 * @author Duy Buffet
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action").trim();
            Cart cart = null;
            User user = null;
            if (session.getAttribute("cart") != null && session.getAttribute("user") != null) {
                cart = (Cart) session.getAttribute("cart");
                user = (User) session.getAttribute("user");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }

            switch (action) {
                case "add":
                    Order order = new Order();
                    order.setCart(cart);
                    order.setOrderStatus(0);
                    order.setReceiverAddress(request.getParameter("address"));
                    order.setReceiverName(request.getParameter("name"));
                    order.setReceiverPhoneNo(request.getParameter("phone"));
                    order.setTotalPrice(Float.parseFloat(request.getParameter("total")));
                    order.setNote(request.getParameter("note"));
                    order.setUser(user);

//                    DAOFactory objDAO = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
                    OrderDAO objDAO = new OrderDAO();
                    objDAO.addOrder(order);
                    out.print("<script>alert('Order successfully. We will contact you soon');</script>");
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }    }

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
