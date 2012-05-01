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
<p><span class="bodyTitle">Columbia University Student Wins DoubleClick's 2004 TopCoder Programming Challenge</span><br />
<span class="bodySubTitle"><em>Jason Winokur Named Champion in $10,000 Coding Contest Eliot Horowitz Wins DoubleClick Employee Challenge </em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., March 1, 2004&#151;</strong>

TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Jason Winokur of Columbia University has won the DoubleClick 2004 Coding Challenge.  In the DoubleClick employee competition, first place finisher was Eliot Horowitz of the New York City office.  The competition was open to all eligible students at Columbia University and New York University as well as DoubleClick employees. The tournament was designed to highlight the competitors' relative skills in the analysis of complex algorithmic problems and the ability to write software to solve those problems.</p>

<p>Winokur overcame nine other students representing Columbia and NYU in the final round at DoubleClick's Headquarters in New York City on Friday to claim the top honors and take home the first place purse of $5,000. The remainder of the student finalists shared an additional $5,000 in prize money.  In the parallel competition for employees, DoubleClick's own software engineers battled in the TopCoder arena applet to evaluate their professional skill sets. DoubleClick Software Engineer Horowitz earned a 32 inch Sony Plasma TV for his victorious effort.  Of the remaining finalists, the top three received Garmin iQue 3600 Palm devices with integrated GPS, and the rest were awarded their choice of a Canon PowerShot S400 digital camera or an Apple iPod.</p>

<p>"TopCoder's competition model provides us with a powerful tool for recruitment and assessment as we look to identify the next generation of DoubleClick's programming talent," said Mok Choe, Chief Information Officer, DoubleClick.  "We've also generated a lot of excitement within our internal development group and given our own talent a chance to shine."</p>

<p>DoubleClick used the TopCoder contest to cultivate the competitive spirit and the technical strength of the contestants who solved the same set of complex problems during two rounds of competitions using Java, C++, C# or Visual Basic as their language of choice.</p>

<p>"Many of the world's top technology companies use TopCoder to reach both professional and collegiate developers," said Rob Hughes, President of TopCoder.  "Nothing attracts an audience like competition, and TopCoder sets the pace."</p>

<p><span class="bodySubTitle">About DoubleClick</span><br />
DoubleClick is the leading provider of tools for advertisers, direct marketers and web publishers to plan, execute and analyze their marketing programs. DoubleClick's online advertising, email marketing and database marketing solutions help clients yield the highest return on their marketing dollar. In addition, the company's marketing analytics tools help clients measure performance within and across channels. DoubleClick Inc. has global headquarters in New York City and maintains 22 offices around the world.</p>

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
