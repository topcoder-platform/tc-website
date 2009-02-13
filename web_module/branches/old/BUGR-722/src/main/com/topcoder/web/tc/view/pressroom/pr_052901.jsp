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

<P CLASS="bodyTextBold">05.29.2001 - TopCoder Addresses Demand for Elite Programmers with Coding Competitions<BR/><SPAN CLASS="bodyTextItal">- San Francisco Collegiate Tournament Finals Concurrent with Sun Java One Event<BR/>- Contestants from Top U.S. Universities Vying for Share of $250,000 Prize Purse.</SPAN></P>
<P>Glastonbury, Conn. - May 29, 2001 - TopCoder, Inc., a Glastonbury, Connecticut-based company committed to identifying and promoting top-notch computer programming talent, announced today the list of contestants for its upcoming TopCoder Collegiate Challenge finals. The event, which will be held in San Francisco from June 5-7, at the San Francisco Hilton and Towers, will pit some of the country's top student programmers against each other in live, two-hour rounds of competition. The tournament also sets the stage for the official launch of TopCoder, which uses these competitions to attract and rate highly skilled programmers while facilitating connections between its members and companies in which technology is a business imperative.</P>
<P>By coupling one-of-a-kind competitions with a unique objective rating system, TopCoder is setting the industry standard for clearly differentiating programming skill. Jack Hughes, the company's founder and author of this innovative business model, is also co-founder and former chairman of Tall[\u225]n, Inc., an application development professional services firm in which CMGI, Inc. acquired a majority ownership last year.</P>
<P>Hughes has long recognized the critical role of programming talent in creating innovative products and services. He named his previous company Tall[\u225]n because it means "talent" in Gaelic. Tall[\u225]n was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte &amp; Touche.</P>
<P>"TopCoder serves to bring excellent programmers together with leading companies in search of high-tech talent," said Hughes, a veteran programmer. "We're confident our programming competitions test and reflect real-world coding skills in a way that's valuable to our constituents. Our fast-growing membership base is already proof of that. By hosting these competitions, TopCoder will provide the means for leading companies to recruit, assess and hire the upper echelon of computer programmers."</P>
<P>Sixteen programmers from some of the nation's top schools for computer science will compete for the $100,000 grand prize and an overall purse of $250,000. The 16 finalists are: Jon McAlister, Daniel Wright and David Pecora (Stanford University); Andrew Nierman, Jason Dillaman and James Lee (University of Michigan); Nathan Egge and Alex Kalita (Virginia Polytechnic Institute and State University); Benjamin Jackson and Sean Stanek (Iowa State University); Jason Woolever (MIT); Kenneth Tang (University of California, San Diego); Jason Wodicka (Rensselaer Polytechnic Institute); Aleksey Kurchuk (Rutgers University); Chad Wood (University of Texas at Austin); and, Andrew Marut (Worcester Polytechnic Institute).</P>
<P>The finalists have been divided into groups of four, based on scoring during the preliminary online qualification rounds. The four first place winners from the June 5 and June 6 semi-final rounds will compete in the final championship round on June 7. The tournament will be held concurrent with Sun Microsystems' Java One conference.</P>
<P>TopCoder leverages the results of its competitions like the Collegiate Challenge Tournament to create a national database of talent-differentiated student and professional programmers. This database, coupled with TopCoder's unique rating system, provides prospecting employers a means to efficiently and cost-effectively source, evaluate and select talent. Companies gain access to the TopCoder database through various subscriptions and sponsorships, utilizing member profile and statistical information to make informed hiring and marketing decisions. While the current competitions are based on the Java programming language, other competitions in other languages, like C++, are currently in development.</P>
<P>Several competitions are scheduled for the remainder of 2001 including TopCoder's first professional tournament, the TopCoder Invitational. The Invitational will begin in September with a series of online elimination rounds and culminate in November with a final round of competition onsite at the Foxwoods Resort Casino in Connecticut. The total purse for the TopCoder Invitational will also be $250,000. For more information and registration details, visit the Web site, www.topcoder.com.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>TopCoder, Inc. organizes and runs programming competitions for its members. Through its Web site, www.topcoder.com, the company has effectively combined attributes of online gaming, recruiting and IT certification. By offering substantial membership incentives, including cash awards, and a unique objective rating model, TopCoder brings together highly qualified, talent-differentiated programmers and acts as a conduit for companies seeking access to such a group. As a commercial site, TopCoder establishes partnerships with organizations in the form of subscriptions and sponsorships.</P> 
<P><BR/></P>



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
