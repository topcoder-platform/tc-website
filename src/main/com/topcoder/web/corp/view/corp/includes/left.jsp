<%@ page contentType="text/html; charset=ISO-8859-1" import="com.topcoder.web.corp.Constants, com.topcoder.shared.util.ApplicationServer"%>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>

<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />

        	<table cellpadding=0 cellspacing=0 border=0 class=leftNavSpacer>
				<tr><td><img src="/i/corp/left_nav_top.gif" border=0 /></td></tr>

    <% if ((level1.equals("testing")) || (level1.equals("tournament")) || (level1.equals("placement")) || (level1.equals("tces")) || (level1.equals("privatelabel"))) { %>
                <tr><td id="leftNavTitle">Employment Services:</td></tr>
                <tr><td id="<%=level1.equals("tournament")?"leftNavSelect":"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("tournament")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" class="<%=level1.equals("tournament")?"leftOn":"left"%>">Tournament Sponsorship</a></td></tr>
                <tr><td id="<%=level1.equals("privatelabel")?"leftNavSelect":"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("privatelabel")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=private_label&d3=index" class="<%=level1.equals("privatelabel")?"leftOn":"left"%>">Sourcing</a></td></tr>
                <% if (level1.equals("privatelabel")) { %>
                    <tr><td id="<%=level2.equals("tces_report")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>/corp/tces/" target="_parent" class="leftOn">Reports</a></td></tr>
                <% } %>
                <tr><td id="<%=level1.equals("testing")?(level2.equals("overview")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("testing")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index" target="_parent" class="<%=level1.equals("testing")?"leftOn":"left"%>">Screening</a></td></tr>
	            <% if (level1.equals("testing")) { %>
	                <tr><td id="<%=level2.equals("attributes")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=testing_attributes" target="_parent" class="leftOn">Process</a></td></tr>
	                <tr><td id="<%=level2.equals("management")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=management_tool" target="_parent" class="leftOn">Attributes</a></td></tr>
		            <tr><td id="<%=level2.equals("demo")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=demo" target="_parent" class="leftOn">Demo</a></td></tr>
	                <tr><td id="leftNavApplet"><img width=10 height=10 src="/i/corp/clear.gif" border=0/><A href="<jsp:getProperty name='sessionInfo' property='ServletPath'/>testing/" class="left">Launch Technical Assessment</A></td></tr>
	            <% } %>
                <tr><td id="<%=level1.equals("placement")?"leftNavSelect":"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("placement")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=placement&d3=index" class="<%=level1.equals("placement")?"leftOn":"left"%>">Placement</a></td></tr>
    <% } else if ((level1.equals("sponsorship"))) { %>
                <tr><td id="leftNavTitle">Marketing Services:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_conference" target="_parent" class="left">Conference Events</a></td></tr>
    <% } else if ((level1.equals("srm"))) { %>
                <tr><td id="leftNavTitle">Sponsorship:</td></tr>
                <tr><td id="<%=level1.equals("srm")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("srm")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_index" target="_parent" class="<%=level1.equals("srm")?"leftOn":"left"%>">Single Round Matches</a></td></tr>
	            <% if (level1.equals("srm")) { %>
	                <tr><td id="<%=level2.equals("web")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_web" class="leftOn">TopCoder Web Site</a></td></tr>
	                <tr><td id="<%=level2.equals("applet")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_applet" class="leftOn">Arena Applet</a></td></tr>
	                <tr><td id="<%=level2.equals("email")?"leftSubnavOn":"leftSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm_email" target="_parent" class="leftOn">Opt-In Email</a></td></tr>
	            <% } %>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index" target="_parent" class="left">Powered by TopCoder<br><img src="/i/corp/clear.gif" width=10 height="3" border=0>Competitions</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="?module=Static&d1=corp&d2=spon_prog&d3=private_index" target="_parent" class="left">Private Label Competitions</a></td></tr>
    <% } else if ((level1.equals("tourny"))) { %>
                <tr><td id="leftNavTitle">Marketing Services:</td></tr>
                <tr><td id="<%=level1.equals("tourny")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("tourny")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny" target="_parent" class="<%=level1.equals("tourny")?"leftOn":"left"%>">Tournaments</a></td></tr>
	            <% if (level1.equals("tourny")) { %>
                    <tr><td id="leftSubnav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>/corp/tces/" target="_parent" class="leftOn">Reports</a></td></tr>
	            <% } %>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_conference" target="_parent" class="left">Conference Events</a></td></tr>
    <% } else if ((level1.equals("pbtc"))) { %>
                <tr><td id="leftNavTitle">Sponsorship:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index" target="_parent" class="left">Single Round Matches</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="<%=level1.equals("pbtc")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("pbtc")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index" target="_parent" class="<%=level1.equals("pbtc")?"leftOn":"left"%>">Powered by TopCoder<br><img src="/i/corp/clear.gif" width=10 height="3" border=0>Competitions</a></td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="?module=Static&d1=corp&d2=spon_prog&d3=private_index" target="_parent" class="left">Private Label Competitions</a></td></tr>
    <% } else if ((level1.equals("conference"))) { %>
                <tr><td id="leftNavTitle">Marketing Services:</td></tr>
                <tr><td id="leftNav"><img src="/i/corp/nav_arrow_right.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny" target="_parent" class="left">Tournaments</a></td></tr>
                <tr><td id="<%=level1.equals("conference")?(level2.equals("index")?"leftNavSelect":"leftNavOn"):"leftNav"%>"><img src="/i/corp/nav_arrow_<%=level1.equals("conference")?"bottom":"right"%>.gif" width=10 height=10 border=0><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_conference" target="_parent" class="<%=level1.equals("conference")?"leftOn":"left"%>">Conference Events</a></td></tr>
    <% } else if ((level1.equals("index"))) { %>
                <tr><td id="leftNavTitle">Corporate Services:</td></tr>
                <tr><td id="leftNav"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class="left">Software</a></td></tr>
                <tr><td id="leftNav"><a href="/corp/?module=Static&d1=corp&d2=tces_home" class="left">Employment Services</a></td></tr>
                <tr><td id="leftNav"><a href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class="left">Marketing Services</a></td></tr>
<%--
                <tr><td id="leftNav"><a href="" class="left">Client List</a></td></tr>
--%>
                <tr><td id="leftNav"><a href="/?t=news_events&c=index" class="left">Press Room</a></td></tr>
                <tr><td id="leftNav"><a href="/tc" class="left">Developer Center</a></td></tr>
    <% } else { %>
                <tr><td id="leftNavTitle">Corporate Services:</td></tr>
                <tr><td id="leftNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=tces_home" class="left">Employment Services</a></td></tr>
                <tr><td id="leftNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" class="left">Sponsorship</a></td></tr>
    <% } %>

				<tr><td><img src="/i/corp/left_nav_btm.gif" border=0 /></td></tr>
            </table>