<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tac:taconiteRoot>

        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="true">
                <div>
                        <tr>
        <td><b>Reference:</b></td>
        <td>
			<c:out value="${request.payment_type_id}" />
        </td></tr>
                
                </div>
        </tac:replaceChildren>

</tac:taconiteRoot>