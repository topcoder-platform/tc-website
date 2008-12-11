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
   <p><span class="bodyTitle">TopCoder and AT&amp;T Announce Winners of Charity Programming Tournament</span><br />
   <span class="bodySubTitle"><em>"A Magical Evening," Benefiting the Christopher Reeve Paralysis Foundation, Is the Venue for Grand Prizes</em></span></p>
   </div>
   
   <p><strong>GLASTONBURY, Conn., December 1, 2003&#151;</strong>
   TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the winners of 
   the TopCoder Charity Challenge, sponsored by the AT&amp;T Foundation, Benefiting the Christopher Reeve Paralysis Foundation (CRPF) (<a href="http://www.topcoder.com/crpf">www.topcoder.com/crpf</a>).  
   As a result of this unique tournament, CRPF raised nearly $40,000.</p>
   
   <p>This programming tournament, the first event of its kind, awarded 10 grand prizes.  Four grand prizes were awarded to the fundraisers who raised the most 
   donations for CRPF.  In addition, four grand prizes were awarded to the highest point scorers in the tournament.  Two additional grand prizes were given to 
   eligible winners of a drawing.  The grand prizewinners received an all expenses paid trip to attend A Magical Evening, the annual star-studded gala for the Christopher Reeve Paralysis Foundation.</p>
   
   <p>Cristobal Baray and his wife, Catherine, from Sunnyvale, California were the number one and two fundraisers, respectively, in this tournament.  Jared Showalter was the leading point scorer in the tournament. These winners were in for a special treat as Christopher Reeve made his first public appearance without the use of his ventilator.</p>
   
   <p>John Lithgow opened the fundraising gala and presented the Visionary Leadership Award to acclaimed architect and designer, Michael Graves while Dana Reeve presented the Human Spirit Award to Francine LeFrak and Rick Friedberg.  Paula Zahn introduced the evening's entertainment, a performance by Wade Preston of the Tony-award winning Broadway musical, Movin' Out. Other celebrities in attendance included Joan Collins, Diane Sawyer, Mike Nichols, David Blaine, Buzz Aldrin, Patty Hearst Shaw and Bernard Shaw.</p>
   
   <p>The TopCoder Charity Challenge is a unique fundraiser designed to support CRPF's ongoing research to find a cure for, and improve the lives of people with, spinal cord injuries and other central nervous system disorders.  The AT&amp;T Foundation invests in projects that use technology in innovative ways to meet community needs and support AT&amp;T's business interests.  The TopCoder Charity Challenge benefiting CRPF is a perfect venue to forward the mission of the AT&amp;T Foundation.</p>
   
   <p>"TopCoder is 'Tops' to AT&amp;T and to the many people who will benefit from the Charity Challenge's fundraising efforts," said William Sardone, Sales Center Vice President - New York.  "AT&amp;T has a long history of linking with programs that benefit others in the communities where our employees live and work.  AT&amp;T is proud to play an important role with the TopCoder Charity Challenge, which will make a lasting difference in the years to come."</p>
   
   <p>"TopCoder is very pleased to have been able to participate in this unique event with CRPF," said Jack Hughes, chairman and founder of TopCoder, and member of CRPF's Board of Directors.  "We wish to thank AT&amp;T and all of the competitors who devoted their time and money to the event.  CRPF, through its multiple roles in research, quality of life and as a resource, is a beacon for those and their families living with paralysis and other neurological disorders."</p>
   
   <p>CRPF is headquartered in Springfield, New Jersey.  The Christopher Reeve Paralysis Foundation (CRPF) is committed to funding research that develops treatments and cures for paralysis caused by spinal cord injury and other central nervous system disorders. The Foundation also vigorously works toimprove the quality of life for people living with disabilities through its grants program, Paralysis Resource Center, and advocacy efforts.  In 2002, the Christopher and Dana Reeve Paralysis Resource Center (PRC) was established in New Jersey to provide a comprehensive, national source of information for people living with paralysis and their caregivers to promote health, foster involvement in the community, and improve quality of life.</p>
   
   <p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
   TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Corporate partners access this member base for employment, software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit www.topcoder.com or call toll free 866-TopCode.</p>
   
   <p><span class="bodySubTitle">About the AT&amp;T Foundation</span><br />
   AT&amp;T is among the world's premier voice and data communications companies, serving consumers, businesses, and government.  Public service and 
   social responsibility are traditions deeply embedded at AT&amp;T.  The AT&amp;T Foundation (<a href="http://www.att.com/foundation">www.att.com/foundation</a>) invests in projects that serve the 
   needs of people in communities throughout the nation, particularly for initiatives that use technology in innovative ways and for programs in which AT&amp;T 
   employees are actively involved as contributors or volunteers.</p>
   
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
