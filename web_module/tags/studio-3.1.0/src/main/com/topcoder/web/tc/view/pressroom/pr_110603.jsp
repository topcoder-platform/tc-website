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
<p><span class="bodyTitle">AT&amp;T Foundation to Sponsor TopCoder Charity Tournament</span><br />
<span class="bodySubTitle"><em>Telecommunications Giant Supports Christopher Reeve Paralysis Foundation Via Programming Tournament</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., November 6, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development, 
today announced that the AT&amp;T Foundation has agreed to be the title sponsor of the TopCoder Charity Challenge Benefiting the 
Christopher Reeve Paralysis Foundation (CRPF).  The TopCoder Charity Challenge is a unique fundraiser designed to support 
CRPF's ongoing research to find a cure for, and improve the lives of people with, spinal cord injuries and other central 
nervous system disorders.  TopCoder will match all funds raised by this tournament, up to $50,000 USD.  More information 
about the tournament can be found at <A href="/crpf">www.topcoder.com/crpf</A>.</p>

<p>The AT&amp;T Foundation invests in projects that use technology in innovative ways to meet community needs and support AT&amp;T's 
business interests.  The TopCoder Charity Challenge benefiting CRPF is a perfect venue to forward the mission of the AT&amp;T Foundation.</p>

<p>"AT&amp;T is proud to encourage people to use technology in innovative ways, and the TopCoder Charity Challenge inspires entrants 
to be creative while benefiting an excellent cause," said William Sardone, AT&amp;T Sales Center Vice President - New York.  
"Involvement with TopCoder is a great extension of our efforts to benefit others in the communities where our employees work 
and live."</p>

<p>Programmers who raise a minimum of $25 USD in donations will be eligible to compete in this tournament.  Donated funds serve 
to sponsor a competing TopCoder member in the tournament.  Donations can be made online at <A href="http://www.ChristopherReeve.org/topcoder">www.ChristopherReeve.org/topcoder</A>.  
The competition will consist of three online rounds, taking place on November 11, 13 and 17.  The first round will be open to all 
eligible competitors.  The top 100 programmers from the first round will advance to the second, and the top 50 programmers in 
the second round will advance to the final round.</p>

<p>The TopCoder Charity Challenge will award ten TopCoder members with a grand prize trip to <i>A Magical Evening</i>, the annual 
star-studded gala in New York City on November 24 that benefits CRPF.  The ten prize winners include the four top scorers in the 
final round of the programming tournament, the four top fundraisers and two "wildcards," who will be chosen at random from all 
participants that have raised at least $100.  TopCoder will send commemorative T-shirts to members that raise at least $50 USD.</p>

<p>"Paralysis is a devastating condition for patients and their families," said Jack Hughes, chairman and founder of TopCoder, and 
member of CRPF's Board of Directors.  "TopCoder is excited to be hosting this tournament for such a determined and hard working 
organization.  Not only does CRPF provide quality of life grants to those living with paralysis, but it is instrumental in directing 
research of the spinal cord and central nervous system."</p>

<p>CRPF is headquartered in Springfield, New Jersey.  Formed in 1982 as the American Paralysis Association (APA), CRPF has grown 
into a substantial force within the spinal repair research field.  In 2002, the Christopher and Dana Reeve Paralysis Resource 
Center (PRC) was established in New Jersey to provide a comprehensive, national source of information for people living with 
paralysis and their caregivers to promote health, foster involvement in the community, and improve quality of life.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder 
members extend across all professional and collegiate levels.</p>

<p>The attraction of competition and the associated rewards create a powerful community of programmers.  Corporate partners access 
this member base for employment, software development and sponsorship.  For registration details or information regarding TopCoder 
Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit <A href="/">www.topcoder.com</A> or call toll free 866-TopCode.</p>

<p><span class="bodySubTitle">About AT&amp;T Foundation</span><br />
AT&amp;T is among the world's premier voice and data communications companies, serving consumers, businesses, and government.  Public 
service and social responsibility are traditions deeply embedded at AT&amp;T.  The AT&amp;T Foundation (<A href="http://www.att.com/foundation">www.att.com/foundation</A>) invests in 
projects that serve the needs of people in communities throughout the nation, particularly for initiatives that use technology in innovative 
ways and for programs in which AT&amp;T employees are actively involved as contributors or volunteers.</p>

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
