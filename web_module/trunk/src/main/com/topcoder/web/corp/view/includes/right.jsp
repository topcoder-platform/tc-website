<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         autoFlush="false" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>
                    <td width="190" align ="left">
                        <img src="/i/spacer.gif" alt="" width="170" height="1" border="0" class="corpRight"><br>

<!-- Candidate Testing begins-->
<% if (level1.equals("testing")) { %>
    <% if ((level2.equals("overview")) || (level2.equals("attributes")) || (level2.equals("management"))) { %>
                        <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=pricing" target="_parent" class="corpLeft"><img src="/i/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" class="corpRight"></a><br>
                        <a href="/testing/"><img src="/i/promo_launch_test_mgmt.gif" alt="Launch Testing Management Tool" width="170" height="129" border="0" class="corpRight"></a><br>
    <% } %>
                        <a href="mailto:tces@topcoder.com?subject=Question about the TopCoder Testing Program"><img src="/i/promo_contact_tces.gif" alt="Contact TCES" width="170" height="81" border="0" class="corpRight"></a><br>
<% } %>
<!-- Candidate Testing ends -->

<!-- Recruiting begins-->
<% if (level1.equals("recruiting")) { %>
    <% if ((level2.equals("overview")) || (level2.equals("reporting"))) { %>
                        <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=pricing" target="_parent" class="corpLeft"><img src="/i/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" class="corpRight"></a><br>
                        <a href="/tces/?task=MainTask"><img src="/i/promo_launch_recr_report.gif" alt="Recruiting Reporting Tool" width="170" height="129" border="0" class="corpRight"></a><br>
    <% } %>
                        <a href="mailto:tces@topcoder.com?subject=Question about the TopCoder Recruiting Program"><img src="/i/promo_contact_tces.gif" alt="Contact TCES" width="170" height="81" border="0" class="corpRight"></a><br>
<% } %>
<!-- Recruiting ends -->

<!-- Recruiting begins-->
<% if (level1.equals("sponsor")) { %>
    <% if ((level2.equals("overview")) || (level2.startsWith("srm"))) { %>
                        <a href="http://www.topcoder.com/?t=tournaments&c=2003_open"><img src="/i/promo_2003_open.gif" alt="2003 TopCoder Open" width="170" height="195" border="0" class="corpRight"></a><br>
    <% } %>
                        <a href="mailto:sponsorships@topcoder.com?"><img src="/i/promo_contact_sponsor.gif" alt="Contact Sponsorship sales" width="170" height="76" border="0" class="corpRight"></a><br>
<% } %>
<!-- Recruiting ends -->

                    </td>
