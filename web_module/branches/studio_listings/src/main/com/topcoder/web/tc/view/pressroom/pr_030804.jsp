<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>


<div align="center">
<p><span class="bodyTitle">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>Visual Computing Technology Leader Continues Sponsorship with World Championship Scheduled for April 16th in Boston</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., March 8, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced NVIDIA Corporation (Nasdaq: NVDA), the worldwide leader in visual processing solutions, as a premier sponsor for its 2004 TopCoder Collegiate Challenge (TCCC 04).  The TCCC 04 will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $100,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at: http://www.topcoder.com/tccc04.</p>

<p>"NVIDIA truly believes that the TopCoder arena fosters an unparalleled competitive spirit among the most brilliant programmers in the world.  We are proud to be a part of this initiative again," said Daniel Rohrer, Manager of DirectX Graphics.  "Our corporate culture encourages innovation and excellence and the TopCoder competition model is a perfect complement to that philosophy."</p>

<p>Beginning in February, more than 1,000 eligible college students from around the world began competing in qualifying rounds of the TCCC 04. Through a series of online rounds, this field will be narrowed to 32 final competitors by March 22nd, comprised of 24 Algorithm and 8 Component competitors. These finalists will compete in a face to face competition at the Boston Park Plaza Hotel in Boston on April 15th and 16th to determine the winners of both competitions.</p>

<p>The TCCC 04 is the third major TopCoder tournament sponsored by NVIDIA.  Last spring, NVIDIA sponsored the TCCC 03 held at MIT and subsequently became a premier sponsor for the 2003 TopCoder Open which took place last December at the Mohegan Sun Casino, Connecticut.</p>

<p>"We are very pleased to have NVIDIA as a repeat sponsor for our competition," said Rob Hughes, President of TopCoder. "NVIDIA correctly recognizes that the TopCoder Collegiate Challenge attracts elite coding 'athletes' from around the globe and provides a unique opportunity for recruiting the best new draftees for their own development teams."</p>

<p><span class="bodySubTitle">About NVIDIA</span><br />
NVIDIA Corporation is a market leader in visual computing technology dedicated to creating products that enhance the interactive experience on consumer and professional computing platforms. Its graphics and communications processors have broad market reach and are incorporated into a wide variety of computing platforms, including consumer digital-media PCs, enterprise PCs, professional workstations, digital content creation systems, notebook PCs, military navigation systems and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 1,800 people worldwide.  For more information, visit the Company's Web site at www.nvidia.com.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>

<p>###</p>


   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
