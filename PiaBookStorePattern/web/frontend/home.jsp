<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.book.Book"%>
<%@page import="dao.book.BookDAO"%>
<%
    BookDAO dao = new BookDAO();
    ArrayList<Book> arrBook = dao.getAllBook();
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
                    <td style="width:100%" class="cont_heading_td cont_heading_td">featured products</td>
                    <td class="cont_heading_r"><img alt="" src="images/cont_heading_r.gif"></td>
                </tr>
                <tr>
                    <td><img src="images/cont_heading_bl.gif" alt="" border="0"></td>
                    <td style="width:100%" class="cont_heading_b"></td>
                    <td><img src="images/cont_heading_br.gif" alt="" border="0"></td>
                </tr>
            </table>
            <br style="line-height:9px">
            <%
                for (Book book : arrBook) {
            %>
            <div class="item">
                <a class="item-title" href="index.jsp?action=product&id=<%=book.getBookId()%>"><%=book.getTitle().getName()%></a>
                <a href="index.jsp?action=product&id=<%=book.getBookId()%>"><img src="images/<%=book.getImageUrl()%>" /></a>
                <div class="item-info">
                    <span>Author : <%=book.getAuthor().getAuthorName()%></span>
                    <span>Category : <%=book.getCategory().getName()%></span>
                    <span>Price : <%=book.getPrice()%> Đ</span>
                    <a href="<%=request.getContextPath()%>/CartController?action=add&id=<%=book.getBookId()%>">
                        <button class="btn" style="background-color: orange;">Add to cart</button>
                    </a>
                </div>
            </div>
            <%
                }
            %>
        </td>
    </tr>
</table>