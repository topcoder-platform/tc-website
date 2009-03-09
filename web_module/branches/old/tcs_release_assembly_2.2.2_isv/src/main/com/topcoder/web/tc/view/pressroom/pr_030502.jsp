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

<P><B>TopCoder Reaches 10,000 Member Milestone</B></P>
<P>Host of Computer Programming Contests Sees Considerable Growth in the Last Six Months</P>
<P>GLASTONBURY, CT., March 4, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced it has reached the 10,000-member mark just one year into the company's existence.</P>
<P>Almost 75 Percent of Membership Gained in Past Six Months</P>
<P>Aided by membership drives to increase the amount of competitors in the 2001 TopCoder Invitational and the current TopCoder Collegiate Challenge, TopCoder added over 7,300 new members from September 2001 through February 2002.  The following chart outlines TopCoder's membership growth over the past six months:</P>
<DIV ALIGN="center"><IMG SRC="/i/membergrowth.jpg" alt="membergrowth" width="371" height="227" border="0"/></DIV>
<P>International Expansion Increases TopCoder's Global Presence</P>
<P>Over the past six months, TopCoder has seen positive results from expanding the eligibility criteria to include residents of four major computer programming hotbeds: Canada, Australia, India and the United Kingdom.  These countries make up more than 1,100 of TopCoder's developer community.  India leads with 401, followed by Canada (390), the United Kingdom (176) and Australia (139).  This growth demonstrates the success of TopCoder's global expansion, and TopCoder will continue to extend its programming competitions worldwide as international demand for competition continues, in effect, bringing the entire worldwide developer community together.  The company's next expansion effort is Ireland.</P>
<P>Match Participation Growth</P>
<P>Participation in TopCoder's Single Round Matches has increased from 81 for the first match in May 2001 to almost 600 for the most recent match on February 28, an increase of over 600 percent.  TopCoder began averaging over 100 participants for matches in August 2001, grew to over 200 in November, reached the 350 mark in January 2002, and erupted to more than 500 in February.   The following chart tracks the member participation per match:</P>
<DIV ALIGN="center"><IMG SRC="/i/matchparticipation.jpg" alt="matchparticipation" width="371" height="214" border="0"/></DIV>
<P>Growth Due to Desire to Increase Skills and Marketability</P>
<P>TopCoder's growth is due largely to the fact that TopCoder offers the developer community a means of building their skills in order to help differentiate and better position themselves in a tight job market.  TopCoder competitions establish objective peer coding ratings that document skills and accomplishments to colleagues and prospective employers.</P>
<P>Continued Growth Expected</P>
<P>TopCoder expects to see this growth trend continue as its average monthly growth rate has been more than 1,200 new members for the past six months, after averaging 510 the previous six.  TopCoder's most successful way of recruiting new members has been its Referral Incentive Program, which debuted in August 2001.  The Referral Incentive Program was designed to increase the number of quality programmers competing in TopCoder competitions.  This program provides cash incentives to those members who spread the word about TopCoder.  For a one-year period following the registration of a referral, the referring member will receive a commission of 10 percent of all cash prizes won by the referred member.</P>
<P>"The Referral Incentive Program has done a great job in increasing membership and developer support," said Jack Hughes, founder and chairman for TopCoder.  "A referring member could actually earn over $20,000 in commissions off of one referral.  This is unprecedented in Internet competitions.  To date, TopCoder's Referral Incentive Program has been responsible for 1,537 members."</P>
<P>About TopCoder, Inc.</P>
<P>TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com.</P>


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
