<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean,
com.topcoder.web.tc.controller.legacy.pacts.common.*,
com.topcoder.web.common.*,
com.topcoder.shared.dataAccess.resultSet.ResutSetContainer,
java.util.*,
com.topcoder.web.tc.controller.legacy.pacts.servlet.*" %>
<tac:taconiteRoot>
<%

    DataInterfaceBean dib = new DataInterfaceBean();
    Map map = dib.geProblemList();
    ResutSetContainer rsc = (ResultSetContainer) map.get(PactsInternalServlet.PROBLEM_LIST);
%>
        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="true">
			<c:out value="${param.payment_type_id}" />               
        </tac:replaceChildren>

</tac:taconiteRoot>