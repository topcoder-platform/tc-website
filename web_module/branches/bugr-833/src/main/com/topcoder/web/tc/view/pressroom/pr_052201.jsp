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

<P CLASS="bodyTextBold">05.22.2001 - Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title<BR/><SPAN CLASS="bodyTextItal">San Francisco Tournament Concurrent with Sun's JavaOne Event. Winners From Top Schools Will Share $250,000 in Prize Money</SPAN></P>
<P>Glastonbury, Conn. -- May 22, 2001 -- TopCoder Inc., a Glastonbury, Connecticut-based company committed to identifying and promoting top-notch computer programming talent, announced today the 16 finalists to compete in the upcoming TopCoder Collegiate Challenge being held June 5-7 at the San Francisco Hilton and Towers. The tournament also sets the stage for the official launch of TopCoder, which uses these competitions to attract and rate highly skilled programmers while acting as a conduit between its members and potential employers.</P>
<P>The finalists from across the U.S. are: Jon McAlister, Daniel Wright and David Pecora (Stanford University); Andrew Nierman, Jason Dillaman, and James Lee (University of Michigan,); Nathan Egge and Alex Kalita, (Virginia Polytechnic Institute); Benjamin Jackson and Sean Stanek, (Iowa State University); Jason Woolever (MIT); Kenneth Tang (University of California, San Diego); Jason Wodicka (Rensselaer Polytechnic Institute); Aleksey Kurchuk (Rutgers University); Chad Wood (University of Texas at Austin); and Andrew Marut (Worcester Polytechnic Institute).</P>
<P>"Each year a new class of graduates enters the IT workforce," said TopCoder founder Jack Hughes. "TopCoder competitions help high-technology companies and recruiters identify and objectively assess candidates by testing and rating coding skills under real-world conditions."</P>
<P>Finalists advanced to the final rounds based on their scoring in preliminary online competition rounds that began on April 7. Scoring in TopCoder competitions is based on two factors: intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition; and velocity, the ability to write good code quickly and accurately. Scores are calculated using TopCoder's objective assessment model and unique rating system, designed to fairly and accurately gauge a contestant's performance.</P>
<P>For the Collegiate Challenge, the 16 finalists have been divided into four groups of four, based on the ratings they have earned over the course of competition. Each group's first place winner will then advance to the final championship round on June 7 from 10:00 a.m. to 12 p.m. (PDT) with an awards ceremony to follow. All competition rounds can be viewed live, online at www.topcoder.com.</P>
<P>The schedule for the event is as follows:</P>
<P><SPAN CLASS="bodyTextBold">Semi-final Rounds</SPAN><BR/>
Tuesday, June 5:<BR/> 
Group 1: 10:00 am - 12:00 pm Pacific Time<BR/>
Group 2: 2:00 pm - 4:00 pm Pacific Time<BR/></P>
<P><SPAN CLASS="bodyTextBold">Wednesday, June 6:</SPAN><BR/> 
Group 3: 10:00 am - 12:00 pm Pacific Time<BR/>
Group 4: 2:00 pm - 4:00 pm Pacific Time<BR/></P>
<P><SPAN CLASS="bodyTextBold">Prizes each semi-final group:</SPAN><BR/>
4th place: $3,000 (4 recipients total)<BR/>
3rd place: $5,750 (4 recipients total)<BR/>
2nd place: $10,000 (4 recipients total)<BR/>
1st place: $25,000 (four coders advance to Championship Round)<BR/></P>
<P><SPAN CLASS="bodyTextBold">Championship Round ($75,000 to 1st place winner) Thursday, June 5:</SPAN><BR/>
10:00 am - 12:00 pm Pacific Time<BR/></P>
<P><SPAN CLASS="bodyTextBold">Awards Ceremony and Reception</SPAN><BR/>
12:00 pm - 2:00 pm Pacific Time<BR/></P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts programming competitions for its members. Through its website, www.topcoder.com, the company has effectively combined the challenge of online contests, the efficiency of online recruiting and the objectivity of IT certification. By offering substantial membership incentives, including cash awards, and a unique objective rating model, TopCoder brings together highly qualified, talent-differentiated programmers, and facilitates connections with companies seeking access to such a group. As a commercial site, TopCoder establishes partnerships with organizations in the form of subscriptions and sponsorships. It costs programmers nothing to participate.</P> 



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
