<%@ page import="java.util.Date,
                 java.util.Calendar"%>
<%
    boolean isEligible = new Boolean((String)request.getAttribute("isEligible")).booleanValue();
    boolean isRegistered = new Boolean((String)request.getAttribute("isRegistered")).booleanValue();
    Calendar now = Calendar.getInstance();
    now.setTime(new Date());
    Calendar end = Calendar.getInstance();
    end.set(2004, 1, 23, 9, 0);

%>


<% if (now.before(end)) { %>
    <table border="0" cellspacing="0" cellpadding="0" width="180">
        <tr><td><img src="/i/messageBoxTop.gif" width="180" height="11" border="0"/></td></tr>
        <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"/></td></tr>
    </table>
    <table cellspacing="0" cellpadding="5" class="messageBoxFrame">
        <tr>
            <td class="messageBoxText">
                <% if (!isEligible) { %>
                    you're not eligible
                <% } else if (isRegistered) { %>
                    you're registered already
                <% } else { %>
                        <img src="/i/tournament/tccc04/message_not_reg.gif" width="180" height="69" border="0"/>
                <% } %>
            </td>
        </tr>
    </table>
<% } %>