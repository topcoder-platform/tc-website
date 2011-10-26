<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


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

var srcBtnUp = '/i/layout/btnMoveUp.png';
var srcBtnUpOn = '/i/layout/btnMoveUpOn.png';
var srcBtnDown = '/i/layout/btnMoveDown.png';
var srcBtnDownOn = '/i/layout/btnMoveDownOn.png';
var srcBtnUpNA = '/i/layout/btnMoveUpNA.png';
var srcBtnDownNA = '/i/layout/btnMoveDownNA.png';

var srcBtnTop = '/i/layout/btnMoveToTop.png';
var srcBtnTopOn = '/i/layout/btnMoveToTopOn.png';
var srcBtnTopNA = '/i/layout/btnMoveToTopNA.png';

var srcBtnOut = '/i/layout/btnMoveOut.png';
var srcBtnOutOn = '/i/layout/btnMoveOutOn.png';

var srcUpDiv = '<div style="margin: 2px;" align="center"><a href="javascript:void(0)" onclick="up(this)" onfocus="this.blur();"><img src="' + srcBtnUp + '" name="upButton" alt="Move up" onmouseover="this.src = \'' + srcBtnUpOn + '\';" onmouseout="mouseOutUp(this)"/><\/a><\/div>';
var srcDownDiv = '<div style="margin: 2px;" align="center"><a href="javascript:void(0)" onclick="down(this)" onfocus="this.blur();"><img src="' + srcBtnDown + '" name="downButton" alt="Move down" onmouseover="this.src = \'' + srcBtnDownOn + '\';" onmouseout="mouseOutDown(this)"/><\/a><\/div>';
var srcTopDiv = '<div style="margin: 2px;" align="center"><a href="javascript:void(0)" onclick="top(this)" onfocus="this.blur();"><img src="' + srcBtnTop + '" name="topButton" alt="Move to top" onmouseover="this.src = \'' + srcBtnTopOn + '\';" onmouseout="this.src = \'' + srcBtnTop + '\';"/><\/a><\/div>';

var srcTopNA = '<img src="' + srcBtnTopNA + '" alt="Move to top"/>';

var srcDownNA = '<div style="margin: 2px;" align="center"><img src="' + srcBtnDownNA + '" alt="Move down"\/><\/div>';
var srcUpNA = '<div style="margin: 2px;" align="center"><img src="' + srcBtnUpNA + '" alt="Move up"\/><\/div>';

var srcBtnOutCell = '<a href="javascript:void(0)" onclick="remove(this)" onfocus="this.blur();"><img src="' + srcBtnOut + '" alt="Remove" onmouseover="this.src = \'' + srcBtnOutOn + '\';" onmouseout="this.src = \'' + srcBtnOut + '\';"/><\/a>';
var srcBtnOutNA = '<img src="/i/layout/btnMoveOutNA.png" alt="Remove"\/>';


/**
 * find the first parent row of element
 */
function findRow(element) {
    while (element.tagName != 'BODY') {
        if (element.tagName == 'TR') {
            return element;
        } else {
            element = element.parentNode;
        }
    }
    return null;
}

/**
 * swap the the given two rows
 */
function swap(row1, row2) {
    if (row1.parentNode.tagName == 'TBODY' && row2.parentNode == row1.parentNode && row1 != row2) {
        var body = row1.parentNode;
        var idx1, idx2;
        for (var i = 0; i < body.rows.length && (idx1 == null || idx2 == null); i++) {
            if (body.rows[i] == row1) {
                idx1 = i;
            } else if (body.rows[i] == row2) {
                idx2 = i;
            }
        }
        var temp;
        //we only really need to swap the data, the buttons and all can remain as they are
        temp = row2.cells[1].innerHTML;
        row2.cells[1].innerHTML = row1.cells[1].innerHTML;
        row1.cells[1].innerHTML = temp;

        temp = row2.id;
        row2.id = row1.id;
        row1.id = temp;
    }
}

/**
 * find an image whose source is src that is a child of element
 */
function findChildImage(element, src) {
    for (var i = 0; i < element.childNodes.length; i++) {
        if (element.childNodes[i].tagName == 'IMG' && element.childNodes[i].src == src) {
            return element.childNodes[i];
        } else {
            var ret = findChildImage(element.childNodes[i], src);
            if (ret != null) {
                return ret;
            }
        }
    }
    return null;

}

function mouseOutDown(element) {
    element.src = srcBtnDown;
}
function mouseOutUp(element) {
    element.src = srcBtnUp;
}
function mouseOutTop(element) {
    element.src = srcBtnTop;
}

/**
 * move a row up one spot.
 * element - an element that is a child of the row to be moved up
 */
function up(element) {
    var row = findRow(element);
    if (isUnRanked(element)) {
        reRank(element, document.getElementById("rankedBody").rows.length);
    } else if (isRanked(element)) {
        if (row.parentNode.tagName == 'TBODY') {
            var body = row.parentNode;
            for (var i = 1; i < body.rows.length; i++) {
                if (body.rows[i] == row) {
                    swap(row, body.rows[i - 1]);
                    var image = findChildImage(body.rows[i - 1], srcBtnUpOn);
                    if (image) {
                        mouseOutUp(image);
                    }
                    return;
                }
            }
        }
    }

}


