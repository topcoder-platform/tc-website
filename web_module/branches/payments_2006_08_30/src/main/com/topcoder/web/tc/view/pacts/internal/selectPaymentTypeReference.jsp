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

<c:set var="problems" value="${requestScope.algorithm_problem_list}"/>
<c:set var="projects" value="${requestScope.component_project_list}"/>
<c:set var="stages" value="${requestScope.digital_run_stage_list}"/>
<c:set var="seasons" value="${requestScope.digital_run_season_list}"/>
<c:set var="rounds" value="${requestScope.algorithm_round_list}"/>
<c:set var="refId" value="${requestScope.reference_id}"/>

<tac:taconiteRoot>
        <tac:replaceChildren contextNodeID="selectReference" parseOnServer="false">
            <input type="text" name="search_text_x" />
            <input type="button" value="test" onClick="alert('hi');search()" />
        <c:choose>
            <c:when test="${refId == 1}">
                <tc-webtag:rscSelect name="round_id" list="${rounds}" 
                        fieldText="round_desc" fieldValue="round_id"                        
                        useTopValue="false" />
            </c:when>                       
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
            <c:when test="${refId == 6}">
                <tc-webtag:rscSelect name="stage_id" list="${stages}" 
                        fieldText="stage_desc" fieldValue="stage_id"                        
                        useTopValue="false" />
            </c:when>                       
            <c:when test="${refId == 7}">
                <tc-webtag:rscSelect name="season_id" list="${seasons}" 
                        fieldText="name" fieldValue="season_id"                         
                        useTopValue="false" />
            </c:when>                       
                  
        </c:choose>
        
        </tac:replaceChildren>

</tac:taconiteRoot>