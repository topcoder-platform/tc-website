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

<div id="footer">
    <!--Update footer-->
   
    <div class="copyright">
        <span>Copyright TopCoder, Inc. 2001-2012</span>
        <span class="line">|</span>
        <a href="terms_of_use.jsp" target="_blank" title="Terms of Use">Terms of Use</a>
        <span class="line">|</span>
        <a href="privacy_policy.jsp" target="_blank" title="Privacy Policy">Privacy Policy</a>
    </div>
    <!--End copyright-->
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
