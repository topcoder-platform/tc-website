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

<P CLASS="bodyTextBold">10.15.2001 - TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament<BR/>  
<SPAN CLASS="bodyTextItal">Computer Programming Tournament Will Award $100,000 To Winner</SPAN></P>
<P>GLASTONBURY, CT - October 15, 2001 - TopCoder, Inc., a company committed to identifying and promoting top-notch computer programming talent, announced today the 16 finalists to compete in their upcoming 2001 TopCoder Invitational tournament being held November 2-3 at the Foxwoods Resort Casino in Mashantucket, CT. The tournament has a total prize purse of $250,000, with the winner receiving $100,000.</P>
<P>The finalists are: Daniel Wright (Stanford, CA), Jon McAlister (Stanford, CA), Dan Adkins (Berkeley, CA), Jason Woolever (Sunnyvale, CA), James Lee (Ann Arbor, MI), Logan Hanks (Blacksburg, VA), Kamen Yotov (Ithaca, NY), Leo Polovets (Pasadena, CA), Eric Ellingson (Prior Lake, MN), David Ziegler (Boston, MA), Nathan Bronson (Durham, NC), Jon Salz (Somerville, MA), Ambrose Feinstein (Orlando, FL), Trayton Otto (Powder Springs, GA), Patrik Sundberg (Cambridge, MA) and Ben Wilhelm (Oberlin, OH).</P>
<P>Finalists advanced to the championship rounds based on their scoring in online elimination rounds, which began on September 25. Scoring in TopCoder competitions is based on two factors: Intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition, and velocity, the ability to write good code quickly and accurately. Scores are calculated using TopCoder's objective rating system, designed to fairly and accurately gauge a contestant's performance. Winners are the fastest among their peers to solve the problems with code that withstands the scrutiny of other contestants, as well as TopCoder's system test.</P>
<P>"We're confident our programming competitions test and reflect real-world coding skills in a way that's valuable to our constituents," said TopCoder founder Jack Hughes. "We're very excited as we enter the finals for our first TopCoder Invitational. The spirit of competition among these highly rated developers has become palpable. We wish each of the finalists the best of luck and look forward to announcing the winners on November 5."</P>
<P>TopCoder has created an objective rating system that places high value on the best and brightest in the programming industry. Their unique programming competitions, and the resulting natural attraction of competition, rewards and recognition, has created a powerful community of software developers. TopCoder competitions hold the attention and interest of individuals who are integral to the technology decision-making process for corporations, now and in the future. TopCoder offers exclusive targeted sponsorships of their single-round competitions and major tournaments to companies seeking to build brand awareness and loyalty among the developer community.</P>
<P>The tournament favorite is Daniel Wright, a junior at Stanford University, majoring in Computer Science. This is Wright's second consecutive appearance in TopCoder's first two major tournaments, as he finished tied for ninth at the TopCoder Collegiate Challenge in June, and won $5,750. Other returning competitors include Collegiate Challenge champion Jason Woolever, a Senior Research and Design Engineer for Synopsys, Inc. of Mountain View, CA; Wright's classmate and winner of $25,000 at the Collegiate Challenge, Jon McAlister; and James Lee, a computer science graduate student at the University of Michigan.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. Since the introduction of TopCoder in February, these competitions have attracted over 4,200 software developers. The attraction of competition and the associated rewards create a powerful community of programmers. Access to this community is granted to corporate partners who both promote and profit from the relationship. It costs members nothing to participate. For more information and registration details, visit the Web site, http://www.topcoder.com/?r=13</P> 



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
