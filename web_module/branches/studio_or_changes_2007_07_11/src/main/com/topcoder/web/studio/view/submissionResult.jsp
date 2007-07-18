<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
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

                <div class="linkBox"><studio:forumLink forumID="0"/></div>
                
                <div class="breadcrumb">
                    <A href="">Past Contests</A> &gt;
                    Contest Name
                </div>

                <h1>Scores</h1>

<div align="center" style="font-size: 32px; font-weight: bold;">
    <span class="coderText">handle</span>
</div>

<div align="center" style="margin-bottom: 10px; font-weight: bold;">
    Submission ID: 1234
</div>

<div align="center" style="margin-bottom: 20px;">
    <div style="overflow: hidden; width: 300px;">
        <a href="/?module=DownloadSubmission&sbmid=5179"><img src="/?module=DownloadSubmission&sbmid=5179" alt="6434" style="display: block; border: 1px solid #999999;" height="293" width="300" /></a>
    </div>
</div>
   
<div align="center" style="margin-bottom: 20px;">
<table style="width: 700px;" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td colspan="4" align="center" style="border-bottom: 1px solid #999999; font-weight: bold;">
            Reviewers & Scores
        </td>
    </tr>
    <tr>
        <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
            <span class="coderText">handle</span>
        </td>
        <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
            <span class="coderText">handle</span>
        </td>
        <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
            <span class="coderText">handle</span>
        </td>
        <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
            Final score
        </td>
    </tr>
    <tr>
        <td align="center" style="font-size: 36px; font-weight: bold;">
            <a href="">99.99</a>
        </td>
        <td align="center" style="font-size: 36px; font-weight: bold;">
            <a href="">99.99</a>
        </td>
        <td align="center" style="font-size: 36px; font-weight: bold;">
            <a href="">99.99</a>
        </td>
        <td align="center" style="font-size: 36px; font-weight: bold;">
            99.99
        </td>
    </tr>
</tbody>
</table>
</div>

<div align="center">
    Click scores to view the corresponding scorecards via
    <a href=""><img src="/i/tcorLogo.png" alt="TopCoder Online Review" style="display: block; margin: 3px;" /></a>
</div>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <jsp:include page="foot.jsp"/>

        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>