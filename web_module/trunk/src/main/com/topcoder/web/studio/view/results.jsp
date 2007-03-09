<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
    <script type="text/javascript"><!--
    function resizeImage(myImage) {
        var myHeight = Math.round(myImage.offsetHeight * 300 / myImage.offsetWidth);
        myImage.style.width = 300 + 'px';
        myImage.style.height = myHeight + 'px';
    }
    //-->
    </script>
</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<div class="linkBox">
    <A HREF="http://studio.topcoder.com/forums?module=ThreadList&amp;forumID=37">Discuss this</A>
</div>

<div class="breadcrumb">
    <A href="">Past Contests</A> &gt;
    Contest Name
</div>

<h1>Winners</h1>

<table class="stat" cellpadding="0" cellspacing="0" style="width:740px">
    <tbody>
        <tr>
            <td class="NW">&nbsp;</td>
            <td class="title" colspan="7">Results</td>
            <td class="NE">&nbsp;</td>
        </tr>
        <tr>
            <td class="headerW"><div>&nbsp;</div></td>
            <td class="headerC" width="1%">
                <a href="">Place</a>
            </td>
            <td class="header">
                <a href="">Handle</a>
            </td>
            <td class="headerC">
                <a href="">Prize</a>
            </td>
            <td class="headerC">
                <a href="">Registered</a>
            </td>
            <td class="headerC">
                <a href="">Submitted</a>
            </td>
            <td class="headerC">
                <a href="">Submission ID</a>
            </td>
            <td class="header">
                Submission
            </td>
            <td class="headerE"><div>&nbsp;</div></td>
        </tr>
        <tr class="light">
            <td class="valueW"><div>&nbsp;</div></td>
            <td class="valueC">
                1
            </td>
            <td class="value">
                <span class="coderText">geethan</span>
            </td>
            <td class="valueC">
                $1000
            </td>
            <td class="valueC">
                <strong>02.23.2007</strong><br>13:28 EST
            </td>
            <td class="valueC">
                <strong>02.23.2007</strong><br>13:28 EST
            </td>
            <td class="valueC">
                1234
            </td>
            <td class="value">
                &nbsp;
                <%-- make it like the Submission column on submissions.jsp --%>
            </td>
            <td class="valueE"><div>&nbsp;</div></td>
        </tr>
        <tr class="dark">
            <td class="valueW"><div>&nbsp;</div></td>
            <td class="valueC">
                2
            </td>
            <td class="value">
                <span class="coderText">geethan</span>
            </td>
            <td class="valueC">
                $500
            </td>
            <td class="valueC">
                <strong>02.23.2007</strong><br>13:28 EST
            </td>
            <td class="valueC">
                <strong>02.23.2007</strong><br>13:28 EST
            </td>
            <td class="valueC">
                1234
            </td>
            <td class="value">
                &nbsp;
                <%-- make it like the Submission column on submissions.jsp --%>
            </td>
            <td class="valueE"><div>&nbsp;</div></td>
        </tr>
        <tr>
            <td class="SW">&nbsp;</td>
            <td class="title" colspan="7">
                <%-- links to submissions page for this contest --%>
                <a href="" class="small">...view all submissions</a>
            </td>
            <td class="SE">&nbsp;</td>
        </tr>
</tbody>
</table>


</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>