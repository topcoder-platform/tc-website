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

<div id="box-foot">
    <small>&copy; 2011. TopCoder</small>
</div>


<%-- Analytics --%>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-6340959-1");
pageTracker._trackPageview();
</script>

<!-- Start of HubSpot Logging Code  -->
<script type="text/javascript" language="javascript">
var hs_portalid=17680; 
var hs_salog_version = "2.00";
var hs_ppa = "topcoder.app101.hubspot.com";
document.write(unescape("%3Cscript src='" + document.location.protocol + "//" + hs_ppa + "/salog.js.aspx' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- End of HubSpot Logging Code -->
