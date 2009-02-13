<%@ page import="com.topcoder.web.oracle.model.CandidateProperty" %>
<%@ page import="com.topcoder.web.oracle.model.RoundProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=RoundProperty.MAX_SELECTED_CANDIDATES%>" var="maxCandidatesKey"/>
<c:set value="${room.round.configMap[maxCandidatesKey]}" var="maxCandidates"/>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
    <style type="text/css">
        html {
            min-height: 100%;
            margin-bottom: 1px;
        }
    </style>
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

            <h1>You have already competed.</h1>

            <div align="center" style="margin: 40px 0px 100px 0px;">
                <p align="center">You have already made your prediction for this contest.<br>Here it is:</p>

                <div class="selectedContainer" style="width: ${maxCandidates*61}px;">
                    <img src="/i/oracle/interface/meterBest.png" alt="" style="position: absolute; top: 0px; left: -30px;"/>
                    <img src="/i/oracle/interface/meterWorst.png" alt="" style="position: absolute; top: 0px; left: ${maxCandidates*61-45}px;"/>

                    <ul id="selectedCandidates" class="imageLineup" style="margin: 0px; float: left;">

                        <c:set value="<%=CandidateProperty.IMAGE_SOURCE%>" var="imageSource"/>
                        <c:set value="<%=CandidateProperty.DOWNLOAD_URL%>" var="downloadUrl"/>
                        <c:forEach items="${predictions}" var="prediction">
                            <li>
                                <c:if test="${!empty prediction.candidate.infoMap[downloadUrl]}">
                                    <div class="save">
                                        <A target="_blank" href="${prediction.candidate.infoMap[downloadUrl]}"><img
                                                src="/i/oracle/interface/disk.png" alt="DL"/></A>
                                    </div>
                                </c:if>
                                <img class="small" name="candidateImage"
                                     src="${prediction.candidate.infoMap[imageSource]}" alt=""
                                     onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');"
                                     onMouseOut="popHide()" onMouseDown="hideViewer()"
                                     style="cursor: default;" />
                            </li>
                        </c:forEach>

                    </ul>

                </div>
            </div>

            <div class="popUp" id="viewerpopup">
                <img src="#" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>

            <div style="clear:both;">&nbsp;</div>


            <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>