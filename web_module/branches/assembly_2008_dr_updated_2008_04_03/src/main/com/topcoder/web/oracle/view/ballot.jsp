<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page import="com.topcoder.web.oracle.model.CandidateProperty" %>
<%@ page import="com.topcoder.web.oracle.model.RoundProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<c:set value="<%=RoundProperty.MAX_SELECTED_CANDIDATES%>" var="maxCandidatesKey"/>
<c:set value="${room.round.configMap[maxCandidatesKey]}" var="maxCandidates"/>

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/oracle/favicon.ico"/>
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
<script language="JavaScript" type="text/javascript" src="/js/org/tool-man/core.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/org/tool-man/events.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/org/tool-man/css.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/org/tool-man/coordinates.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/org/tool-man/drag.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/org/tool-man/dragsort.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/org/tool-man/cookies.js"></script>
<script language="JavaScript" type="text/javascript"><!--
function postToViewer(mySrc) {
    document.getElementById("viewer").src = mySrc;
}

function hideViewer() {
    document.getElementById("viewerpopup").style.display = "none";
}

function pickCandidate(myCandidate) {
    myCandidate.parentNode.style.visibility = 'hidden';
}

var binHash;
var dragsort = ToolMan.dragsort();
window.onload = function() {
    dragsort.makeListSortable(document.getElementById('selectedCandidates'));
    //figure out the mapping between candidates in the bin, and their indexes.

    var list = document.getElementById("candidateBin").getElementsByTagName("li");
    binHash = new Array(list.length);
    for (var i = 0; i < list.length; i++) {
        var images = list[i].getElementsByTagName("img");
        for (var j = 0; j < images.length; j++) {
            if (images[j].name == "candidateImage") {
                binHash[images[j].getAttribute("src")] = i;
                break;
            }
        }
    }
}

/*
move selected item to the right most position in the selected candidates list
f the selected candidates list has reached it's max size, alert user to remove
a candidate first
*/
function select(obj) {
    if (document.getElementById("selectedCandidates").getElementsByTagName("li").length == ${maxCandidates}) {
        alert("Oops, you already have ${maxCandidates} candidates.  Please remove one first.")
    } else {
        //check if the item is in the candidate bin
        var element = obj;
        while (element && element.tagName != 'BODY') {
            if (element.tagName == 'UL' && element.id == "candidateBin") {
                var oldItem = obj.parentNode;
                var newItem = document.createElement("li");
                newItem.innerHTML = oldItem.innerHTML + '<div class="remove"><A onclick="boot(this)"><img src="/i/oracle/interface/remove.png" alt="" \/><\/A><\/div>';
                var images = newItem.getElementsByTagName("img");
                for (var j = 0; j < images.length; j++) {
                    if (images[j].name == "candidateImage") {
                        images[j].setAttribute("onclick", "");
                        break;
                    }
                }
                oldItem.innerHTML = "&nbsp;";
                oldItem.style.visibility = 'hidden';
                newItem.id = oldItem.id;
                oldItem.id = "";
                document.getElementById("selectedCandidates").appendChild(newItem);
                dragsort.addSortableItem(document.getElementById("selectedCandidates"), newItem);
                break;
            } else {
                element = element.parentNode;
            }
        }


    }
}

/*
move selected item back into the candidate bin from the selected candidate list
*/
function boot(obj) {
    var myLi = findParent(obj, 'LI');
    var myDiv = findParent(obj, 'DIV');
    myDiv.parentNode.removeChild(myDiv);
    var images = myLi.getElementsByTagName("img");
    for (var i = 0; i < images.length; i++) {
        if (images[i].name == "candidateImage") {
            var idx = binHash[images[i].getAttribute("src")];
            var item = document.getElementById("candidateBin").getElementsByTagName("li")[idx];
            images[i].setAttribute("onclick", "select(this)");
            item.innerHTML = myLi.innerHTML;
            item.id = myLi.id;
            myLi.id = "";
            myLi.parentNode.removeChild(myLi);
            item.style.visibility = 'visible';
            break;
        }
    }
}


function findParent(element, parentTagName) {
    element = element.parentNode;
    while (element.tagName != 'BODY') {
        if (element.tagName == parentTagName) {
            return element;
        } else {
            element = element.parentNode;
        }
    }
    return null;
}

