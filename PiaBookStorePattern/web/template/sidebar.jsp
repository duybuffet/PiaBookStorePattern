
<%@page import="entity.book.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.book.CategoryDAO"%>
<table cellpadding="0" cellspacing="0" border="0" class="box_width_left">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" class="box_heading_table">
                <tr>
                    <td><img src="images/box_heading_tl.gif" alt="" border="0"></td>
                    <td style="width:100%" class="box_heading_tall_t"></td>
                    <td><img src="images/box_heading_tr.gif" alt="" border="0"></td>
                </tr>
                <tr>
                    <td class="box_heading_tall_l"><img src="images/box_heading_l.gif" alt="" border="0"></td>
                    <td style="width:100%" class="box_heading_td">category</td>
                    <td class="box_heading_tall_r"><img src="images/box_heading_r.gif" alt="" border="0"></td>
                </tr>
                <tr>
                    <td><img src="images/box_heading_bl.gif" alt="" border="0"></td>
                    <td style="width:100%" class="box_heading_tall_b"></td>
                    <td><img src="images/box_heading_br.gif" alt="" border="0"></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" border="0" class="box_body_table">
                <tr>
                    <td style="width:100%" class="box_body">
                        <br style="line-height:11px">
                        <ul>
                            <%
                                CategoryDAO dao = new CategoryDAO();
                                ArrayList<Category> arrCate = dao.getAllCategories();
                                for (Category cate : arrCate) {
                            %>
                            <li class="bg_list"><a href="#"><%=cate.getName()%></a></li>
                            <%
                                }
                            %>
                        </ul>
                        <br style="line-height:9px">
                    </td>
                </tr>
            </table>
            <img alt="" src="images/line1.gif"><br><br style="line-height:11px">
            <table cellpadding="0" cellspacing="0" border="0" class="box_heading_table_2">
                <tr>
                    <td><img src="images/box_heading_tl_2.gif" alt="" border="0"></td>
                    <td style="width:100%" class="box_heading_tall_t_2"></td>
                    <td><img src="images/box_heading_tr_2.gif" alt="" border="0"></td>
                </tr>
                <tr>
                    <td class="box_heading_tall_l_2"><img src="images/box_heading_l_2.gif" alt="" border="0"></td>
                    <td style="width:100%" class="box_heading_td_2">special</td>
                    <td class="box_heading_tall_r_2"><img src="images/box_heading_r_2.gif" alt="" border="0"></td>
                </tr>
                <tr>
                    <td><img src="images/box_heading_bl_2.gif" alt="" border="0"></td>
                    <td style="width:100%" class="box_heading_tall_b_2"></td>
                    <td><img src="images/box_heading_br_2.gif" alt="" border="0"></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" border="0" class="box_body_table_2">
                <tr>
                    <td class="box_body"  style="padding:0 15px 4px 15px">
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td style="height:57px " class="vam">
                                    <span> <a href="#">I Am America (And So Can<br>
                                            You!)</a></span> (by James Patterson)
                                </td>
                            </tr>
                        </table> 
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td><img src="images/pic_corn_tl.gif" alt="" border="0"></td>
                                            <td class="pic_corn_t"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                            <td><img src="images/pic_corn_tr.gif" alt="" border="0"></td>
                                        </tr>
                                        <tr>
                                            <td class="pic_corn_l"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                            <td class="image"><a href="#"><img src="images/p_1.jpg" alt="" border="0"></a></td>
                                            <td class="pic_corn_r"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td><img src="images/pic_corn_bl.gif" alt="" border="0"></td>
                                            <td class="pic_corn_b"><img src="images/spacer.gif" width="1" height="1" alt=""></td>
                                            <td><img src="images/pic_corn_br.gif" alt="" border="0"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width:100%" align="center">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="height:91px " class="vam">
                                                <span class="productSpecialPrice">$10.80</span><br><br style="line-height:9px"><s>$16.19</s>
                                </td>
                            </tr>
                        </table> 
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<img alt="" src="images/line2.gif"><br>
</td>
</tr>
</table>