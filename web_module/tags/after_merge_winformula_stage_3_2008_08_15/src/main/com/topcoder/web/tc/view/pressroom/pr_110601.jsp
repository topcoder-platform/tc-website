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

<P CLASS="bodyTextBold">11.06.2001 - Houston Native Jon McAlister Wins $250,000 TopCoder Invitational<BR/>  
<SPAN CLASS="bodyTextItal">Stanford University Junior Beats Out 15 Competitors for $100,000 Grand Prize</SPAN></P>
<P>CONNECTICUT -- November 5, 2001 -- Jon McAlister, a native of Houston, Texas, won the first-ever $250,000 TopCoder Invitational computer programming tournament held November 2 and 3 at the Foxwoods Resort Casino in Mashantucket, CT. McAlister, who is currently a junior computer science major at Stanford University, beat out 15 of the top computer programmers in the country to claim the $100,000 grand prize.</P>
<P>"Jon has clearly distinguished himself as one of the top computer programmers in the country," said TopCoder Chairman and Founder, Jack Hughes. "This is a tremendous accomplishment as Jon is only a junior in college, and was able to win a tournament which was not only open to other top collegians, but professional programmers as well."</P>
<P>"TopCoder competitions are great intellectual brain candy," said McAlister. "Tournaments like the Invitational are a unique experience to show how good a programmer you really are."</P>
<P>McAlister entered the Invitational as the second seed, and upset top-seed and fellow Stanford junior Daniel Wright (Lafayette, CO) by 71 points in the finals. Nathan Bronson (Durham, NC) and James Lee (Ann Arbor, MI) finished third and fourth, respectively, in the final round. </P>
<P>Semi-finalists in the tournament were: Dan Adkins (Berkeley, CA), Jason Woolever (Sunnyvale, CA), Logan Hanks (Blacksburg, VA), Kamen Yotov (Ithaca, NY), Leo Polovets (Pasadena, CA), Eric Ellingson (Prior Lake, MN), David Ziegler (Boston, MA), Jon Salz </P>
<P>(Somerville, MA), Ambrose Feinstein (Orlando, FL), Trayton Otto (Powder Springs, GA), Patrik Sundberg (Cambridge, MA) and Ben Wilhelm (Oberlin, OH).</P>
<P>TopCoder, Inc. is a company committed to identifying and promoting top-notch computer programming talent. TopCoder's objective rating system places high value on the best and brightest in the programming industry. These unique programming competitions, and the resulting natural attraction of competition, rewards and recognition, have created a powerful community of software developers who are integral to the technology decision-making process for corporations, now and in the future. TopCoder offers exclusive targeted sponsorships of their competitions to companies seeking to build brand awareness and loyalty among the developer community. Single-round competitions are held weekly and are open to all TopCoder members. TopCoder's best-rated members are invited to compete in major tournaments. </P>
<P>All Invitational semifinalists advanced to the onsite rounds based on their scoring in three online elimination rounds. Four semi-final rounds were held on Friday, with the winner of each round advancing to the Saturday's final. Scoring in TopCoder competitions is based on two factors: Intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition, and velocity, the ability to write good code quickly and accurately. Scores are calculated using TopCoder's objective rating system, designed to fairly and accurately gauge a contestant's performance. Winners are the fastest among their peers to solve the problems with code that withstands the scrutiny of other contestants, as well as TopCoder's system test.</P>
<P>The Invitational was the second major programming competition hosted by TopCoder. The company will hold its next tournament, the 2002 TopCoder Collegiate Challenge, in April 2002 in Cambridge, MA. </P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. Since the introduction of TopCoder in February, these competitions have attracted over 4,800 software developers. The attraction of competition and the associated rewards create a powerful community of programmers. Access to this community is granted to corporate partners who both promote and profit from the relationship. For more information and registration details, visit the Web site, http://www.topcoder.com/?r=15.
Editors' Note: Photos are available via the Associated Press Photo Network and on the Internet at Feature Photo Service's link through http://www.newscom.com </P> 



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
