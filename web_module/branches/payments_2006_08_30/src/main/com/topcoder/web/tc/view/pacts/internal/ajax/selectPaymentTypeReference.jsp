<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<c:set var="problems" value="${requestScope.algorithm_problem_list}"/>
<c:set var="projects" value="${requestScope.component_project_list}"/>
<c:set var="stages" value="${requestScope.digital_run_stage_list}"/>
<c:set var="seasons" value="${requestScope.digital_run_season_list}"/>
<c:set var="rounds" value="${requestScope.algorithm_round_list}"/>
<c:set var="studioContests" value="${requestScope.studio_contest_list}"/>
<c:set var="componentContests" value="${requestScope.component_contest_list}"/>
<c:set var="refId" value="${requestScope.reference_type_id}"/>
<c:set var="search" value="${requestScope.search}"/>

<c:set var="ALGORITHM_ROUND" value="<%= PactsConstants.REFERENCE_ALGORITHM_ROUND_ID + "" %>" />
<c:set var="COMPONENT_PROJECT" value="<%= PactsConstants.REFERENCE_COMPONENT_PROJECT_ID + "" %>" />
<c:set var="ALGORITHM_PROBLEM" value="<%= PactsConstants.REFERENCE_ALGORITHM_PROBLEM_ID + "" %>" />
<c:set var="STUDIO_CONTEST" value="<%= PactsConstants.REFERENCE_STUDIO_CONTEST_ID + "" %>" />
<c:set var="COMPONENT_CONTEST" value="<%= PactsConstants.REFERENCE_COMPONENT_CONTEST_ID + "" %>" />
<c:set var="DIGITAL_RUN_STAGE" value="<%= PactsConstants.REFERENCE_DIGITAL_RUN_STAGE_ID + "" %>" />
<c:set var="DIGITAL_RUN_SEASON" value="<%= PactsConstants.REFERENCE_DIGITAL_RUN_SEASON_ID + "" %>" />

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
                                     useTopValue="false" onChange="referenceChanged(document.f.algorithm_round_id.value)" />
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>              
						<script type="text/javascript">
								referenceChanged(document.f.algorithm_round_id.value)
				    	</script>
                                            
                     </c:when>                       
                     
                     <c:when test="${refId == COMPONENT_PROJECT}">
                        <c:if test="${empty projects}">           
                        <input type="hidden" name="missing_reference" value="Please select a component for the payment"/>
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
                                     useTopValue="false"  onChange="referenceChanged(document.f.component_project_id.value)"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />                            
                             <br/>Client:
                             <input type="text" name="client"/>
                        </c:if>                                  
						<script type="text/javascript">
								referenceChanged(document.f.component_project_id.value)
				    	</script>

                     </c:when>               
                     
                     
                     <c:when test="${refId == ALGORITHM_PROBLEM}">
                        <c:if test="${empty problems}">             
                        <input type="hidden" name="missing_reference" value="Please select a problem for the payment"/>
                          Enter search text for problem name: <input type="text" name="search_text" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No problems found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty problems}">                   
                             <tc-webtag:rscSelect name="algorithm_problem_id" list="${problems}" 
                                     fieldText="name" fieldValue="problem_id"                        
                                     useTopValue="false" onChange="referenceChanged(document.f.algorithm_problem_id.value)"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>               
						<script type="text/javascript">
								referenceChanged(document.f.algorithm_problem_id.value)
				    	</script>
                                           
                     </c:when>                       

                     <c:when test="${refId == STUDIO_CONTEST}">
                        <c:if test="${empty studioContests}">
                        <input type="hidden" name="missing_reference" value="Please select a studio contest for the payment"/>                        
                          Enter search text for studio contest name: <input type="text" name="search_text" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No studio contests found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty studioContests}">                   
                             <tc-webtag:rscSelect name="studio_contest_id" list="${studioContests}" 
                                     fieldText="name" fieldValue="contest_id"                        
                                     useTopValue="false"  onChange="referenceChanged(document.f.studio_contest_id.value)"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>          
						<script type="text/javascript">
								referenceChanged(document.f.studio_contest_id.value)
				    	</script>                                                
                     </c:when>                       

                     <c:when test="${refId == COMPONENT_CONTEST}">
                        <c:if test="${empty componentContests}">                  
                            <input type="hidden" name="missing_reference" value="Please select a component contest for the payment"/>                        
                          Enter search text for component contest name: <input type="text" name="search_text" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No component contests found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty componentContests}">                   
                             <tc-webtag:rscSelect name="component_contest_id" list="${componentContests}" 
                                     fieldText="contest_desc" fieldValue="contest_id"                        
                                     useTopValue="false"  onChange="referenceChanged(document.f.component_contest_id.value)"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>       
						<script type="text/javascript">
								referenceChanged(document.f.component_contest_id.value)
				    	</script>                                                   
                     </c:when>                       

                     
                     <c:when test="${refId == DIGITAL_RUN_STAGE}">
                         <tc-webtag:rscSelect name="digital_run_stage_id" list="${stages}" 
                                 fieldText="stage_desc" fieldValue="stage_id"                        
                                 useTopValue="false" onChange="referenceChanged(document.f.digital_run_stage_id.value)"/>
						<script type="text/javascript">
								referenceChanged(document.f.digital_run_stage_id.value)
				    	</script>                                 
                     </c:when>                       
                     
                     <c:when test="${refId == DIGITAL_RUN_SEASON}">
                         <tc-webtag:rscSelect name="digital_run_season_id" list="${seasons}" 
                                 fieldText="name" fieldValue="season_id"                         
                                 useTopValue="false" onChange="referenceChanged(document.f.digital_run_season_id.value)"/>
						<script type="text/javascript">
								referenceChanged(document.f.digital_run_season_id.value)
				    	</script>                                 
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
 