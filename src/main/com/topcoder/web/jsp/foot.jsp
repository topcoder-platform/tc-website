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
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-6340959-1");
pageTracker._trackPageview();
</script>

<!-- Performable Analytics -->
<%
 if (handle != null && !handle.equals("") && !handle.equals("anonymous")) {
%>
<script type="text/javascript">

    var _paq = _paq || [];
 
    _paq.push(["identify", {
    id: "<%=handle %>"
    }]);
</script>

<%}%>

<script src="//d1nu2rn22elx8m.cloudfront.net/performable/pax/4wrbNk.js" type="text/javascript"></script>

