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

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- TCO Header -->

        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/events/google2003/Logo_60gry.gif" width="176" height="77" border="0"/></td>

         <td width="100%" align="center" colspan="3">
         <OBJECT 
            classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            WIDTH="100%" HEIGHT="80" id="google" ALIGN="">
         <PARAM NAME=movie VALUE="google.swf">
         <PARAM NAME=quality VALUE=high> <PARAM NAME=salign VALUE=T>
         <PARAM NAME=bgcolor VALUE=#FFFFFF>
         <EMBED 
            src="/i/events/google2003/google.swf" 
            quality="high" 
            salign="T" 
            bgcolor="#FFFFFF"  
            WIDTH="100%" 
            HEIGHT="80" 
            NAME="google" 
            ALIGN="" 
            TYPE="application/x-shockwave-flash" 
            PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
         </EMBED>
         </OBJECT><br />
      </td>
        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/events/google2003/pbtc_gray.gif" width="176" height="77" border="0"/></td>
   </tr>
   
   <tr>
      <td colspan="7" width ="100%" align="center">
         <OBJECT 
            classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            WIDTH="100%" HEIGHT="150" id="google" ALIGN="">
         <PARAM NAME=movie VALUE="googletabs.swf">
         <PARAM NAME=quality VALUE=high> <PARAM NAME=salign VALUE=T>
         <PARAM NAME=bgcolor VALUE=#FFFFFF>
         <EMBED 
            src="/i/events/google2003/googletabs.swf" 
            quality="high" 
            salign="T" 
            bgcolor="#FFFFFF"  
            WIDTH="100%" 
            HEIGHT="150" 
            NAME="google" 
            ALIGN="" 
            TYPE="application/x-shockwave-flash" 
            PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
         </EMBED>
         </OBJECT><br />
        </td>
     </tr>

<!-- Gutter Begins -->
   <tr>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
        <td width="150" valign="top"><img src="/i/clear.gif" width="150" height="1" border="0"/></td>
<!--Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td class="bodyText" valign="top">
            <img src="/i/clear.gif" width="500" height="1" border="0"/><br />
       
            <h2>Competition Structure</h2>
            
           <p><span class="bodySubtitle">The Competition Field</span><br />
            A total of 500 individuals will qualify to compete in Round 1.  The top 250 scorers will advance to Round 2.  The top 
            25 scorers from Round 2 will advance to the Championship Round, which will be held onsite at Google’s headquarters 
            in Mountain View, CA, USA.</p>
            
           <p><span class="bodySubtitle">Scoring and Advancing</span><br />
            After each round of competition, the top scorers will be identified and will advance to the next round.  Coder advancement 
            in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round 
            Structure) for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) 
            point total. The structure of the online rounds is as follows:</p>

            <ul>
                <li><strong>Online Round 1</strong><br />
                Up to 500 coders will compete in Round 1 and up to 250 will advance.  The 250 highest scoring competitors will advance 
                to Round 2.  Each coder must have positive points to advance, so if there are less than 250 competitors who score positive 
                points, only those competitors with a positive point total will advance. </li>

                <li><strong>Online Round 2</strong><br />
                Up to 250 coders will compete and up to 25 will advance.  The 25 highest scoring competitors will advance to the 
                Championship Round.  Each coder must have positive points to advance, so if there are less than 25 competitors who 
                score positive points, only those competitors with a positive point total will advance.</li>

                <li><strong>Onsite Championship Round</strong><br />
                Up to 25 coders will compete in the Championship Round being held onsite at Google's headquarters.  Each finalist 
                is responsible for arriving at Google's headquarters to compete.</li>
            </ul>

            <p><strong>NOTE: </strong>In the event of a tie for any advancing position, the tie will be resolved in the following manner:</p>
            <ul>
                <li>Total points acquired (higher is better) during the previous rounds of the tournament, excluding the Qualification Round</li>
                <li>If a tie still remains, all tied coders will advance to the next round</li>
            </ul><br />
            
           <p><span class="bodySubtitle">Round Structure</span><br />
            Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. 
            (Note: the format of these competition rounds is similar to the format of TopCoder Single Round Matches.)</p>

            <ul>
            <li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with the same three questions 
            representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded 
            upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem 
            was opened to the time it was submitted.</li>
            <li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality of 
            other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, 
            and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as a penalty, applied 
            against their total score in that round of competition. </li>
            <li><strong>The System Testing</strong> Phase is applied to all submitted code that has not already been successfully challenged. 
            If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally 
            earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be 
            correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set 
            of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge 
            Phase will be added to the sets of inputs for the System Testing Phase.</li>
            </ul>
            
            <p><span class="bodySubtitle">Championship Round</span><br />
            The 25 advancers from Round 2 must travel to Google’s headquarters to compete in the Championship Round of the tournament.  All 
            finalists must arrive at Google’s headquarters no later than 10:00 AM on Friday, November 14th.  If a contestant is unable to attend 
            the onsite rounds, he/she will forfeit eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest 
            scorer from Round 2.</p>

            <p>Google and TopCoder will NOT provide travel arrangements for each finalist.  All expenses to attend the onsite finals are the 
            responsibility of the finalist.</p>

            <p>TopCoder will determine the room assignments for the Championship Round prior to the start of the Championship Round.</p>

            <p>The Championship Round will be a single round of 25 coders. First, second, third and fourth place in the Championship Round are 
            determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round 
            will be the coder with the highest point total for the round. In the event of a tie in the Championship rounds, the tie will be resolved in the 
            following manner (in order):</p>
            <ul>
            <li>Total points acquired (higher is better) during Rounds 1 and 2</li>
            <li>If a tie still remains in the Championship Round, then the prize money will be distributed equally among the tied coders</li>
            </ul>

            <p><span class="bodySubtitle">Other</span><br />
            The tournament is void in whole or in part where prohibited by law.</p>

            <p>This tournament is brought to you by TopCoder, Inc. <A href="/">(http://www.topcoder.com/)</A> 703 Hebron Avenue, Glastonbury, 
            CT 06033 and Google, Inc. <A href="http://www.google.com">(http://www.google.com)</A> 2400 Bayshore Parkway, Mountain View, CA 
            94043.</p>

            
            <p><br /></p>
                        
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
        <td width="150" valign="top"><img src="/i/clear.gif" width="150" height="1" border="0"/></td>
<!--Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>