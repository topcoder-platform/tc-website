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
<p><span class="bodyTitle">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament</span><br />
<span class="bodySubTitle"><em>Graphics and Communications Processors Leader Joins Elite Group of Sponsors for Top Programming Event</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., August 04, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that NVIDIA Corporation (Nasdaq: NVDA) has been named as a premier level sponsor for the 2004 TopCoder Open. This year's TopCoder Open will bring the world's finest professional and collegiate programmers together in competition for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place November 11th and 12th at the Santa Clara Marriott in Santa Clara, CA. Full registration details and rules are provided at:  http://www.topcoder.com/tco04
<br/><br/>
"We are thrilled to be a part of this exciting coding competition for the 3rd consecutive year," said Daniel Rohrer, Manager of DirectX Graphics. "The characteristics that allow TopCoder competitors to be successful closely mirror qualities we look for in our engineers at NVIDIA - a drive to win, a razor-sharp mind, and a competitive spirit. We look forward to welcoming TopCoder's finalists to Silicon Valley in November, as well as seeing who prevails among the elite professional and university coders."
<br/><br/>
The initial online qualification rounds will begin September 7th and continue through September 29th, with the top 32 competitors advancing to the onsite finals. Contestants can compete in the Algorithm or Component competitions, or both. 
<br/><br/>
Cash prizes for the 2004 TopCoder Open will comprise $100,000 for the component contest and $50,000 for the algorithm contest for an overall prize purse worth $150,000. "As an ongoing sponsor, NVIDIA shows their commitment to building long term and valuable relationships with a community of top notch developers," said Rob Hughes, President and COO of TopCoder. "NVIDIA recognizes that being the market leader in visual computing technology means consistently attracting highly skilled developers from around the world - and the TopCoder Open attracts the brightest and the best." 
<br/><br/>
<span class="bodySubTitle">About NVIDIA</span><br />
NVIDIA Corporation is a market leader in visual computing technology dedicated to creating products that enhance the interactive experience on consumer and professional computing platforms. Its graphics and communications processors have broad market reach and are incorporated into a wide variety of computing platforms, including consumer PCs, enterprise PCs, notebook PCs, professional workstations, handhelds, and video game consoles. NVIDIA is headquartered in Santa Clara, California and employs more than 1,900 people worldwide.  For more information, visit the Company's Web site at www.nvidia.com.
<br/><br/>
<span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
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
