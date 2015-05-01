<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String action = "";
    if (request.getParameter("action") != null) {
        action = (String) request.getParameter("action");
    } 
%>
<html>
    <head>
        <title>Book Store</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <table cellpadding="0" cellspacing="0" border="0" style="width:721px" align="center"> 
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" style="height:366px; background:url(images/top.gif) no-repeat right top" class="header">
                        <tr>
                            <td align="center">
                                <jsp:include page="template/header.jsp" />
                                <jsp:include page="template/nav.jsp" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" style="height:565px; background:#ffffff ">
                        <tr>
                            <td><img alt="" src="images/spacer.gif" width="9" height="1"></td>
                            <td class="col_left">
                                <jsp:include page="template/sidebar.jsp" />
                            </td>
                            <td><img alt="" src="images/spacer.gif" width="9" height="1"></td>
                            <td class="col_center">
                                <%
                                    if (!action.equals("")) {
                                        if (action.equalsIgnoreCase("cart")) {
                                %>
                                <jsp:include page="frontend/cart.jsp" />
                                <%
                                        } else if (action.equalsIgnoreCase("home")) {
                                %>
                                <jsp:include page="frontend/home.jsp" />
                                <%
                                        } else if (action.equalsIgnoreCase("login")) {
                                %>
                                <jsp:include page="frontend/login.jsp" />
                                <%
                                        } else if (action.equalsIgnoreCase("product")) {
                                %>
                                <jsp:include page="frontend/product.jsp" />
                                <%
                                        } else if (action.equalsIgnoreCase("register")) {
                                %>
                                <jsp:include page="frontend/register.jsp" />
                                <%
                                        } else if (action.equalsIgnoreCase("cart")) {
                                %>
                                <jsp:include page="frontend/cart.jsp" />
                                <%
                                        } else if (action.equalsIgnoreCase("checkout")) {
                                %>
                                <jsp:include page="frontend/checkout.jsp" />
                                <%
                                        }
                                    } else {
                                %>
                                <jsp:include page="frontend/home.jsp" />
                                <%
                                    }
                                %>
                                
                            </td>
                            <td><img alt="" src="images/spacer.gif" width="9" height="1"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="template/footer.jsp" />
                </td>
            </tr>
        </table>
    </body>
</html>









