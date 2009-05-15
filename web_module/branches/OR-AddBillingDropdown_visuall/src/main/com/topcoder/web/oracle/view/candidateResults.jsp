<%@ page import="com.topcoder.web.oracle.model.CandidateProperty" %>
<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/coders.css">
    <script language="JavaScript" type="text/javascript" src="/js/oracle/popup.js"></script>
    <script language="JavaScript" type="text/javascript"><!--
    function postToViewer(mySrc) {
        document.getElementById("viewer").src = mySrc;
    }

    function hideViewer() {
        document.getElementById("viewerpopup").style.display = "none";
    }
    //-->
    </script>
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

            <div style="margin-bottom: 20px;">
                <A href="/"><img src="/i/oracle/layout/topcoder.png" alt="TopCoder" /></A>
            </div>

            <jsp:include page="nav.jsp" >
            <jsp:param name="selectedTab" value="${room.id}Cand"/>
            </jsp:include>

            <%--
            <p><strong>${room.round.contest.name} &gt; ${room.round.name} &gt; Candidate Results</strong></p>
            --%>

            <div id="bodyColumn">

                <div class="pagingBox">
                    |
                    <c:forEach items="${room.round.rooms}" var="myRoom">
                        <c:choose>
                            <c:when test="${room.id==myRoom.id}">
                                ${myRoom.name}
                            </c:when>
                            <c:otherwise>
                                <A href="?module=ViewCandidateResults&amp;<%=Constants.ROOM_ID%>=${myRoom.id}">${myRoom.name}</A>
                            </c:otherwise>
                        </c:choose>
                    |
                    </c:forEach>
                </div>
    
                <div align="center">
                    <ul id="candidateBin" class="imageLineup">
    
                        <c:set value="<%=CandidateProperty.IMAGE_SOURCE%>" var="imageSource"/>
                        <c:set value="<%=CandidateProperty.DOWNLOAD_URL%>" var="downloadUrl"/>
                        
                    <c:forEach items="${results}" var="result">
    
                        <li style="float: none;">
    
                            <c:if test="${!empty result.candidate.infoMap[downloadUrl]}">
                                <div class="save">
                                    <A target="_blank" href="${result.candidate.infoMap[downloadUrl]}"><img
                                            src="/i/oracle/interface/disk.png" alt="DL"/></A>
                                </div>
                            </c:if>
                                <div class="place">
                                    ${result.placed}
                                </div>
                            <img class="small" name="candidateImage"
                                 src="${result.candidate.infoMap[imageSource]}" alt=""
                                 onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');"
                                 onMouseOut="popHide()" onMouseDown="hideViewer()"
                                 style="cursor: default;"/>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="popUp" id="viewerpopup"><img src="#" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>

            </div>

        <div style="clear:both;">&nbsp;</div>
        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>