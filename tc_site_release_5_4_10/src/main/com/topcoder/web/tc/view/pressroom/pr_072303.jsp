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
<p><span class="bodyTitle">Revelation Software to Sponsor 2003 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Software Company to Gain Exposure to Top Programmers Worldwide</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., July 23, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced Revelation Software 
as a corporate sponsor for its 2003 TopCoder Open.  Revelation intends to gain critical awareness of their product offerings 
through sponsorship of this tournament.</p>

<p>The 2003 Open will begin online on October 7th and will culminate at the Mohegan Sun Casino in Connecticut on December 
4th and 5th.  This tournament will award a $100,000 prize purse, with $50,000 being awarded to the champion.</p>

<p>"By being associated with this tournament, Revelation will gain in-depth exposure to and contact with many of the best 
programmers in the world," said Jack Hughes, Chairman and Founder of TopCoder.  "In turn, TopCoder is excited to bring 
the message and products of this great, forward-thinking company to our membership that is nearly 30,000 strong."</p>

<p>"We are delighted to sponsor this event.  It's an opportunity for us to show our support for the developer community.  
Events like this one bring out the best solutions from the best developers, and those are the type of developers we want," 
said Mike Ruane, President and CEO of Revelation Software.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder 
members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create 
a powerful community of programmers.  Corporate partners access this member base for employment, software development 
and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder Employment Services or 
sponsorship of TopCoder Events, please visit www.topcoder.com.</p>

<p>Revelation Software Founded in 1982, Revelation Software delivers a suite of application development tools and companion 
services that take full advantage of leading network computing architectures, messaging, groupware, and client server platforms. 
Today, the company's flagship product OpenInsight for Workgroups is the only database development and application environment 
that provides both Windows and Java-based GUI s tools to develop and deploy web-based and client server applications that 
support native and relational XML, SQL, Lotus Notes and the leading legacy Multi-Value data sources such a ARev, Pick and IBM 
Universe. There are more than 1.5 million licensed users of Revelation products across 60,000 deployed sites worldwide. The 
company has offices in Westwood, New Jersey, as well as a European subsidiary in the United Kingdom, and an Asia Pacific 
subsidiary in Australia. </p>

<p>Note to editors: Revelation Software is a division of Revelation Technologies. Revelation Software, OpenInsight and JOI are 
trademarks of Revelation Technologies. All other trademarks and trade names are property of their respective holders.</p>

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
