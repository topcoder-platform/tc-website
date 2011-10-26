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

<P><B>China, New Zealand and Ireland Added to TopCoder Developer Community</B></P>
<P>Host of Computer Programming Contests Continues To Expand Globally</P>

<P>
GLASTONBURY, CT., May 28, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today announced it has expanded eligibility to its online and onsite computer programming contests to include citizens of China, New Zealand and Ireland.  The addition of these countries to the TopCoder developer community demonstrates the company's continuing global expansion efforts, representing the fifth, sixth and seventh international territories that have been added since the company launched its competitions in February 2001.  According to an IDC report published in 2001, these three countries alone have more than 300,000 professional developers in residence.  Citizens of Canada, Australia, India and the United Kingdom are also eligible to compete along with the primarily U.S. member base.
</P>

<P>
"We are thrilled to welcome the development communities from China, New Zealand and Ireland to TopCoder, and continue the international expansion of our competitions," said Jack Hughes, chairman and founder of TopCoder.  "Programmers from these countries are a driving force within the worldwide IT community and are becoming an increasingly important and influential group to target."
</P>

<P>
<B>International Demand Helps Membership Escalate</B><BR/> 
Since the beginning of 2002, TopCoder recognized positive results from its international expansion efforts. After incorporating Australia and India at the end of 2001, TopCoder has added close to 9,500 new members in the first five months of 2002, and increased its membership by 141 percent.    
</P>

<P>
"TopCoder is a venue for interaction, learning and competition amongst the worldwide developer community," said Tom Longo, vice president of membership for TopCoder.  "The increase in our membership clearly demonstrates the international appeal of TopCoder." 
</P>

<P>
TopCoder will continue to extend its programming competitions globally as international demand for competition continues, in effect, bringing the entire worldwide developer community together.  
</P>

<P>
About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com.</P>



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
