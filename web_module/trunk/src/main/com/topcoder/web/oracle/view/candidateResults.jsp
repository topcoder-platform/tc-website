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

            <h1>TopCoder Homepage Design > Candidate Results</h1>

            <div class="pagingBox">
                Room 1
                | <A href="?module=Static&d1=results&d2=tcdotcomCandRd1Rm2">Room 2</A>
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

        <div style="clear:both;">&nbsp;</div>
        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>