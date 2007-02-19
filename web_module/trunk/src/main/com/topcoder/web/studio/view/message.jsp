<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>    
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<% ResultSetContainer rscTco07 = (ResultSetContainer) request.getAttribute("tco07studio_info");
    if (rscTco07 != null && !rscTco07.isEmpty()) {
%>

<style type="text/css">
    #message {
        float: right;
        width: 180px;
        margin: 0px 0px 20px 20px;
        color: #8B0A50;
        font-size: 11px;
    }

    #message a:link, #message a:visited {
        color: #8B0A50;
        text-decoration: underline;
        font-weight: bold;
    }

    #message a:hover, #message a:active {
        color: #FF0000;
        text-decoration: none;
        font-weight: bold;
    }
</style>

<div id="message" style="" align="center">
    <div style="margin-bottom: 10px;">
        <A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco07/message.png" alt="TCO07"/></A>
    </div>
        <% if (rscTco07.getIntItem(0, "registered")== 0) { %>
            Sorry, you are ineligible for the <strong><%=rscTco07.getStringItem(0, "event_desc")%></strong>.
            <br>If this is a mistake, contact <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
        <% } else if (rscTco07.getIntItem(0, "registered")== 1) { %>
        	You are registered for the <strong><%=rscTco07.getStringItem(0, "event_desc")%></strong>.
        <% } else { %>
        	You are not registered for the <strong><%=rscTco07.getStringItem(0, "event_desc")%></strong>.
            <br>Would you like to <strong><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=TCO07ViewRegistration&ct=studio" class="tco07MessageLink">register</a></strong>?
        <% } %>
        <br/><br/>
</div>

<% } %>
