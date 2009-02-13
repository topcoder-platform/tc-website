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

    <% if ((level1.equals("testing")) || (level1.equals("tournament")) || (level1.equals("tces")) || (level1.equals("privatelabel"))) { %>

<!-- TCES begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Employment Services:</td></tr>


<!-- Tournamnet Users begins -->
                <tr><td id="<%=level1.equals("tournament")?"leftNavSelect":"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("tournament")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" class="<%=level1.equals("tournament")?"leftOn":"left"%>">Tournament Sponsorship</a></td></tr>
<!-- Tournamnet Users ends -->

<!-- Private Label Users begins -->
                <tr><td id="<%=level1.equals("privatelabel")?"leftNavSelect":"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("privatelabel")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=private_label&d3=index" class="<%=level1.equals("privatelabel")?"leftOn":"left"%>">Private Label Events</a></td></tr>
<!-- Private Label Users ends -->

<!-- Testing begins-->
                <tr><td id="<%=level1.equals("testing")?(level2.equals("overview")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("testing")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index" target="_parent" class="<%=level1.equals("testing")?"leftOn":"left"%>">Technical Assessment Tool</a></td></tr>
            <% if (level1.equals("testing")) { %>
                <tr><td id="<%=level2.equals("attributes")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=testing_attributes" target="_parent" class="leftOn">Process</a></td></tr>
                <tr><td id="<%=level2.equals("management")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=management_tool" target="_parent" class="leftOn">Attributes</a></td></tr>
	            <tr><td id="<%=level2.equals("demo")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=demo" target="_parent" class="leftOn">Demo</a></td></tr> 
                <tr><td id="leftNavApplet"><img alt="" width="10" height="10" src="/i/corp/clear.gif" border="0"/><A href="<jsp:getProperty name='sessionInfo' property='ServletPath'/>testing/" class="left">Launch Testing App Tool</A></td></tr>
            <% } %>
<!-- Testing ends -->

<!-- TCES ends -->

    <% } else if ((level1.equals("sponsorship"))) { %>

<!-- Sponsorship begins -->
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Marketing Services:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_conference" target="_parent" class="left">Conference Events</a></td></tr>
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
                <tr><td id="leftNavTitle">Marketing Services:</td></tr>
                <tr><td id="<%=level1.equals("tourny")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("tourny")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny" target="_parent" class="<%=level1.equals("tourny")?"leftOn":"left"%>">Tournaments</a></td></tr>
            <% if (level1.equals("tourny")) { %>
            <% } %>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_conference" target="_parent" class="left">Conference Events</a></td></tr>
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

    <% } else if ((level1.equals("conference"))) { %>

<!-- Private Label begins -->
                <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Marketing Services:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="<%=level1.equals("conference")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("conference")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_conference" target="_parent" class="<%=level1.equals("conference")?"leftOn":"left"%>">Conference Events</a></td></tr>
            
                
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

            <img src="/i/corp/left_nav_btm.gif" width="180" height="23" border="0" alt=""><br><br>
            
            <div align="center"><img src="/i/corp/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br></center>
