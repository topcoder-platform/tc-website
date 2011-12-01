<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<c:set var="problems" value="${requestScope.algorithm_problem_list}"/>
<c:set var="projects" value="${requestScope.component_project_list}"/>
<c:set var="stages" value="${requestScope.digital_run_stage_list}"/>
<c:set var="tracks" value="${requestScope.digital_run_track_list}"/>
<c:set var="seasons" value="${requestScope.digital_run_season_list}"/>
<c:set var="rounds" value="${requestScope.algorithm_round_list}"/>
<c:set var="studioContests" value="${requestScope.studio_contest_list}"/>
<c:set var="componentContests" value="${requestScope.component_contest_list}"/>
<c:set var="parentPayments" value="${requestScope.parent_reference_list}"/>
<c:set var="refId" value="${requestScope.reference_type_id}"/>
<c:set var="type" value="${requestScope.type}"/>
<c:set var="search" value="${requestScope.search}"/>
<c:set var="optionalReference" value="${requestScope.optional_reference}"/>
<c:set var="firstLoad" value="${not empty param.first_load}"/>
<c:set var="roundUnknown" value="${not empty requestScope.round_unknown && requestScope.round_unknown== 'true'}"/>

<c:set var="ALGORITHM_ROUND" value="<%= PactsConstants.REFERENCE_ALGORITHM_ROUND_ID + "" %>" />
<c:set var="COMPONENT_PROJECT" value="<%= PactsConstants.REFERENCE_COMPONENT_PROJECT_ID + "" %>" />
<c:set var="ALGORITHM_PROBLEM" value="<%= PactsConstants.REFERENCE_ALGORITHM_PROBLEM_ID + "" %>" />
<c:set var="STUDIO_CONTEST" value="<%= PactsConstants.REFERENCE_STUDIO_CONTEST_ID + "" %>" />
<c:set var="COMPONENT_CONTEST" value="<%= PactsConstants.REFERENCE_COMPONENT_CONTEST_ID + "" %>" />
<c:set var="DIGITAL_RUN_STAGE" value="<%= PactsConstants.REFERENCE_DIGITAL_RUN_STAGE_ID + "" %>" />
<c:set var="DIGITAL_RUN_TRACK" value="<%= PactsConstants.REFERENCE_DIGITAL_RUN_TRACK_ID + "" %>" />
<c:set var="DIGITAL_RUN_SEASON" value="<%= PactsConstants.REFERENCE_DIGITAL_RUN_SEASON_ID + "" %>" />
<c:set var="PARENT_PAYMENT" value="<%= PactsConstants.REFERENCE_PARENT_PAYMENT_ID + "" %>" />
<c:set var="COMPONENT_WINNING" value="<%= PactsConstants.COMPONENT_PAYMENT + "" %>" />


