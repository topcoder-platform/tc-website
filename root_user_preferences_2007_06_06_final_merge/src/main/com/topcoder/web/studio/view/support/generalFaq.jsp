<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <jsp:include page="../top.jsp"/>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="support"/>
        </jsp:include>
        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <div class="linkBox"><studio:forumLink forumID="3"/></div>

                <h1>Hints & Tips</h1>
                
                <div style="float: right; text-align: left; margin-left: 10px;">
                    <a href="/?module=Static&d1=support&d2=getStarted">Getting Started</a>
                    <br />Hints & Tips
                    <br /><a href="/?module=Static&d1=support&d2=competitionFaq">Competition FAQs</a>
                </div>

                <h3>What software should I use?</h3>
                Each contest will list file formats that will be accepted both for submissions and final deliverables from the winner(s). Some contests will limit the types of files that will be accepted based on the client's preferences. The most common file types accepted as final deliverables are EPS and AI files from Adobe Illustrator and PSD files from Adobe Photoshop. Open source programs such as Gimp and Inkscape are often acceptable substitutes and many contests accept files from these programs.<br><br>
                
                <h3>What are vector graphics?</h3>
                Vector graphics are images created using points, lines, curves and polygons rather than pixels (raster
                graphics). Vector graphics can be scaled infinitely without degradation. Most Adesigners use Adobe
                Illustrator to create vector files and save them as .EPS (Encapsulated Post Script) or .AI (Adobe
                Illustrator) files.
                <br><br>

                <h3>How do I create vector graphics?</h3>
                You must use a vector graphics editor such as Adobe Illustrator or CorelDraw to create vector graphics.
                PhotoShop .PSD or Photoshop EPS files are not acceptable formats. Please note that using other programs
                such as PaintShop Pro or PhotoShop to export or save a file as an .EPS or .AI file does not make it a
                proper vector graphic.
                <br><br>

                <h3>How do I create a .PDF file?</h3>
                There are many free options available to you on the internet if you do not own a copy of Adobe Acrobat.
                <A href="http://www.primopdf.com/" target="_blank">PrimoPdf</A> and
                <A href="http://www.cutepdf.com/" target="_blank">CutePdf</A> are two options for creating free .PDF
                files online.
                <br><br>

                <h3>What is an .ICO file?</h3>

                .ICO files are Windows based icon image files. These files can hold multiple sizes of icons at varying
                color depths. Standard sizes for most Windows applications are 64x64, 32x32 and 16x16. Icon files should
                be created at maximum color depth, optimized for Windows XP unless otherwise specified in the contest
                details.
                <br><br>

                <h3>How do I create a .ICO file?</h3>
                Many designers will create their artwork in another program such as Adobe Illustrator or PhotoShop and
                then import these files into an icon editor such as <A href="http://www.axialis.com/" target="_blank">Axialis</A>.
                There are also a number of
                <A href="http://www.download.com/3120-2001_4-0-1-0.html?qt=icon+editor&amp;author=&amp;titlename=&amp;desc=&amp;dlcount=&amp;daysback=&amp;swlink=&amp;gfiletype=&amp;os=&amp;li=49&amp;dlsize=&amp;ca=" target="_blank">free
                    icon editors</A> available.
                <br><br>

                <h3>More questions?</h3>
                If you have more questions, please send them to <A href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</A>.

        </div>
        <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
    </div>

    <jsp:include page="../foot.jsp"/>

    <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>