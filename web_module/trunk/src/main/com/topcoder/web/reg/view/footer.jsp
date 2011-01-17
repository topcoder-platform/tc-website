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
