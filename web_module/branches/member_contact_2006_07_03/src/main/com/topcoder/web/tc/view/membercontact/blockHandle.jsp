<%@ page import="com.topcoder.web.tc.controller.request.membercontact.BlockHandle" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tac:taconiteRoot>

<c:set value="<%=BlockHandle.ID%>" var="id"/>
<c:choose>

	<c:when test="${cf:containsMapKey(requestScope, id)}" >
       <tac:replaceChildren contextNodeID="blockHandleResult" parseOnServer="true">
		    <div style="font-weight:bold;color:red;">
		       User FOUND!
		    </div>

           <script type="text/javascript">
           alert("has id!");
		       //addBlockedUser('<c:out value="${requestScope.id}" />', '<c:out value="${requestScope.handle}" />');
           </script>
	    </tac:replaceChildren>
	</c:when>
    <c:otherwise>
        <tac:replaceChildren contextNodeID="blockHandleResult" parseOnServer="true">
		    <div style="font-weight:bold;color:red;">
		       User not found.
		    </div>
        </tac:replaceChildren>
    </c:otherwise>
</c:choose>

</tac:taconiteRoot>