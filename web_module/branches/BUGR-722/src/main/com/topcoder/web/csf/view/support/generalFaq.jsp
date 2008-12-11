<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
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

                <div class="linkBox">
                    <csf:forumLink forumID="3"/>
                </div>

                <h1>Frequently Asked Questions</h1>

                <h3>What are vector graphics?</h3>
                Vector graphics are images created using points, lines, curves and polygons rather than pixels (raster
                graphics). Vector graphics can be scaled infinitely without degradation. Most designers use Adobe
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

                <h3>Will Studio contests affect my TopCoder Rating?</h3>
                No. Studio is independent of TopCoder ratings and statistics. Winning Studio contests will not improve
                your TopCoder standings.
                <br><br>

                <h3>Why can't I see the Contest Specifications?</h3>
                You must be a registered Studio member to see a contest's specifications document. You can register with
                Studio by clicking any of the <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register Now</A>
                links on this site. If you already have a TopCoder handle, you may login to
                <A href="http://<%=ApplicationServer.SERVER_NAME%>">www.topcoder.com</A> and update your profile by
                simply opting in for Studio membership.
                <br><br>

                <h3>How do I get paid if I win?</h3>
                There are two steps to getting paid:
                <ol>
                    <li>Submit the deliverables listed under the "Final Deliverables for Winner" heading on the contest
                        details page.
                    </li>
                    <li>A completed and signed IRS tax form - either W-9 or W-8BEN, depending on where you live and what
                        your U.S. resident status is. Members will only be required to submit this document once.
                    </li>
                    <ul>
                        <li><A href="/pdfs/forms/fw9.pdf">W-9 Form</A></A>
                    </li>
                    <li><A href="/pdfs/forms/iw9.pdf">W-9 Instructions</A></li>
                    <li><A href="/pdfs/forms/fw8ben.pdf">W-8BEN Form</A></li>
                    <li><A href="/pdfs/forms/iw8ben.pdf">W-8BEN Instructions</A></li>
                </ul>
            </ol>
            Once these requirements are satisfied, payment will be sent. You have the option of choosing to receive
            payment either via check using the U.S. Postal Service to the address in your profile, via PayPal or via
            wire transfer. Any questions regarding prize payments and requests for payment type should be directed to
            <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
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