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

<P><B>BHS grad has shot at winning $100,000 in computer contest</B></P>

<P>
By JENNIFER STOCKINGER<BR/> 
Brainerd Dispatch Staff Writer<BR/>
</P>

<P>
A 22-year-old Brainerd High School graduate has a shot to win $100,000 in a national computer programming contest. 
</P>

<P>
James Esser, a senior at the University of Minnesota and the son of Stephen and Linda Esser of Baxter, is one of 16 finalists who advanced to the championship round in the 2002 Sun Microsystems and TopCoder Collegiate Challenge tournament. The tournament is April 19-20 at the University Park Hotel at the Massachusetts Institute of Technology in Cambridge, Mass. 
</P>

<P>
Esser is one of two college students from Minnesota to advance to the championship round. He advanced to the championship round based on his scores in a series of online elimination rounds that began in February. 
</P>

<P>
Esser was fourth seed out of 128 competitors from the Midwest Region. He advanced to the regional semifinals along with 31 other competitors from the Midwest and then advanced to the regional finals. At the regional finals, 16 students qualified for the championship round. 
</P>

<P>
At the finals, the champion will win $100,000. The second-, third- and fourth-place winners will take home $25,000, $8,000 or $5,000. The others will win $1,000. 
</P>

<P>
Esser has won $1,020 so far in the competition. He said if he wins the top prize he would buy a laptop computer and may take a year off to tour Europe. He said, depending on his job search, he would consider investing in a house. 
</P>

<P>
Each TopCoder round deals with three questions, relating to mathematics puzzles, said Esser. Participants earn points based on how quickly they solve the problems. 
</P>

<P>
One question Esser solved involved stacking between 50 to 100 boxes of different weights and sizes. He had to write a computer program that determined how many ways the boxes could be stacked without falling. 
</P>

<P>
Esser plans to study as many potential problems as he can before the competition for practice. 
</P>

<P>
"I was hoping to get this far," said Esser. "I may have gotten lucky getting through (some of the matches). I have a good rank, but all it takes is one night of bad luck." 
</P>

<P>
Esser is ranked No. 28 overall among more than 2,600 ranked coders. 
</P>

<P>
Esser said it will be fun to attend the tournament and meet other people who are interested in computer programming. 
</P>

<P>
"It will be nice to look at other people's solutions and see how they solve problems," he said. "I have learned a lot from others from the competition. 
</P>

<P>
"I learned technical things like the tricks to make things work faster ... Plus the way you look at problems." 
</P>

<P>
Esser has been interested in computers since he was 12. Developing games and working on the computer has been his hobby. 
</P>

<P>
Esser will graduate in May with a computer science degree. He is interested in attending graduate school and intends to find a job in game development. 
</P>

<P>
"I want to enter the working world," said Esser.
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
