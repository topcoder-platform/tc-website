<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants"
         autoFlush="false" %>

<!-- My Services begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">My Services</td></tr>

<!-- Candidate Testing begins-->
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_bottom.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=index" target="_parent" class="corpLeft">Candidate Testing</a></td></tr>
                <tr><td id="myServicesSubnavOn"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=index" target="_parent" class="corpLeft">Overview</a></td></tr>
                <tr><td id="myServicesSubnav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=problem_selection" target="_parent" class="corpLeft">Problem Selection</a></td></tr>
                <tr><td id="myServicesSubnav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=coding_environment" target="_parent" class="corpLeft">Coding Environment</a></td></tr>
                <tr><td id="myServicesSubnav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=session_admin" target="_parent" class="corpLeft">Session Administration</a></td></tr>
                <tr><td id="myServicesSubnav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=reporting" target="_parent" class="corpLeft">Reporting</a></td></tr>
                <tr><td id="myServicesSubnav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=security_fraud" target="_parent" class="corpLeft">Security and Fraud Detection</a></td></tr>
                <tr><td id="myServicesSubnav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=pricing" target="_parent" class="corpLeft">Pricing</a></td></tr>
<!-- Candidate Testing ends-->

                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index" class="corpLeft">Sponsorship</a></td></tr>
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="/tces/tces?task=MainTask" class="corpLeft">Employment Services</a></td> </tr>
                <tr><td id="myServicesNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=acc_admin&d2=index" class="corpLeft">My Account</a></td></tr>
            </table>
<!-- My Services ends -->

<!-- Company Information begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="companyInfoTitle">Company Information</td></tr>
                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=about&d2=index" class="corpLeft">About TopCoder</a></td></tr>
                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=news_events&d2=index" class="corpLeft">Press Room</a></td></tr>
                <tr><td id="companyInfoNav"><img src="/i/nav_arrow_right.gif" width="10" height="10" alt="" border="0"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=contact&d2=index" class="corpLeft">Contact Us</a></td></tr>
            </table>
<!-- Company Information ends -->

            <img src="/i/left_nav_btm.gif" width="170" height="69" border="0" alt="" /><br /><br />
            <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" />

