<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants"
         autoFlush="false" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");

%>
<!-- My Services begins -->
            <img src="/i/clear.gif" width="170" height="6" border="0" alt=""><br>
            <img src="/i/left_nav_top.gif" width="170" height="11" border="0" alt=""><br>

            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">Corporate Services</td></tr>


<!-- Candidate Testing begins-->
                <tr><td id="<%=level1.equals("testing")?(level2.equals("overview")?"myServicesNavSelect":"myServicesNavOn"):"myServicesNav"%>"><img src="/i/nav_arrow_<%=level1.equals("testing")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index" target="_parent" class="corpLeft">Testing</a></td></tr>
<% if (level1.equals("testing")) { %>
                <tr><td id="<%=level2.equals("attributes")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=testing_attributes" target="_parent" class="corpLeft">Attributes</a></td></tr>
                <tr><td id="<%=level2.equals("management")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=management_tool" target="_parent" class="corpLeft">Management Tool</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=pricing" target="_parent" class="corpLeft">Pricing</a></td></tr>
<% } %>
<!-- Candidate Testing ends -->

<!-- Recruiting begins -->
                <tr><td id="<%=level1.equals("recruiting")?(level2.equals("overview")?"myServicesNavSelect":"myServicesNavOn"):"myServicesNav"%>"><img src="/i/nav_arrow_<%=level1.equals("recruiting")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=index" class="corpLeft">Recruiting</a></td> </tr>
<% if (level1.equals("recruiting")) { %>
                <tr><td id="<%=level2.equals("reporting")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=reporting" target="_parent" class="corpLeft">Reporting Tool</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=pricing" target="_parent" class="corpLeft">Pricing</a></td></tr>
<% } %>
<!-- Recruiting ends -->

<!-- Sponsorship begins -->
                <tr><td id="<%=level1.equals("sponsorship")?(level2.equals("overview")?"myServicesNavSelect":"myServicesNavOn"):"myServicesNav"%>"><img src="/i/nav_arrow_<%=level1.equals("sponsorship")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" class="corpLeft">Sponsorship</a></td></tr>
<%--
<% if (level1.equals("sponsorship")) { %>
                <tr><td id="<%=level2.equals("srm")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=srm" class="corpLeft">Single Round Matches</a></td></tr>
                <tr><td id="<%=level2.equals("tournament")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=tournament" target="_parent" class="corpLeft">Tournaments</a></td></tr>
                <tr><td id="<%=level2.equals("highSchool")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=high_school" target="_parent" class="corpLeft">TopCoder High School</a></td></tr>
<% } %>
--%>
<!-- Sponsorship ends -->

<!-- Private Label Events begins
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("privateLabel")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=index" class="corpLeft">Private Label Events</a></td></tr>
<% if (level1.equals("privateLabel")) { %>
                <tr><td id="<%=level2.equals("overview")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("online")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=online" target="_parent" class="corpLeft">Online Services</a></td></tr>
                <tr><td id="<%=level2.equals("onsite")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=onsite" target="_parent" class="corpLeft">Onsite Services</a></td></tr>
<% } %>
 Private Label Events ends -->

<!-- Manage Users begins -->
                <tr><td id="<%=level1.equals("manageUsers")?"myServicesNavSelect":"myServicesNav"%>"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserList" class="corpLeft">Manage Users</a></td></tr>
<!-- Manage Users ends -->
            </table>
<!-- My Services ends -->

<!-- Company Information begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">Company Information</td></tr>

<!-- About Corporate Services begins -->
                <tr><td id="<%=level1.equals("about")?(level2.equals("index")?"myServicesNavSelect":"myServicesNavOn"):"myServicesNav"%>"><img src="/i/nav_arrow_<%=level1.equals("about")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=index" class="corpLeft">About TopCoder</a></td></tr>
<% if (level1.equals("about")) { %>
                <tr><td id="<%=level2.equals("privacy")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=privacy" target="_parent" class="corpLeft">Privacy</a></td></tr>
                <tr><td id="<%=level2.equals("terms")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=terms" target="_parent" class="corpLeft">Terms</a></td></tr>
<% } %>
<!-- About Corporate Services ends -->

<!--                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=news_events&d3=index" class="corpLeft">Press Room</a></td></tr> -->

<!-- Contact Us begins -->
                <tr><td id="<%=level1.equals("contact")?"myServicesNavSelect":"myServicesNav"%>"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=contact&d3=index" class="corpLeft">Contact Us</a></td></tr>
<!-- Contact Us ends -->
            </table>
<!-- Company Information ends -->

            <img src="/i/left_nav_btm.gif" width="170" height="23" border="0" alt=""><br><br>
            <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br>

