<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants"
         autoFlush="false" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");

%>
<!-- My Services begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">My Services</td></tr>

<!-- Candidate Testing begins-->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("testing")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=index" target="_parent" class="corpLeft">Candidate Testing</a></td></tr>
<% if (level1.equals("testing")) { %>
                <tr><td id="<%=level2.equals("overview")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("problemSelection")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=problem_selection" target="_parent" class="corpLeft">Problem Selection</a></td></tr>
                <tr><td id="<%=level2.equals("codingEnvironent")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=coding_environment" target="_parent" class="corpLeft">Coding Environment</a></td></tr>
                <tr><td id="<%=level2.equals("sessionAdmin")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=session_admin" target="_parent" class="corpLeft">Session Administration</a></td></tr>
                <tr><td id="<%=level2.equals("reporting")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=reporting" target="_parent" class="corpLeft">Reporting</a></td></tr>
                <tr><td id="<%=level2.equals("security")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=security_fraud" target="_parent" class="corpLeft">Security and Fraud Detection</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=pricing" target="_parent" class="corpLeft">Pricing</a></td></tr>
<% } %>
<!-- Candidate Testing ends-->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("sponsorship")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" class="corpLeft">Sponsorship</a></td></tr>
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("recruiting")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="/tces/?task=MainTask" class="corpLeft">Employment Services</a></td> </tr>
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("myAccount")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=acc_admin&d3=index" class="corpLeft">My Account</a></td></tr>
<% if (level1.equals("myAccount")) { %>
                <tr><td id="<%=level2.equals("createUser")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserEdit" target="_parent" class="corpLeft">Create User</a></td></tr>
                <tr><td id="<%=level2.equals("userList")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserList" target="_parent" class="corpLeft">User List</a></td></tr>

<% } %>
            </table>
<!-- My Services ends -->

<!-- Company Information begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="companyInfoTitle">Company Information</td></tr>
                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=index" class="corpLeft">About TopCoder</a></td></tr>
                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=news_events&d3=index" class="corpLeft">Press Room</a></td></tr>
                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=contact&d3=index" class="corpLeft">Contact Us</a></td></tr>
            </table>
<!-- Company Information ends -->

            <img src="/i/left_nav_btm.gif" width="170" height="69" border="0" alt="" /><br /><br />
            <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" />

