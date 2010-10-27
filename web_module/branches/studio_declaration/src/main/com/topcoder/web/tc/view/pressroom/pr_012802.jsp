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


<P CLASS="bodyTextBold"> 01.28.2002 <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/>United Kingdom Added to TopCoder Developer Community<BR/><SPAN CLASS="bodyTextItal">Host of Computer Programming Contests Continues Global Expansion</SPAN></P>
<P>GLASTONBURY, CT., Jan. 28, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced it has expanded eligibility to its online and onsite 
computer programming contests to include citizens of the United Kingdom.  The addition of the United Kingdom to the TopCoder developer community demonstrates the company's continuing global expansion efforts.  The United 
Kingdom is the fourth international territory to be added since the company launched its competitions in February 2001. Citizens of Canada, Australia and India are also eligible to compete.</P>
<P>"We are pleased to welcome the citizens of the United Kingdom to TopCoder's developer community, and are excited about the continued international expansion of our competitions," said Jack Hughes, Chairman and 
founder of TopCoder.  "Programmers from Australia, Canada, India and the United Kingdom are a driving force within the worldwide IT community and are becoming an increasingly important and influential group to target."</P>
<P><B>International Demand for Competition Continues</B><BR/>Over the past six months, TopCoder has seen positive results from expanding the eligibility criteria to include residents of Canada, Australia and India.  Opening 
up the competitions to citizens of Australia on Nov. 29, 2001 and India on Dec. 20, 2001 has contributed to the over 2,000 new members who have joined the TopCoder developer community in the past two months.</P>
<P>"TopCoder is a venue for interaction, learning and competition amongst the worldwide developer community," said Tom Longo, Vice President of Membership for TopCoder.  "The increase in our membership clearly demonstrates 
the international appeal of TopCoder."</P>
<P>TopCoder will continue to extend its programming competitions globally as international demand for competition continues, in effect, bringing the entire worldwide developer community together.  
According to Hughes, the company's next expansion effort is Ireland.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. With a global membership database, TopCoder members extend across all professional and collegiate levels. 
The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to 
corporate partners who both promote and profit from the relationship. For more information and registration details.</P>



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
