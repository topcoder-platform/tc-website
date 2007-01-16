<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="../js/popup.js"></script>
    <script type="text/javascript">
    function postToViewer(mysrc){
        document.getElementById("viewer").src = mysrc;
    }
    </script>
    <style type="text/css">
    html { min-height: 100%; margin-bottom: 1px; }
    #candidates{
        width: 605px;
        padding: 0px;
        margin: 0px;
        list-style-type: none;
    }
    #candidates li{
        cursor: move;
        position: relative;
        float: left;
        margin: 10px 4px 1px 4px;
        padding: 0px;
        text-align: center;
        background: #FFFFFF;
    }
    #candidates li img {
        width: 50px;
        height: 50px;
        display: block;
        padding: 0px;
        margin: 0px;
        border: 1px solid black;
    }
    </style>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">

        <jsp:include page="../top.jsp"/>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="contactUs"/>
        </jsp:include>

        <div id="contentIn" class="contentIn">

            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>Vote</h1>


<form>
<div align="center" style="margin-bottom: 20px;">
Drag and drop submissions to sort them according to your preference.
<br><br>

<%-- TABLE REQUIRED TO SPACE OUT THE FLOATED <LI>'S CORRECTLY  --%>
<table cellpadding="0" cellspacing="0" style="margin-bottom: 20px;">
<tbody>
    <tr>
        <td>
<ul id="candidates" align="center" style="float:left; clear:both;">
<li title="01">1<img src="/i/submissions/01.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" onload="maxImage(this);" /></li>
<li title="02">2<img src="/i/submissions/02.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="03">3<img src="/i/submissions/03.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="04">4<img src="/i/submissions/04.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="05">5<img src="/i/submissions/05.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="06">6<img src="/i/submissions/06.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="07">7<img src="/i/submissions/07.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="08">8<img src="/i/submissions/08.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="09">9<img src="/i/submissions/09.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="10">10<img src="/i/submissions/10.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="11">11<img src="/i/submissions/11.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="12">12<img src="/i/submissions/12.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="13">13<img src="/i/submissions/13.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="14">14<img src="/i/submissions/14.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="15">15<img src="/i/submissions/15.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="16">16<img src="/i/submissions/16.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="17">17<img src="/i/submissions/17.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="18">18<img src="/i/submissions/18.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="19">19<img src="/i/submissions/19.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="20">20<img src="/i/submissions/20.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="21">21<img src="/i/submissions/21.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="22">22<img src="/i/submissions/22.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="23">23<img src="/i/submissions/23.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="24">24<img src="/i/submissions/24.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="25">25<img src="/i/submissions/25.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="26">26<img src="/i/submissions/26.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="27">27<img src="/i/submissions/27.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="28">28<img src="/i/submissions/28.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="29">29<img src="/i/submissions/29.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="30">30<img src="/i/submissions/30.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="31">31<img src="/i/submissions/31.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="32">32<img src="/i/submissions/32.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="33">33<img src="/i/submissions/33.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="34">34<img src="/i/submissions/34.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="35">35<img src="/i/submissions/35.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="36">36<img src="/i/submissions/36.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="37">37<img src="/i/submissions/37.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="38">38<img src="/i/submissions/38.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="39">39<img src="/i/submissions/39.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="40">40<img src="/i/submissions/40.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="41">41<img src="/i/submissions/41.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="42">42<img src="/i/submissions/42.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="43">43<img src="/i/submissions/43.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="44">44<img src="/i/submissions/44.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="45">45<img src="/i/submissions/45.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="46">46<img src="/i/submissions/46.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="47">47<img src="/i/submissions/47.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="48">48<img src="/i/submissions/48.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="49">49<img src="/i/submissions/49.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
<li title="50">50<img src="/i/submissions/50.png" alt="" onmouseover="postToViewer(this.src); popUp(this,'viewerpopup');" onmouseout="popHide()" onmousedown="popHide()" /></li>
</ul>
<div class="popUp" id="viewerpopup"><img src="" id="viewer" alt="" style="margin:5px; border: 1px solid black; background: #FFFFFF;"></div>
        </td>
    </tr>
</tbody>
</table>

<input src="/i/layout/btnSubmit.png" onmouseover="this.src='/i/layout/btnSubmitOn.png'" onmouseout="this.src='/i/layout/btnSubmit.png'" type="image">
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