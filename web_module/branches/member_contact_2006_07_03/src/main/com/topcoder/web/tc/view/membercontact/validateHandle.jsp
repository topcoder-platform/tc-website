<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>

<tac:taconiteRoot>

    <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
        <% String handle = request.getParameter("th");
            if("cucu".equals(handle)) {
        %>
        <div style="font-weight:bold;color:green;">
        User OK <%= handle %>
        </div>
        <% } else { %>
        <div style="font-weight:bold;color:red;">
        UNKNOWN User <%= handle %>
        </div>
        <% } %>
    </tac:replaceChildren>
</tac:taconiteRoot>