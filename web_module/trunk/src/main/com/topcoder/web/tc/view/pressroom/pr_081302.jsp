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

   <P><B>Sun Microsystems and TopCoder Host SunNetwork(SM) Coding Challenge<BR/>
   At the SunNetwork(SM) Conference in San Francisco</B></P>
   
   <P>
   SANTA CLARA, Calif. and GLASTONBURY, Conn., Aug. 13 /PRNewswire-FirstCall/
   -- Sun Microsystems, Inc. (Nasdaq: SUNW) and TopCoder, Inc. today opened
   registration for the upcoming SunNetwork(SM) Coding Challenge being held
   during the SunNetwork(SM) Conference and Pavilion at the San Francisco Moscone
   Center from September 18-20, 2002. The tournament, which has a total prize
   purse of $80,000, will be open to Java(TM) coding conference attendees who
   register for the conference at http://www.topcoder.com/sunnetworkchallenge or
   at the TopCoder pavilion during the SunNetwork Conference.
   </P>
   <P>
   This year marks the inaugural edition of the SunNetwork Conference and
   Pavilion, an event dedicated to showcasing Sun's end-to-end solutions that
   have revolutionized the Internet, networking and computing industries.
   SunNetwork offers in-depth sessions on Sun system architecture, network and
   computing management, services development tools and techniques. SunNetwork
   will bring Sun's partners, customers and developers together to solve their
   technology and networking challenges.
   </P>
   <P>
   "Many people think of software engineers as antisocial without a
   competitive bone in their bodies," said James Gosling, Vice President and Sun
   Fellow, Sun Microsystems, Inc. "But while we may be 'differently social', we
   are very competitive, especially about the activity at the core of our
   profession:  coding. The folks at TopCoder have done a great job of
   formalizing the informal competitions that hackers have always engaged in, and
   I'm looking forward to the Java Coding Challenge at the SunNetwork
   Conference."
   </P>
   <P>
   The Challenge will commence with a qualification round on September 18th,
   which will be open to everyone attending the SunNetwork Conference with the
   top 32 performers advancing to the next round of competition. Through
   elimination rounds, the field of 32 competitors will then be narrowed to an
   elite "Final Four," who will compete in the Championship round for the grand
   prize of $50,000. The second place winner will receive $15,000, the third
   place winner takes home $10,000 and the fourth place winner captures the final
   $5,000. The championship round will be held at 4:00 p.m. PDT on Thursday,
   September 19th at the Moscone Center. The grand prize winner will be awarded a
   check for $50,000 on Friday, September 20th at 9:00 a.m. PDT by James Gosling
   and Bill Joy prior to the closing keynote of the conference. Competition
   updates will be published on the Sun web site,
   http://sunnetwork.sun.com/sf2002/topcoder/ throughout the tournament.
   </P>
   <P>
   "TopCoder has taken a very technical discipline and made it into an
   exciting competitive event," said Mark Tolliver, Executive Vice President,
   Marketing &amp; Strategy, Chief Strategy Officer, Sun Microsystems, Inc. "We at
   Sun are very pleased with the way developers across the US are taking an
   interest in the Challenge. The SunNetwork Coding Challenge provides an
   excellent platform for displaying individual programming talent, and is a
   great way to learn and build collaborative developer communities."
   </P>
   <P>
   "TopCoder is pleased to be powering the SunNetwork Coding Challenge," said
   Rob Hughes, President and Chief Operating Officer, TopCoder, Inc. "TopCoder's
   competitions are a proven way for developers to hone their coding skills. Over
   the past six months, TopCoder's student and professional members have spent
   over 80,000 hours at TopCoder's web site improving their Java skills. The
   SunNetwork Coding Challenge is an opportunity for these developers to showcase
   their skills during competition."
   </P>



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
