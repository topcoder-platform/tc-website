<%@page contentType="text/xml;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<fmt:requestEncoding value="utf-8"/>

<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="errorDiv" parseInBrowser="true">
    	<div id="errorDiv">    
                 <tc-webtag:errorIterator id="err" name="error">
                    <font color="#FF0000"><%=err%></font><br/>
                </tc-webtag:errorIterator>
         </div>
    
	</taconite-replace>
    <taconite-replace contextNodeID="searchResults" parseInBrowser="true">
    				<div id="searchResults">
    
		<select multiple="true" size="15" style="width: 600px;" name="school" ondblclick="schoolDoubleClick()">					
                      <c:forEach items="${requestScope.schools}" var="result">
                         <option value="${result[1].id}">[<c:out value="${result[1].address.country.name}"/>] <c:out value="${result[1].name}"/> (${result[0]})</option>
                         
                      </c:forEach>
		</select>    
		</div>
	</taconite-replace>
</taconite-root>