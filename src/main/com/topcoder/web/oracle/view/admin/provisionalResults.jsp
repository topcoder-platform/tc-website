<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page import="com.topcoder.web.oracle.model.CandidateProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
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

                <h1>Provisional Results</h1>

                <c:set value="<%=CandidateProperty.IMAGE_SOURCE%>" var="imageSource"/>
                <c:set value="<%=CandidateProperty.DOWNLOAD_URL%>" var="downloadUrl"/>
                    <table cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                        <tr>
                <c:forEach items="${rooms}" var="room">
                            <td valign="top" align="center">
                            <h3>${room.name}</h3>
                            <ul id="candidateBin" class="imageLineup">
                            <c:forEach items="${results[room.id]}" var="result">
                                <li style="float: none;">
                                    <c:if test="${!empty result.candidate.infoMap[downloadUrl]}">
                                        <div class="save">
                                            <A target="_blank" href="${result.candidate.infoMap[downloadUrl]}"><img
                                                    src="/i/oracle/interface/disk.png" alt="DL"/></A>
                                        </div>
                                    </c:if>
                                        <div class="place">
                                            ${result.correctValue}
                                        </div>
                                    <img class="small" name="candidateImage"
                                         src="${result.candidate.infoMap[imageSource]}" alt=""
                                         onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');"
                                         onMouseOut="popHide()" onMouseDown="hideViewer()"
                                         style="cursor: default;"/>
                                </li>
                            </c:forEach>
                            </ul>
                            </td>
                </c:forEach>
                        </tr>
                    </tbody>
                    </table>
                    <div class="popUp" id="viewerpopup"><img src="#" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>


        <div style="clear:both;">&nbsp;</div>
        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>