<%
    boolean isEligible = new Boolean((String)request.getAttribute("isEligible")).booleanValue();
    boolean isRegistered = new Boolean((String)request.getAttribute("isRegistered")).booleanValue();

%>

<table border="0" cellspacing="0" cellpadding="0" width="180">
    <tr><td><img src="/i/top_10_lists_top.gif" width="180" height="11" border="0"></td></tr>
    <tr><td><img src="/i/important_message.gif" width="180" height="20" border="0"></td></tr>
</table>
<table border="0" cellspacing="0" cellpadding="5" width="180" class="messageBoxFrame">
    <tr>
        <td class="messageBoxText">
            <% if (!isEligible) { %>
                you're not eligible
            <% } else if (isRegistered) { %>
                you're registered already
            <% } else { %>
                    <img src="/i/tournament/tccc04/message_not_reg.gif" width="180" height="69" border="0">
            <% } %>
        </td>
    </tr>
</table>