<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>    
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%-- TCO07 STARTS HERE --%>        
<% ResultSetContainer rscTco07 = (ResultSetContainer) request.getAttribute("tco07_info");
    if (rscTco07 != null && !rscTco07.isEmpty()) {
%>

<style type="text/css">
    .tco07Message {
        color: #666666;
        font-size: 11px;
        font-weight: normal;
        padding: 5px;
        background: #FFFFFF;
    }

    A.tco07MessageLink:link {
        color: #8B0A50;
        text-decoration: underline;
    }

    A.tco07MessageLink:visited {
        color: #8B0A50;
        text-decoration: underline;
    }

    A.tco07MessageLink:hover {
        color: #FF0000;
        text-decoration: none;
    }

    A.tco07MessageLink:active {
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
        <td class="tco07Message" align="center">
            <div align="center">
            <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/tournament/tco07/message.png" alt="TCO07" border="0"/></A>
            </div>
            <rsc:iterator list='<%=rscTco07%>' id="resultRow">
                <% if (resultRow.getIntItem("registered")== 0) { %>
                	Sorry, you are ineligible for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.<br/>If this is a mistake, contact <A href="mailto:service@topcoder.com" class="tco07MessageLink">service@topcoder.com</A>.
                <% } else if (resultRow.getIntItem("registered")== 1) { %>
                	You are registered for the <strong><%=resultRow.getStringItem("event_desc")%></strong>.
                <% } else { %>
                	You are not registered for the <strong><%=resultRow.getStringItem("event_desc")%></strong>, click
                <a href="/tc?module=TCO07ViewRegistration&ct=<rsc:item name="ct" row='<%=resultRow%>'/>" class="tco07MessageLink">here</a> to register.
                <% } %>
                <br/><br/>
            </rsc:iterator>
        </td>
    </tr>
</table>
<% } %>


<%-- TCHS07 STARTS HERE --%>        
<% ResultSetContainer rscTch07 = (ResultSetContainer) request.getAttribute("tchs07_info");
    if (rscTch07 != null && !rscTch07.isEmpty() && rscTch07.getIntItem(0, "open") == 1) {
%>

<style type="text/css">
    .tchs07Message {
        color: #FFFFFF;
        font-size: 11px;
        font-weight: normal;
        padding: 5px;
        background: #FF9900 url(/i/tournament/tchs07/calendar_bg.png) top center;
    }

    A.tchs07MessageLink:link {
        color: #FFFFFF;
        text-decoration: underline;
    }

    A.tchs07MessageLink:visited {
        color: #FFFFFF;
        text-decoration: underline;
    }

    A.tchs07MessageLink:hover {
        color: #FFFFFF;
        text-decoration: none;
    }

    A.tchs07MessageLink:active {
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
            <A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=about"><img src="/i/tournament/tchs07/message.png" alt="TCHS07" border="0"/></A>
            <br /><br />
            <% if (rscTch07.getIntItem(0, "registered")== 0) { %>
            	Sorry, you are ineligible for the <strong>2007 TopCoder High School Tournament</strong>.<br><br>If this is a mistake, contact <A href="mailto:service@topcoder.com" class="tchs07MessageLink">service@topcoder.com</A>.<br />
            <% } else if (rscTch07.getIntItem(0, "registered")== 1) { %>
            	You are registered for the <strong>2007 TopCoder High School Tournament</strong>.<br />
            <% } else { %>
            	You are not registered for the <strong>2007 TopCoder High School Tournament</strong>, click
            <a href="/tc?module=TCHS07ViewRegistration" class="tchs07MessageLink">here</a> to register.<br />
            <% } %>
        </td>
    </tr>
</table>
<% } %>


<%-- TCCC06 STARTS HERE
<%@ page import="java.util.Calendar,
                 java.util.Date" %>
<jsp:useBean id="compTerms" class="com.topcoder.web.tc.controller.request.util.TCCC06ComponentTerms" scope="request"/>
<jsp:useBean id="algoTerms" class="com.topcoder.web.tc.controller.request.tournament.tccc06.ViewAlgoRegistration" scope="request"/>
<% Calendar now = Calendar.getInstance();
    now.setTime(new Date());
    if ((now.after(compTerms.getBeginning()) && now.before(compTerms.getEnd())) || (now.after(algoTerms.getBeginning()) && now.before(algoTerms.getEnd()))) {
%>

<style type="text/css">
    .tccc06Message {
        color: #FFFFFF;
        font-size: 11px;
        font-weight: normal;
        padding: 5px;
        background: #003333 url(/i/tournament/tccc06/message_bg.gif) top center repeat-x;
    }

    A.tccc06MessageLink:link {
        color: #A0DA4D;
        text-decoration: underline;
    }

    A.tccc06MessageLink:visited {
        color: #269696;
        text-decoration: underline;
    }

    A.tccc06MessageLink:hover {
        color: #C0F377;
        text-decoration: none;
    }

    A.tccc06MessageLink:active {
        color: #C0F377;
        text-decoration: underline;
    }
</style>

<table border="0" cellspacing="0" cellpadding="0" width="180">
    <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
    <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
</table>
<table cellspacing="0" cellpadding="0" class="messageBoxFrame" style="margin-bottom: 10px;">
    <tr>
        <td class="tccc06Message" align="center">
            <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/message.gif" alt="TCCC06" border="0"/></A>
            <br /><br />
            <% if (algoTerms.isRegistered()) { %>
            You are registered for the TCCC Algorithm Competition.<br />
            <% } else { %>
            <% if ((now.after(algoTerms.getBeginning()) && now.before(algoTerms.getEnd()))) { %>
            <% if (algoTerms.isEligible()) { %>
            You are not registered for the <strong>TCCC Algorithm Competition</strong>, click
            <a href="/tc?module=TCCC06ViewAlgoReg" class="tccc06MessageLink">here</a> to register.<br />
            <% } else { %>
            Sorry, you are not eligible to register for the TCCC Algorithm Competition.<br />
            <% }
            }
            }%>
            <% if (compTerms.isRegistered()) { %>
            You are registered for the TCCC Component Competition.
            <% } else {%>

            <% if ((now.after(compTerms.getBeginning()) && now.before(compTerms.getEnd()))) { %>
            <% if (compTerms.isEligible()) { %>
            You are not registered for the <strong>TCCC Component Competition</strong>, click
            <a href="/tc?module=TCCC06ComponentTerms" class="tccc06MessageLink">here</a> to register.
            <% } else { %>
            Sorry, you are not eligible to register for the TCCC Component Competition.
            <% }
            }
            } %>
        </td>
    </tr>
</table>
<% } %>
--%>

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