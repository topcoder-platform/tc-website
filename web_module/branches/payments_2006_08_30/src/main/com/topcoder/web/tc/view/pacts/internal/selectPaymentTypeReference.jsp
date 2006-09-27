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
<c:set var="refId" value="${requestScope.reference_id}"/>
<c:set var="search" value="${requestScope.search}"/>

<taconite-root xml:space="preserve">

    <taconite-replace contextNodeID="selectReference" parseInBrowser="true">
        <c:if test="${refId >= 0}">
          <tr id="selectReference">
              <td><b>Reference:</b></td>
              <td>
                 <c:choose>
                     <c:when test="${refId == 1}">
                        <c:if test="${empty rounds}">                  
                            <c:if test="${not empty search}">                  
                                The search returned no rows.  Please search again
                            </c:if>
                          Enter search text for round name: <input type="text" name="search_text" />
                          <input type="button" value="search" onClick="search()" />
                          <br/>
                        </c:if>
                        <c:if test="${not empty rounds}">                   
                             <tc-webtag:rscSelect name="algorithm_round_id" list="${rounds}" 
                                     fieldText="round_desc" fieldValue="round_id"                        
                                     useTopValue="false" />
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>                                  
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
             </td>
          </tr>
         </c:if>
     </taconite-replace>
     
 </taconite-root>
 