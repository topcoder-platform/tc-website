<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/xml"%>

<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="schoolSearch" parseInBrowser="true">
		<tr id="schoolSearch">
			<td nowrap="nowrap">
				<tc-webtag:radioButton name="school_type" value="1" />	Search: 
		
				<c:choose>
					<c:when test="${not empty schools and not search_again }">
						<tc-webtag:objectSelect name="school_sel_id" list="${schools}" valueField="id" textField="name"  topText="[Select one]" topValue="-1" />
						<input type="button" value="search again" onClick="searchAgain()" />
						<input type="hidden" name="school_search" value="${school_search}" />
					</c:when>
					<c:otherwise>
						 
						<tc-webtag:textInput name="school_search" value="${school_search}" size="20" editable="true" /> 					
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
 