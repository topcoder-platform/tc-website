<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>    
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%-- TCCC07 STARTS HERE --%>        
<% ResultSetContainer rscTccc07 = (ResultSetContainer) request.getAttribute("tccc07_info");
    if (rscTccc07 != null && !rscTccc07.isEmpty()) {
%>

<style type="text/css">
    .tccc07Message {
        color: #4b4fa1;
        font-size: 11px;
        font-weight: normal;
        padding: 5px;
        background: #FFFFFF;
    }

    A.tccc07MessageLink:link {
        color: #4b4fa1;
        text-decoration: underline;
    }

    A.tccc07MessageLink:visited {
        color: #4b4fa1;
        text-decoration: underline;
    }

    A.tccc07MessageLink:hover {
        color: #FF0000;
        text-decoration: none;
    }

    A.tccc07MessageLink:active {
        color: #FF0000;
        text-decoration: underline;
    }
</style>

<table border="0" cellspacing="0" cellpadding="0" width="180">
    <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
    <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
</table>
<table cellspacing="0" cellpadding="0" class="messageBoxFrame" style="margin-bottom: 10px;">
    <tr>
        <td class="tccc07Message" align="center">
            <div align="center" style="margin: 6px 0px;">
                <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"><img src="/i/tournament/tccc07/message.png" alt="TCCC07" border="0"/></A>
            </div>
            <rsc:iterator list='<%=rscTccc07%>' id="resultRow">
                <% if (resultRow.getIntItem("registered")== 0) { %>
                    Sorry, you are ineligible for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.<br/>If this is a mistake, contact <A href="mailto:service@topcoder.com" class="tccc07MessageLink">service@topcoder.com</A>.
                <% } else if (resultRow.getIntItem("registered")== 1) { %>
                    You are registered for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.
                <% } else { %>
                    You are not registered for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.
                 <br />Would you like to <a href="/tc?module=TCCC07ViewRegistration&et=<rsc:item name="event_type_id" row='<%=resultRow%>'/>" class="tccc07MessageLink">register</a>?
                <% } %>
                <br/><br/>
            </rsc:iterator>
        </td>
    </tr>
</table>
<% } %>
<%-- TCCC07 ENDS HERE --%>

<%-- TCHS08 STARTS HERE --%>
<% ResultSetContainer rscTch08 = (ResultSetContainer) request.getAttribute("tchs08_info");
    if (rscTch08 != null && !rscTch08.isEmpty() && rscTch08.getIntItem(0, "open") == 1) {
%>

<style type="text/css">
    .tchs08Message {
        color: #FFFFFF;
        font-size: 11px;
        font-weight: normal;
        padding: 5px;
        background: #d1b54a url(/i/tournament/tchs08/calendarBg.png) top center;
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

<table border="0" cellspacing="0" cellpadding="0" width="180">
    <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
    <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
</table>
<table cellspacing="0" cellpadding="0" class="messageBoxFrame" style="margin-bottom: 10px;">
    <tr>
        <td class="tchs07Message" align="center">
            <A href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=overview"><img src="/i/tournament/tchs08/message.png" alt="TCHS08" border="0"/></A>
            <br /><br />
            <% if (rscTch08.getIntItem(0, "registered")== 0) { %>
                Sorry, you are ineligible for the <strong>2008 TopCoder High School Tournament</strong>.<br><br>If this is a mistake, contact <A href="mailto:service@topcoder.com" class="tchs07MessageLink">service@topcoder.com</A>.<br />
            <% } else if (rscTch08.getIntItem(0, "registered")== 1) { %>
                You are registered for the <strong>2008 TopCoder High School Tournament</strong>.<br />
            <% } else { %>
                You are not registered for the <strong>2008 TopCoder High School Tournament</strong>, click
            <a href="/tchs08?module=ViewRegistration" class="tchs08MessageLink">here</a> to register.<br />
            <% } %>
        </td>
    </tr>
</table>
<% } %>
<%-- TCHS08 STARTS HERE --%>


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