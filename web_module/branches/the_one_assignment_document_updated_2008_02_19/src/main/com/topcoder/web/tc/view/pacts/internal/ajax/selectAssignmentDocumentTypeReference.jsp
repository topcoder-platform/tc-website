<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType,
                 com.topcoder.web.common.BaseProcessor,
                 java.util.HashMap" %>

<c:set value="<%=AssignmentDocumentType.GLOBAL_TYPE_ID%>" var="GLOBAL_TYPE_ID"/>
<c:set var="defaultStatusId" value="<%= new Long((String)((HashMap) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get("assignment_document_status_id")) %>" />

<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="selectReference" parseInBrowser="true">
    <tr id="selectReference">
        <c:choose>
            <c:when test="${assignment_document_type_id == GLOBAL_TYPE_ID}">
            </c:when>
            <c:otherwise>
                <c:if test="${empty search_values}">           
                    <c:if test="${not empty reference_description}">    
                        <td><b>Reference:</b></td>      
                        <td><c:out value="${reference_description}" />
                            <input type="text" name="search_text"/>
                            <input type="button" value="search" onClick="doSearch(true, false)" />
                        </td>
                    </c:if>
                </c:if>
                <c:if test="${not empty search_values}">
                    <c:if test="${not empty reference_description}">    
                        <td><b>Reference:</b></td>      
                        <td><c:out value="${reference_description}" />
                             <tc-webtag:rscSelect name="search_list" list="${search_values}" 
                                 fieldText="${field_text}" fieldValue="${field_value}" selectedValue="${reference_id}"                                             
                                 useTopValue="false" />
                             <input type="button" value="do another search" onClick="typeChanged()" />
                        </td>
                    </c:if>
                </c:if>                                  
            </c:otherwise>
        </c:choose>
     </tr>
     </taconite-replace>   

    <taconite-replace contextNodeID="submissionTitle" parseInBrowser="true">
    <tr id="submissionTitle">
        <c:choose>
            <c:when test="${assignment_document_type_id == GLOBAL_TYPE_ID}">
            </c:when>
            <c:otherwise>
                <td><b>Submission title:</b></td>
                <td>
                    <tc-webtag:textInput name="submission_title" id="submission_title" editable="true" /> 
                </td>
            </c:otherwise>
        </c:choose>
     </tr>
     </taconite-replace>   

    <taconite-replace contextNodeID="status" parseInBrowser="true">
    <tr id="status">
        <c:choose>
            <c:when test="${assignment_document_type_id == GLOBAL_TYPE_ID}">
                <td><b>Status:</b></td>
                <td>
                    <SELECT CLASS="dropdown" NAME="assignment_document_status_id">
                        <c:forEach items="${assignment_document_status_list}" var="statusItem">
                            <OPTION value='${statusItem.id}' <c:if test="${statusItem.id == defaultStatusId}">selected</c:if>>
                                ${statusItem.description}
                            </OPTION>
                        </c:forEach>
                    </SELECT>
                </td>
            </c:when>
            <c:otherwise>
                <td><b>Status:</b></td>
                <td>
                    <SELECT CLASS="dropdown" NAME="assignment_document_status_id">
                        <c:forEach items="${assignment_document_status_list}" var="statusItem">
                            <OPTION value='${statusItem.id}' <c:if test="${statusItem.id == defaultStatusId}">selected</c:if>>
                                ${statusItem.description}
                            </OPTION>
                        </c:forEach>
                    </SELECT>
                </td>
            </c:otherwise>
        </c:choose>
     </tr>
     </taconite-replace>   

    <taconite-replace contextNodeID="hardCopy" parseInBrowser="true">
    <tr id="hardCopy">
        <c:choose>
            <c:when test="${assignment_document_type_id == GLOBAL_TYPE_ID}">
            </c:when>
            <c:otherwise>
                <td><b>Hard Copy:</b>
                </td>
                <td>        
                    <br/>
                    <tc-webtag:chkBox name="assignment_document_hard_copy"/>
                </td>
            </c:otherwise>
        </c:choose>
     </tr>
     </taconite-replace>   

    <taconite-replace contextNodeID="expirationDate" parseInBrowser="true">
    <tr id="expirationDate">
        <c:choose>
            <c:when test="${assignment_document_type_id == GLOBAL_TYPE_ID}">
            </c:when>
            <c:otherwise>
                <td><b>Expiration Date:</b></td><td>
                <tc-webtag:textInput name="expire_date" id="expire_date" size="12" editable="true" /> 
                    <button id="trigger_expire_date">Set</button> If left empty it is set to current date + <%=PactsConstants.ASSIGNMENT_DOCUMENT_SHORT_EXPIRATION_PERIOD%> (has hard copy) or current date + <%=PactsConstants.ASSIGNMENT_DOCUMENT_LONG_EXPIRATION_PERIOD%> days (no hard copy)
                </td>            
            </c:otherwise>
        </c:choose>
     </tr>
     </taconite-replace>   
     
 </taconite-root>
 