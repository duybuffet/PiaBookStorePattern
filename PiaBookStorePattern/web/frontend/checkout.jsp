<%@page import="dao.book.BookDAO"%>
<%@page import="entity.book.Book"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="entity.business.Cart"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    User user = null;
    Cart cart = null;
    HashMap<Integer, Integer> listBookId = null;
    if (session.getAttribute("user") != null) {
        user = (User) session.getAttribute("user");
        if (session.getAttribute("cart") == null || session.getAttribute("cart").equals("")) {
            response.sendRedirect("index.jsp");
        } else {
            cart = (Cart) session.getAttribute("cart");
            listBookId = cart.getListBook();
            if (listBookId.isEmpty()) {
                response.sendRedirect("index.jsp");
            }
        }
    }
%>
<form name="register" method="post" action="OrderController?action=add">          
    <div class="form_row">
        <label class="form-group"><strong>Receiver name: </strong></label>
        <input required type="text" class="form-control" pattern="[A-Za-z0-9]+" name="name" />
    </div>  
    <div class="form_row">
        <label class="form-group"><strong>Receiver address: </strong></label>
        <input required type="text" class="form-control" pattern="[A-Za-z0-9]+" name="address" />
    </div> 

    <div class="form_row">
        <label class="form-group"><strong>Receiver phone: </strong></label>
        <input required type="text" class="form-control" pattern="[0-9]+" name="phone" />
    </div> 

    <div class="form_row">
        <label class="form-group"><strong>Note: </strong></label>
        <textarea class="form-control" name="note"></textarea>
    </div>                                 

    <div class="col-md-11">                                       
        <table class="table" border="1" style="border-collapse: collapse;">
            <tr>
                <td>Book</td>
                <td>Author</td>
                <td>Price</td>
                <td>Qty</td>
                <td>Total</td>                                    
            </tr>
            <%
                Float total = 0F;
                if (cart != null) {
                    Iterator it = listBookId.entrySet().iterator();
                    while (it.hasNext()) {
                        Map.Entry pair = (Map.Entry) it.next();
                        Book book = new BookDAO().getBookById((Integer) pair.getKey());
                        int qtt = (Integer) pair.getValue();
                        total += book.getPrice() * qtt;
                        if (qtt > 0) {
            %>
            <tr>
                <td><%=book.getTitle().getName()%></td>
                <td><%=book.getAuthor().getAuthorName()%></td>
                <td><%=book.getPrice()%></td>
                <td><%=qtt%></td>
                <td><%=book.getPrice() * qtt%></td>
            </tr>                                        
            <%
                        }
                    }
                }
            %>
            <input type="hidden" name="total" value="<%=total%>">
            <tr>
                <td colspan="4">Total</td>
                <td><%=total%></td>
            </tr>

        </table>
    </div>
    <div class="form_row">
        <button class="btn btn-success" type="submit">Order</button>
    </div> 
</form> 