<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<c:choose>
    <c:when test="${param['clip']=='ep1'}">
        <strong>Episode 1</strong>
        (<tc-webtag:forumLink forumID="515804" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />00:48 News
            <br />06:09 Education: Code Coverage Tools
            <br />11:21 Human Interest
        </div>
    </c:when>
    <c:otherwise>
        <a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep1">Episode 1</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep2' || param['clip']==null}">
        <br /><strong>Episode 2</strong>
        (<tc-webtag:forumLink forumID="516246" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />00:40 News
            <br />03:38 Education: Feedback
            <br />05:29 Education: TheFaxman Interview
            <br />08:29 Human Interest
            <br />13:30 Viewer Email
            <br /><a href="/movies/tcchannel/ep2.mov">Low-bandwidth version</a>
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep2">Episode 2</a>
    </c:otherwise>
</c:choose>
