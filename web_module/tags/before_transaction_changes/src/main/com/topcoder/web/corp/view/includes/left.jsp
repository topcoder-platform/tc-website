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
                <tr><td id="myServicesTitle">My Services</td></tr>

<!-- Candidate Testing begins-->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("testing")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index" target="_parent" class="corpLeft">Candidate Testing</a></td></tr>
<% if (level1.equals("testing")) { %>
                <tr><td id="<%=level2.equals("overview")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("codingEnvironment")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=coding_environment" target="_parent" class="corpLeft">Candidate Testing Environment</a></td></tr>
                <tr><td id="<%=level2.equals("problemSelection")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=problem_selection" target="_parent" class="corpLeft">Problem Selection</a></td></tr>
                <tr><td id="<%=level2.equals("sessionAdmin")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=session_admin" target="_parent" class="corpLeft">Session Administration</a></td></tr>
                <tr><td id="<%=level2.equals("reporting")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=reporting" target="_parent" class="corpLeft">Reporting</a></td></tr>
                <tr><td id="<%=level2.equals("security")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=security_fraud" target="_parent" class="corpLeft">Security and Fraud Detection</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=pricing" target="_parent" class="corpLeft">Pricing</a></td></tr>
<% } %>
<!-- Candidate Testing ends -->

<!-- Recruiting begins -->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("recruiting")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=index" class="corpLeft">Recruiting</a></td> </tr>
<% if (level1.equals("recruiting")) { %>
                <tr><td id="<%=level2.equals("overview")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("candidateID")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=candidate_id" target="_parent" class="corpLeft">Candidate Identification</a></td></tr>
                <tr><td id="<%=level2.equals("jobPostings")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=job_postings" target="_parent" class="corpLeft">Advertising and Job Postings</a></td></tr>
                <tr><td id="<%=level2.equals("emailCampaign")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=email_campaign" target="_parent" class="corpLeft">Targeted Email Campaign</a></td></tr>
                <tr><td id="<%=level2.equals("featuredEmployer")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=featured_employer" target="_parent" class="corpLeft">SRM Featured Employer</a></td></tr>
                <tr><td id="<%=level2.equals("reporting")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=reporting" target="_parent" class="corpLeft">Reporting</a></td></tr>
                <tr><td id="<%=level2.equals("pricing")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=pricing" target="_parent" class="corpLeft">Pricing</a></td></tr>
<% } %>
<!-- Recruiting ends -->

<!-- Sponsorship begins -->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("sponsorship")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" class="corpLeft">Sponsorship</a></td></tr>
<% if (level1.equals("sponsorship")) { %>
                <tr><td id="<%=level2.equals("overview")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("targeted")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=targeted" class="corpLeft">Targeted Sponsorship</a></td></tr>
                <tr><td id="<%=level2.equals("aboutTime")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=about_time" target="_parent" class="corpLeft">It's About Time</a></td></tr>
                <tr><td id="<%=level2.equals("dotCom")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=dot_com" target="_parent" class="corpLeft">The TopCoder Site</a></td></tr>
                <tr><td id="<%=level2.equals("surveys")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=surveys" target="_parent" class="corpLeft">Surveys</a></td></tr>
                <tr><td id="<%=level2.equals("demographics")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=demographics" target="_parent" class="corpLeft">Demographics</a></td></tr>
<% } %>
<!-- Sponsorship ends -->

<!-- Private Label Events begins
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("privateLabel")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=index" class="corpLeft">Private Label Events</a></td></tr>
<% if (level1.equals("privateLabel")) { %>
                <tr><td id="<%=level2.equals("overview")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("online")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=online" target="_parent" class="corpLeft">Online Services</a></td></tr>
                <tr><td id="<%=level2.equals("onsite")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=private_label&d3=onsite" target="_parent" class="corpLeft">Onsite Services</a></td></tr>
<% } %>
 Private Label Events ends -->

<!-- Account Admin begins -->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("myAccount")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=acc_admin&d3=index" class="corpLeft">Account Administration</a></td></tr>
<% if (level1.equals("myAccount")) { %>
                <tr><td id="<%=level2.equals("userList")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserList" target="_parent" class="corpLeft">User List</a></td></tr>
                <tr><td id="<%=level2.equals("createUser")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserEdit" target="_parent" class="corpLeft">Create User</a></td></tr>
<% } %>
<!-- Account Admin ends -->
            </table>
<!-- My Services ends -->

<!-- Company Information begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">Company Information</td></tr>

<!-- About Corporate Services begins -->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_<%=level1.equals("about")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=index" class="corpLeft">About Corporate Services</a></td></tr>
<% if (level1.equals("about")) { %>
                <tr><td id="<%=level2.equals("index")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("privacy")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=privacy" target="_parent" class="corpLeft">Privacy</a></td></tr>
                <tr><td id="<%=level2.equals("terms")?"myServicesSubnavOn":"myServicesSubnav"%>"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=terms" target="_parent" class="corpLeft">Terms</a></td></tr>
<% } %>
<!-- About Corporate Services ends -->

<!--                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=news_events&d3=index" class="corpLeft">Press Room</a></td></tr> -->

<!-- Contact Us begins -->
                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_<%=level1.equals("contact")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=contact&d3=index" class="corpLeft">Contact Us</a></td></tr>
<!-- Contact Us ends -->
            </table>
<!-- Company Information ends -->

            <img src="/i/left_nav_btm.gif" width="170" height="23" border="0" alt=""><br><br>
            <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br>

