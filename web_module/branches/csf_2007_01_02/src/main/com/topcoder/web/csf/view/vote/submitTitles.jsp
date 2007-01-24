<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <link type="text/css" rel="stylesheet" href="/css/main.css">
    <link type="text/css" rel="stylesheet" href="/css/stats.css">
    <script type="text/javascript" src="../js/popup.js"></script>

    <script type="text/javascript">
    </script>

    <style type="text/css">
    </style>

</head>

<body>

<div style="margin: 2px;" align="center">
    <div id="contentOut" class="contentOut">
        <div id="contentIn" class="contentIn">
            <div class="contentSpacer">
                <h1>Vote</h1>

<div align="center" style="margin: 20px;">
Please rank the candidates below from best to worst.<br>Only the <span class="bigGreen">Top 5</span> will be counted.<br>When you're done, click the <strong>Submit my vote</strong> button on bottom.
</div>

<table class="stat" style="width: 740px;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="5">My Favorites</td>
    </tr>
    <tr>
        <td class="headerC" colspan="2">
            Rank
        </td>
        <td class="header" width="100%">
            Submission
        </td>
        <td class="headerC" nowrap="nowrap">
            Move Up /<br>Move Down
        </td>
        <td class="headerC" nowrap="nowrap">
            Move to<br>Top
        </td>
    </tr>
</thead>
<tbody id="submissions">
    <tr class="highlightLt">
        <td class="topN" rowspan="5" style="background: #006600;">Top 5</td>
        <td class="valueC">
            1
        </td>
        <td class="value" nowrap="nowrap">
            ABCDEFGHIJKLMNOPQRSTUVWXYZ
            <a href="" target="_blank"><img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" /></a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <img src="/i/layout/btnMoveUpNA.png" alt="Move up" />
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <img src="/i/layout/btnMoveToTopNA.png" alt="Move to top" />
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="highlightDk">
        <td class="valueC">
            2
        </td>
        <td class="value" nowrap="nowrap">
            Movie maps
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="highlightLt">
        <td class="valueC">
            3
        </td>
        <td class="value" nowrap="nowrap">
            ABCDEFGHIJKLMNOPQRSTUVWXYZ
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="highlightDk">
        <td class="valueC">
            4
        </td>
        <td class="value" nowrap="nowrap">
            Movie maps
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="highlightLt">
        <td class="valueC">
            5
        </td>
        <td class="value" nowrap="nowrap">
            Movie maps
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="dark">
        <td class="nottopN" rowspan="10">&nbsp;</td>
        <td class="valueC">
            6
        </td>
        <td class="value" nowrap="nowrap">
            Movie maps
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="light">
        <td class="valueC">
            7
        </td>
        <td class="value" nowrap="nowrap">
            ABCDEFGHIJKLMNOPQRSTUVWXYZ
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="dark">
        <td class="valueC">
            8
        </td>
        <td class="value" nowrap="nowrap">
            Movie maps
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="light">
        <td class="valueC">
            9
        </td>
        <td class="value" nowrap="nowrap">
            ABCDEFGHIJKLMNOPQRSTUVWXYZ
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';" /></a>
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToBottom.png" alt="Move to bottom" onmouseover="this.src = '/i/layout/btnMoveToBottomOn.png';" onmouseout="this.src = '/i/layout/btnMoveToBottom.png';" /></a>
            </div>
        </td>
    </tr>
    <tr class="dark">
        <td class="valueC">
            10
        </td>
        <td class="value" nowrap="nowrap">
            Movie maps
            <a href="" target="_blank">
            <img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'magglassPopup')" onmouseout="popHide()" />
            </a>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <img src="/i/layout/btnMoveDownNA.png" alt="Move down" />
            </div>
        </td>
        <td class="valueC">
            <div style="margin: 2px;" align="center">
            <a href="#" onclick="layout" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';" /></a>
            </div>
            <div style="margin: 2px;" align="center">
            <img src="/i/layout/btnMoveToBottomNA.png" alt="Move to bottom" />
            </div>
        </td>
    </tr>
</table>
<%-- MAGNIFYING GLASS POPUP --%>
<div id="magglassPopup" class="popUp"><div>View submission</div></div>

<div align="center" style="margin:20px;">
    Are you done ranking the candidates?
    <div align="center" style="margin-top:10px;">
        <A href="" class="bigButton" style="width: 160px;">Submit my vote</A>
    </div>
</div>


            </div>
        </div>
        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>