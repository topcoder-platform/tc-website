<%@ page language="java"
         import="com.topcoder.web.common.validation.ValidationResult,
         com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>

<tac:taconiteRoot>

    <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
        <% String handle = request.getParameter("th");
           ValidationResult validator = new HandleValidator().validate(handle);
           
           if(result.isValid()) {
        %>
        <div>
        </div>
        <% } else { %>
            <div style="font-weight:bold;color:red;">
                <%= result.getMessage() %>
            </div>
        <% } %>
    </tac:replaceChildren>
</tac:taconiteRoot>