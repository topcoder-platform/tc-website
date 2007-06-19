<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${param['clip']=='ep1'}">
        Episode 1 >>
    </c:when>
    <c:otherwise>
        <a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep1">Episode 1</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep2'}">
        <br />Episode 2 >>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep2">Episode 2</a>
    </c:otherwise>
</c:choose>