/**
 * move a row down one spot.
 * element - an element that is a child of the row to be moved up
 */
function down(element) {
    var row = findRow(element);
    if (row.parentNode.tagName == 'TBODY') {
        var body = row.parentNode;
        for (var i = 0; i < body.rows.length - 1; i++) {
            if (body.rows[i] == row) {
                swap(row, body.rows[i + 1]);
                var image = findChildImage(body.rows[i + 1], srcBtnDownOn);
                if (image) {
                    mouseOutDown(image);
                }
                return;
            }
        }
    }
}

/**
 * Move a row from it's current position to another.
 */

function reRank(element, idx) {
    var row = findRow(element);
    var rankedBody = document.getElementById("rankedBody");
    var tr = rankedBody.insertRow(idx);
    var td;
    for (var j = 0; j < 2; j++) {
        td = tr.insertCell(tr.cells.length);
        if (j == 1) {
            //only need to copy the data, the rest will be taken care of in the refresh
            td.innerHTML = row.cells[j].innerHTML;
        }
    }
    tr.id = row.id;

    //look around and delete the old row from the ranked table
    var found = false;
    for (var i = 1; i < rankedBody.rows.length && !found; i++) {
        if (rankedBody.rows[i] == row) {
            found = true;
            rankedBody.deleteRow(i);
        }
    }

    //if it wasn't a ranked row, perhaps it was an unranked one
    var unRankedBody = document.getElementById("unRankedBody");
    for (var i = 0; i < unRankedBody.rows.length; i++) {
        if (unRankedBody.rows[i] == row) {
            unRankedBody.deleteRow(i);
        }
    }

    refreshRanked(rankedBody);
}

/**
 * move a row to the top.
 * element - an element that is a child of the row to be moved up
 */
function top(element) {
    reRank(element, 0);
}


function remove(element) {
    var row = findRow(element);
    if (isRanked(row)) {
        var rankedBody = document.getElementById("rankedBody");
        for (var i = 0; i < rankedBody.rows.length; i++) {
            if (rankedBody.rows[i] == row) {
                var unRankedBody = document.getElementById("unRankedBody");
                var newRow = unRankedBody.insertRow(unRankedBody.rows.length);
                newRow.id = row.id;
                var tdRank = newRow.insertCell(newRow.cells.length);
                tdRank.innerHTML = 'not ranked';
                var tdData = newRow.insertCell(newRow.cells.length);
                tdData.innerHTML = row.cells[1].innerHTML;
                rankedBody.deleteRow(i);
                refreshUnRanked(unRankedBody);
                refreshRanked(rankedBody);
            }
        }
    }
}


var styles = ["valueC", "value", "valueC", "valueC", "valueC"];
var nowraps = [null, null, null, null, null];
/**
 * refresh presentation after data/structure changes
 */
function refreshRanked(body) {
    var tr, td, tdUpDown,tdTop,tdRemove;

    for (var i = 0; i < body.rows.length; i++) {
        tr = body.rows[i];
        //have to do it this way because of non standard IE when using setAttribute
        tr.className = i % 2 == 0 ? "light" : "dark";
        if (tr.cells.length == 2) {
            tdUpDown = tr.insertCell(tr.cells.length);
            tdTop = tr.insertCell(tr.cells.length);
            tdRemove = tr.insertCell(tr.cells.length);
        } else {
            tdUpDown = tr.cells[2];
            tdTop = tr.cells[3];
            tdRemove = tr.cells[4];
        }
        if (i == 0) {
            tdUpDown.innerHTML = srcUpNA + (body.rows.length == 1 ? srcDownNA : srcDownDiv);
            tdTop.innerHTML = srcTopNA;
            tdRemove.innerHTML = srcBtnOutCell;
        } else if (i == body.rows.length - 1) {
            tdUpDown.innerHTML = (body.rows.length == 1 ? srcUpNA : srcUpDiv) + srcDownNA;
            tdTop.innerHTML = body.rows.length == 1 ? srcTopNA : srcTopDiv;
            tdRemove.innerHTML = srcBtnOutCell;
        } else {
            tdUpDown.innerHTML = srcUpDiv + srcDownDiv;
            tdTop.innerHTML = srcTopDiv;
            tdRemove.innerHTML = srcBtnOutCell;
        }

        for (var j = 0; j < tr.cells.length; j++) {
            td = tr.cells[j];
            if (j == 0) {
                //rerank the rows
                td.innerHTML = i + 1;
            }
            if (styles[j]) {
                td.className = styles[j];
            }
            if (nowraps[j]) {
                td.setAttribute("nowrap", nowraps[j]);
            }
        }
    }
}

/**
 * refresh presentation after data/structure changes
 */
