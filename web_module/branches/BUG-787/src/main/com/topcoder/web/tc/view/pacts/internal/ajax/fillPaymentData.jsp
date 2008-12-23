<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<taconite-root xml:space="preserve">

 <taconite-replace-children contextNodeID="runJS" parseInBrowser="true">     
		<script type="text/javascript">
		setDescription('<c:out value="${requestScope.description}" />');
		setDueDate('<c:out value="${requestScope.dueDate}" />');
		setDesign(<c:out value="${requestScope.isDesign}" />);
    </script>
</taconite-replace-children>      
 </taconite-root>
 