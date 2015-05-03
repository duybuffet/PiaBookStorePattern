<%@page import="entity.book.Book"%>
<%@page import="dao.book.AuthorDAO"%>
<%@page import="dao.book.CategoryDAO"%>
<%@page import="entity.book.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.book.Author"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Book> result = (ArrayList<Book>)session.getAttribute("SearchResult");    
%>
<table cellpadding="0" cellspacing="0" border="0">
    <form method="post" action="BookController?action=search">
        <div class="form-group">
            <label><strong>Book Title: </strong></label>
            <input type="text" class="form-control" name="title" />
        </div>       
        <div class="form-group">
            <label ><strong>Category: </strong></label>
            <input type="text" class="form-control" name="category" />
        </div>
        <div class="form-group">
            <label><strong>Author: </strong></label>
            <input type="text" class="form-control" name="author" />
        </div>
        <button class="btn btn-primary" type="submit"> Search </button>
        <div class="clear"></div>
    </form>
    <br>
    <br>
    <%
        if (result != null) {
    %>
    <table id="result-search" style="border-collapse: collapse; " border="1">
        <tr>
            <th>Book Title</th>
            <th>Category</th>
            <th>Author</th>
        </tr>
        <%
            for (Book book : result) {
        %>
        <tr>
            <td><a href="<%=request.getContextPath()%>/index.jsp?action=product&id=<%=book.getBookId()%>"><%=book.getTitle().getName()%></a></td>
            <td><%=book.getCategory().getName()%></td>
            <td><%=book.getAuthor().getAuthorName()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <%            
        }
    %>
</table>
<%
    session.setAttribute("SearchResult", null);
%>