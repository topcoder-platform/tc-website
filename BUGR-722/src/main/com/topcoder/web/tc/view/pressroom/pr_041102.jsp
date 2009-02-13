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

<P><B>Student seeks top computer title</B></P>

<P>
By KEN BRADFORD<BR/>
Tribune Staff Writer <BR/>
</P>

<P>
Jeremy Haubold remembers how he got started in computer programming.
</P>

<P>
"My dad started me at age 5," he said. "He thought it would be a useful skill, and I just started playing around with it."
</P>

<P>
Now a senior at Purdue University, Haubold has earned a place among the top young programmers in the country.
</P>

<P>
He and 15 other finalists are awaiting the annual Collegiate Challenge Computer Programming Tournament. The finals in the tournament, sponsored by Sun Microsystems and TopCoder, will be April 19 and 20 in Cambridge, Mass.
</P>

<P>
The top prize is $100,000.
</P>

<P>
"A hundred grand would be nice," said the son of Tim and Fran Haubold of South Bend. "It would pay for grad school."
</P>

<P>
It may seem a distant dream -- he's ranked 12th among the 16 finalists -- but he plans on giving it his best effort.
</P>

<P>
The second of seven Haubold children, he was home-schooled. He feels he's found his niche with his double major in computer science and mathematics at Purdue.
</P>

<P>
He joined the TopCoder competitions this year after a company representative visited Purdue. In basic terms, the challenge is to come up with the best code to solve a specific problem.
</P>

<P>
Here's a very simplified version of a problem: We'll give you a sentence. Create a program that finds the letter used most commonly in it.
</P>

<P>
A challenge like that might take three to five minutes. In a true TopCoder event, students are given three problems to solve in 75 minutes.
</P>

<P>
He qualified for the finals by competing in a series of online elimination rounds, beginning in February. He's ranked third among Midwest participants and already has earned $2,625 in prize money.
</P>

<P>
"I love competing," Haubold said. "Ideally, these are things that will prepare me for the job market."
</P>

<P>
He likes the work, too. Many of the top people in his field are interested more in management, but he still enjoys the math and logic work.
</P>

<P>
"I don't think I'll ever want to stop coding," he said.
</P>

<P>
His longer-term goals are to attend graduate school in computer sciences and he would like to have a career that involves artificial intelligence.
</P>

<P>
Jack Hughes, TopCoder founder, said the contest brings attention to the top talent in the industry.
</P>

<P>
With 6,000 collegiate members, TopCoder is well aware how bright its finalists are.
</P>

<P>
"Given the pedigree of these outstanding students, it is clear that we have identified the future leaders of software development and the technology industry," he said, in a news release.
</P>

<P>
Haubold chose Purdue because it has one of the 20 best computer science schools in the country. Several of the other finalists are from elite schools like Stanford, MIT and the University of California-Berkeley.
</P>

<P>
"Some of these are just better than me," he said, laughing.
</P>

<P>
And this isn't a competition that allows for a lot of last-minute study or preparation.
</P>

<P>
"Chances are, you didn't get this far without knowing how to do this," he said.
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
