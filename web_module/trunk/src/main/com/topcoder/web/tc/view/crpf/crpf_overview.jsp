<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="events"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="TopCoder Charity Challenge"/>  
        </jsp:include>

<!--CRPF Header-->
            <table align="center">
               <tr>
                  <td><img src="/i/tournament/crpf03/crpf_banner.gif" width="601" height="152" border="0"  vspace="15"/></td>
               </tr>
            </table>

            <blockquote>
            <h2>The Best of the Best</h2>
            
            <p>Everyone knows that programmers from Chennai are the masters of software development. But who among them is the best? Verizon is on a mission to answer that question. 
            Through the Verizon Coding Challenge, top software developers will have a chance to showcase their skills, earn recognition as the top developers in Chennai 
            and win cash and other prizes.  
            </p>
            <p>If you want to raise your profile by besting your peers, then this is the event for you. Verizon has teamed with TopCoder, the leader in online and offline programming competitions 
            and skills assessment, to execute this exciting event. Verizon may use the results of this event for the purpose of finding new employees for their Chennai Center.
            </p>
            <p><span class="bodySubtitle">Choose Your Weapon</span><br />
            Use Java, C++, C# or VB.NET to compete. The event will allow developers to choose from these four important programming languages, with no particular 
            advantage given to any one language.
            </p>
            <p><span class="bodySubtitle">How It Works</span><br />
            The tournament is a timed contest allowing all participants to compete online to solve the same problems under the same time constraints. The contests are challenging and exciting for participants and 
            spectators. The format is simple:
            </p>
            <blockquote>
            <p><span class="bodySubtitle">Download the Arena</span><br />
            TopCoder's Competition Arena (a Java Applet) provides the interface to the competition. Here contestants will read the problem statements, code 
            solutions, compile and test those solutions and submit their code for points. Prior to the match, you can practice on many sample problems by downloading the arena ahead of time.
            </p>
            <p><span class="bodySubtitle">Coding Phase</span><br />
            At the designated date and time, competitors will enter the Arena just prior to "kick off". Competitors are placed in virtual rooms of 10 developers 
            per room. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution 
            in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tells the tale as competitors vie for the highest point total.
            </p>
            <p><span class="bodySubtitle">Challenge Phase</span><br />
            During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through submitted code, with the hope that the results are not satisfied by the 
            software written. Breaking another developer's code is the most direct form of engaging competition for a programmer. In this phase, precious points 
            are awarded or taken away based on successful challenges. A penalty exists for an unsuccessful challenge.
            </p>
            <p><span class="bodySubtitle">System Tests</span><br />
            Within minutes of the end of the Challenge Phase, TopCoder will determine the accuracy of all submissions and award final points to all competitors. It 
            is the instant gratification of knowing winners, losers, statistics and one's own performance versus the field that makes TopCoder events unique and 
            captivating.
            </p>
            </blockquote>
            <p><span class="bodySubtitle">Can Your Skills Carry You to August 29th?</span><br />
            Registration for the Verizon Coding Challenge opens on August 4th and closes on August 15th, 2003.  Be sure to register early, as only the first 500 eligible individuals to
            register will be invited to compete in Round #1 which will be held at XXX on August 20th. 

            </p>
            <p>The competitors with the top 250 scores from the first round will advance to the second round on August 25th. The top 25 performers in the second round will be invited to 
            compete for the large cash prizes onsite at VDSI Chennai on August 29th.
            </p>
            
            </blockquote>
            
            <p><br /></p>
                        
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
       <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/> 
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
