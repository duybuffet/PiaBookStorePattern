<%@page import="dao.book.BookDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="entity.business.Cart"%>
<%@page import="entity.book.Book"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cart cart = null;
    HashMap<Integer, Integer> listBookId = null;
    if (session.getAttribute("cart") != null && !session.getAttribute("cart").equals("")) {
        cart = (Cart) session.getAttribute("cart");
        listBookId = cart.getListBook();
        if (listBookId.isEmpty()) {
            response.sendRedirect("index.jsp");
        }
    } else {
    }
%>
<form method="post" action="CartController?action=update">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" class="cont_heading_table">
                    <tr>
                        <td><img src="images/cont_heading_tl.gif" alt="" border="0"></td>
                        <td style="width:100%" class="cont_heading_t"></td>
                        <td><img src="images/cont_heading_tr.gif" alt="" border="0"></td>
                    </tr>
                    <tr>
                        <td class="cont_heading_l"><img alt="" src="images/cont_heading_l.gif"></td>
                        <td style="width:100%" class="cont_heading_td cont_heading_td">product info</td>
                        <td class="cont_heading_r"><img alt="" src="images/cont_heading_r.gif"></td>
                    </tr>
                    <tr>
                        <td><img src="images/cont_heading_bl.gif" alt="" border="0"></td>
                        <td style="width:100%" class="cont_heading_b"></td>
                        <td><img src="images/cont_heading_br.gif" alt="" border="0"></td>
                    </tr>
                </table>
                <br style="line-height:9px">
                <table cellpadding="0" cellspacing="0" border="0" style="border:1px solid #FFFFFF; border-width:0 14px 0 27px" class="product">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0" class="product"> 
                                <tr>
                                    <td class="cart_line_y"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
                                    <td class="name shop_cart vam" align="center">
                                        <span>Book</span>
                                    </td>
                                    <td class="cart_line_y"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
                                    <td class="qty shop_cart vam" align="center">
                                        <span>Qty.</span>
                                    </td>
                                    <td class="cart_line_y"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
                                    <td class="total shop_cart vam" align="center">
                                        <span>Total</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7" class="cart_line_x"><img src="images/spacer.gif" alt="" width="1" height="1"></td>
                                </tr> 

                                <%
                                    Iterator it = listBookId.entrySet().iterator();
                                    Float total = 0F;
                                    while (it.hasNext()) {
                                        Map.Entry pair = (Map.Entry) it.next();
                                        Book book = new BookDAO().getBookById((Integer) pair.getKey());
                                        int qtt = (Integer) pair.getValue();
                                        total += book.getPrice() * qtt;
                                        if (qtt > 0) {
                                %>
                                <tr>
                                    <td class="cart_line_y"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
                                    <td>

                                        <table cellpadding="0" cellspacing="0" border="0" style="height:107px ">
                                            <tr>
                                                <td class="vam">
                                                    <table cellpadding="0" cellspacing="0" border="0" class="">
                                                        <tr>
                                                            <td align="center" style="border:1px solid #ffffff; border-width:10px 10px 10px 10px; width:100%">

                                                                <span><a href="#"><%=book.getTitle().getName()%></a></span>  (by <%=book.getAuthor().getAuthorName()%>)<br><br style="line-height:9px">
                                                                <table cellpadding="0" cellspacing="0" border="0" style="width:102px">
                                                                    <tr>
                                                                        <td><img src="images/pic_corn_tl.gif" alt="" border="0"></td>
                                                                        <td class="pic_corn_t"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                                        <td><img src="images/pic_corn_tr.gif" alt="" border="0"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pic_corn_l"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                                        <td class="image"><a href="#"><img style="width: 75px; height: 115px;" src="images/<%=book.getImageUrl()%>" alt="" border="0"></a></td>
                                                                        <td class="pic_corn_r"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><img src="images/pic_corn_bl.gif" alt="" border="0"></td>
                                                                        <td class="pic_corn_b"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                                        <td><img src="images/pic_corn_br.gif" alt="" border="0"></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="cart_line_y"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
                                    <td align="center" class="vam">
                                        <input name="qtt<%=book.getBookId()%>" type="number" value="<%=qtt%>" style="width: 40px; margin-top: -5px; margin-bottom: -5px;">
                                    </td>
                                    <td class="cart_line_y"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
                                    <td align="center" class="vam">
                                        <span class="productSpecialPrice"><%=book.getPrice() * qtt%> Đ</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7"><img src="images/spacer.gif" alt="" width="1" height="1"></td>
                                </tr> 
                                <%
                                        }
                                    }
                                %>
                            </table>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td class="cart_line_x"><img src="images/spacer.gif" alt="" width="1" height="1"></td>
                                </tr>
                            </table>
                            <table style="height:33px" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td><img alt="" src="images/spacer.gif" width="310" height="1"></td>
                                    <td class="vam" style="width:150px"><strong>sub-total:</strong><span class="productSpecialPrice"> <%=total%> Đ</span></td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="height:45px;">
                                        <br style="line-height:19px"><button class="btn" type="submit" style="padding: 0px;margin-top: -11px;color: #ffffff;width: 49px; height: 17px; background-color: blue; font-weight: bold; font-size: 10px;">Update</button></a>
                                        <a href="index.jsp"><img src="images/button_continue_shopping1.gif" border="0" alt=""></a>
                                        <a href="<%=request.getContextPath()%>/index.jsp?action=checkout"><img src="images/button_checkout.gif" border="0" alt=""></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table> 
            </td>
        </tr>

    </table>
</form>