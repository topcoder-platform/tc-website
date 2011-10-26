<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>    
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%-- TCO08 STARTS HERE --%>        
<% ResultSetContainer rscTco08 = (ResultSetContainer) request.getAttribute("tco08_info");
    if (rscTco08 != null && !rscTco08.isEmpty()) {
%>

<style type="text/css">
.tco08Message {
 margin: 0 0 10px 0;
 color: #FFFFFF;
 font-size: 11px;
 font-weight: normal;
 padding: 5px 5px 10px 5px;
 background: #000000 url(/i/tournament/tco08/messageBG.png) top center no-repeat;
 border-bottom: 1px solid #999999;
}

div.tco08Logo {
 margin: 4px 0; 
}

A.tco08MessageLink:link {
 color: #FFFFFF;
 text-decoration: underline;
}

A.tco08MessageLink:visited {
 color: #FFFFFF;
 text-decoration: underline;
}

A.tco08MessageLink:hover {
 color: #FFFFFF;
 text-decoration: none;
}

A.tco08MessageLink:active {
 color: #FFFFFF;
 text-decoration: underline;
}
</style>

<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
<tbody>
    <tr>
        <td class="header">Message from TopCoder</td>
    </tr>
</tbody>
</table>

<div class="tco08Message" align="center">
    <div class="tco08Logo">
        <a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=about"><img src="/i/tournament/tco08/message.png" alt="TCO08" border="0"/></a>
    </div>
    <rsc:iterator list='<%=rscTco08%>' id="resultRow">
        <% if (resultRow.getIntItem("registered")== 0) { %>
            Sorry, you are ineligible for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.<br />If this is a mistake, contact <a href="mailto:service@topcoder.com" class="tco08MessageLink">service@topcoder.com</a>.
        <% } else if (resultRow.getIntItem("registered")== 1) { %>
            You are registered for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.
        <% } else { %>
            You are not registered for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.
         <br />Would you like to <a href="/tco08?module=ViewRegistration&et=<rsc:item name="event_type_id" row='<%=resultRow%>'/>" class="tco08MessageLink">register</a>?
        <% } %>
        <br /><br />
    </rsc:iterator>
</div>
<% } %>
<%-- TCO08 ENDS HERE --%>

<%-- TCHS08 STARTS HERE --%>
<% ResultSetContainer rscTch08 = (ResultSetContainer) request.getAttribute("tchs08_info");
    if (rscTch08 != null && !rscTch08.isEmpty() && rscTch08.getIntItem(0, "open") == 1) {
%>

<style type="text/css">
.tchs08Message {
 margin: 0 0 10px 0;
 color: #FFFFFF;
 font-size: 11px;
 font-weight: normal;
 padding: 5px;
 background: #000000;
 border-bottom: 1px solid #999999;
}

div.tchs08Logo {
 margin: 4px 0; 
}

A.tchs08MessageLink:link {
 color: #FFFFFF;
 text-decoration: underline;
}

A.tchs08MessageLink:visited {
 color: #FFFFFF;
 text-decoration: underline;
}

A.tchs08MessageLink:hover {
 color: #FFFFFF;
 text-decoration: none;
}

A.tchs08MessageLink:active {
 color: #FFFFFF;
 text-decoration: underline;
}
</style>

<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
<tbody>
    <tr>
        <td class="header">Message from TopCoder</td>
    </tr>
</tbody>
</table>
            
<div class="tchs08Message" align="center">
    <div class="tchs08Logo">
        <a href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=overview"><img src="/i/tournament/tchs08/message.png" alt="TCHS08" border="0"/></a>
    </div>
    <% if (rscTch08.getIntItem(0, "registered")== 0) { %>
        Sorry, you are ineligible for the <strong>2008 TopCoder High School Tournament</strong>.<br /><br />If this is a mistake, contact <a href="mailto:service@topcoder.com" class="tchs08MessageLink">service@topcoder.com</a>.<br />
    <% } else if (rscTch08.getIntItem(0, "registered")== 1) { %>
        You are registered for the <strong>2008 TopCoder High School Tournament</strong>.<br />
    <% } else { %>
        You are not registered for the <strong>2008 TopCoder High School Tournament</strong>, click
    <a href="/tchs08?module=ViewRegistration" class="tchs08MessageLink">here</a> to register.<br />
    <% } %>
</div>
<% } %>
<%-- TCHS08 ENDS HERE --%>


<%--
<table border="0" cellspacing="0" cellpadding="0" width="180">
    <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
    <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
</table>
<table cellspacing="0" cellpadding="0" class="messageBoxFrame">
    <tr>
        <td class="messageBoxText" align=left>
      The TopCoder site will be down for maintenance for about 4 hours, starting at <strong>11:00PM ET on Sunday, December 12th</strong>.  Thank you for your patience.<br />
        </td>
    </tr>
</table>
--%>