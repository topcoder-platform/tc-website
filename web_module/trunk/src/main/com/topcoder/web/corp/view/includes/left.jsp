<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants"
         autoFlush="false" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>

    <% if ((level1.equals("testing")) || (level1.equals("recruiting")) || (level1.equals("tces")) || (level1.equals("manageUsers"))) { %>

<!-- TCES begins -->
            <img src="/i/clear.gif" width="170" height="6" border="0" alt=""><br>
            <img src="/i/left_nav_top.gif" width="170" height="11" border="0" alt=""><br>

            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">Employment Services:</td></tr>

<!-- Recruiting begins -->
                <tr><td id="<%=level1.equals("recruiting")?(level2.equals("overview")?"myServicesNavSelect":"myServicesNavOn"):"myServicesNav"%>"><img src="/i/nav_arrow_<%=level1.equals("recruiting")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=index" class="<%=level1.equals("recruiting")?"corpLeftOn":"corpLeft"%>">Recruiting</a></td> </tr>
            <% if (level1.equals("recruiting")) { %>
                <tr><td id="<%=level2.equals("reporting")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=reporting" target="_parent" class="corpLeftOn">Reporting Tool</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=pricing" target="_parent" class="corpLeftOn">Pricing</a></td></tr>
            <% } %>
<!-- Recruiting ends -->

<!-- Testing begins-->
                <tr><td id="<%=level1.equals("testing")?(level2.equals("overview")?"myServicesNavSelect":"myServicesNavOn"):"myServicesNav"%>"><img src="/i/nav_arrow_<%=level1.equals("testing")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index" target="_parent" class="<%=level1.equals("testing")?"corpLeftOn":"corpLeft"%>">Testing</a></td></tr>
            <% if (level1.equals("testing")) { %>
                <tr><td id="<%=level2.equals("attributes")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=testing_attributes" target="_parent" class="corpLeftOn">Attributes</a></td></tr>
                <tr><td id="<%=level2.equals("management")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=management_tool" target="_parent" class="corpLeftOn">Management Tool</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=pricing" target="_parent" class="corpLeftOn">Pricing</a></td></tr>
            <% } %>
<!-- Testing ends -->

<!-- Manage Users begins -->
                <tr><td id="<%=level1.equals("manageUsers")?"myServicesNavSelect":"myServicesNav"%>"><img src="/i/nav_arrow_<%=level1.equals("manageUsers")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserList" class="<%=level1.equals("manageUsers")?"corpLeftOn":"corpLeft"%>">Manage Users</a></td></tr>
<!-- Manage Users ends -->
<!-- TCES ends -->

    <% } else if ((level1.equals("sponsorship"))) { %>

<!-- Sponsorship begins -->
            <img src="/i/clear.gif" width="170" height="6" border="0" alt=""><br>
            <img src="/i/left_nav_top.gif" width="170" height="11" border="0" alt=""><br>

            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">Sponsorship:</td></tr>

            <% if (level1.equals("sponsorship")) { %>
                <tr><td id="<%=level2.startsWith("overview")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" class="corpLeftOn">Overview</a></td></tr>
                <tr><td id="<%=level2.startsWith("srm")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_index" class="corpLeftOn">Single Round Matches</a></td></tr>
                <tr><td id="<%=level2.startsWith("tourny")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="corpLeftOn">Tournaments</a></td></tr>
            <% } %>
<!-- Sponsorship ends -->

    <% } else { %>

            <img src="/i/clear.gif" width="170" height="6" border="0" alt=""><br>
            <img src="/i/left_nav_top.gif" width="170" height="11" border="0" alt=""><br>

            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">Corporate Services:</td></tr>

<!-- Employment Services begins -->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=tces_home" target="_parent" class="corpLeft">Employment Services</a></td></tr>
<!-- Employment Services ends -->

<!-- Sponsorship begins -->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" target="_parent" class="corpLeft">Sponsorship</a></td></tr>
<!-- Sponsorship ends -->

    <% } %>
            
            </table>

<!-- TopCoder Info begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">TopCoder Info:</td></tr>
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?t=about_tc&c=index" class="corpLeft">About Us</a></td></tr>
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?t=news_events&c=index" class="corpLeft">Press Room</a></td></tr>
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?t=contacts&c=index" class="corpLeft">Contact Us</a></td></tr>
            </table>
<!-- TopCoder Info ends -->

            <img src="/i/left_nav_btm.gif" width="170" height="23" border="0" alt=""><br><br>
            <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br>

