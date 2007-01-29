<%@page contentType="text/xml"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="searchResults" parseInBrowser="true">
    				<div id="searchResults">
    
		<select multiple="true" size="15" style="width: 600px;" name="school" ondblclick="schoolDoubleClick()">					
                      <c:forEach items="${requestScope.schools}" var="result">
                         <option value="${result[1].id}">[${result[1].address.country.name}] ${result[1].name} (${result[0]})</option>
                      </c:forEach>
		</select>    
		</div>
	</taconite-replace>
</taconite-root>
