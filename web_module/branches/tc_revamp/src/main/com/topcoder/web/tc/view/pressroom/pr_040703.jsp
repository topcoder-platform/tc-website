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

<div align="center"><strong>Duke University's David Arthur Wins 2003 Sun Microsystems And Topcoder Collegiate Challenge</strong><br />
Toronto, Canada Resident Beats Out 15 Competitors for $50,000 Grand Prize</div>

<p><strong>CAMBRIDGE, MA&#151;April 7, 2003&#151;</strong>Sun Microsystems, Inc. and TopCoder, Inc. today announced 
that Duke University Junior David Arthur, originally from Toronto, Canada, has won the 2003 Sun Microsystems and TopCoder 
Collegiate Challenge, held this past weekend at the University Park Hotel @ MIT in Cambridge, Massachusetts.  Arthur prevailed 
over 15 of the world's best Java and C++ programmers for the $50,000 grand prize and the claim of the world's best college 
programmer. <a class="bodyText" href="/?t=tournaments&amp;c=tccc03_champ#photo">See Photos</a></p>

<p>"What a great feeling this is to be able to compete against the best programmers in the world.  I really didn't think I had much 
of a chance against these other guys," said Arthur. "I'm also really thankful to TopCoder, Sun and Nvidia for putting on such an 
exciting and professional event."</p>

<p>Arthur went into the tournament semifinals on Friday as the Southeast Regional Champion.  He was also the number one seed 
in that region for this tournament.  Arthur is on a full academic scholarship at Duke University where he is currently in his 
Junior year.  Coming into this weekend, his total prize money from TopCoder was just over $16,000.  He won the majority 
of his TopCoder winnings last fall when he finished in third place in the 2002 TopCoder Invitational.</p>

<p>"Given the intense competition of this year's Collegiate Challenge, David should be proud to be the Collegiate Challenge 
Champion," said TopCoder founder and Chairman, Jack Hughes.  "Winning a competition that invited the top 1,000 collegiate 
programmers around the world is a tremendous accomplishment."</p>

<p>"Once again TopCoder has provided the platform for future thought leaders to exhibit their skills using Java to solve 
multivariate non-trivial problems," said Stans Kleijnen, vice president, market development engineering at Sun 
Microsystems, Inc. "Sun is proud to sponsor the 2003 TopCoder Collegiate Challenge, which provides a unique environment 
for capturing the technical discipline of developing software into an exciting and competitive event for developers and spectators."</p>

<p>Arthur beat the following finalists in the championship round: Jimmy M&#229;rdell (Ume&#229; University) who placed second, 
Daniel Wright (Stanford University) who finished in third place, and Alan Gasperini (UCLA) who placed fourth.  The four 
tournament finalists triumphed over the following semifinalists in previous rounds of the tournament: Eugene Davydov 
(Stanford University), Stefan Pochman (Darmstadt University of Technology), Ke Yi (Duke University), Alexey Radul 
(MIT), Benjamin Mathews (CalTech), Xiaomin Chen (Rutgers University), Ante Derek (Stanford University), Bogdan 
Stanescu (George Mason University), Tony Chang (University of Illinois, Urbana-Champaign), Tom Sirgedas (University 
of Michigan), Jacob Burnim (CalTech) and Wei Liu (University of Minnesota, Twin Cities).</p>

<p>TopCoder's Collegiate Challenge, along with its annual Invitational Tournament and other weekly competitions, has 
attracted a worldwide member base of talent-differentiated student and professional programmers.  Companies interested 
in hiring competition-driven programmers partner with TopCoder to recruit these members.  NVIDIA Corporation (Nasdaq: 
NVDA), corporate sponsor of the Collegiate Challenge, was onsite at the tournament finals to recruit these top-notch 
programmers.</p>

<p>"TopCoder doesn't just identify the best programmers in the world, but it recognizes the best programmers who are 
passionate and determined to win," said Daniel Rohrer, Manager of DirectX Graphics for NVIDIA.  "TopCoder provides 
NVIDIA with a quality source of dedicated and motivated programmers who will thrive at NVIDIA and will be challenged 
working with our driven team of world-class engineers and developers."</p>

<p><br /></p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership 
database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the 
associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners 
who both promote and profit from the relationship.  For more information, visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com</a></p>

<p><strong>About Sun Microsystems, Inc.</strong><br />
Since its inception in 1982, a singular vision&#151;"The Network Is The Computer[tm]"&#151;has propelled Sun 
Microsystems, Inc. (Nasdaq: SUNW) to its position as a leading provider of industrial-strength hardware, software and services 
that make the Net work.  Sun can be found in more than 100 countries and on the World Wide Web at <a class="bodyText" href="http://sun.com">http://sun.com</a></p>

<p><strong>About NVIDIA</strong><br />
NVIDIA Corporation is a market leader in visual computing technology dedicated to creating products that enhance the interactive 
experience on consumer and professional computing platforms.  Its graphics and communications processors have broad market 
reach and are incorporated into a wide variety of computing platforms, including consumer digital-media PCs, enterprise PCs, 
professional workstations, digital content creation systems, notebook PCs, military navigation systems and video games consoles. 
NVIDIA is headquartered in Santa Clara, California and employs more than 1,400 people worldwide.  For more information, visit 
the company's Web site at <a class="bodyText" href="http://www.nvidia.com">www.nvidia.com</a></p>

<p>###</p>

<p>Sun, Sun Microsystems, the Sun logo, Java and The Network Is The Computer are trademarks or registered trademarks of 
Sun Microsystems, Inc. in the United States and other countries.</p>



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
