<%@ page import="java.util.Calendar,
                 java.util.Date"%>
<jsp:useBean id="compTerms" class="com.topcoder.web.tc.controller.request.util.TCCC05ComponentTerms" scope="request" />
<jsp:useBean id="algoTerms" class="com.topcoder.web.tc.controller.request.util.TCCC05AlgorithmTerms" scope="request" />
<%  Calendar now = Calendar.getInstance();
    now.setTime(new Date());
    if ((now.after(compTerms.getBeginning())&&now.before(compTerms.getEnd()))||(now.after(algoTerms.getBeginning())&&now.before(algoTerms.getEnd()))) {
%>

    <table border="0" cellspacing="0" cellpadding="0" width="180">
        <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
        <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
    </table>
    <table cellspacing="0" cellpadding="0" class="messageBoxFrame">
        <tr>
            <td class="tccc05Message" align=center>
            <img src="/i/tournament/tccc05/message.gif" border=0 /><br/><br/>
            <% if (algoTerms.isRegistered()) { %>
                    You are registered for the TCCC Algorithm Competition.<br/>
            <% } else { %>
            <% if ((now.after(algoTerms.getBeginning())&&now.before(algoTerms.getEnd()))) { %>
              <% if (algoTerms.isEligible()) { %>
                 You are not registered for the TCCC Algorithm Competition, click <a class="tccc05MessageLink" href="/tc?module=TCCC05AlgorithmTerms">here</a> to register.<br/>
            <%   } else { %>
                   Sorry, you are not eligible to register for the TCCC.
            <%   }
               }
            }%>
            <% if (compTerms.isRegistered()) { %>
                You are registered for the TCCC Component Competition.
            <% } else {%>

            <% if ((now.after(compTerms.getBeginning())&&now.before(compTerms.getEnd()))) { %>
            <%   if (compTerms.isEligible()) { %>
                   You are not registered for the TCCC Component Competition, click <a class="tccc05MessageLink" href="/tc?module=TCCC05ComponentTerms">here</a> to register.
            <%   } else { %>
                   Sorry, you are not eligible to register for the TCCC.
            <%   }
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