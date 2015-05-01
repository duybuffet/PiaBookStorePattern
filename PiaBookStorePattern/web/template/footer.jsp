<%@page import="entity.user.User"%>
<%
    User u = (User) session.getAttribute("user");
%>
<table cellpadding="0" cellspacing="0" border="0" style="height:93px; background:url(images/bot.gif) repeat-x top" class="footer">
    <tr>
        <td><img alt="" src="images/q3.gif"></td>		
        <td><br style="line-height:45px"><a href="#"><img src="images/p1.gif" alt="" border="0"></a><br></td>		
        <td style="width:100%" align="right">
            <br style="line-height:40px">
            <span><a href="#">Specials</a></span> &nbsp; &nbsp;<span>|</span> &nbsp; &nbsp;<span><a href="#">Advanced Search</a></span> &nbsp; &nbsp;<span>|</span> &nbsp; &nbsp;<span><a href="#">Contact Us</a></span> &nbsp; &nbsp;<span>|</span> &nbsp; &nbsp;<span><a  href="index.jsp?action=register">Create an account</a></span> &nbsp; &nbsp;<span>|</span> &nbsp; &nbsp;
            
            <% if (u == null){ %>
            <span><a href="index.jsp?action=login">Log In</a></span>
            <% } else { %>
            <span><a href="<%=request.getContextPath()%>/UserController?action=logout">Logout</a></span>
            <% } %>
            <br style="line-height:1px;">
            <br style="line-height:7px;">            
        </td>
        <td><img alt="" src="images/q4.gif"></td>		
    </tr>
</table>