<taconite-root xml:space="preserve">

    <taconite-replace contextNodeID="selectReference" parseInBrowser="true">
        <c:if test="${refId > 0}">
          <tr id="selectReference">
              <td><b>Reference:</b></td>
              <td>
                 <c:choose>
                     <c:when test="${refId == ALGORITHM_ROUND && !optionalReference}">
                        <c:choose>
                        <c:when test="${empty rounds}">    
                          <input type="hidden" name="missing_reference" value="Please select a round for the payment"/>
                          Enter search text for round name: <input type="text" name="searchInput" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No rounds found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:when>
                        <c:otherwise>                   
                             <tc-webtag:rscSelect name="algorithm_round_id" list="${rounds}" 
                                     fieldText="round_desc" fieldValue="round_id"  selectedValue="${param.reference_id}"                      
                                     useTopValue="false" onChange="referenceChanged('algorithm_round_id')" />
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:otherwise>   
                        </c:choose>                                   
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('algorithm_round_id');
                            </script>
                        </c:if>                                           
                     </c:when>                       
                     <c:when test="${refId == ALGORITHM_ROUND && optionalReference}">
                        <c:choose>
                        <c:when test="${roundUnknown}">
                        </c:when>                        
                        <c:when test="${empty rounds}">    
                          <input type="hidden" name="missing_reference" value="Please select a round for the payment or check Round Unknown"/>
                          Enter search text for round name <input type="text" name="searchInput" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No rounds found containing <c:out value="${search}"/>. </font>
                            </c:if>
                            or: 
                            <c:if test="${not firstLoad}">  
                                <script type="text/javascript">
                                    referenceChanged('algorithm_round_id');
                                </script>
                           </c:if>                                                                        
                        </c:when>
                        <c:otherwise>                   
                             <tc-webtag:rscSelect name="algorithm_round_id" list="${rounds}" 
                                     fieldText="round_desc" fieldValue="round_id"  selectedValue="${param.reference_id}"                      
                                     useTopValue="false" onChange="referenceChanged('algorithm_round_id')" />
                             <input type="button" value="do another search" onClick="typeChanged()" /> or: 
                            <c:if test="${not firstLoad}">  
                                <script type="text/javascript">
                                    referenceChanged('algorithm_round_id');
                                </script>
                           </c:if>                                                                        
                        </c:otherwise>   
                        </c:choose>                                   
                        <input type="checkbox" name="round_unknown_cbx" onClick="setRoundUnknown(this.checked)" <%= "true".equals(request.getAttribute("round_unknown"))? "checked=\"checked\"": ""  %>/>
                        Round Unknown<br/>                       

                     </c:when>                       
                     
                     <c:when test="${refId == COMPONENT_PROJECT}">
                        <c:if test="${empty projects}">           
                        <input type="hidden" name="missing_reference" value="Please select a component for the payment"/>
                          Enter search text for component name: <input type="text" name="searchInput" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No components found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty projects}">                   
                             <tc-webtag:rscSelect name="component_project_id" list="${projects}" 
                                     fieldText="project_desc" fieldValue="project_id" selectedValue="${param.reference_id}"
                                     useTopValue="false"  onChange="referenceChanged('component_project_id')"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />           
                        </c:if>                                  
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('component_project_id');
                            </script>
                        </c:if>

                     </c:when>               
                     
                     
                     <c:when test="${refId == ALGORITHM_PROBLEM}">
                        <c:if test="${empty problems}">             
                        <input type="hidden" name="missing_reference" value="Please select a problem for the payment"/>
                          Enter search text for problem name: <input type="text" name="searchInput" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No problems found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty problems}">                   
                             <tc-webtag:rscSelect name="algorithm_problem_id" list="${problems}" 
                                     fieldText="name" fieldValue="problem_id" selectedValue="${param.reference_id}"                                             
                                     useTopValue="false" onChange="referenceChanged('algorithm_problem_id')"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>               
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('algorithm_problem_id');
                            </script>
                        </c:if>
                        
                                           
                     </c:when>                       

                     <c:when test="${refId == STUDIO_CONTEST}">
                        <c:if test="${empty studioContests}">
                        <input type="hidden" name="missing_reference" value="Please select a studio contest for the payment"/>                        
                          Enter search text for studio contest name: <input type="text" name="searchInput" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No studio contests found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty studioContests}">                   
                             <tc-webtag:rscSelect name="studio_contest_id" list="${studioContests}" 
                                     fieldText="project_desc" fieldValue="project_id" selectedValue="${param.reference_id}"
                                     useTopValue="false"  onChange="referenceChanged('studio_contest_id')"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>          
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('studio_contest_id');
                            </script>
                        </c:if>
                                                                   
                     </c:when>                       

                     <c:when test="${refId == COMPONENT_CONTEST}">
                        <c:if test="${empty componentContests}">                  
                            <input type="hidden" name="missing_reference" value="Please select a component contest for the payment"/>                        
                          Enter search text for component contest name: <input type="text" name="searchInput" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No component contests found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty componentContests}">                   
                             <tc-webtag:rscSelect name="component_contest_id" list="${componentContests}" 
                                     fieldText="contest_desc" fieldValue="contest_id" selectedValue="${param.reference_id}"                                             
                                     useTopValue="false"  onChange="referenceChanged('component_contest_id')"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>       
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('algorithm_round_id');
                            </script>
                        </c:if>
                                                                          
                     </c:when>                       

                     <c:when test="${refId == PARENT_PAYMENT}">
                        <c:if test="${empty parentPayments}">                  
                            <input type="hidden" name="missing_reference" value="Please select a parent for the payment"/>                        
                          Enter search text for the parent payment detail: <input type="text" name="searchInput" value="${search}" />
                          <input type="button" value="search" onClick="search()" />
                            <c:if test="${not empty search}">          
                                <font color="#FF0000">No payments found containing <c:out value="${search}"/>. </font>
                            </c:if>
                          <br/>
                        </c:if>
                        <c:if test="${not empty parentPayments}">                   
                             <tc-webtag:rscSelect name="parent_reference_id" list="${parentPayments}" 
                                     fieldText="payment_desc" fieldValue="payment_id" selectedValue="${param.reference_id}"                                             
                                     useTopValue="false"  onChange="referenceChanged('parent_reference_id')"/>
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </c:if>       
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('parent_reference_id');
                            </script>
                        </c:if>
                                                  
                     </c:when>                       


                     
                     <c:when test="${refId == DIGITAL_RUN_STAGE}">
                         <tc-webtag:rscSelect name="digital_run_stage_id" list="${stages}" 
                                 fieldText="stage_desc" fieldValue="stage_id"  selectedValue="${param.reference_id}"                                            
                                 useTopValue="false" onChange="referenceChanged('digital_run_stage_id')"/>
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('digital_run_stage_id');
                            </script>
                        </c:if>
                                                        
                     </c:when>                       
                     
                     <c:when test="${refId == DIGITAL_RUN_TRACK}">
                         <tc-webtag:rscSelect name="digital_run_track_id" list="${tracks}" 
                                 fieldText="track_desc" fieldValue="track_id"  selectedValue="${param.reference_id}"                                            
                                 useTopValue="false" onChange="referenceChanged('digital_run_track_id')"/>
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('digital_run_track_id');
                            </script>
                        </c:if>
                                                        
                     </c:when>                       
                     
                     <c:when test="${refId == DIGITAL_RUN_SEASON}">
                         <tc-webtag:rscSelect name="digital_run_season_id" list="${seasons}" 
                                 fieldText="name" fieldValue="season_id"  selectedValue="${param.reference_id}"                                             
                                 useTopValue="false" onChange="referenceChanged('digital_run_season_id')"/>
                        <c:if test="${not firstLoad}">  
                            <script type="text/javascript">
                                referenceChanged('digital_run_season_id');
                            </script>
                        </c:if>
                                                       
                     </c:when>                       

                 </c:choose>
             </td>
          </tr>
         </c:if>
         <c:if test="${refId <= 0}">
            <tr id="selectReference"> <td></td><td></td></tr>
         </c:if>
     </taconite-replace>
     
    <taconite-replace contextNodeID="projectClient" parseInBrowser="true">
        <c:choose>
            <c:when test="${requiresClient}">
            <tr id="projectClient"> 
            <td><b>Client:</b></td>
            <td>
                <tc-webtag:textInput name="client" size="30" editable="true" />
            </td>
            </tr>
            </c:when>
            <c:otherwise>
                <tr id="projectClient"> <td></td><td></td></tr>
            </c:otherwise>
        </c:choose>   
     </taconite-replace>     
    <taconite-replace contextNodeID="trPlaced" parseInBrowser="true">
        <c:choose>
            <c:when test="${type == COMPONENT_WINNING}">
            <tr id="trPlaced"> 
            <td><b>Placed:</b></td>
            <td>
                <select name="placed" onChange="placedChanged()">
                    <option value="1">1st</option>
                    <option value="2">2nd</option>                                  
                 </select>
            </td>
            </tr>
            </c:when>
            <c:otherwise>
                <tr id="trPlaced"> <td></td><td></td></tr>
            </c:otherwise>
    </c:choose>

    </taconite-replace>
    
 </taconite-root>
 