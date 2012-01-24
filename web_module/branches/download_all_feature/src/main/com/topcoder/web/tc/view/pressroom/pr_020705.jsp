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
<p><span class="bodyTitle">TopCoder Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark</span><br />
<span class="bodySubTitle"><em>Global Leader in Programming Competitions and Competitive Software Development Celebrates Rapid Growth</em></span></p>
</div>

<p><strong>GLASTONBURY, CT, February 7, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced it was celebrating a major milestone as the TopCoder global community of registered members officially surpassed the 50,000 mark. At the same time, the number of rated TopCoder developers has approached 10,000. In less than four years since the organization's inception, TopCoder programming tournaments have awarded more than $2 million in prize money to some of the best collegiate and professional programmers from 187 countries around the globe. TopCoder membership is free and brings with it eligibility to compete in high profile tournaments, access to round tables and educational forums as well as access to some of the world's leading employers of software developers. For full membership benefit details and registration please visit http://www.topcoder.com.
<br /><br />
Through its schedule of high profile tournaments and unique competition arena, TopCoder recognizes and promotes the abilities of the best programmers around the world and with TopCoder Software harnesses the talent of these developers to design, develop and deploy software using its revolutionary competitive development methodology.
<br /><br />
Along with reaching the 50,000 registered and 10,000 rated member milestones, other TopCoder statistical notes include:
<ul>
<li>3,211 individual participants have competed in the 8 major tournaments since May 2001;</li>
<li>$2,060,000 in prize money has been awarded to TopCoder members, $1.29million in major tournament prize money and $785,000 over the course of 229 weekly single round matches (SRMs);</li>
<li>Major TopCoder sponsors and clients include Yahoo!, Google, NVIDIA, Microsoft Corporation, Praxair, Inc., Sun Microsystems, Inc., ING, Intel Corporation, and ABB Ltd;</li>
<li>Total of 187 countries represented by TopCoder members;</li>
<li>TopCoder membership is 52% collegiate and 48% professional;</li>
<li>Over 37,500 challenges have been submitted in SRMs;</li>
<li>149,774 code submissions have been made in all rated events;</li>
<li>4,926,915 individual system tests have been run in all rated events.</li>
</ul>

"We are celebrating the continued growth of TopCoder as we reach this significant milestone of 50,000 with 10,000 of those members fully ranked and rated," said Rob Hughes, President of TopCoder. "We've experienced dynamic growth this year - almost 12,000 new members in the last six months alone - so we are at a very exciting stage of our community's life and are committed to continuing to provide the world's number one developer forum for the world's top developers."
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br /><br />
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.
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
