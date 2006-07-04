<%@ page language="java"
         import="com.topcoder.web.common.validation.ValidationResult,
         com.topcoder.web.common.validation.StringInput,
         com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator,
         com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidationResult
         " %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>

<tac:taconiteRoot>

    <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
        <% String handle = request.getParameter("th");
        HandleValidationResult result = (HandleValidationResult) new HandleValidator().validate(new StringInput(handle));
           
           if(result.isValid()) {
        %>
        <div>
        <% } else if (!result.handleExist()) { %>
        </div>
            <div style="font-weight:bold;color:red;">
               User name not found.
            </div>
        <% } else if (!result.canReceiveEmail()) { %>
            <div style="font-weight:bold;color:red;">
                The user  can't receive email via member contact.
            </div>
        <% } %>
    </tac:replaceChildren>
</tac:taconiteRoot>