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

<P><B>Extra credit</B></P>

<P>
The Brainerd Junior High School speech team recently completed its tournament season. Heart of the Lakes conference awards were presented to the top speakers in each of the 13 Minnesota State High School League categories: Natasha Leyk, earned second in discussion; Kayla Wallin, second in serious prose; and Carmen Cummings, third in humorous interpretation. Other team members were Brad Folta, Sarah Jacobson, Vincenza Spagnuolo, Meghan Hagedon, Brittany Steinkraus, Danielle Knopik, Ashley Goedker, Amy Espersen, Kaiji Ollila, Amanda Wooden and Kayna Schindele. 
</P>

<P>
Sara Hemquist, Baxter, had her work published in the 2001-02 edition of Shelterbelt, a compilation of creative writing and artwork by Northern State University students. 
</P>

<P>
The North Central Service Cooperative awarded scholarships to students in 10th-12th grades from 12 school districts recently at its annual recognition program in Staples. Students recognized would not otherwise be honored at a local or regional level. Area scholarship winners are Kelly Trowbridge, Crosby-Ironton School District, earned a $250 scholarship from MacNeil Environmental; Matt Langer, Pierz, and Jennifer Alt, Pillager, both earned $100 from Blue Cross Blue Shield; Nicholas Ogborn, Crosby-Ironton, $100 from the NCSC leadership team; Nickole Graves, Aitkin, $150 from Horace Mann Insurance; and Justin Nash, Aitkin, won a DVD player. Other students recognized were Jeremy Vought and Carime Saxvold, both of Pequot Lakes; and Jennie Virnig, Pierz. 
</P>

<P>
Students from Brainerd High School competed at the Minnesota Distributive Education Clubs of America career development conference in Minneapolis in March. The team placed seventh in free enterprise and in the top 12 in travel and tourism. Members on the DECA team are Sarah Anderson, Jose English, Rick Kelm, Chelsey Kron, Jenni Lange, Rick Litke, Andrea Smith, Becka Theien, Art Tuttle, Dan VanEssen and Kris Vitale. Litke and Tuttle also were honored for their yearlong DECA work. 
</P>

<P>
The following area students were named to the national honor roll list for the 2001-02 school year and will receive an application for a $1,000 community contributions scholarship: Karen Cox, Tracy Kuchinski, Krystal Steinert, Kayla Koval, Matheu Weidenbach, Jason Forcier, Kate Fogle, Andy Smith and Rachel Hoben, all high school students in Little Falls; Alicia Wright, Lacey Nelson, Christy Hanson, Nickole Andert, Kelli Lecy, Jacquline Windschitl, Nicole Bender, Lemuel Berry, Kelsey Mjelmeland and Shayla Groess, all high school students in Staples/Motley; Kristin Tiggelaar, Heather Arnold, Alesha Kuschke, Tiffany McLellan, Christine Fox, Mike Langer, Kristy Bender, Laura Knierim, Jeremy Wicek and Tiffany Varilek, all high school students in Pequot Lakes; Jennifer Knowlen, high school student in Brainerd; Derek Saint Onge, Erin Catlin, Amber Buttler, Anthony Jackson, Nickole Graves, Jacqueline Baker, Kyle Bender, Dawna Butcher, Ann Davies, Nathan Horner, Katie Haberkorn, Melissa King, Katie Martin, Jacob Mehr, Jamie Miller, Stephanie Olson, Levi Baer, Daniel Appel, Jennifer Oxborough and Jason Esler, all high school students in Aitkin; Derek Haukos, Holly Sander, Tina Weitemier, Steven Perpich, Megan Beseres, Kate Beaman, Kristi Burgwald, Timothy Faatz and Michael Herda, all high school students at Crosby-Ironton. 
</P>

<P>
Curtis Johnson, a first-grader at Lowell Elementary School in Brainerd, read and reported on 100 books in the Red Tape program. 
</P>

<P>
The Cuyuna Range Lions Club is offering its $1,000 John Lindahl Memorial Scholarship to a Crosby-Ironton High School senior. The scholarship committee met April 4. 
</P>

<P>
Amy Wacker, the daughter of James and Debbie Wacker of Brainerd, was awarded a $500 scholarship from the Minnesota State University Moorhead Alumni Foundation for the 2002-03 school year. 
</P>

<P>
Stephanie Burnham, the daughter of Jan and Steve Burnham of Brainerd, submitted a poem to a contest sponsored by Creative Communication, based in Utah, and it was selected from thousands of entries as one of the top 10 in her grade division. Burnham is a fifth-grader at Pillager Elementary School. Burnham will be recognized in the poetry anthology called "A Celebration of Young Poets" and she will receive a $50 savings bond. 
</P>

<P>
Jim Esser, a 1998 graduate of Brainerd High School, recently was selected as one of 16 finalists to compete in the upcoming final rounds of the 2002 Sun Microsystems Inc. and TopCoder Collegiate Challenge tournament on April 19-20 in Cambridge, Mass. 
</P>

<P>
Esser is a senior computer sciences major at the University of Minnesota's Institute of Technologies in the Twin Cities. 
</P>

<P>
The tournament has a total prize purse of $150,000 with the winner receiving $100,000. The tournament began with 512 competitors. 
</P>

<P>
He's the son of Steve and Marie Esser of Brainerd.
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
