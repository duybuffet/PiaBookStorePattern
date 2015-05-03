<%@page import="entity.user.User"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.business.Cart"%>
<%
    Cart cart = null;
    HashMap<Integer, Integer> listBookId = null;
    if (session.getAttribute("cart") != null && !session.getAttribute("cart").equals("")) {
        cart = (Cart) session.getAttribute("cart");
        listBookId = cart.getListBook();
    }
    User u = (User) session.getAttribute("user");
%>
<table cellpadding="0" cellspacing="0" border="0" style="height:119px; width:721px;">
    <tr>
        <td><img alt="" src="images/logo.gif"><br></td>
        <td style="width:127px;">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr><td nowrap class="vam"><strong><a href="<%=request.getContextPath()%>/index.jsp?action=search">Searh Book</a></strong> &nbsp;<br><br style="line-height:9px"></td></tr>
            </table>
        </td>
        <td><img src="images/z.gif" alt="" border="0"></td>
        <td style="width:153px;">
            <table cellpadding="0" cellspacing="0" border="0">
                <%
                    if (u != null) {
                %>
                <tr><td nowrap class="vam"><strong>Xin chào :</strong> &nbsp;<br><br style="line-height:9px"><%=u.getNameSurname().getFirstName()%> <%=u.getNameSurname().getMidName()%> <%=u.getNameSurname().getLastName()%></td></tr>
                <%
                    }
                %>
            </table>
        </td>
        <td><img src="images/z.gif" alt="" border="0"></td>
        <td><img alt="" src="images/spacer.gif" width="14" height="1"></td>
        <td style="width:21px"><img src="images/z1.gif" alt="" border="0"></td>    
        <td>
            <table cellpadding="0" cellspacing="0" border="0" style="width:119px">
                <tr>
                    <td align="left"><b>Shopping cart:</b><br>
                        <span>in your cart</span> <a href="index.jsp?action=cart"><% if (listBookId != null) out.print(listBookId.size()); else out.print('0');%> items</a><br>                                                                  </td>
                </tr>
            </table>
        </td> 
    </tr>
</table> 