<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
						<div align="center"><IMG SRC="/i/pressroom/denver_bizjrnl.gif" ALT="Denver Business Journal" border="0"/></div><BR/>
						<p><span class="bodyTitle">Coder wins big in contests</span></p>
                        </div>
<P>Lyn Berry-Helmlinger<BR/>
Denver Business Journal</P>
<P>Last year, Lafayette native Daniel Wright earned more money at two computer programming tournaments than many folks banked at their full-time jobs.</P>
<P>In fact, the Stanford junior made nearly $46,000 from competitions in 2001.</P>
<P>Now, Wright is once again headed into the heat of competition -- this time, to vie for a prize purse worth $150,000.</P>
<P>Wright is one of 16 finalists to advance to the championship rounds of the 2002 Sun Microsystems and TopCoder Collegiate Challenge tournament. The competition is scheduled for April 19-20 at the University Park Hotel@MIT in Cambridge, Mass.</P>
<P>TopCoder will score the contestants based on their ability to use a particular coding language under the pressure of peer-to-peer competition -- known as intensity -- and velocity, which is the ability to write quality code quickly and accurately. The winner of the tournament will receive $150,000.</P>
<P>Wright is confident about his chances in the upcoming tournament.</P>
<P>"I came very, very close to winning $100,000 in the previous Invitational contest," he said. "By the TopCoder rating system, I'm one of the highest seeds for this contest -- so maybe this time I'll be lucky."</P>
<P>Wright has entered the tournament as the second seed in the West region. This is Wright's third consecutive appearance in TopCoder's first three major tournaments, according to Adam Loss, TopCoder's director of public relations.</P>
<P>"Maybe the third time will be a charm for Daniel," said Jack Hughes, TopCoder founder and chairman. "Daniel is the only member of TopCoder to reach the final 16 in each of our first three major tournaments, which is a tremendous testament to his coding skill."</P>
<P>Previously, Wright tied for ninth and won $5,750 at the 2001 TopCoder Collegiate Challenge; he was the runner-up at the 2001 TopCoder Invitational, where he competed with a group of opponents that included professional coders -- and won $25,000.</P>
<P>He advanced to the championship rounds of the upcoming challenge based on his scoring in a series of online elimination rounds, which began with a field of 512 competitors on Feb. 19, according to Loss.</P>
<P>Wright has been a member of TopCoder since April 2001 and has won a total of $45,991 from his appearances in last year's two major TopCoder challenges and the company's weekly single-round matches.</P>
<P>"I enjoy coding and I enjoy competition, perhaps in the same way that many people enjoy competitive sports," said the computer science major. "I also like the substantial prize money -- that is perhaps the main factor that has kept me competing for so long."</P>
<P>If he excels in the upcoming competition, Wright said he plans to use the prize money for mainly practical purposes.</P>
<P>"I'll pay for my tuition and pay off my student loans first," he said. "Then, maybe I'll buy a car. Mostly, I'll try to save it for the future."</P>
<P>In the meantime, Wright said he'll continue to hone his skills by competing in TopCoder's single round matches, which are held twice a week.</P>
<P>"I think practice is the best preparation," he said.</P>
<P>Connecticut-based TopCoder, which arranges and hosts online and onsite programming competitions for its members, was created in February 2001. The organization's goal is to create a community of programmers while setting the industry standard for discerning programming skill.</P>
<P>TopCoder has more than 6,000 collegiate members.</P>
<P>"Given the pedigree of these outstanding students, it is clear that we have identified the future leaders of software development and the technology industry," Hughes said of the contestants in the upcoming Sun Microsystems and TopCoder Collegiate Challenge.</P>
<P>"These 16 have put in a tremendous effort in order to elevate above a crowded field of the best and the brightest. The energy and excitement during the online elimination rounds was amazing," he added.</P>
<P>Stans Kleijnen, vice president of market development engineering for Sun, said the company is proud to be the exclusive sponsor of the 2002 TopCoder tournament.</P>
<P>"[This competition] clearly identifies some of the best collegiate programmers in the country," said Kleijnen, in a prepared statement. "[TopCoder and Sun] are working together to empower university students to deliver cutting-edge technology presentations to their peers and gain valuable experience and industry insight in the process."</P>
<P>Copyright 2002 American City Business Journals Inc.</P>
<p><br></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
