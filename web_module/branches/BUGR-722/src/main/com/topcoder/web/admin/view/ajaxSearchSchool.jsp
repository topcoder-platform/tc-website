<%@page contentType="text/xml;charset=utf-8"%>
<%@ page import="com.topcoder.web.admin.controller.request.UpdateIntroEvent"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<fmt:requestEncoding value="utf-8"/>



<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="schoolSearch" parseInBrowser="true">
		<tr id="schoolSearch">
			<td nowrap="nowrap">
				<tc-webtag:radioButton name="<%= UpdateIntroEvent.SCHOOL_TYPE %>" value="1" selected="true"/>
						Search: 
		
				<c:choose>
					<c:when test="${not empty schools and not search_again }">
						<tc-webtag:objectSelect name="<%= UpdateIntroEvent.SCHOOL_SELECT_ID %>" list="${schools}" valueField="id" textField="name"  topText="[Select one]"  topValue="-1" onChange="setSchoolType(1)" />
						<input type="button" value="search again" onClick="searchAgain()" />
						<input type="hidden" name="school_search" value="${school_search}" />
					</c:when>
					<c:otherwise>
						 
						<tc-webtag:textInput name="school_search" value="${school_search}" size="20" editable="true"  onKeyPress="setSchoolType(1)" /> 					
						<input type="button" value="search" onClick="search()" />
						<c:if test="${not search_again}">
								<font color="#FF0000">No schools found.</font>
						</c:if>
						
					</c:otherwise>
				
				
				</c:choose>
			
			</td>
		</tr>
	</taconite-replace>
</taconite-root>
 