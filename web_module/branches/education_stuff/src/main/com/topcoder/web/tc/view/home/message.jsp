<%@ page import="java.util.Calendar,
                 java.util.Date"%>
<jsp:usebean id="compTerms" class="com.topcoder.web.tc.controller.request.util.TCO04ComponentTerms" scope="request" />
<jsp:usebean id="algoTerms" class="com.topcoder.web.tc.controller.request.util.TCO04AlgorithmTerms" scope="request" />
<%  Calendar now = Calendar.getInstance();
now.setTime(new Date());
if ((now.after(compTerms.getBeginning())&&now.before(compTerms.getEnd()))||(now.after(algoTerms.getBeginning())&&now.before(algoTerms.getEnd()))) {%>
    <table border="0" cellspacing="0" cellpadding="0" width="180">
        <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
        <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
    </table>
    <table cellspacing="0" cellpadding="0" class="messageBoxFrame">
        <tr>
            <td class="tco04Message" align=center>
            <img src="/i/tournament/tco04/message.gif" border=0 /><br/><br/>
            <% if (algoTerms.isRegistered()) { %>
                You are registered for the TCO Algorithm Competition.<br/>
            <%
            } else {
                if (algoTerms.isEligible()) { %>
                    You are not registered for the TCO Algorithm Competition, click <a class="tco04MessageLink" href="/tc?module=TCO04AlgorithmTerms">here</a> to register.<br/>
            <%    }
             } %>
            <% if (compTerms.isRegistered()) { %>
                You are registered for the TCO Component Competition.
            <%
            } else {
                if (compTerms.isEligible()) { %>
                    You are not registered for the TCO Component Competition, click <a class="tco04MessageLink" href="/tc?module=TCO04ComponentTerms">here</a> to register.
            <%    } else { %>
                    Sorry, you are not eligible to register for the TCO.
            <%    }
             } %>

            </td>
        </tr>
    </table>
<% } %>