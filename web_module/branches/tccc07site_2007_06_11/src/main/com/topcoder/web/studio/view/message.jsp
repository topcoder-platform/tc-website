<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>    
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<% ResultSetContainer rscTccc07 = (ResultSetContainer) request.getAttribute("tccc07studio_info");
    if (rscTccc07 != null && !rscTccc07.isEmpty()) {
%>

<style type="text/css">
    #message {
        float: right;
        width: 180px;
        margin: 0px 0px 20px 20px;
        color: #4b4fa1;
        font-size: 11px;
    }

    #message a:link, #message a:visited {
        color: #4b4fa1;
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
        <A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"><img src="/i/tournament/tccc07/message.png" alt="TCCC07"/></A>
    </div>
        <% if (rscTccc07.getIntItem(0, "registered")== 0) { %>
            Sorry, you are ineligible for the <strong><%=rscTccc07.getStringItem(0, "event_desc")%></strong>.
            <br>If this is a mistake, contact <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
        <% } else if (rscTccc07.getIntItem(0, "registered")== 1) { %>
        	You are registered for the <strong><%=rscTccc07.getStringItem(0, "event_desc")%></strong>.
        <% } else { %>
        	You are not registered for the <strong><%=rscTccc07.getStringItem(0, "event_desc")%></strong>.
            <br>Would you like to <strong><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=TCCC07ViewRegistration&et=7" class="tccc07MessageLink">register</a></strong>?
        <% } %>
        <br/><br/>
</div>

<% } %>
