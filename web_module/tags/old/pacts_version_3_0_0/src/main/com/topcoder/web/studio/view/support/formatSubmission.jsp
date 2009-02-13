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

                <div class="linkBox"><studio:forumLink forumID="3"/></div>

                <h1>Formatting Your Submission</h1>
                
                <div style="float: right; text-align: left; margin-left: 10px;">
                    <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted">Getting Started</a>
                    <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">General FAQs</a>
                    <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=competitionFaq">Competition FAQs</a>
                    <br />Formatting Your Submission
                    <br /><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">Assignment FAQ</a>
                </div>

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
    If a contest requires a preview image and/or preview file, you must provide one. If it does not require a preview image and/or preview file, you are free to submit one if you like, but it is not required. 
</p>

<p>
    Preview Image: Place your preview image in the submission folder. Example: /submission/storyboard1.jpg
</p>

<p>
    Preview File: Place your submission into a ZIP file and place it in your submission folder. Example: /submission/storyboards.zip
</p>

<p>
    Please follow the submission instructions listed on the Contest Overview page.
</p>

<h2>
    Examples:
</h2>

<p>
    <strong>XYZ Logo Contest</strong>
    <br />Requirements you see on the Contest Details page:
</p>

<ul>
    <li>Submission requirements: One JPG or PNG file containing your logo design. A preview image is required.</li>
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
    /submission/logo1.png <em>(submission also acts as preview image)</em>
    <br />/source/vectorfiles.zip <em>(EPS files, fonts or text file.)</em>
</p>

<p>
    <strong>XYZ Web Design Storyboard Contest</strong>
    <br />Requirements you see on the Contest Details page:

<ul>
    <li>Submission requirements: Five (5) JPG or PNG files showing each screen of your design. A preview image is required. A preview file is required.</li>
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
    <br />/submission/storyboard1.jpg <em>(preview image of your choice)</em>
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