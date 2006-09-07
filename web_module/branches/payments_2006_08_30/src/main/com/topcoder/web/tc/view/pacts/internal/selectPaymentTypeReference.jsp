<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.web.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.servlet.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>

<tac:taconiteRoot>
<%

    DataInterfaceBean dib = new DataInterfaceBean();
    Map map = dib.getProblemList();
    ResultSetContainer rsc = (ResultSetContainer) map.get(PactsInternalServlet.PROBLEM_LIST);
%>
        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="true">
			<c:out value="${param.payment_type_id}" />         
            <tc-webtag:rscSelect name="payment_method_id" list="<%=rsc%>" 
                        fieldText="name" fieldValue="problem_id"              			
            			useTopValue="false" />
			      
        </tac:replaceChildren>

</tac:taconiteRoot>