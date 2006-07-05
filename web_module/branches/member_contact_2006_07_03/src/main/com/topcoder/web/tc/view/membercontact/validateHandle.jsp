<%@ page language="java"
         import="com.topcoder.web.common.validation.ValidationResult,
         com.topcoder.web.common.validation.StringInput,
         com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator,
         com.topcoder.web.common.HibernateUtils
         " %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>

<tac:taconiteRoot>

        <%

        String handle = request.getParameter("th");
        HibernateUtils.begin();
        ValidationResult result = new HandleValidator().validate(new StringInput(handle));
        HibernateUtils.commit();

           if(result.isValid()) {
        %>
		    <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
        			<div> </div>
   	    	</tac:replaceChildren>
		    <tac:replaceChildren contextNodeID="submitButton" parseOnServer="true">
			    <input type='submit' value='Send'/>
   	    	</tac:replaceChildren>
        <% } else { %>
		    <tac:replaceChildren contextNodeID="validationHandle" parseOnServer="true">
	            <div style="font-weight:bold;color:red;">
    	           <%= result.getMessage() %>
        	    </div>
            </tac:replaceChildren>
		    <tac:replaceChildren contextNodeID="submitButton" parseOnServer="true">
			    <input type='submit' value='Send' disabled="true"/>
   	    	</tac:replaceChildren>
        <% } %>

</tac:taconiteRoot>