<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

     <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script src="js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="howitworks" />
            </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
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


<h2>Your entire contest submission will include three elements: </h2>

<ol><p>    
    <li><strong>Your display submission file(s):</strong> The file(s) you include in this Zip file will be displayed on the Studio site. The client will see everything within this Zip file and will base their winner choices on what they see here.<br><br>
    <li><strong>Your final source file(s):</strong> The file(s) you include in this Zip file will never be displayed on the Studio site. This Zip file is only transferred to the client if your submission receives a prize placement.<br><br>
    <li><strong>Your preview image:</strong> The file you choose here represents your entire submission and is the first thing a client sees when evaluating your submission. It is turned into a thumbnail and displayed on the Studio site.<br><br>
    
    Here is how the upload form appears on the Studio site:<br>
<img src="/i/v2/submission_process.jpg" alt="Submission Process"/></img>
</p></ol>

<strong>Let's walk through each field below:</strong>


<h2>
    Submission Zip File:
</h2>
<img src="/i/v2/sub_process1.gif" alt="Submission Zip File"/></img>

<ul><p>Your submission Zip file will be created based on the information you find on the Contest Details page. <br />Here are some examples:
            <li><strong>XYZ Logo Contest</strong><br>
            One JPG or PNG file containing your logo design.<br><br>
            <li><strong>XYZ Web Design Storyboard Contest</strong><br>
            Five (5) JPG or PNG files showing each screen of your design.<br><br>
            <li><strong>XYZ Application Prototype Contest</strong><br>
            Fifteen (15) HTML files showing each screen of your design, along with your CSS file, JavaScript file(s), and all image files, structured in the correct directory hierarchy in a Zip file.
</p></ul>


<h2>
    Source Zip File:
</h2>
<img src="/i/v2/sub_process2.gif" alt="Source Zip File"/></img>

<ul><p>Your source Zip file will be created based on the information you find on the Contest Details page. <br />Here are some examples:
    <li><strong>XYZ Logo Contest</strong>
    <br />All vector files of the submitted logo design, created as IA files and/or EPS files. All fonts used (with the exception of Windows standard fonts) in your design must also be submitted in this zip. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.<br><br>

    <li><strong>XYZ Web Design Storyboard Contest</strong>
    <br />All original source files of the submitted design. Files should be created in Adobe Photoshop, Gimp, Adobe Illustrator or Inkscape and saved as layered PSD files, AI or EPS files.<br><br>

        All fonts used (with the exception of Windows standard fonts) in your design must also be submitted in this zip. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.<br><br>

    <li><strong>XYZ Application Prototype Contest </strong>
    <br />Same as "submission" folder PLUS any additional files for new graphics created. New files should be created in Adobe Photoshop, Gimp, Adobe Illustrator or Inkscape and saved as layered PSD files, AI or EPS files.<br><br>

        All fonts used (with the exception of Windows standard fonts) in your design must also be submitted in this zip. If you do not have permission to release the fonts, you must provide a text file including the name of the font and a link to where the font can be purchased.
</p></ul>

<h2>
    Preview Image:
</h2>
<img src="/i/v2/sub_process3.gif" alt="Preview Image"/></img>
<p>
    Your preview image can be one of your JPG files from your submission files if the contest is graphical, or it can be a screenshot of one of the pages/screens your have programmed in coding contests. Also, feel free to be creative with your preview image! See this post for more information.<br><br>
Lastly, because some internet connections are slow, and some source files are very large, we recommend uploading a "test" submission 24 hours before the contest ends. This will allow you to understand how long it will take your submission to be accepted. Once you've finalized your design, you can replace your test submission with your final one.

</p>

<h3>Questions?</h3>
<p>Please email us at <a href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com.</a></p>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
