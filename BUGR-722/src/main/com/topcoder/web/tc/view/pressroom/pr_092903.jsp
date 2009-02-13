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
<p><span class="bodyTitle">TopCoder Announces Intel as Title Sponsor for Annual International Programming Tournament</span><br />
<span class="bodySubTitle"><em>World's Largest Chip Maker Joins TopCoder in Crowning International Programming Champion</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., September 29, 2003&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Intel 
Corporation as the title sponsor for the 2003 TopCoder Open.  The 2003 TopCoder Open will bring many of the world's best programmers together 
in competition for international ranking, notoriety and the $100,000 prize purse, of which $50,000 will be awarded to the tournament champion.  
Details are provided at: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_overview">http://www.topcoder.com/tco</A>.</p>

<p>Beginning in October, programmers from all around the world will compete in qualifying rounds of the 2003 TopCoder Open.  Through a series 
of online rounds, the field will be narrowed to 16 semifinalists.  These semifinalists will then compete head-to-head over two days at the Mohegan 
Sun Casino in Uncasville, CT on December 4th and 5th.  For the first time, in addition to the programming tournament, the event will feature new 
component design and development contests.  The winners of each of these contests will receive $15,000.</p>

<p>"Intel is excited to be a part of this great programming tournament," said Richard Wirt, Intel Senior Fellow and General Manager, Software and 
Solutions Group.  "It is clear that many of these competitors are involved in the technology decisions that will shape our future.  By working together 
with TopCoder, Intel and its developer network, Intel Developer Services (<A href="http://www.intel.com/IDS">www.intel.com/IDS</A>), will continue to educate programmers on current 
and next-generation computing initiatives and technologies."</p>

<p>"Intel is the ultimate technology leader and matches well with the TopCoder member base," said Jack Hughes, Chairman and Founder of TopCoder.  
"Our members want to be associated with the best technology resources in the world.  To that end, we are happy to bring them that much closer to 
Intel by joining forces to put on the 2003 TopCoder Open."</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members extend across 
all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Corporate 
partners access this member base for employment, software development and sponsorship.  For registration details or information regarding TopCoder 
Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit <A href="/">www.topcoder.com</A> or call toll free 866-TOPCODER.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>

<p>Intel is a trademark of Intel Corporation or its subsidiaries in the United States and other countries.</p>

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
