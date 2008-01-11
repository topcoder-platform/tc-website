<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<% ResultSetContainer rscTco08 = (ResultSetContainer) request.getAttribute("tco08studio_info");
    if (rscTco08 != null && !rscTco08.isEmpty()) {
%>

<div id="message" align="center">
    <div style="margin: 10px 0px 10px 0px;">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about"><img src="/i/tournament/tco08/message.png" alt="TCO08"/></a>
    </div>
        <% if (rscTco08.getIntItem(0, "registered")== 0) { %>
            Sorry, you are ineligible for the <strong><%=rscTco08.getStringItem(0, "event_desc")%></strong>.
            <br />If this is a mistake, contact <a href="mailto:service@topcoder.com">service@topcoder.com</a>.
        <% } else if (rscTco08.getIntItem(0, "registered")== 1) { %>
        	You are registered for the <strong><%=rscTco08.getStringItem(0, "event_desc")%></strong>.
        <% } else { %>
        	You are not registered for the <strong><%=rscTco08.getStringItem(0, "event_desc")%></strong>.
            <br />Would you like to <strong><a href="http://<%=ApplicationServer.SERVER_NAME%>/tco08?module=ViewRegistration&amp;et=7" class="tco08MessageLink">register</a></strong>?
        <% } %>
        <br/><br/>
</div>

<% } %>
