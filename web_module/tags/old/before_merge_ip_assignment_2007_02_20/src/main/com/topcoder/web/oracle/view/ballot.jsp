<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/oracle/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Oracle</title>

    <link type="text/css" rel="stylesheet" href="/i/oracle/css/main.css">
    <link type="text/css" rel="stylesheet" href="/i/oracle/css/stats.css">

    <script type="text/javascript" src="/i/oracle/js/popup.js"></script>
    <script type="text/javascript">
    function postToViewer(mySrc){
        document.getElementById("viewer").src = mySrc;
    }
    function hideViewer(){
        document.getElementById("viewerpopup").style.display = "none";
    }
    function pickCandidate(myCandidate){
        myCandidate.parentNode.style.visibility = 'hidden';        
    }
    </script>
    <style type="text/css">
    html { min-height: 100%; margin-bottom: 1px; }

    #favorites img.small {
        cursor: move;
    }

    #candidates img.small {
        cursor: pointer;
    }

    a.marker{
        position: absolute;
        top: -7px;
    }
    </style>
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
            <img src="/i/oracle/i/interface/step1.png" alt="Step 1"/>
        </td>
        <td width="100%">
            Browse the <strong>Candidate Pool</strong> and <strong>Click</strong> on the candidates you like most to move them into the <strong>Favorites</strong> list.<br>
        </td>
    </tr>
    <tr>
        <td style="padding: 6px;">
            <img src="/i/oracle/i/interface/step2.png" alt="Step 2" /> 
        </td>
        <td>
            In the <strong>Favorites</strong> section, <strong>drag and drop</strong> candidates to sort them according to your preference.<br>
        </td>
    </tr>
    <tr>
        <td style="padding: 6px;">
            <img src="/i/oracle/i/interface/step3.png" alt="Step 3" /> 
        </td>
        <td>
            You can <strong>click the remove button</strong> <img src="/i/oracle/i/interface/remove.png" alt="REMOVE" align="absmiddle" /> under any of your favorites to remove it from the list.
        </td>
    </tr>
</table>

<%-- centers favorites and limits its width to 610px --%>
<div align="center" style="width: 610px;">
    <div>
<ul id="favorites" class="imageLineup" align="center" style="float:left; clear:both; padding-bottom: 40px;">
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/09.png" alt="" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/43.png" alt="" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/12.png" alt="" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/13.png" alt="" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/27.png" alt="" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/06.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/07.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li>
    <div class="remove"><A href="REMOVE"><img src="/i/oracle/i/interface/remove.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/08.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<%-- 
This is what a spot on the favorites list before a candidate has been added
to its spot.  It creates a light gray spot to show how many more candidates 
you can add. When dragging and dropping, only the "filled" spots on the 
favorites list should be moveable.
--%>
<li>&nbsp;</li>
<li>&nbsp;</li>
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
        <A href="javascript:void(0)" class="marker" style="left: -7px;"><img src="/i/oracle/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 93px;"><img src="/i/oracle/i/layout/markerOn.png" alt="marker" /></A>
        <!-- left value of the page text box is always [((thispage - 1) * 600 / (pages - 1)) - 40] -->
        <div style="width: 80px; position: absolute; top: 10px; left: 60px; text-align: center;">Page <strong>2</strong> of <strong>7</strong></div>
        <A href="javascript:void(0)" class="marker" style="left: 193px;"><img src="/i/oracle/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 293px;"><img src="/i/oracle/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 393px;"><img src="/i/oracle/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 493px;"><img src="/i/oracle/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 593px;"><img src="/i/oracle/i/layout/marker.png" alt="marker" /></A>
        <img src="/i/oracle/i/layout/dottedLine.png" alt="Submission range" style="display: block;" />
    </div>
--%>


<p align="center">
<%--
<span class="bigRed">You have no available spots in your Favorites list. Please remove one of your candidates and try again.</span>
--%>
<%-- use this when there are no errors --%>
<span class="bigRed">&nbsp;</span>
</div>

<%-- centers candidates and limits its width to 610px --%>
<div align="center" style="width: 610px;">

<ul id="candidates" class="imageLineup" align="center" style="float:left; clear:both; width: 100%;">
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/01.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/02.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/03.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/04.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/05.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/06.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/07.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/08.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/09.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/10.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/11.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/12.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/13.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/14.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/15.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/16.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/17.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/18.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/19.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/20.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/21.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/22.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/23.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/24.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/25.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/26.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/27.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/28.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/29.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/30.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/31.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/32.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/33.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/34.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/35.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/36.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/37.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/38.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/39.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/40.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/41.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/42.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/43.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/44.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/45.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/46.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/47.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/48.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/49.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
<li>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/oracle/i/interface/disk.png" alt="DL" /></A></div>
    <img class="small" src="/i/oracle/i/submissions/50.png" alt="" onClick="pickCandidate(this);" onMouseOver="postToViewer(this.src); popUp(this,'viewerpopup');" onMouseOut="popHide()" onMouseDown="hideViewer()" />
</li>
</ul>
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