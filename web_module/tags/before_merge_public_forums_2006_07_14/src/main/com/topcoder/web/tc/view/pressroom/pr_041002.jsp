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

<P><B>CS Major Competes for $100K</B></P>

<P>
By Claire Churchley<BR/>
Michigan Technological University <BR/>
</P>

<P>
Computer science major Joseph Nievelt has won through to the semi-final round of the 2002 Sun Microsystems and TopCoder Collegiate Challenge tournament. Nievelt is among 16 other finalists who are competing for a possible prize of $100,000 in the championship rounds held at the Massachusetts Institute of Technology on April 19 and 20. 
</P>

<P>
Nievelt has some reservations about his chances in the sem-finals because the top ranked coder in the competition will be in his room. "I'm hopeful, but I don't expect to make it to the finals," Nievelt said. He is definitely excited for the competition though. 
</P>

<P>
Nievelt competed in three online competitions to get to the Regional Finals on March 13. The scoring of the competition is based on two different criteria. Intensity is the ability of a contestant to use a particular coding language well during peer-to-peer competition, and velocity is the ability to write good code quickly and accurately. 
</P>

<P>
In the weekly single-round matches Nievelt has accumulated a total of over $4,000. He entered the tournament as the second seed in the MidWest. "He has scaled steep odds to get to this point," said TopCoder founder and Chairman Jack Hughes. Nievelt made it through to the final 16 from a group of over 500 of the country's best code developers.
</P>

<P>
According to Nievelt, he participated in the first three rounds of the competition from in his dorm room. He logged into a "room" in the competition and had to code solutions to three problems as quickly and accurately as possible. Nievelt was the top finisher in one of the first rounds in his "room" which consisted of seven other coders. 
</P>

<P>
Even though contestants are allowed to compete from home, according to Nievelt TopCoder has strict rules against cheating. Coders are allowed to use and code they have written in the past, but they can not use others' code, whether they find it online or have a friend help them during the competition. Nievelt believes that once competitors reach the higher rounds they shouldn't have to resort to cheating because it will either be too obvious or take too much time. 
</P>

<P>
The third round was the Regional Finals. Here Nievelt competed against 8 coders from each region. He finished third in his region and 12th overall, which was good enough to get him through to the semi-finals. The semi-final and final rounds at MIT are the first rounds of the competition to be on site.
</P>

<P>
Nievelt has competed in a couple of other coding competitions including the ACM regional competition and the Northern Michigan University Programming Contest in which the MTU team took the top two places on March 23. 
</P>

<P>
Nievelt also said that he hopes to write drivers for hardware, or possibly work at a video game company in the future. "I'm thinking software engineering is definitely something I'll go into," Nievelt said.
</P>

<P>About TopCoder, Inc.</P>
<P>TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com.</P>



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
