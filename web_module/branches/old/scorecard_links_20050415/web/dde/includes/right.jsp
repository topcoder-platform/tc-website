
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>

<!-- Home Page begins -->
    <% if ((level1.equals("index"))) { %>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <img src="/images/headFeaturedClients.gif" width="170" height="29" alt="Featured Clients" border="0"><br>
                <img src="/images/rodale_promo.gif" width="170" height="160" alt="Rodale" border="0"><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <img src="/images/praxair_promo.gif" width="170" height="147" alt="Praxair" border="0"><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <p class="seeAll"><A href="/customers/index.jsp">See all customers</A></p>
<!-- Home Page ends -->

<!-- Component Page begins -->
    <% } else if ((level1.equals("components"))) { %>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <img src="/images/headFeaturedComponents.gif" width="170" height="29" alt="Featured Components" border="0"><br>
                <a href="/catalog/c_component.jsp?comp=2803908&ver=1"><img src="/images/feat_comp_math_expression.gif" width="170" height="104" alt="Math Expression Evaluator" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="/catalog/c_component.jsp?comp=6511227&ver=1"><img src="/images/feat_comp_priority_queue.gif" width="170" height="119" alt="Priority Queue" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="/catalog/c_component.jsp?comp=6401675&ver=1"><img src="/images/feat_comp_checksum.gif" width="170" height="134" alt="Checksum Utility" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="/catalog/c_component.jsp?comp=5709951&ver=1"><img src="/images/feat_comp_svg2dgraphics.gif" width="170" height="119" alt="SVG2DGraphics" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
<!-- Component Page ends -->

<!-- Component Page begins -->
    <% } else if ((level1.equals("free_components"))) { %>
                <img src="/images/clear.gif" width="1" height="100" alt="" border="0"><br>
                <a href="/catalog/c_showroom.jsp" target="_top"><img src="/images/promos/promo_catalog_third.gif" alt="Component Catalog" width="170" height="120" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="/forum/c_active_collab.jsp" target="_top"><img src="/images/promos/promo_cust_forums_third.gif" alt="Customer Forums" width="170" height="120" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="http://www.topcoder.com/rtables/viewForum.jsp?forum=205768&mc=3" target="_top"><img src="/images/promos/promo_roundtables_third.gif" alt="Member Round Tables" width="170" height="120" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
<!-- Component Page ends -->

<!-- Component Page begins -->
    <% } else if ((level1.equals("catalog"))) { %>
                <img src="/images/clear.gif" width="1" height="15" alt="" border="0"><br>
                <table border="0" cellpadding="0" cellspacing="0" class="sidebarFrame" width="170">
                    <tr><td class="sidebarTitle">Status Key</td></tr>

                    <tr valign="top">
                        <td class="sidebarText">
                            <p><img src="/images/statusKeyVertical.gif" alt="" width="150" height="93" border="0"></p>
                            <p><strong>New components are constantly being added to the catalogs. To read more about what these Status Symbols mean, see our 
                            <a href="/components/methodology.jsp">Component Methodology</a></strong></p>
                        </td>
                    </tr>
                </table>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="/components/free_components.jsp" target="_top"><img src="/images/promos/promo_free_comps_third.gif" alt="Free Components" width="170" height="120" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="/forum/c_active_collab.jsp" target="_top"><img src="/images/promos/promo_cust_forums_third.gif" alt="Customer Forums" width="170" height="120" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
                <a href="http://www.topcoder.com/rtables/viewForum.jsp?forum=205768&mc=3" target="_top"><img src="/images/promos/promo_roundtables_third.gif" alt="Member Round Tables" width="170" height="120" border="0"></a><br>
                <img src="/images/clear.gif" width="1" height="10" alt="" border="0"><br>
<!-- Component Page ends -->
    <% } else { %>
                <img src="/images/clear.gif" width="170" height="10" alt="" border="0"><br>
    <% } %>
            
            <p><br></p>
