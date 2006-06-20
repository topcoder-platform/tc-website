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

<P><B>Sixteen Finalists Announced for $150,000 Sun Microsystems and TopCoder Collegiate Challenge</B></P>
<P>Computer Programming Tournament Will Award $100,000 To Winner</P>

<P>
GLASTONBURY, CT - March 25, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent, announced today the 16 finalists - four Regional Champions and 12 "wildcards" - to compete in the upcoming final rounds of the 2002 Sun Microsystems, Inc. and TopCoder Collegiate Challenge tournament being held April 19-20 at the University Park Hotel @ MIT in Cambridge, Massachusetts.  The tournament has a total prize purse of $150,000, with the winner receiving $100,000.  
</P>

<P>
The four Regional Champions are: Northeast - Ben Wilhelm (Oberlin College), Southeast - Trayton Otto (Georgia Institute of Technology), Midwest - Tom Sirgedas (University of Michigan-Ann Arbor), and West - Dan Adkins (University of California-Berkeley).  The 12 "wildcards" include: Nathan Paymer, Ling Li, and Po-Shen Loh (California Institute of Technology), Daniel Wright, Eugene Davydov, and Ante Derek (Stanford University), James Esser (University of Minnesota-Twin Cities), Logan Hanks (Virginia Polytechnic Institute State University), Jonathan Salz (Massachusetts Institute of Technology), Joseph Nievelt (Michigan Technological University), Jeremy Haubold (Purdue University), and Ambrose Feinstein (University of Central Florida).
</P>

<P>
All finalists advanced to the championship rounds based on their scoring in a series of online elimination rounds, which began with a field of 512 competitors on February 19, 2002.  Regional Champions had the highest point totals during the Regional Finals, held on March 13.  The "wildcard" advancers finished with the next 12 highest point totals, regardless of region.  
</P>

<P>
"Sun is proud to be the exclusive sponsor of the 2002 TopCoder Collegiate Challenge, which clearly identified some of the best collegiate programmers in the country," said Stans Kleijnen, vice president, market development engineering at Sun Microsystems, Inc.  "TopCoder in association with the Sun Developer Connection (SDC) program -- Sun's overarching resource for individual developers which includes access to programs such as the Student Technology Associate Representative (STAR) program -- are working together to empower university students to deliver cutting-edge technology presentations, to their peers and gain valuable experience and industry insight in the process."
</P>

<P>
"Given the pedigree of these outstanding students, it is clear that we have identified the future leaders of software development and the technology industry," said TopCoder founder and Chairman, Jack Hughes.  "TopCoder has over 6,000 collegiate members.  These 16 have put in a tremendous effort in order to elevate above a crowded field of the best and the brightest.  The energy and excitement during the online elimination rounds was amazing.  We look forward to seeing them all at MIT in April."
</P>

<P>
This is the second annual Collegiate Challenge and third major programming tournament hosted by TopCoder.  The 2001 TopCoder Collegiate Challenge was held in June 2001, and was won by Jason Woolever, a Massachusetts Institute of Technology graduate student.  Woolever is currently a Senior Research and Development Engineer at Synopsys, Inc. of Sunnyvale, California.  
</P>


<P>
About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com. 
</P>

<P>
About Sun Developer Connection Program<BR/>
Building on Sun's vision to enable services on demand with the latest open technologies, the Sun Developer Connection (SDC) offers individual developers and software development partners a single, worldwide entry point to build a technical and business relationship with Sun. As one of the largest developer communities in the world, the SDC is the connection to Sun for comprehensive resources to build and market solutions leveraging Sun's open technologies, products, business development, and community forums. All programs, registration and eligibility information can be found at <A HREF="http://www.sun.com/sdc" CLASS="bodyText" TARGET="_blank">http://www.sun.com/sdc</A>.  STAR is designed to empower university students to deliver cutting-edge technology presentations, to their peers and gain valuable experience and industry insight in the process. For more information about the STAR program, go to: <A HREF="http://www.sun.com/developers/evangcentral/students/sunstar.html" CLASS="bodyText" TARGET="_blank">http://www.sun.com/developers/evangcentral/students/sunstar.html</A> 
</P>


<P>
Sun, Sun Microsystems, the Sun logo, Sun Developer Connection, Java, and The Network Is The Computer are trademarks of Sun Microsystems in the United States and other countries.
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
