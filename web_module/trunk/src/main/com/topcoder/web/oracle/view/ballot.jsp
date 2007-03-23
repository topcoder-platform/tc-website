<%@ page import="com.topcoder.web.oracle.model.CandidateProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/oracle/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Oracle</title>

    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
    <style type="text/css">
    html { min-height: 100%; margin-bottom: 1px; }

    div.selectedContainer {
        position: relative;
        height: 160px; 
        margin: 0px; 
        padding: 25px 0px 0px 0px; 
        background: transparent url(/i/oracle/interface/meterMiddle.png) top center repeat-x;
    }

    #selectedCandidates img.small {
        cursor: move;
    }

    #candidateBin img.small {
        cursor: pointer;
    }

    a.marker{
        position: absolute;
        top: -7px;
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
function postToViewer(mySrc){
    document.getElementById("viewer").src = mySrc;
}

function hideViewer(){
    document.getElementById("viewerpopup").style.display = "none";
}

function pickCandidate(myCandidate){
    myCandidate.parentNode.style.visibility = 'hidden';        
}

var binHash
var dragsort = ToolMan.dragsort();
window.onload = function() {
    dragsort.makeListSortable(document.getElementById('selectedCandidates'));
    //figure out the mapping between candidates in the bin, and their indexes.

    var list = document.getElementById("candidateBin").getElementsByTagName("li");
    binHash = new Array(list.length);
    for (var i = 0; i < list.length; i++) {
        binHash[list[i].getElementsByTagName("img")[0].getAttribute("src")] = i;
    }
}

/*
move selected item to the right most position in the selected candidates list
f the selected candidates list has reached it's max size, alert user to remove
a candidate first
*/
function select(obj) {
    if (document.getElementById("selectedCandidates").getElementsByTagName("li").length == 5) {
        alert("Sorry, you have already selected 5 candidates.  Please remove one before adding another.")
    } else {
        //check if the item is in the candidate bin
        var element = obj;
        while (element && element.tagName != 'BODY') {
            if (element.tagName == 'UL' && element.id == "candidateBin") {
                var oldItem = obj.parentNode;
                var newItem = document.createElement("li");
                newItem.innerHTML = oldItem.innerHTML + '<div class="remove"><A href="#"><img src="/i/oracle/interface/remove.png" alt="" /></A></div>';
                var images = newItem.getElementsByTagName("img");
                for (var i=0; i<images.length; i++) {
                    if (images[i].name = "candidateImage") {
                        images[i].setAttribute("onclick", "boot(this)");
                        break;
                    }
                }
                oldItem.innerHTML = "&nbsp;";
                oldItem.style.visibility = 'hidden';
                document.getElementById("selectedCandidates").appendChild(newItem);
                dragsort.makeListSortable(document.getElementById('selectedCandidates'));
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
    var idx = binHash[obj.getAttribute("src")];
    var item = document.getElementById("candidateBin").getElementsByTagName("li")[idx];
    item.innerHTML = obj.parentNode.innerHTML;
    item.getElementsByTagName("img")[0].setAttribute("onclick", "select(this)");
    obj.parentNode.parentNode.removeChild(obj.parentNode);
}


//-->
</script>

</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">



<h1>Make your prediction</h1>

<form>
<div align="center">

<table cellpadding="0" cellspacing="0" style="width: 610px; text-align: left; margin-bottom: 20px;">
<tbody>
    <tr>
        <td style="padding: 6px;">
            <img src="/i/oracle/interface/step1.png" alt="Step 1"/>
        </td>
        <td width="100%">
            Browse the <strong>The Pool</strong> and <strong>Click</strong> on the candidateBin you like most to move them into the <strong>My Prediction</strong> list.<br>
        </td>
    </tr>
    <tr>
        <td style="padding: 6px;">
            <img src="/i/oracle/interface/step2.png" alt="Step 2" />
        </td>
        <td>
            In the <strong>My Prediction</strong> section, <strong>drag and drop</strong> candidates to sort them according to your preference.<br>
        </td>
    </tr>
    <tr>
        <td style="padding: 6px;">
            <img src="/i/oracle/interface/step3.png" alt="Step 3" />
        </td>
        <td>
            You can <strong>click the remove button</strong> <img src="/i/oracle/interface/remove.png" alt="REMOVE" align="absmiddle" /> under any of your selectedCandidates to remove it from the list.
        </td>
    </tr>
</table>

<h2 align="left" style="width: 610px;">My Prediction</h2>

<%-- centers selectedCandidates and limits its width to 610px --%>
<div align="center" style="position: relative; width: 610px;">

<%--
<div style="position: absolute; top: 0px; left: 0px; width: 400px; height: 10px; margin: 0px; padding: 0px;">
</div>
-%>
    <%-- 
    this width has to be set dynamically (centering floats is always a pain)
    It has to be 61 X Max num of selectedCandidates 
    --%>

    <div class="selectedContainer" style="width: 305px;">
        <img src="/i/oracle/interface/meterBest.png" alt="" style="position: absolute; top: 0px; left: -30px;" />
        <img src="/i/oracle/interface/meterWorst.png" alt="" style="position: absolute; top: 0px; right: -30px;" />
        <ul id="selectedCandidates" class="imageLineup" align="center" style="float:left; clear:both; margin: 0px;">
        </ul>
    </div>

    <div style="clear: both; margin-bottom: 20px;">
        <BUTTON name="submit" value="submit" type="submit" class="button">Submit</BUTTON>
    </div>

    <%-- PAGING
    < prev</A>
    | <A href="javascript:void(0)">next ></A>
    <!-- dotted line container -->
    <div style="position: relative; width: 600px;">
        <!-- left value is always [((thispage - 1) * 600 / (pages - 1)) - 7], so in this case page 1 is -7, page 2 is 93... -->
        <A href="javascript:void(0)" class="marker" style="left: -7px;"><img src="/i/oracle/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 93px;"><img src="/i/oracle/layout/markerOn.png" alt="marker" /></A>
        <!-- left value of the page text box is always [((thispage - 1) * 600 / (pages - 1)) - 40] -->
        <div style="width: 80px; position: absolute; top: 10px; left: 60px; text-align: center;">Page <strong>2</strong> of <strong>7</strong></div>
        <A href="javascript:void(0)" class="marker" style="left: 193px;"><img src="/i/oracle/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 293px;"><img src="/i/oracle/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 393px;"><img src="/i/oracle/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 493px;"><img src="/i/oracle/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 593px;"><img src="/i/oracle/layout/marker.png" alt="marker" /></A>
        <img src="/i/oracle/layout/dottedLine.png" alt="Submission range" style="display: block;" />
    </div>
    --%>


    <p align="center">
    <%-- error text
    <span class="bigRed">You have no available spots in your My Prediction list. Please remove one of your candidates and try again.</span>
    --%>
    <%-- use this when there are no errors --%>
    <span class="bigRed">&nbsp;</span>
</div>

<h2 align="left" style="width: 610px;">The Pool</h2>

<c:set value="<%=CandidateProperty.IMAGE_SOURCE%>" var="imageSource"/>

<%-- centers candidates and limits its width to 610px --%>
<div align="center" style="width: 610px;">
<ul id="candidateBin" class="imageLineup" align="center" style="float:left; clear:both; width: 100%;">

<c:forEach items="${candidates}" var="candidate">
    <li>
        <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/interface/disk.png" alt="DL" /></A></div>
        <img class="small" name="candidateImage" src="${candidate.infoMap[imageSource]}" alt="" onclick="select(this)" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
    </li>
</c:forEach>
</div>

<div class="popUp" id="viewerpopup"><img src="" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>

<div style="clear:both;">&nbsp;</div>

</div>
</form>


        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>