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
<p><span class="bodyTitle">Intel Corporation Sponsors 2004 TopCoder Open Tournament</span><br />
<span class="bodySubTitle"><em>Intel Joins as One of the Premier-Level Sponsors for Programming Contest</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., August 04, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Intel Corporation has joined as one of the premier-level sponsors for the 2004 TopCoder Open. This year's TopCoder Open will bring the world's finest professional and collegiate programmers together in competition for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place November 11th and 12th at the Santa Clara Marriott in Santa Clara, CA. Full registration details, prize information and rules are provided at:  http://www.topcoder.com/tco04
<br/><br/>
"We are pleased to participate as a sponsor of the 2004 TopCoder Open, which is recognized as one of the pre-eminent events of its kind in the world," said Melissa Laird, general manager, Solutions Enabling Division, Intel Corporation. "We look forward to an exciting tournament and the interaction with an exceptional field of contestants."
<br/><br/>
The initial online qualification rounds will begin September 7th and continue through September 29th, with the top 32 competitors advancing to the Onsite Finals in Santa Clara, CA on November 11th and 12th.  Contestants can compete in the Algorithm or Component competitions, or both. Cash prizes for the 2004 TopCoder Open will comprise $100,000 for the component tournament and $50,000 for the algorithm contest for an overall prize purse worth $150,000. 
<br/><br/>
"The 2004 Open will be the largest and most competitive tournament in our history," said Rob Hughes, President and COO of TopCoder. "Intel continues to demonstrate their support of the TopCoder event, and the developer community at large."<br/><br/>
<span class="bodySubTitle">About Intel</span><br />
Intel, a respected microprocessor company and one of the leading manufacturers of computer, networking and communications products, also offers a worldwide network of software resources to help developers plan, create, market and support next-generation applications. Additional information about Intel is available at www.intel.com/pressroom.
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
