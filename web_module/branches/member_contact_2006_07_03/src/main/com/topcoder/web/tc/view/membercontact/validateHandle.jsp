<%@ taglib uri="/taconite.tld" prefix="tac" %>

<tac:taconiteRoot>

    <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
        <% String handle = request.getParameter("th");
            if("cucu".equals(handle)) {
        %>
        <div style="font-weight:bold;color:green;">
        User OK
        </div>
        <% } else { %>
        <div style="font-weight:bold;color:red;">
        UNKNOWN User
        </div>
        <% } %>
    </tac:replaceChildren>
</tac:taconiteRoot>