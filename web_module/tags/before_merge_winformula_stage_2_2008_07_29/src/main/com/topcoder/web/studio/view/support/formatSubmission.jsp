<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../top.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="support"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <div style="padding: 10px 0;">
                    <strong>Help Pages:</strong> <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted">Getting Started</a>
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">Assignment FAQ</a>
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=competitionFaq">Competition FAQs</a>
                    | Formatting Your Submission
                    | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">General FAQs</a>
                </div>

                <h1>Formatting Your Submission</h1>

<p>
    Your submission must contain both your submission file(s) and your final source file(s) contained in one ZIP file. You must follow the following directory format within your ZIP file: 
</p>

<p>
    /submission
    <br />/source
</p>

<h2>
    Explanation:
</h2>

<table cellpadding="10" cellspacing="0">
<tbody>
    <tr>
        <td>
            <strong>/submission</strong>
        </td>
        <td>
            All of your submission files go in this folder. Only files in this folder are shown on the Studio web site.
        </td>
    </tr>
    <tr>
        <td>
            <strong>/source</strong>
        </td>
        <td>
            All of your final files/source files go in this folder. These files are never shown on the Studio web site.
        </td>
    </tr>
</tbody>
</table>

<p>
    The Contest Details page will list the files you must include in your submission.
</p>

<h2>
    Examples:
</h2>

<p>
    <strong>XYZ Logo Contest</strong>
    <br />Requirements you see on the Contest Details page:
</p>

<ul>
    <li>Submission requirements: One JPG or PNG file containing your logo design.</li>
    <li>Source requirements: All vector files of the submitted logo design, such as IA files and/or EPS files. All fonts used in your design must be submitted with your files. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.</li>
</ul>

<p>
    You've designed your logo in Illustrator.
</p>

<ol>
    <li>You would save your logo as an EPS file.</li>
    <li>You save your fonts or list your fonts in a text file.</li>
    <li>You would then save your logo as a PNG file. The PNG file is your submission.</li>
    <li>You then zip everything up like this:</li>
</ol>

<p>
    /submission/logo1.png
    <br />/source/vectorfiles.zip <em>(EPS files, fonts or text file.)</em>
</p>

<p>
    <strong>XYZ Web Design Storyboard Contest</strong>
    <br />Requirements you see on the Contest Details page:

<ul>
    <li>Submission requirements: Five (5) JPG or PNG files showing each screen of your design.</li>
    <li>Source requirements: All original source files of the submitted design, such as PSD files, IA and/or EPS files. All fonts used in your design must be submitted with your files. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.</li>
</ul>

<p>
    You've designed your storyboards in Photoshop and you've also created your web icons in Illustrator.
</p>

<ol>
    <li>You would save your final storyboard files as layered PSD files and your icons as EPS files.</li>
    <li>You would then save your final storyboards as JPG files and place then in a ZIP file called "storyboards.zip". The JPGs within this ZIP are your submission.</li>
    <li>You then zip everything up like this:</li>
</ol>

<p>
    /submission/storyboards.zip <em>(Five JPG or PNG screens)</em>
    <br />/source/EPSiconfiles.zip <em>(all icons you designed in Illustrator)</em>
    <br />/source/PSDstoryboards.zip <em>(all layered PSD files of each storyboard screen)</em>
</p>

<p>
    <strong>XYZ Application Prototype Contest</strong>
    <br />Requirements you see on the Contest Details page:
</p>

<ul>
    <li>Submission requirements: Fifteen (15) HTML files showing each screen of your design, along with your CSS file, JavaScript file(s), and all image files, structured in the correct directory hierarchy in a Zip file.</li>
    <li>Source requirements: Your entire submission plus any layered PSD or EPS files of graphics you modified or created for this design.</li>
</ul>

<p>
    You've created all of your HTML, CSS and JavaScript and you have also created 4 new buttons for the application in Photoshop.
</p>

<ol>
    <li>You would save your button graphics as layered PSD files.</li>
    <li>You would save your HTML, CSS, JavaScript and image files and then zip them up according to the directory structure listed on the Contest Details page. This zip file is your submission.</li>
    <li>You then zip everything up like this:</li>
</ol>

<p>
    /submission/prototype.zip <em>(Fifteen HTML files, plus CSS, JavaScript and images)</em>
    <br />/source/prototype.zip <em>(Fifteen HTML files, plus CSS, JavaScript and images)</em>
    <br />/source/PSDbuttons.zip <em>(all layered PSD files of new graphic buttons)</em>
</p>

<div>
<p><strong>Trouble Shooting Tips</strong></p>

<p><strong>
Browsers<br />
SAFARI: </strong>Some members have noted problems uploading files in Safari. We recommend using FireFox or an alternative browser to upload your entries.</p>
<p><strong>
Zip Software<br />
PC USERS:</strong> Several users have reported problems when using certain zip software. The submission seems to be formatted correctly, but they still receive an error message about their source folder. Some members are recommending using 7Zip or WinRar software to package submissions.</p>
<p>If you have any problems submitting, please email studioadmin@topcoder.com at least 24 hours before the contest deadline.</p>
</div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>

    </div>
</body>
</html>