function refreshUnRanked(body) {
    var tr, td, tdUpDown,tdTop,tdRemove;
    for (var i = 0; i < body.rows.length; i++) {
        tr = body.rows[i];
        tr.className = "disabled";
        if (tr.cells.length == 2) {
            tdUpDown = tr.insertCell(tr.cells.length);
            tdTop = tr.insertCell(tr.cells.length);
            tdRemove = tr.insertCell(tr.cells.length);
        } else {
            tdUpDown = tr.cells[2];
            tdTop = tr.cells[3];
            tdRemove = tr.cells[4];
        }
        tdUpDown.innerHTML = srcUpDiv + srcDownNA;
        tdTop.innerHTML = srcTopDiv;
        tdRemove.innerHTML = srcBtnOutNA;

        for (var j = 0; j < tr.cells.length; j++) {
            td = tr.cells[j];
            if (styles[j]) {
                td.className = styles[j];
            }
            if (nowraps[j]) {
                td.setAttribute("nowrap", nowraps[j]);
            }
        }
    }
}


function isRanked(element) {
    while (element && element.tagName != 'BODY') {
        if (element.tagName == 'TABLE') {
            return element.id == 'ranked';
        } else {
            element = element.parentNode;
        }
    }
    return null;
}

function isUnRanked(element) {
    while (element && element.tagName != 'BODY') {
        if (element.tagName == 'TABLE') {
            return element.id == 'unranked';
        } else {
            element = element.parentNode;
        }
    }
    return null;
}


function submit() {
    var candidates = '';
    var rankedRows;
    rankedRows = document.getElementById("rankedBody").rows;
    for (var i = 0; i < rankedRows.length; i++) {
        if (i < rankedRows.length - 1) {
            candidates += rankedRows[i].id + ",";
        } else {
            candidates += rankedRows[i].id;
        }
    }
    document.ballotForm.<%=Constants.CANDIDATE_IDS%>.value = candidates;
    document.ballotForm.submit();
}
</script>


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

<p align="center">
    <tc-webtag:errorIterator id="err" name="<%=Constants.CANDIDATE_IDS%>">
        <span class="bigRed">${err}</span>
        <br></tc-webtag:errorIterator>
</p>
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
    <tbody id="rankedBody"></tbody>
</table>
<%-- table for the disabled candidates --%>
<table id="unranked" class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
    <tbody id="unRankedBody">
        <c:forEach items="${candidates}" var="candidate">

            <tr class="disabled" id="${candidate.id}">
                <td class="valueC">
                    not ranked
                </td>
                <c:set value="<%=Constants.SUBMISSION_DESCRIPTION_PROPERTY%>" var="descriptionKey"/>
                <c:set value="<%=Constants.SUBMISSION_ID_PROPERTY%>" var="submissionIdKey"/>
                <c:set value="${candidate.infoMap[descriptionKey]}" var="description"/>
                <c:set value="${candidate.infoMap[submissionIdKey]}" var="submissionId"/>
                <td class="value">
                    <span style="cursor: default; white-space: nowrap;" onMouseOver="blurbUp(this, '${candidate.id}Blurb')" onMouseOut="popHide('${candidate.id}Blurb')">
                        <c:choose>
                            <c:when test="${fn:length(description)>50}">
                                ${fn:substring(description, 0, 50)}&#133;
                            </c:when>
                            <c:otherwise>
                                ${description}
                            </c:otherwise>
                        </c:choose>
                    </span>

                    <div id="${candidate.id}Blurb" class="popUp">
                        <div style="width: 400px;">
                            <strong>Full description:</strong><br><br>
                                ${description}
                        </div>
                    </div>

                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}" target="_blank">
                        <img src="/i/layout/disk.gif" alt="" align="absmiddle" onMouseOver="popUp(this,'diskPopup')" onMouseOut="popHide()"/>
                    </a>
                </td>
                <td class="valueC">
                    <div style="margin: 2px;" align="center">
                        <a href="javascript:void(0)" onClick="up(this)" onFocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onMouseOver="this.src = '/i/layout/btnMoveUpOn.png';" onMouseOut="this.src = '/i/layout/btnMoveUp.png';"/></a>
                    </div>
                    <div style="margin: 2px;" align="center">
                        <img src="/i/layout/btnMoveDownNA.png" alt="Move down"/>
                    </div>
                </td>
                <td class="valueC">
                    <a href="javascript:void(0)" onClick="top(this)" onFocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onMouseOver="this.src = '/i/layout/btnMoveToTopOn.png';" onMouseOut="this.src = '/i/layout/btnMoveToTop.png';"/></a>
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

<%-- DISK POPUP --%>
<div id="diskPopup" class="popUp">
    <div>Download submission</div>
</div>

<form action="${sessionInfo.servletPath}" method="POST" name="ballotForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitBallot"/>
    <tc-webtag:hiddenInput name="<%=Constants.ELECTION_ID%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.CANDIDATE_IDS%>"/>

    <div align="center" style="margin:20px;">
        Are you done ranking the candidates?
        <div align="center" style="margin-top:10px;">
            <A href="javascript:void(0)" onClick="submit()" class="button" style="width: 160px;">Submit my vote</A>
        </div>
    </div>
</form>


</div>

<jsp:include page="../foot.jsp"/>
</div>
</div>

</body>
</html>