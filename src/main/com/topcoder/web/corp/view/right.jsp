<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet,
                 com.topcoder.shared.util.ApplicationServer" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>
                    <td width="190" align ="left">
                        <img src="/i/corp/spacer.gif" alt="" width="170" height="10" border="0" class="corpRight"><br>

<!-- Corporate Home begins-->
<% if (level1.equals("tces_home")) { %>
                        <div class="corpRight"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_becomesponsor"><img src="/i/promos/sponsor_tccc04.gif" alt="Become a Sponsor for the TCCC04" width="170" height="150" border="0" /></A><br/><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br /></div>
                        <div class="corpRight"><a href="mailto:tces@topcoder.com"><img src="/i/corp/promo_contact_tces.gif" alt="Contact TCES" width="170" height="76" border="0"></a></div>
                        <div class="corpRight"><a href="/i/corp/downloads/tc_demo_tces.pdf"><img src="/i/corp/promos/tc_demo_tces.gif" alt="Download TCES Demographics" width="170" height="218" border="0"></a></div>
<% } %>
<!-- Corporate Home ends -->

<!-- Candidate Testing begins-->
<% if (level1.equals("testing")) { %>
    <% if ((level2.equals("overview")) || (level2.equals("attributes")) || (level2.equals("management"))) { %>
                        <div class="corpRight"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=pricing" target="_parent"><img src="/i/corp/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" class="corpRight"></a></div>
    <% } %>
                        <div class="corpRight"><a href="mailto:tces@topcoder.com"><img src="/i/corp/promo_contact_tces.gif" alt="Contact TCES" width="170" height="76" border="0"></a></div>
                        <div class="corpRight"><a href="/i/corp/downloads/tc_demo_tces.pdf"><img src="/i/corp/promos/tc_demo_tces.gif" alt="Download TCES Demographics" width="170" height="218" border="0"></a></div>
<% } %>
<!-- Candidate Testing ends -->

<!-- Recruiting begins-->
<% if (level1.equals("recruiting")) { %>
    <% if ((level2.equals("overview")) || (level2.equals("reporting"))) { %>
                        <div class="corpRight"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=pricing" target="_parent"><img src="/i/corp/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" class="corpRight"></a></div>
    <% } %>
                        <div class="corpRight"><a href="mailto:tces@topcoder.com"><img src="/i/corp/promo_contact_tces.gif" alt="Contact TCES" width="170" height="76" border="0"></a></div>
                        <div class="corpRight"><a href="/i/corp/downloads/tc_demo_tces.pdf"><img src="/i/corp/promos/tc_demo_tces.gif" alt="Download TCES Demographics" width="170" height="218" border="0"></a></div>
<% } %>
<!-- Recruiting ends -->

<!-- Sponsorship begins-->
<% if ((level1.equals("sponsor")) || (level1.equals("srm")) || (level1.equals("tourny")) || (level1.equals("pbtc")) || (level1.equals("private_labelxs"))) { %>
<!-- Sponsorship begins      
                        <div class="corpRight"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_overview"><img src="/i/corp/promo_2003_open.gif" alt="2003 TopCoder Open" width="170" height="195" border="0"></a></div>-->  
                        <div class="corpRight"><a href="mailto:sponsorships@topcoder.com?"><img src="/i/corp/promo_contact_sponsor.gif" alt="Contact Sponsorship sales" width="170" height="76" border="0"></a></div>
                        <div class="corpRight"><a href="/i/corp/downloads/tc_demo_spon.pdf"><img src="/i/corp/promos/tc_demo_spon.gif" alt="Download Sponsorship Demographics" width="170" height="218" border="0"></a></div>
<% } %>
<!-- Sponsorship ends -->

                    </td>