function verify() {
    var candidates = '';
    var list = document.getElementById("selectedCandidates").getElementsByTagName("li");
    if (list.length <${maxCandidates}) {
        var confirmed = confirm("Are you sure you want to submit without selecting all ${maxCandidates} candidates?");
        if (!confirmed) {
            return false;
        }
    }
    for (var i = 0; i < list.length; i++) {
        if (i < list.length - 1) {
            candidates += list[i].id + ",";
        } else {
            candidates += list[i].id;
        }
    }
    document.ballotForm.<%=Constants.CANDIDATE_IDS%>.value = candidates;
    return true;
}

//-->
</script>

</head>

<body>

<div align="center">
<div id="contentOut">
    <div id="contentIn">


        <h1>Predict the winners</h1>

        <div align="center">

            <table cellpadding="0" cellspacing="0" style="width: 610px; text-align: left; margin-bottom: 20px;">
                <tbody>
                    <tr>
                        <td style="padding: 6px;">
                            <img src="/i/oracle/interface/step1.png" alt="Step 1"/>
                        </td>
                        <td width="100%">
                            Browse the <strong>Pool of Candidates</strong> and <strong>Click</strong> any that you'd like to add to your <strong>Prediction</strong>.<br>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 6px;">
                            <img src="/i/oracle/interface/step2.png" alt="Step 2"/>
                        </td>
                        <td>
                            In the <strong>Prediction</strong> section, <strong>drag and drop</strong> candidates to
                            sort them from best to worst.<br>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 6px;">
                            <img src="/i/oracle/interface/step3.png" alt="Step 3"/>
                        </td>
                        <td>
                            <strong>Click the remove button</strong>
                            <img src="/i/oracle/interface/remove.png" alt="REMOVE" align="absmiddle"/> under any candidates in your prediction
                            to remove them from the list.
                        </td>
                    </tr>
            </table>

            <h2 align="left" style="width: 610px;">My Prediction</h2>

            <%-- centers selectedCandidates and limits its width to 610px --%>
            <div align="center" style="position: relative; width: 610px;">

                <tc-webtag:errorIterator id="err" name="<%=Constants.CANDIDATE_IDS%>">
                    <p align="center"><span class="bigRed">${err}</span></p>
                </tc-webtag:errorIterator>


                <div class="selectedContainer" style="width: ${maxCandidates*61}px;">
                    <img src="/i/oracle/interface/meterBest.png" alt="" style="position: absolute; top: 0px; left: -30px;"/>
                    <img src="/i/oracle/interface/meterWorst.png" alt="" style="position: absolute; top: 0px; left: ${maxCandidates*61-45}px;"/>
                    <ul id="selectedCandidates" class="imageLineup" align="center" style="float:left; clear:both; margin: 0px;">
                    </ul>
                </div>

                <div style="clear: both; margin-bottom: 20px;">
                    <form action="${sessionInfo.servletPath}" method="POST" name="ballotForm" onSubmit="return verify();">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitBallot"/>
                        <tc-webtag:hiddenInput name="<%=Constants.ROOM_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CANDIDATE_IDS%>"/>

                        <BUTTON name="submit" value="submit" type="submit" class="button">Submit</BUTTON>

                    </form>

                </div>

            </div>

            <h2 align="left" style="width: 610px;">Pool of Candidates</h2>

            <c:set value="<%=CandidateProperty.IMAGE_SOURCE%>" var="imageSource"/>
            <c:set value="<%=CandidateProperty.DOWNLOAD_URL%>" var="downloadUrl"/>

            <%-- centers candidates and limits its width to 610px --%>
            <div align="center" style="width: 610px;">
                <ul id="candidateBin" class="imageLineup" style="float:left; clear:both; width: 100%;">

                    <c:forEach items="${candidates}" var="candidate">
                        <li id="${candidate.id}">
                            <c:if test="${!empty candidate.infoMap[downloadUrl]}">
                                <div class="save">
                                    <A target="_blank" href="${candidate.infoMap[downloadUrl]}"><img src="/i/oracle/interface/disk.png" alt="DL"/></A>
                                </div>
                            </c:if>
                            <img class="small" name="candidateImage" src="${candidate.infoMap[imageSource]}" alt="" onclick="select(this)" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()"/>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="popUp" id="viewerpopup">
                <img src="" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>

            <div style="clear:both;">&nbsp;</div>

        </div>


        <jsp:include page="foot.jsp"/>
    </div>
</div>
</div>

</body>
</html>