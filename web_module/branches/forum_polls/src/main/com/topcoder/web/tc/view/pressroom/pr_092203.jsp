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
<p><span class="bodyTitle">NVIDIA Signs On To Sponsor 2003 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Leader in Visual Processing Recruits Talent and Promotes Products via Programming Competition Sponsorship </em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., September 22, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development, today announced NVIDIA as a premier sponsor for its 2003 TopCoder Open.  NVIDIA is seeking exceptional candidates for their open programming positions while continuing to increase exposure of the NVIDIA suite of graphics cards.</p>

<p>"We are thrilled to have NVIDIA return to sponsor a premier programming competition for students and professionals," said Jack Hughes, Chairman and Founder of TopCoder.  "As a recognized leader in graphics technology, one of the most demanding areas in all of computing, NVIDIA is a perfect match for the TopCoder community who represent many of the best and brightest software developers."</p>

<p>The 2003 Open will begin online on October 7th and will culminate at the Mohegan Sun Casino in Connecticut on December 4th and 5th.  This is the first tournament in which all professionals and university students are able to compete in the initial qualification rounds, and through the process of elimination, 16 final competitors will advance to the championship and compete against one another for their share of the $100,000 prize purse, with $50,000 being awarded to the champion.  Details are available at: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_overview">http://www.topcoder.com/tco</A></p>

<p>"TopCoder has built a great community of top notch, competitive talent.  It's great when you see such a group of supportive folks really driving each other to excel.  We see a lot of synergy between the TopCoder community and our own here at NVIDIA.  We're delighted to be participating again, and I'm personally excited to see the college talent go toe to toe with the professionals.  It'll be a great match!" said Daniel Rohrer, Manager of Direct X Graphics at NVIDIA.</p>

<p>The 2003 Open is the second major TopCoder tournament sponsored by NVIDIA.  Earlier this year, NVIDIA was a premier sponsor of the TopCoder Collegiate Challenge held at MIT in April.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Corporate partners access this member base for employment, software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit <A href="/">www.topcoder.com.</A></p>

<p><span class="bodySubTitle">About Nvidia</span><br />
NVIDIA Corporation is a market leader in visual computing technology dedicated to creating products that enhance the interactive experience on consumer and professional computing platforms. Its graphics and communications processors have broad market reach and are incorporated into a wide variety of computing platforms, including consumer digital-media PCs, enterprise PCs, professional workstations, digital content creation systems, notebook PCs, military navigation systems and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 1,600 people worldwide. For more information, visit the Company's Web site at <A href ="http://www.nvidia.com">www.NVIDIA.com</A>.</p>

<p>###</p>
March 02, 2006 


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
