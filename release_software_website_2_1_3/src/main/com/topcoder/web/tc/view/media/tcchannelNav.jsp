<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


<c:choose>
    <c:when test="${param['clip']=='tco08_25' || param['clip']==null}">
        <br /><strong>2008 TopCoder Open</strong>
        (<tc-webtag:forumLink forumID="517604" message="discuss" />)
        <div style="margin-left: 10px;">
            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=movies">See all the videos from the TCO08!</a>
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=tco08_25">2008 TopCoder Open</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep07'}">
        <br /><strong>Episode 7</strong>
        (<tc-webtag:forumLink forumID="518706" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />00:34 News
            <br />01:34 Dynamic Programming (by <tc-webtag:handle coderId="10407399" context="algorithm"/>)
            <br />09:25 Behind the Handle: <tc-webtag:handle coderId="8472826" context="algorithm"/> (by <tc-webtag:handle coderId="15006955" context="algorithm"/>)
            <br />14:20 TC Trivia
            <br /><a href="/movies/tcchannel/ep07.wmv">Low-bandwidth version</a>
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep07">Episode 7</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep06_part3'}">
        <br /><strong>TC Channel at the TCCC07 Part 3</strong>
        (<tc-webtag:forumLink forumID="517933" message="discuss" />)
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep06_part3">TC Channel at the TCCC07 Part 3</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep06_part2'}">
        <br /><strong>TC Channel at the TCCC07 Part 2</strong>
        (<tc-webtag:forumLink forumID="517933" message="discuss" />)
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep06_part2">TC Channel at the TCCC07 Part 2</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep06_part1'}">
        <br /><strong>TC Channel at the TCCC07 Part 1</strong>
        (<tc-webtag:forumLink forumID="517933" message="discuss" />)
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep06_part1">TC Channel at the TCCC07 Part 1</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep06_trailer'}">
        <br /><strong>TC Channel is Going to Disney World</strong>
        (<tc-webtag:forumLink forumID="517933" message="discuss" />)
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep06_trailer">TC Channel is Going to Disney World</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep05'}">
        <br /><strong>Episode 5</strong>
        (<tc-webtag:forumLink forumID="517575" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />00:48 News
            <br />03:36 Member Profile: <tc-webtag:handle coderId="8511003" context="algorithm"/>
            <br />09:07 Show Us Your Station
            <br />12:14 Edu-tainment
            <br />20:42 TC Trivia
            <br /><a href="/movies/tcchannel/ep05.mov">Low-bandwidth version</a>
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep05">Episode 5</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep04'}">
        <br /><strong>Episode 4</strong>
        (<tc-webtag:forumLink forumID="517192" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />00:32 Wu Cracks Top 40/40
            <br />02:36 TCCC Underway	
            <br />03:06 Tomek TV
            <br />05:59 Equitrader Tourney
            <br />06:17 Welcome Ira Heffan
            <br />06:37 Education: Configuration API & Configuration Persistence
            <br /><a href="/movies/tcchannel/ep04.mov">Low-bandwidth version</a>
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep04">Episode 4</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep03'}">
        <br /><strong>Episode 3</strong>
        (<tc-webtag:forumLink forumID="516708" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />02:05 TCO07 Webcast Highlights
            <br />03:52 Algorithm Competitor Intros
            <br />13:27 System Test Results
            <br />15:44 Interview with <tc-webtag:handle coderId="309453" context="algorithm"/>
            <br /><a href="/movies/tcchannel/ep03.mov">Low-bandwidth version</a>
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep03">Episode 3</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep02'}">
        <br /><strong>Episode 2</strong>
        (<tc-webtag:forumLink forumID="516246" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />00:40 News
            <br />03:38 Education: Feedback
            <br />05:29 Education: TheFaxman Interview
            <br />08:29 Human Interest
            <br />13:30 Viewer Email
            <br /><a href="/movies/tcchannel/ep02.mov">Low-bandwidth version</a>
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep02">Episode 2</a>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='ep01'}">
        <br /><strong>Episode 1</strong>
        (<tc-webtag:forumLink forumID="515804" message="discuss" />)
        <div style="margin-left: 10px;">
            00:00 Introduction
            <br />00:48 News
            <br />06:09 Education: Code Coverage Tools
            <br />11:21 Human Interest
        </div>
    </c:when>
    <c:otherwise>
        <br /><a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep01">Episode 1</a>
    </c:otherwise>
</c:choose>
