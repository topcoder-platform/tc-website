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

<P CLASS="bodyTextBold"> 12.10.2001 <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/>TopCoder Announces Sun Microsystems as Exclusive Sponsor for Annual Collegiate Challenge</P>
<P> CLASS="bodyTextItal">Leading Systems Provider Partners with Computer Programming Competition Host to Support Technology in Higher Education and Extend Reach to the Developer Community</P>
<P>GLASTONBURY, Conn., Dec. 10, 2001 -- TopCoder, Inc., a company committed to identifying and promoting top-notch computer programming talent through competition, today announced Sun Microsystems as the exclusive tournament sponsor for its 2nd Annual TopCoder Collegiate Challenge. The Sun and TopCoder Collegiate Challenge invites thousands of TopCoder members to qualify for the coveted 512 tournament spots in order to continue on in competition for national ranking, notoriety and the $150,000 prize purse, of which $100,000 will be awarded to the tournament champion.</P>
<P>Beginning February 2002, the 512 programmers will participate in a series of online elimination rounds, culminating with the Sun and TopCoder Collegiate Challenge finals on April 19-20, 2002 onsite at the University Park Hotel at Massachusetts Institute of Technology (MIT) in Cambridge, Massachusetts.</P>
<P>"Collegiate programmers are a driving force within the IT community and are an important group for Sun by way of resources, marketing and recruitment," said Stans Kleijnen, vice president, Sun Developer Network, Sun Microsystems, Inc. "The Sun and TopCoder Collegiate Challenge enables Sun to show its support for this talented community and its development, as well as provide an exciting, new way for Sun to reach such a critical target audience."</P>
<P>"TopCoder is pleased to have Sun as an exclusive sponsor for our Annual Collegiate Challenge," said Jack Hughes, founder of TopCoder, Inc. "Sun has demonstrated its commitment to the developer</P>
<P>TopCoder Announces Sun Microsystems as Exclusive Sponsor community through the creation of the Sun Developer Connection program and the Java programming language. Sponsoring this competition is just another example of Sun's commitment."</P>
<P>Elimination Rounds Will Reduce 512 to 16 for the Finals The Sun and TopCoder Collegiate Challenge will bring together 512 of the highest-rated TopCoder college-level members for four rounds of online regional competition, starting Feb. 19, 2002. The field will then be narrowed to an elite 16, who will compete in the final two rounds, April 19-20, 2002, at the University Park Hotel at MIT in Cambridge, Mass. The winner will receive $100,000 of the $150,000 prize purse.</P>
<P>TopCoder will host weekly online programming competitions, throughout the year, for both professional and collegiate developers to compete for national ranking and rewards. More information regarding the sponsorship of these weekly single-round matches, as well as the 2002 TopCoder Invitational, can be found at www.topcoder.com or by calling 1-866-867-2633.</P>
<P>About TopCoder, Inc.TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. With a global membership database, TopCoder members extend across all professional and collegiate levels. The attraction of competition and the associated rewards create a powerful community of programmers. Access to this community is granted to corporate partners who both promote and profit from the relationship. For more information and registration details visit www.topcoder.com/?r=17.</P>
<P CLASS="smallText">About the Sun Developer Connection ProgramBuilding on Sun's vision to enable services on demand with the latest open technologies, the Sun Developer Connection (SDC) offers individual developers and software development partners a single, worldwide entry point to build a technical and business relationship with Sun. As one of the largest developer communities in the world, the SDC is the connection to Sun for comprehensive resources to build and market solutions leveraging Sun's open technologies, products, business development, and community forums.###</P>
<P CLASS="smallText">Sun, Sun Microsystems, the Sun logo, Sun Developer Connection, Java, Solaris, and The Network Is The Computer are trademarks of Sun Microsystems in the United States and other countries.</P>
<A CLASS="bodyText" href="/reg/">:: Register with TopCoder to compete</A>



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
