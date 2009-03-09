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
<p><span class="bodyTitle">TopCoder Announces Artifact Software and Northface University as Sponsors of the 2003 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Software Product Company And Technical University To GainExposure <br/>To The Top Programmers In The World</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., October 1, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development, today announced that
Artifact Software and Northface University have signed on as corporate sponsors of the upcoming 2003 TopCoder Open (<A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_overview">www.topcoder.com/tco</A>).
Artifact will leverage this international programming tournament to introduce its suite of products to some of the world's best programmers.
Northface University will gain exposure to further their efforts to establish the finest university in the world for software developers.</p>

<p>"TopCoder is thrilled to introduce Artifact (TM) , the Artifact Network and Northface University to our international member base exceeding
30,000 in numbers," said Jack Hughes, Chairman and Founder of TopCoder.  "We feel that the Artifact Network is a great resource that our
members will be able to contribute to and benefit from in their daily programming endeavors.  He continued by saying, "Northface University is
a new institution dedicated to furthering the education of serious software developers.  This is a perfect match for TopCoder."</p>

<p>The 2003 TopCoder Open begins online on October 7th.  The tournament will consist of two qualification rounds that will identify the top 500
programmers.  These 500 will compete in four online elimination rounds to be held from October 15th to November 5th.  These elimination
rounds will narrow the field to 16 finalists.  These 16 will compete onsite at the Mohegan Sun Casino in Uncasville, CT on December 4th and 5th.
Competitors will be awarded cash prizes ranging from $25 for the top 200 finishers up to $50,000 for the grand prizewinner.</p>

<p>"Artifact Software is proud to be a sponsor of this year's TopCoder Open," said Jeff Mason, Vice President, Marketing.  "There are no tighter
deadlines than the ones facing these competitors and helping programmers meet deadlines, and build better software, is exactly what the Artifact
Network is about."</p>

<p>"We're delighted to sponsor the 2003 TopCoder Open," said Scott McKinley, Northface University's President and CEO. "Student programmers and
software developers who have entered the workforce without bachelors or master's degrees are an important group for us, and there is no better
venue to reach the best and brightest software developers than TopCoder. Our mission is to give students a real-world education so that they graduate
with B.S. degrees, the two most-respected certifications in the industry, and the resume and references they need to be successful on the job."</p>

<p><span class="bodySubTitle">About Artifact</span><br />
Artifact provides software products and an on-line service to help developers better manage and share their programming resources.  The
Artifact Network is a global developer network that serves as a forum for the public exchange of code and development expertise.  The network
is used by thousands of developers worldwide and contains thousands of valuable programming assets.  The Artifact Server is the technology that
runs the public Artifact Network.  Artifact Server is available to organizations interested in deploying a private, secure, code-sharing environment
behind the corporate firewall.</p>

<p><span class="bodySubTitle">Northface University</span><br />
Northface University is establishing the finest university in the world for software developers. In lockstep with partners IBM, Microsoft, and
Unisys, Northface University is meeting the growing, unmet market need for industry-experienced software developers. Model-centric B.S. and
MBA programs are focused on the most advanced methodologies and practices for bridging the gap between business and IT. Renowned as the faculty
who wrote the books other instructors teach from, Northface University faculty will mentor the next generation of technology leaders in an
experiential learning environment with small classes, state-of-the-art equipment and facilities. Learn more at <A href="http://www.northface.edu">www.northface.edu</A></p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members extend
across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.
Corporate partners access this member base for employment, software development and sponsorship.  For registration details or information regarding
TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit <A href="/">www.topcoder.com</A> or call toll free 866-TopCoder.</p>

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
