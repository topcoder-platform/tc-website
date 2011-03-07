<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");
    String handle = null;
    if (sessionInfo != null)
    {
        handle = sessionInfo.getHandle();
    }

%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td width="100%" class="footer">
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/" class="footerLinks">Home</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/home" class="footerLinks">About TopCoder</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index" class="footerLinks">Press Room</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/lets-talk-2/" class="footerLinks">Contact Us</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=jobs" class="footerLinks">Careers</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=privacy" class="footerLinks">Privacy</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=terms" class="footerLinks">Terms</a>
            <br />
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc" class="footerLinks">Competitions</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/cockpit" class="footerLinks">Cockpit</a>        </td>
    </tr>
    <tr>
      <td width="100%" class="copyright">Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></td></tr>
</tbody>
</table>

<%-- Analytics --%>


<!-- Start of HubSpot Logging Code  -->
<script type="text/javascript" language="javascript">
var hs_portalid=17680; 
var hs_salog_version = "2.00";
var hs_ppa = "topcoder.app101.hubspot.com";
document.write(unescape("%3Cscript src='" + document.location.protocol + "//" + hs_ppa + "/salog.js.aspx' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- End of HubSpot Logging Code -->
