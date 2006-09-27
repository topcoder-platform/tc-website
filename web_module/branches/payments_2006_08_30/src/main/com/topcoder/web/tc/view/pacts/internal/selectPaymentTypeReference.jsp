<%@page contentType="text/xml"%>
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
<c:set var="refId" value="${requestScope.reference_type_id}"/>
<c:set var="search" value="${requestScope.search}"/>

<c:set var="ALGORITHM_ROUND" value="<%= PactsConstants.REFERENCE_ALGORITHM_ROUND_ID + "" %>" />
<c:set var="COMPONENT_PROJECT" value="<%= PactsConstants.REFERENCE_COMPONENT_PROJECT_ID + "" %>" />
<c:set var="ALGORITHM_PROBLEM" value="<%= PactsConstants.REFERENCE_ALGORITHM_PROBLEM_ID + "" %>" />
<c:set var="STUDIO_CONTEST" value="<%= PactsConstants.REFERENCE_STUDIO_CONTEST_ID + "" %>" />
<c:set var="COMPONENT_CONTEST" value="<%= PactsConstants.REFERENCE_COMPONENT_CONTEST_ID + "" %>" />
<c:set var="DIGITAL_RUN_STAGE" value="<%= PactsConstants.REFERENCE_DIGITAL_RUN_STAGE_ID + "" %>" />
<c:set var="DIGITAL_RUN_SEASON" value="<%= PactsConstants.REFERENCE_DIGITAL_RUN_SEASON_ID + "" %>" />
<c:set var="PARENT_PAYMENT" value="<%= PactsConstants.REFERENCE_PARENT_PAYMENT_ID + "" %>" />

<taconite-root xml:space="preserve">

    <taconite-replace contextNodeID="selectReference" parseInBrowser="true">
        <c:if test="${refId > 0}">
          <tr id="selectReference">
              <td><b>Reference:</b></td>
              <td>
                 <c:choose>
                     <c:when test="${refId == ALGORITHM_ROUND}">
                        <c:if test="${empty rounds}">    
                          <input type="hidden" name="missing_reference" value="Please select a round for the payment"/>
                          Enter search text for round name: <input type="text" name="search_text" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No rounds found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty rounds}">                   
                             <tc-webtag:rscSelect name="algorithm_round_id" list="${rounds}" 
                                     fieldText="round_desc" fieldValue="round_id"                        
                                     useTopValue="false" />
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>                                  
                     </c:when>                       
                     
                     <c:when test="${refId == COMPONENT_PROJECT}">
                        <c:if test="${empty projects}">                  
                          Enter search text for component name: <input type="text" name="search_text" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No components found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty projects}">                   
                             <tc-webtag:rscSelect name="component_project_id" list="${projects}" 
                                     fieldText="project_desc" fieldValue="project_id"                        
                                     useTopValue="false" />
                             <input type="button" value="do another search" onClick="typeChanged()" />
                             <br/>
                             <input type="text" name="client"/>
                        </c:if>                                  

                     </c:when>               
                     
                     
                     <c:when test="${refId == ALGORITHM_PROBLEM}">
                        <c:if test="${empty problems}">                  
                          Enter search text for problem name: <input type="text" name="search_text" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty problems}">          
                                <font color="#FF0000">No problems found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty problems}">                   
                             <tc-webtag:rscSelect name="algorithm_problem_id" list="${problems}" 
                                     fieldText="name" fieldValue="problem_id"                        
                                     useTopValue="false" />
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>                                  
                     </c:when>                       
                     
                     <c:when test="${refId == REFERENCE_DIGITAL_RUN_STAGE_ID}">
                         <tc-webtag:rscSelect name="stage_id" list="${stages}" 
                                 fieldText="stage_desc" fieldValue="stage_id"                        
                                 useTopValue="false" />
                     </c:when>                       
                     <c:when test="${refId == REFERENCE_DIGITAL_RUN_SEASON_ID}">
                         <tc-webtag:rscSelect name="season_id" list="${seasons}" 
                                 fieldText="name" fieldValue="season_id"                         
                                 useTopValue="false" />
                     </c:when>                       

                 </c:choose>
             </td>
          </tr>
         </c:if>
         <c:if test="${refId <= 0}">
            <tr id="selectReference"> <td></td><td></td></tr>
         </c:if>
     </taconite-replace>
     
 </taconite-root>
 