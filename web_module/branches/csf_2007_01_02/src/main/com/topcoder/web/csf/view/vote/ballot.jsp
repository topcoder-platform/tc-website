<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>

    <script type="text/javascript">
    </script>

    <style type="text/css">
    </style>

</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="../top.jsp"/>

<jsp:include page="../primaryNav.jsp">
    <jsp:param name="selectedTab" value="competitions"/>
</jsp:include>

<div id="main">
<div class="pageHeader">
    <span class="pageName">Vote</span>
</div>

<%----------------------------------------------------------------------------------------%>

<div align="center" style="margin: 20px;">
    Please rank the candidates below from best to worst.
    <br>
    You do not need to rank every candidate, only the ones you want.
    <br>
    When you're done, click the <strong>Submit my vote</strong> button on bottom.
</div>

<table id="ranked" class="stat" style="width: 100%; margin-bottom: 0px;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="5"><span class="title">My Vote</span></td>
    </tr>
    <tr>
        <td class="headerC">
            <div style="width: 45px;">Rank</div>
        </td>
        <td class="header" width="100%">
            Candidate
        </td>
        <td class="headerC" nowrap="nowrap">
            <div style="width: 80px;">Move Up /<br>Move Down</div>
        </td>
        <td class="headerC" nowrap="nowrap">
            <div style="width: 56px;">Move to<br>Top</div>
        </td>
        <td class="headerC" nowrap="nowrap">
            <div style="width: 62px;">Remove</div>
        </td>
    </tr>
</thead>
<tbody>
<%--
<tr class="light">
    <td class="valueC">
        <strong>1</strong>
    </td>
    <td class="value" nowrap="nowrap">
        ABCDEFGHIJKLMNOPQRSTUVWXYZ
        <a href="" target="_blank"><img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/></a>
    </td>
    <td class="valueC">
        <div style="margin: 2px;" align="center">
            <img src="/i/layout/btnMoveUpNA.png" alt="Move up"/>
        </div>
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';"/></a>
        </div>
    </td>
    <td class="valueC">
        <img src="/i/layout/btnMoveToTopNA.png" alt="Move to top"/>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveOut.png" alt="Remove" onmouseover="this.src = '/i/layout/btnMoveOutOn.png';" onmouseout="this.src = '/i/layout/btnMoveOut.png';"/></a>
    </td>
</tr>
<tr class="dark">
    <td class="valueC">
        <strong>2</strong>
    </td>
    <td class="value" nowrap="nowrap">
        Movie maps
        <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
        </a>
    </td>
    <td class="valueC">
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></a>
        </div>
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';"/></a>
        </div>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></a>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveOut.png" alt="Remove" onmouseover="this.src = '/i/layout/btnMoveOutOn.png';" onmouseout="this.src = '/i/layout/btnMoveOut.png';"/></a>
    </td>
</tr>
<tr class="light">
    <td class="valueC">
        <strong>3</strong>
    </td>
    <td class="value" nowrap="nowrap">
        ABCDEFGHIJKLMNOPQRSTUVWXYZ
        <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
        </a>
    </td>
    <td class="valueC">
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></a>
        </div>
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';"/></a>
        </div>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></a>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveOut.png" alt="Remove" onmouseover="this.src = '/i/layout/btnMoveOutOn.png';" onmouseout="this.src = '/i/layout/btnMoveOut.png';"/></a>
    </td>
</tr>
<tr class="dark">
    <td class="valueC">
        <strong>4</strong>
    </td>
    <td class="value" nowrap="nowrap">
        Movie maps
        <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
        </a>
    </td>
    <td class="valueC">
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></a>
        </div>
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';"/></a>
        </div>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></a>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveOut.png" alt="Remove" onmouseover="this.src = '/i/layout/btnMoveOutOn.png';" onmouseout="this.src = '/i/layout/btnMoveOut.png';"/></a>
    </td>
</tr>
<tr class="light">
    <td class="valueC">
        <strong>5</strong>
    </td>
    <td class="value" nowrap="nowrap">
        Movie maps
        <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
        </a>
    </td>
    <td class="valueC">
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></a>
        </div>
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';"/></a>
        </div>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></a>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveOut.png" alt="Remove" onmouseover="this.src = '/i/layout/btnMoveOutOn.png';" onmouseout="this.src = '/i/layout/btnMoveOut.png';"/></a>
    </td>
</tr>
<tr class="dark">
    <td class="valueC">
        <strong>6</strong>
    </td>
    <td class="value" nowrap="nowrap">
        Movie maps
        <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
        </a>
    </td>
    <td class="valueC">
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></a>
        </div>
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';"/></a>
        </div>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></a>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveOut.png" alt="Remove" onmouseover="this.src = '/i/layout/btnMoveOutOn.png';" onmouseout="this.src = '/i/layout/btnMoveOut.png';"/></a>
    </td>
</tr>
<tr class="light">
    <td class="valueC">
        <strong>7</strong>
    </td>
    <td class="value" nowrap="nowrap">
        ABCDEFGHIJKLMNOPQRSTUVWXYZ
        <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
        </a>
    </td>
    <td class="valueC">
        <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></a>
        </div>
        <div style="margin: 2px;" align="center">
            <img src="/i/layout/btnMoveDownNA.png" alt="Move down"/>
        </div>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></a>
    </td>
    <td class="valueC">
        <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveOut.png" alt="Remove" onmouseover="this.src = '/i/layout/btnMoveOutOn.png';" onmouseout="this.src = '/i/layout/btnMoveOut.png';"/></a>
    </td>
</tr>
--%>
</table>
<%-- table for the disabled candidates --%>
<table id="unranked" class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
    <tbody>
        <c:forEach items="${candidates}" var="candidate">

            <tr class="disabled">
                <td class="valueC">
                    not ranked
                </td>
                <td class="value" nowrap="nowrap">
                    ${candidate.name}
                    <a href="" target="_blank">
                        <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()"/>
                    </a>
                </td>
                <td class="valueC">
                    <div style="margin: 2px;" align="center">
                        <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></a>
                    </div>
                    <div style="margin: 2px;" align="center">
                        <img src="/i/layout/btnMoveDownNA.png" alt="Move down"/>
                    </div>
                </td>
                <td class="valueC">
                    <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></a>
                </td>
                <td class="valueC">
                    <img src="/i/layout/btnMoveOutNA.png" alt="Remove"/>
                </td>
            </tr>

</c:forEach>
    </tbody>
    <%-- This row is required to space out the disabled table the same as the enabled table --%>
    <tfoot>
        <tr>
            <td>
                <div style="width: 45px;"><img src="/i/clear.png" alt=""/></div>
            </td>
            <td width="100%">
            </td>
            <td>
                <div style="width: 80px;"><img src="/i/clear.png" alt=""/></div>
            </td>
            <td>
                <div style="width: 56px;"><img src="/i/clear.png" alt=""/></div>
            </td>
            <td>
                <div style="width: 62px;"><img src="/i/clear.png" alt=""/></div>
            </td>
        </tr>
    </tfoot>
</table>

<%-- MAGNIFYING GLASS POPUP --%>
<div id="magglassPopup" class="popUp">
    <div>View full submission</div>
</div>

<div align="center" style="margin:20px;">
    Are you done ranking the candidates?
    <div align="center" style="margin-top:10px;">
        <A href="" class="button" style="width: 160px;">Submit my vote</A>
    </div>
</div>

</div>

<jsp:include page="../foot.jsp"/>
</div>
</div>

</body>
</html>