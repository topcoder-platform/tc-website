
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");

%>

            <img src="/images/clear.gif" width="180" height="6" border="0" alt=""><br>
            <img src="/images/left_nav_top.gif" width="180" height="11" border="0" alt=""><br>

            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Software:</td></tr>
                <tr>
                    <td id="leftNavTitle">
                        <%@ include file="/includes/componentSearch.jsp" %>
                    </td>
                </tr>

<!-- Applications begins -->
                <tr><td id="<%=level1.equals("applications")?"leftNavOn":"leftNav"%>"><a href="/applications/index.jsp" class="<%=level1.equals("applications")?"leftOn":"left"%>"><img src="/images/nav_arrow_<%=level1.equals("applications")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0">Applications</a></td></tr>

            <% if (level1.equals("applications")) { %>
                <tr><td id="<%=level2.equals("overview")?"leftSubnavOn":"leftSubnav"%>"><a href="/applications/index.jsp" class="leftOn">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("methodology")?"leftSubnavOn":"leftSubnav"%>"><a href="/applications/methodology.jsp" class="leftOn">Methodology</a></td></tr>
            <% } %>
<!-- Applications ends -->

<!-- Components begins-->
                <tr><td id="<%=level1.equals("components")?"leftNavOn":"leftNav"%>"><a href="/catalog/c_showroom.jsp" class="<%=level1.equals("components")?"leftOn":"left"%>"><img src="/images/nav_arrow_<%=level1.equals("components")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0">Components</a></td></tr>

            <% if (level1.equals("components")) { %>
                <tr><td id="<%=level2.equals("browse")?"leftSubnavOn":"leftSubnav"%>"><a href="/catalog/c_showroom.jsp" class="leftOn">Browse Catalogs</a></td></tr>
                <tr><td id="<%=level2.equals("overview")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/index.jsp" class="leftOn">What Are Components?</a></td></tr>
                <tr><td id="<%=level2.equals("methodology")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/methodology.jsp" class="leftOn">Methodology</a></td></tr>
                <tr><td id="<%=level2.equals("subscriptions")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/subscriptions.jsp" class="leftOn">Purchasing</a></td></tr>
                <tr><td id="<%=level2.equals("free_components")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/free_components.jsp" class="leftOn">Free Components</a></td></tr>
                <tr><td id="<%=level2.equals("suggest")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/request.jsp" class="leftOn">Suggest a Component</a></td></tr>
            <% } %>
<!-- Components ends -->

<!-- Customers begins-->
                <tr><td id="<%=level1.equals("customers")?"leftNavSelect":"leftNav"%>"><a href="/customers/index.jsp" class="<%=level1.equals("customers")?"leftOn":"left"%>"><img src="/images/<%=level1.equals("customers")?"clear":"nav_arrow_right"%>.gif" width="10" height="10" alt="" border="0">Customers</a></td></tr>
<!-- Customers ends -->

<!-- Forum begins-->
                <tr><td id="<%=level1.equals("forum")?"leftNavOn":"leftNav"%>"><a href="/forum/c_active_collab.jsp" target="_parent" class="<%=level1.equals("forum")?"leftOn":"left"%>"><img src="/images/nav_arrow_<%=level1.equals("forum")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0">Forums</a></td></tr>
            
            <% if (level1.equals("forum")) { %>
                <tr><td id="<%=level2.equals("all")?"leftSubnavOn":"leftSubnav"%>"><a href="/forum/c_active_collab.jsp" target="_parent" class="leftOn">Component Forums</a></td></tr>
            <% } %>
<!-- Forum ends -->
            
            </table>

            <img src="/images/left_nav_btm.gif" width="180" height="23" border="0" alt=""><br>
            <img src="/images/clear.gif" width="180" height="15" border="0" alt=""><br>
            
            <div align="right"><A href="http://www.topcoder.com/?t=sponsor&c=link&link=/i/downloads/cbdi_journal.pdf&refer=homepage" target="blank"><img src="/images/cbdi_journal.gif" alt="CBDI Journal" width="170" height="150" border="0" /></A></div><br/>
            <img src="/images/clear.gif" width="180" height="10" border="0" alt=""><br>
            <div align="right"><A href="http://www.topcoder.com/demo/Gift_Card_Case_Study.pdf" target="blank"><img src="/images/stage_casestudy_promo.gif" alt="Client Case Study" width="170" height="106" border="0" /></A></div><br><br>
            
            <div align="center"><img src="/images/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br></center>
