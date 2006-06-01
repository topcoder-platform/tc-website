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

<P CLASS="bodyTextBold">06.07.2001 - Jason Woolever Wins 2001 TopCoder Collegiate Challenge<BR/><SPAN CLASS="bodyTextItal">MIT Student Beats Out 15 Competitors for $100,000 Grand Prize</SPAN></P>
<P>San Francisco, Calif. - June 7, 2001 - MIT student Jason Woolever has won the first-ever TopCoder Collegiate Challenge, held at the San Francisco Hilton and Towers June 5-7. Woolever beat out 15 programmers from some of the nation's top schools for computer science.</P>
<P>The event coincided with the launch of the Glastonbury, Connecticut-based TopCoder, Inc., a company committed to identifying and promoting top-notch computer programming. TopCoder uses these competitions to attract and rate highly skilled programmers while facilitating connections between its members and employers.</P>
<P>"Jason is a stellar example of the caliber of graduates that enter the IT workforce each year," said TopCoder founder Jack Hughes. "Through these competitions, TopCoder will continue to provide the means for leading companies to recruit, assess and hire programmers like Jason."</P>
<P>"I knew it would be a tough win; the other competitors did a great job," said Woolever, who will start a new job at Synopsys in Sunnyvale, California next week. "I'm thinking about using the money for a down payment on a house."</P>
<P>The runners-up included: Jon McAlister, Daniel Wright and David Pecora (Stanford University); Andrew Nierman, Jason Dillaman and James Lee (University of Michigan); Nathan Egge and Alex Kalita (Virginia Polytechnic Institute and State University); Benjamin Jackson and Sean Stanek (Iowa State University); Kenneth Tang (University of California, San Diego); Jason Wodicka (Rensselaer Polytechnic Institute); Aleksey Kurchuk (Rutgers University); Chad Wood (University of Texas at Austin); and Andrew Marut (Worcester Polytechnic Institute).</P>
<P>TopCoder is leveraging the results of the Collegiate Challenge and other competitions to create a national database of talent-differentiated student and professional programmers. It has several competitions scheduled for the remainder of 2001, including its first professional tournament, the TopCoder Invitational. The Invitational will begin in September with a series of online elimination rounds and culminate in November with a final round of competition onsite at the Foxwoods Resort Casino in Connecticut. The total purse for that tournament will also be $250,000. While the current competitions are based on the Java programming, competitions based on other languages (like C++) are in development.</P>
<P CLASS="smallText">For more information and registration details, visit the Web site, www.topcoder.com.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>TopCoder, Inc. organizes and runs programming competitions for its members. Through its Web site, www.topcoder.com, the company effectively combines the challenge of head-to-head contests, the efficiency of online recruiting and the objectivity of IT certification. By offering substantial membership incentives, including cash awards, and a unique objective rating model, TopCoder brings together highly qualified, talent-differentiated programmers, and acts as a conduit for companies seeking access to such a group. As a commercial site, TopCoder establishes partnerships with organizations in the form of subscriptions and sponsorships.  </P> 



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
