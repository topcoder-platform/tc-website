<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">

   <tr>

<!-- Verizon logo-->
      <td width="147" bgcolor="#000000" rowspan="2" colspan="3" valign="top"><img src="/i/events/verizon2003/logo_black_147.gif" width="147" height="141" border="0"/></td>

<!-- Top Nav-->
      <td width="100%" bgcolor="#000000" colspan="2"><img src="/i/clear.gif" width="100%" height="40" border="0"/></td>
   </tr>

   <tr>
<!-- Top Ad -->
      <td width="100%" bgcolor="#CC0001" colspan="2" align="left">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr>
               <td width="100%"><img src="/i/events/verizon2003/vcc03_logo.gif" width="550" height="101" border="0"/></td>
               <td align="right" valign="middle"><img src="/i/events/verizon2003/pbtc.gif" width="146" height="34" border="0"/></td>
            </tr>
          </table>
      </td>
   </tr>
   
   <tr>
<!-- Top Bar -->
      <td width="147" bgcolor="#000000" colspan="3"><img src="/i/clear.gif" width="147" height="20" border="0"/></td>
      <td width="100%" bgcolor="#000000" colspan="2"><img src="/i/clear.gif" width="100%" height="20" border="0"/></td>
   </tr>
   
   <tr>
<!-- Left Column-->
      <td width="10" bgcolor="#666666"><img src="/i/clear.gif" width="10" height="1"/></td>
      <td valign="top" bgcolor="#666666">
         <table  border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td bgcolor="#666666" valign="top"><img src="/i/clear.gif" width="127" height="10" border="0"/></td></tr>
            <tr><td>      
                     <jsp:include page="verizonLinks.jsp" >
                        <jsp:param name="selectedTab" value="rules"/>
                        <jsp:param name="selectedSubtab" value="structure"/>
                     </jsp:include>
            </tr>
            <tr><td class="bodyText" bgcolor="#ffffff"><img src="/i/events/verizon2003/vcc03_right.gif" width="127" height="300" border="0"/></td></tr>
         </table><br />
       </td>
      <td width="10" bgcolor="#666666"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
       
<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
      <td class="bodyText" valign="top">
            <img src="/i/clear.gif" width="100%" height="10" border="0"/><br />
            <h2>Competition Structure</h2>
            
<!-- The Competition Field -->
            <p><span class="bodySubtitle">The Competition Field</span><br />
            A total of 500 individuals will be invited to compete in Round #1.  The top 250 scorers will advance to Round 2.  The top 25 
            scorers from Round 2 will advance to Round #3 (the Championship Round), which will be held onsite at Verizon's Chennai VDSI 
            facility.</p>
            
<!-- Online Elimination Rounds -->
            <p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            Everyone who competes in Round #1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the 
            start of the online round.  <strong><em>All start times will be communicated as Chennai Time</em></strong>.  If a coder 
            does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in 
            that round of competition. </p>

            <p>All competitors who have been invited to compete will be randomly assigned to specific rooms, with up to 10 people in 
            each room.  TopCoder will determine all room assignments prior to the start of each online round. </p>

            <p><span class="bodySubtitle">Scoring and Advancing During Online Rounds</span><br />
            After each round of competition, the top scorers will be identified and will advance to the next round.  Coder advancement in 
            all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) 
            for each coder. In order to advance, a coder must finish each round with a greater-than-zero point total. The structure of the 
            online rounds is as follows:</p>
            
            <ul>
               <li><span class="bodySubtitle">Round #1</span><br />
               Up to 500 coders will compete in Round #1 and up to 250 will advance.  The 250 highest scoring competitors will advance to 
               Round #2.  Each coder must have positive points to advance, so if there are less than 250 competitors who score positive 
               points, only those competitors with a positive point total will advance.</li>
               
               <li><span class="bodySubtitle">Round #2</span><br />
               Up to 250 coders will compete and up to 25 will advance.  The 25 highest scoring competitors will advance to Round #3.  
               Each coder must have positive points to advance, so if there are less than 25 competitors who score positive points, only those 
               competitors with a  positive point total will advance.</li>
               
               <li><span class="bodySubtitle">Round #3 Championship Round</span><br />
               Up to 25 coders will compete in the Championship Round being held onsite at Verizon's Chennai facility.  Each finalist is 
               responsible for arriving at Verizon's facility to compete.</li>
            </ul>
            
            <p><strong>NOTE:</strong>  In the event of a tie for any advancing position, the tie will be resolved in the following manner:<br/>
            <ul>
               <li>Total points acquired (higher is better) during the previous rounds of the tournament</li>
               <li>If a tie still remains, all tied coders will advance to the next round</li>
            </ul>
            </p>

<!-- Round Structure -->
            
            <p><span class="bodySubtitle">Competition Round Structure</span><br />
            Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. 
            (Note: the format of these competition rounds is similar to the format of the Single Round Matches.)</p>
            
            <ul>
                <li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with the same three questions 
                representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are 
                awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time 
                the problem was opened to the time it was submitted.</li>

                <li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality 
                of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the 
                defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as 
                a penalty, applied against their total score in that round of competition.</li>

                <li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully 
                challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the 
                points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the 
                output from the code submission to be correct. If the output from a coder's submission does not match the expected output, 
                the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a 
                given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing 
                Phase.</li>
            </ul><br />

<!-- Championship Round -->
            <p><span class="bodySubtitle">Onsite Championship Round</span><br />
            The 25 advancers from Round #2 must travel to Verizon's Chennai VDSI facility to compete in the Championship round of the 
            tournament.  All finalists must arrive at Verizon's Chennai VDSI no later than 10:00 AM on Friday, August 29th.  If a contestant 
            is unable to attend the onsite rounds, he/she will forfeit eligibility to receive a prize, and his/her spot in the tournament will be 
            given to the next highest scorer from Round #2.</p>

            <p>Verizon and TopCoder will NOT provide travel arrangements for each finalist.  All expenses to attend the onsite finals are the 
            responsibility of the finalist.</p>

            <p>TopCoder will determine the room assignments for the Championship Round prior to the start of the Championship round. </p>

            <p>The Championship Round will be a single round of 25 coders. First, second, third and fourth place in the Championship round 
            are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship 
            Round will be the coder with the highest point total for the round. In the event of a tie in the Championship rounds, the tie will be 
            resolved in the following manner (in order):</p>
            
            <ul>
            <li>Total points acquired (higher is better) during Rounds #1 and #2</li>
            <li>If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</li>
            </ul><br />
            
            <p><br /></p>
      </td>
   </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>