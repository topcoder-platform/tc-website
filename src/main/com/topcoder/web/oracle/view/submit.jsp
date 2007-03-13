<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Oracle</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

    <script type="text/javascript" src="../js/popup.js"></script>
    <script type="text/javascript">
    function postToViewer(mysrc){
        document.getElementById("viewer").src = mysrc;
    }
    function hideViewer(){
        document.getElementById("viewerpopup").style.display = "none";
    }
    </script>
    <style type="text/css">
    html { min-height: 100%; margin-bottom: 1px; }
    ul.imageLineup{
        width: 605px;
        padding: 0px;
        margin: 0px;
        list-style-type: none;
    }
    ul.imageLineup li{
        position: relative;
        float: left;
        margin: 10px 4px 1px 4px;
        padding: 0px;
        text-align: center;
        background: #FFFFFF;
    }
    img.small{
        width: 50px;
        height: 50px;
        display: block;
        padding: 0px;
        margin: 0px;
        border: 1px solid black;
    }
    ul.imageLineup div.save{
        position: absolute;
        bottom: -7px;
        right: 5px;
        background: #FFFFFF;
        border-right: 1px solid #FFFFFF;
    }
    ul.imageLineup div.move{
        position: absolute;
        bottom: -7px;
        left: 5px;
        border: 1px solid #FFFFFF;
    }
    #favorites{
        border: 1px solid green;
    }
    #favorites li{
        cursor: move;
    }
    a.marker{
        position: absolute;
        top: -7px;
    }
    </style>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">

        <jsp:include page="../top.jsp"/>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>

        <div id="contentIn" class="contentIn">

            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

<h1>Make your prediction</h1>

<form>
<div align="center" style="margin-bottom: 20px;">
<strong>Drag and drop</strong> candidates to sort them according to your preference<br>
<strong>Mouse over</strong> candidates to see them at full size<br>
To remove a candidate from your list of favorites, <strong>click down</strong> <img src="/i/layout/btnMoveDown.png" alt="" /> on the image
<br><br>

<table cellpadding="0" cellspacing="0" style="margin-bottom: 20px;">
<tbody>
    <tr>
        <td>

<%-- "favorites" is the container <ul> for the candidate <li>'s that have been selected for ranking --%>

<div align="center">
<ul id="favorites" class="imageLineup" align="center" style="float:left; clear:both;">
<li title="01">01
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/01.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="02">02
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/02.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="03">03
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/03.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="04">04
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/04.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="05">05
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/05.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<%--
<li title="06">06
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/06.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="07">07
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/07.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="08">08
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/08.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="09">09
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/09.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
<li title="10">10
    <div class="move"><A href="MOVE DOWN"><img src="/i/layout/btnMoveDown.png" alt="" /></A></div>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <img class="small" src="/i/submissions/10.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" />
</li>
--%>
</ul>
</div>
<div class="popUp" id="viewerpopup"><img src="" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>
        </td>
    </tr>
</tbody>
</table>

<div style="margin-bottom: 60px;">
    <input src="/i/layout/btnSubmit.png" onmouseover="this.src='/i/layout/btnSubmitOn.png'" onmouseout="this.src='/i/layout/btnSubmit.png'" type="image">
</div>

<div align="center" style="margin-bottom: 40px;">
    <div style="width: 600px; margin-bottom: 20px;">
        Here are <strong>all</strong> the candidates<br>
        <strong>Mouse over</strong> candidates to see them at full size<br>
        <strong>Click up</strong> <img src="/i/layout/btnMoveUp.png" alt="" /> on each of your favorites to move them into the list above
        <br><br>
    </div>
    
<%-- PAGING
    <A href="javascript:void(0)">< prev</A>
    | <A href="javascript:void(0)">next ></A>
    <!-- dotted line container -->
    <div style="position: relative; width: 600px;">
        <!-- left value is always [((thispage - 1) * 600 / (pages - 1)) - 7], so in this case page 1 is -7, page 2 is 93... -->
        <A href="javascript:void(0)" class="marker" style="left: -7px;"><img src="/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 93px;"><img src="/i/layout/markerOn.png" alt="marker" /></A>
        <!-- left value of the page text box is always [((thispage - 1) * 600 / (pages - 1)) - 40] -->
        <div style="width: 80px; position: absolute; top: 10px; left: 60px; text-align: center;">Page <strong>2</strong> of <strong>7</strong></div>
        <A href="javascript:void(0)" class="marker" style="left: 193px;"><img src="/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 293px;"><img src="/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 393px;"><img src="/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 493px;"><img src="/i/layout/marker.png" alt="marker" /></A>
        <A href="javascript:void(0)" class="marker" style="left: 593px;"><img src="/i/layout/marker.png" alt="marker" /></A>
        <img src="/i/layout/dottedLine.png" alt="Submission range" style="display: block;" />
    </div>
--%>

</div>

<table cellpadding="0" cellspacing="0" style="margin-bottom: 20px;">
<tbody>
    <tr>
        <td>

<%-- "submissions" is the container <ul> for candidate <li>'s --%>

<ul id="submissions" class="imageLineup" align="center" style="float:left; clear:both;">
<li title="01">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/01.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="02">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/02.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="03">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/03.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="04">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/04.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="05">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/05.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="06">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/06.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="07">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/07.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="08">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/08.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="09">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/09.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="10">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/10.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="11">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/11.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="12">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/12.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="13">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/13.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="14">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/14.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="15">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/15.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="16">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/16.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="17">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/17.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="18">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/18.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="19">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/19.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="20">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/20.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="21">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/21.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="22">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/22.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="23">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/23.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="24">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/24.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="25">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/25.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="26">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/26.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="27">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/27.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="28">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/28.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="29">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/29.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="30">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/30.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="31">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/31.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="32">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/32.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="33">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/33.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="34">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/34.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="35">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/35.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="36">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/36.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="37">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/37.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="38">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/38.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="39">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/39.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="40">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/40.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="41">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/41.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="42">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/42.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="43">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/43.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="44">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/44.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="45">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/45.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="46">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/46.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="47">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/47.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="48">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/48.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="49">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/49.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
<li title="50">
    <%--<div class="move"><A href="MOVE UP"><img src="/i/layout/btnMoveUp.png" alt="" /></A></div>--%>
    <div class="save"><A target="_blank" href="DOWNLOAD"><img src="/i/layout/disk.gif" alt="DL" /></A></div>
    <A href="javascript:void(0)"><img class="small" src="/i/submissions/50.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="hideViewer()" /></A>
</li>
</ul>
<div class="popUp" id="viewerpopup"><img src="" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>
        </td>
    </tr>
</tbody>
</table>
</div>

</form>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <jsp:include page="../foot.jsp"/>

        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>