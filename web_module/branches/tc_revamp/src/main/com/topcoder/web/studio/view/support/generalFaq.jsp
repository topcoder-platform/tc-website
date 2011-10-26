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
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=formatSubmission">Formatting Your Submission</a>
                        | General FAQs
                        </div>
        
                        <h1>General FAQs</h1>
                        
        
                        <h3>What software should I use?</h3>
                        Each contest will list file formats that will be accepted both for submissions and final deliverables from the winner(s). Some contests will limit the types of files that will be accepted based on the client's preferences. The most common file types accepted as final deliverables are EPS and AI files from Adobe Illustrator and PSD files from Adobe Photoshop. Open source programs such as Gimp and Inkscape are often acceptable substitutes and many contests accept files from these programs.<br /><br />
                        
                        <h3>What are vector graphics?</h3>
                        Vector graphics are images created using points, lines, curves and polygons rather than pixels (raster
                        graphics). Vector graphics can be scaled infinitely without degradation. Most Adesigners use Adobe
                        Illustrator to create vector files and save them as .EPS (Encapsulated Post Script) or .AI (Adobe
                        Illustrator) files. InkScape is open source equivalent software.
                        <br /><br />
        
                        <h3>How do I create vector graphics?</h3>
                        You must use a vector graphics editor such as Adobe Illustrator or CorelDraw to create vector graphics.
                        PhotoShop .PSD or Photoshop EPS files are not acceptable formats. Please note that using other programs
                        such as PaintShop Pro or PhotoShop to export or save a file as an .EPS or .AI file does not make it a
                        proper vector graphic.
                        <br /><br />
        
                        <h3>How do I create a .PDF file?</h3>
                        There are many free options available to you on the internet if you do not own a copy of Adobe Acrobat.
                        <a href="http://www.primopdf.com/" target="_blank">PrimoPdf</a> and
                        <a href="http://www.cutepdf.com/" target="_blank">CutePdf</a> are two options for creating free .PDF
                        files online.
                        <br /><br />
        
                        <h3>What is an .ICO file?</h3>
        
                        .ICO files are Windows based icon image files. These files can hold multiple sizes of icons at varying
                        color depths. Standard sizes for most Windows applications are 64x64, 32x32 and 16x16. Icon files should
                        be created at maximum color depth, optimized for Windows XP unless otherwise specified in the contest
                        details.
                        <br /><br />
        
                        <h3>How do I create a .ICO file?</h3>
                        Many designers will create their artwork in another program such as Adobe Illustrator or PhotoShop and
                        then import these files into an icon editor such as <a href="http://www.axialis.com/" target="_blank">Axialis</a>.
                        There are also a number of
                        <a href="http://www.download.com/3120-2001_4-0-1-0.html?qt=icon+editor&amp;author=&amp;titlename=&amp;desc=&amp;dlcount=&amp;daysback=&amp;swlink=&amp;gfiletype=&amp;os=&amp;li=49&amp;dlsize=&amp;ca=" target="_blank">free
                            icon editors</a> available.
                        <br /><br />
        
                        <h3>More questions?</h3>
                        If you have more questions, please send them to <a href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</a>.

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
