<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.shared.util.ApplicationServer"%>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>

<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />

            <img src="/i/corp/clear.gif" width="180" height="6" border="0" alt=""><br>
            <img src="/i/corp/left_nav_top.gif" width="180" height="11" border="0" alt=""><br>

    <% if ((level1.equals("testing")) || (level1.equals("recruiting")) || (level1.equals("tces")) || (level1.equals("manageUsers"))) { %>

<!-- TCES begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Employment Services:</td></tr>

<!-- Recruiting begins -->
                <tr><td id="<%=level1.equals("recruiting")?(level2.equals("overview")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("recruiting")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=index" class="<%=level1.equals("recruiting")?"leftOn":"left"%>">Recruiting</a></td> </tr>
            <% if (level1.equals("recruiting")) { %>
                <tr><td id="<%=level2.equals("reporting")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=reporting" target="_parent" class="leftOn">Reporting Tool</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=pricing" target="_parent" class="leftOn">Pricing</a></td></tr>
                <tr><td id="leftNavApplet"><img alt="" width="10" height="10" src="/i/corp/clear.gif" border="0"/><A href="/corp/tces/?task=MainTask" class="left">Launch Recruiting Reports</A></td></tr>
            <% } %>
<!-- Recruiting ends -->

<!-- Testing begins-->
                <tr><td id="<%=level1.equals("testing")?(level2.equals("overview")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("testing")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index" target="_parent" class="<%=level1.equals("testing")?"leftOn":"left"%>">Testing</a></td></tr>
            <% if (level1.equals("testing")) { %>
                <tr><td id="<%=level2.equals("attributes")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=testing_attributes" target="_parent" class="leftOn">Attributes</a></td></tr>
                <tr><td id="<%=level2.equals("management")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=management_tool" target="_parent" class="leftOn">Management Tool</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=pricing" target="_parent" class="leftOn">Pricing</a></td></tr>
                <tr><td id="leftNavApplet"><img alt="" width="10" height="10" src="/i/corp/clear.gif" border="0"/><A href="<jsp:getProperty name='sessionInfo' property='ServletPath'/>testing/" class="left">Launch Testing App Tool</A></td></tr>
            <% } %>
<!-- Testing ends -->

<!-- Manage Users begins -->
                <tr><td id="<%=level1.equals("manageUsers")?"leftNavSelect":"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("manageUsers")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserList" class="<%=level1.equals("manageUsers")?"leftOn":"left"%>">Manage Users</a></td></tr>
<!-- Manage Users ends -->
<!-- TCES ends -->

    <% } else if ((level1.equals("sponsorship"))) { %>

<!-- Sponsorship begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Sponsorship:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index" target="_parent" class="left">Single Round Matches</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index" target="_parent" class="left">Powered by TopCoder<br><img src="/i/corp/clear.gif" width="10" height="3" alt="" border="0">Competitions</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=private_index" target="_parent" class="left">Private Label Competitions</a></td></tr>
<!-- Sponsorship ends -->

    <% } else if ((level1.equals("srm"))) { %>

<!-- SRM begins-->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Sponsorship:</td></tr>

                <tr><td id="<%=level1.equals("srm")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("srm")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_index" target="_parent" class="<%=level1.equals("srm")?"leftOn":"left"%>">Single Round Matches</a></td></tr>
            <% if (level1.equals("srm")) { %>
                <tr><td id="<%=level2.equals("web")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_web" class="leftOn">TopCoder Web Site</a></td></tr>
                <tr><td id="<%=level2.equals("applet")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_applet" class="leftOn">Arena Applet</a></td></tr>
                <tr><td id="<%=level2.equals("email")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_email" target="_parent" class="leftOn">Opt-In Email</a></td></tr>
            <% } %>

                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index" target="_parent" class="left">Powered by TopCoder<br><img src="/i/corp/clear.gif" width="10" height="3" alt="" border="0">Competitions</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=private_index" target="_parent" class="left">Private Label Competitions</a></td></tr>
<!-- SRM ends-->

    <% } else if ((level1.equals("tourny"))) { %>

<!-- Tournament begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Sponsorship:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index" target="_parent" class="left">Single Round Matches</a></td></tr>

                <tr><td id="<%=level1.equals("tourny")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("tourny")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="<%=level1.equals("tourny")?"leftOn":"left"%>">Tournaments</a></td></tr>
            <% if (level1.equals("tourny")) { %>
                <tr><td id="<%=level2.equals("web")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_web" class="leftOn">TopCoder Web Site</a></td></tr>
                <tr><td id="<%=level2.equals("applet")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_applet" class="leftOn">Arena Applet</a></td></tr>
                <tr><td id="<%=level2.equals("email")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_email" target="_parent" class="leftOn">Opt-In Email</a></td></tr>
                <tr><td id="<%=level2.equals("onsite")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_onsite" target="_parent" class="leftOn">Onsite Branding</a></td></tr>
                <tr><td id="<%=level2.equals("pr")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr" target="_parent" class="leftOn">Public Relations</a></td></tr>
                <tr><td id="<%=level2.equals("review")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tourny_review" target="_parent" class="leftOn">Post-Tournament Review</a></td></tr>
            <% } %>

                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index" target="_parent" class="left">Powered by TopCoder<br><img src="/i/corp/clear.gif" width="10" height="3" alt="" border="0">Competitions</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=private_index" target="_parent" class="left">Private Label Competitions</a></td></tr>
<!-- Tournament ends -->

    <% } else if ((level1.equals("pbtc"))) { %>

<!-- Powered by TopCoder begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Sponsorship:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index" target="_parent" class="left">Single Round Matches</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="<%=level1.equals("pbtc")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("pbtc")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index" target="_parent" class="<%=level1.equals("pbtc")?"leftOn":"left"%>">Powered by TopCoder<br><img src="/i/corp/clear.gif" width="10" height="3" alt="" border="0">Competitions</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=private_index" target="_parent" class="left">Private Label Competitions</a></td></tr>
<!-- Powered by TopCoder ends -->

    <% } else if ((level1.equals("private_label"))) { %>

<!-- Private Label begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Sponsorship:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index" target="_parent" class="left">Single Round Matches</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index" target="_parent" class="left">Powered by TopCoder<br><img src="/i/corp/clear.gif" width="10" height="3" alt="" border="0">Competitions</a></td></tr>
                <tr><td id="<%=level1.equals("private_label")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("private_label")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=index" target="_parent" class="<%=level1.equals("private_label")?"leftOn":"left"%>">Private Label Competitions</a></td></tr>
<!-- Private Label ends -->

    <% } else { %>

            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Corporate Services:</td></tr>

<!-- Employment Services begins -->
                <tr><td id="leftNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=tces_home" target="_parent" class="left">Employment Services</a></td></tr>
<!-- Employment Services ends -->

<!-- Sponsorship begins -->
                <tr><td id="leftNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" target="_parent" class="left">Sponsorship</a></td></tr>
<!-- Sponsorship ends -->

    <% } %>
            
            </table>

<!-- TopCoder Info begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">TopCoder Info:</td></tr>
                <tr><td id="leftNav"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=about_tc&c=index" class="left"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0">About TopCoder</a></td></tr>
                <tr><td id="leftNav"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?d1=review_board&d2=competition" class="left"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"/>Review Boards</a></td></tr>
                <tr><td id="leftNav"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=news_events&c=index" class="left"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0">Press Room</a></td></tr>
                <tr><td id="leftNav"><a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=contacts&c=index" class="left"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0">Contact Us</a></td></tr>
            </table>
<!-- TopCoder Info ends -->

            <img src="/i/corp/left_nav_btm.gif" width="180" height="23" border="0" alt=""><br><br>
            
            <div align="center"><img src="/i/corp/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br></center>
