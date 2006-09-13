<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

<c:set var="problems" value="${requestScope.algorithm_problem_list}"/>
<c:set var="projects" value="${requestScope.component_project_list}"/>
<c:set var="refId" value="${requestScope.reference_id}"/>

        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="true">
        reference_id = <c:out value="${refId}"/>
<!--  
			<input type="text" name="search_text_x" />
			<input type="button" value="search" onClick="alert('hi');search()" />
-->			
		<c:choose>
			<c:when test="${refId == 2}">
            	<tc-webtag:rscSelect name="project_id" list="${projects}" 
                        fieldText="project_desc" fieldValue="project_id"              			
            			useTopValue="false" />
			</c:when>            			
			<c:when test="${refId == 3}">
            	<tc-webtag:rscSelect name="problem_id" list="${problems}" 
                        fieldText="name" fieldValue="problem_id"              			
            			useTopValue="false" />
			</c:when>            			
			      
		<c:choose>
		
        </tac:replaceChildren>

</tac:taconiteRoot>