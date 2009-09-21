<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<c:set value="<%=Constants.PAPER_TERMS%>" var="PAPER_TERMS"/>
<c:set value="${requestScope[PAPER_TERMS]}" var="paperTerms"/>

<ul>
    <li>
        <c:forEach var="term" items="${paperTerms}">
            <c:out value="${term.title}"/> <a href="${term.url}">(Download)</a>
        </c:forEach>
    </li>
</ul>

<p>
    You cannot agree to these terms electronically. You must print the terms and send a signed hard copy to TopCoder.
    You can get a printer friendly version by clicking "Donwload" link.
</p>

<p>
    For submission by <b>email</b>, send a clear and legible scan or photo of the entire page (completed, signed, and
    dated) as an attachment to member-agreements@topcoder.com.  For submission by <b>fax</b>, you may fax the completed,
    signed, and dated form (without a cover sheet) to: (US) +1 (860) 631-1027.  For submission by <b>mail</b>, send the
    completed, signed, and dated form to: Attention: Legal Department, TopCoder, Inc., 95 Glastonbury Blvd.,
    Glastonbury, CT 06033.
</p>
