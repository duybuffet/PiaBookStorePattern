<%@page import="entity.decorator.book.BookDescriptionImprove"%>
<%@page import="entity.book.Book"%>
<%@page import="dao.book.BookDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }
    Book book = new BookDAO().getBookById(id);
    book = new BookDescriptionImprove(book);
%>
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
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td style="height:73px " class="vam"><span><a href="#"><%=book.getTitle().getName()%></a></span>  (by <%=book.getAuthor().getAuthorName()%>)</td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" style="width:90px">
                                                    <tr>
                                                        <td><img src="images/pic_corn_tl.gif" alt="" border="0"></td>
                                                        <td class="pic_corn_t"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                        <td><img src="images/pic_corn_tr.gif" alt="" border="0"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="pic_corn_l"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                        <td class="image"><a href="#"><img src="images/<%=book.getImageUrl()%>" border="0" style="max-width: 150px; max-height: 230px;"/></a></td>
                                                        <td class="pic_corn_r"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="images/pic_corn_bl.gif" alt="" border="0"></td>
                                                        <td class="pic_corn_b"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                                        <td><img src="images/pic_corn_br.gif" alt="" border="0"></td>
                                                    </tr>
                                                </table>
                                                <br><br style="line-height:9px">
                                                <div><a href="#">click to enlarge</a></div>
                                            </td>
                                            <td><img alt="" src="images/spacer.gif" width="14" height="1"></td>
                                            <td style="width:100%">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td style="height:34px " class="vam"><%=book.getDescription()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height:46px " class="vam"><span class="productSpecialPrice"><%=book.getPrice()%> Đ</span></td>
                                                    </tr>
                                                </table>    
                                            </td>
                                        </tr>
                                    </table> 
                                </td>
                            </tr>
                            <tr>
                                <td style="height:17px "></td>
                            </tr>
                        </table> 
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td class="line_x"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
                            </tr>
                        </table> 
                        <br style="line-height:9px">
                        <table cellpadding="0" cellspacing="0" class="product" >
                            <tr>
                                <td  style="height:31px" colspan="2" class="vam">
                                    <strong>Available options:</strong><br>
                                </td>
                            </tr>
                            <tr>
                                <td  style="width:59px; height:21px"><br style="line-height:4px">Memory:</td>
                                <td  style="width:307px; height:21px">
                                    <select name="menu2"  class="jamp1"onChange="MM_jumpMenu('parent', this, 0)">
                                        <option></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td  style="width:59px; height:33px"><br style="line-height:4px">Model:</td>
                                <td  style="width:307px; height:33px">
                                    <select name="menu2"  class="jamp2"onChange="MM_jumpMenu('parent', this, 0)">
                                        <option>Value</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <table style="height:32px" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td class="vam">This product was added to catalog on Friday 30 September, 2008</td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" border="0" style="height:100px ">
                            <tr>
                                <td>
                                    <br style="line-height:9px"><a href="#"><img src="images/button_reviews.gif" alt="" border="0"></a><img alt="" src="images/spacer.gif" width="5" height="1">
                                    <a href="<%=request.getContextPath()%>/CartController?action=add&id=<%=book.getBookId()%>"><img src="images/button_add_to_cart1.gif" alt="" border="0"></a>
                                </td>
                            </tr>
                        </table>  
                    </td>
                </tr>
            </table> 
        </td>
    </tr>
</table>