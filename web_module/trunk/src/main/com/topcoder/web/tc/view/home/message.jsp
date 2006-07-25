<%@ page import="java.util.Calendar,
                 java.util.Date" %>
<%--
--%>
<jsp:useBean id="compTerms" class="com.topcoder.web.tc.controller.request.util.TCCC06ComponentTerms" scope="request"/>
<jsp:useBean id="algoTerms" class="com.topcoder.web.tc.controller.request.util.TCCC06AlgorithmTerms" scope="request"/>
<% Calendar now = Calendar.getInstance();
    now.setTime(new Date());
    if ((now.after(compTerms.getBeginning()) && now.before(compTerms.getEnd())) || (now.after(algoTerms.getBeginning()) && now.before(algoTerms.getEnd()))) {
%>

<style type="text/css">
.tccc06Message
{
color: #FFFFFF;
font-size: 11px;
font-weight: normal;
padding: 5px;
background: #003333 url(/i/tournament/tccc06/message_bg.gif) top center repeat-x;);
}

A.tccc06MessageLink:link
{
color: #A0DA4D;
text-decoration: underline;
}

A.tccc06MessageLink:visited
{
color: #269696;
text-decoration: underline;
}

A.tccc06MessageLink:hover
{
color: #C0F377;
text-decoration: none;
}

A.tccc06MessageLink:active
{
color: #C0F377;
text-decoration: underline;
}
</style>

<table border="0" cellspacing="0" cellpadding="0" width="180">
    <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
    <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
</table>
<table cellspacing="0" cellpadding="0" class="messageBoxFrame">
    <tr>
        <td class="tccc06Message" align="center">
            <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/message.gif" alt="TCCC06" border="0"/></A>
            <br/><br/>
            <% if (algoTerms.isRegistered()) { %>
            You are registered for the TCCC Algorithm Competition.<br/>
            <% } else { %>
            <% if ((now.after(algoTerms.getBeginning()) && now.before(algoTerms.getEnd()))) { %>
            <% if (algoTerms.isEligible()) { %>
            You are not registered for the <strong>TCCC Algorithm Competition</strong>, click
            <a href="/tc?module=TCCC06AlgorithmTerms" class="tccc06MessageLink">here</a> to register.<br/>
            <% } else { %>
            Sorry, you are not eligible to register for the TCCC.
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
            Sorry, you are not eligible to register for the TCCC.
            <% }
            }
            } %>
        </td>
    </tr>
</table>
<% } %>

<%--
<table border="0" cellspacing="0" cellpadding="0" width="180">
    <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
    <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
</table>
<table cellspacing="0" cellpadding="0" class="messageBoxFrame">
    <tr>
        <td class="messageBoxText" align=left>
      The TopCoder site will be down for maintenance for about 4 hours, starting at <strong>11:00PM ET on Sunday, December 12th</strong>.  Thank you for your patience.<br/>
        </td>
    </tr>
</table>
--%>