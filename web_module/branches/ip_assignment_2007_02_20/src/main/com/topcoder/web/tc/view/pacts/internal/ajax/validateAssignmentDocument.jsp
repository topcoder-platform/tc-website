<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="errorsTr" parseInBrowser="true">
		<tr id="errorsTr">
	        <td colspan="2">
    	    	<tc-webtag:errorIterator id="err" name="error">
    	    		<font color="#FF0000"><%=err%></font><br/>
    	    	</tc-webtag:errorIterator>
        	</td>
        </tr>
     </taconite-replace>
     <c:if test="${validationResult.valid}">
        <taconite-redirect parseInBrowser="true" targetUrl="http://taconite.sf.net/" />
    </c:if>
 </taconite-root>
 