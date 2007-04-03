<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page import="com.topcoder.web.oracle.model.RoundProperty" %>
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
<div id="contentOut" class="contentOut">
<jsp:include page="../top.jsp">
    <jsp:param name="section" value="admin"/>
</jsp:include>
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">back to
    Contests</A></div>

<h1>Provisional Results</h1>

<div class="header">Provisional Results</div>


    <c:forEach items="${rooms}" var="room">
<h3>${room.name}</h3>
<table cellpadding="0" cellspacing="0" class="input">
<tbody>

    <c:forEach items="${results[room.id]}" var="result">

<tr>
    <td class="name">
<c:if test="${!empty result.candidate.infoMap[downloadUrl]}">
                                    <div class="save">
                                        <A target="_blank" href="${result.candidate.infoMap[downloadUrl]}"><img
                                                src="/i/oracle/interface/disk.png" alt="DL"/></A>
                                    </div>
                                </c:if>
                                <img class="small" name="candidateImage"
                                     src="${result.candidate.infoMap[imageSource]}" alt="" onclick="select(this)"
                                     onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');"
                                     onMouseOut="popHide()" onMouseDown="hideViewer()"
                                     style="cursor: default;" />
    </td>
    <td class="value" width="100%">
        ${result.correctValue}
    </td>
</tr>
    </c:forEach>

</tbody>
</table>

    </c:forEach>



</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="../foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>