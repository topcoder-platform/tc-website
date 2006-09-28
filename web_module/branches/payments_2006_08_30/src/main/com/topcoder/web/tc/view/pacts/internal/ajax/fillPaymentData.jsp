<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="payment" value="${requestScope.payment}"/>

<taconite-root xml:space="preserve">

 <taconite-replace-children contextNodeID="runJS" parseInBrowser="true">     
		<script type="text/javascript">
        document.f.payment_desc.value = '<c:out value="${payment.description}" />';
		document.f.date_due.value = '<c:out value="${payment.dueDate}" />';
var st = '<c:out value="${payment.statusId}" />';
    </script>
</taconite-replace-children>      
 </taconite-root>
 