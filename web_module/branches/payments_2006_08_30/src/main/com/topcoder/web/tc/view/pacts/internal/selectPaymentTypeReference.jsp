<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tac:taconiteRoot>

        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="true">
			<c:out value="${param.payment_type_id}" />               
        </tac:replaceChildren>

</tac:taconiteRoot>