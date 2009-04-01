<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
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
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_how_to_compete"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
         <jsp:include page="/page_title.jsp" >
         <jsp:param name="image" value="alg_support_faqs"/>
         <jsp:param name="title" value="How to Compete"/>
         </jsp:include>

      <h2>The Room Summary Window</h2>

      <p>
      The room summary window provides competitors and spectators with the ability to view details about the status of all of the competitors within a given room.  In addition, the room summary window provides the ability for competitors to the view submissions of others during the challenge phase.
      </p>
      <p>
      There are two ways to get to the room summary - 1) Drilling in from the leader board, and 2) clicking on the "Summary" button from within a competition room.  Depending on the method used, the room summary window will appear differently.  If the room summary window is opened from the leader board, the "Who's Here" list and the chat window will appear (although the chat area will be view-only).  When opened from within the competition room, the room summary window will contain only the status information about each competitor assigned to that room.
      </p>
      
      <a name="spectating"></a>
      <p><span class="bodySubtitle">1 Spectating</span><br/>
      The Room Summary Window contains a row for each competitor in the competition room that you are viewing.  Each row contains columns for room place (rank), handle, received points for each of the problems, and a current score.
      <br/><br/>
      The received points for a problem submission will appear in different colors, depending upon the language that was used to compile the submission.  The default color-coding is as follows:
      <br/>
      <i>Java</i> - Green<br/>
      <i>C++</i> - White<br/>
      <i>C#</i> - Blue<br/>
      <i>VB</i> - Light Blue
      <br/><br/>
      In addition to point values, the information about a specific problem for a competitor may contain a text status, rather than a point value.  The different statuses are as follows:
      <br/>
      <i>Unopened</i> - The problem has not yet been opened by that competitor<br/>
      <i>Opened</i> - The problem has been opened, but no compilations have taken place<br/>
      <i>Compiled</i> - At least one compilation attempt has occurred on this problem<br/>
      <i>Challenge Succeeded</i> - There has been a successful challenge applied against this submission<br/>
      <i>Failed System Test</i> - This submission has failed during the system-testing phase<br/>
      <i>Passed System Test</i> - This submission has withstood all phases of competition and the received points will be factored into the final score for that competitor
      <br/><br/>
      Clicking on any of the column heading will sort the room summary list by the selected column.  
      <br/><br/>
      At any time, you may right-click on any of the handles in the list and you will have to functions available to you.  <b>Info</b> will display the Coder Info Window, which contains some basic information about that member.  History will display a chronological list of events that have taken place for that competitor during the given event.  The events listed are submissions, challenges, and individual system test results.  In the event that any of the system tests failed, the value following the colon is the (incorrect) value that the given submission returned for the given arguments.
      <br/><br/>
      During a rated event, no competitor or spectator may view the submission of any other competitors during the coding phase of the competition.  However, at the start of the challenge phase, the source code of the submissions become available to all users by double clicking on the individual submission for a given competitor in the Room Summary Window.  Even spectators may view the individual submissions at the start of the challenge phase.
      <br/><br/>
      The Room Summary Window will stay up-to-date with the latest information even as it remains open.
      </p>
      
      <a name="challenging"></a>
      <p><span class="bodySubtitle">2 Challenging</span><br/>
      During the challenge phase of a rated event, each competitor has the opportunity to view the source code of each of the other competitors' submissions (within your room).  The room summary window provides each competitor access to those submissions.  During the challenge phase, any registered competitor who views the source code of a same-room competitor will also see a "Challenge" button in the lower, left-hand corner of the source code window.  Clicking the "Challenge" button will open the <A href="/tc?module=Static&d1=help&d2=problemArguments">Arguments Window</A> and allow you to proceed with your challenge of that submission. 
      <br/><br/>
      The TopCoder Arena has code-beautification functionality built in for those that wish to use it.  In the Room Summary Window, setting <b>Pretty</b> to <b>On</b> in the upper-right corner will cause subsequent source code view to incorporate basic code formatting rules.  For some languages and some submissions, the <b>Pretty</b> option will have no effect.   
      </p>
      
      <a name="divisionsummary"></a>
      <p><span class="bodySubtitle">3 Division Summary</span><br/>
      The Division Summary Window is very similar to the Room Summary Window, except that it contains information for <i>all</i> competitors within a division, rather than just a single room.  Since the division summary is not specific to a single room, it must be accessed from the Active Contests menu.  To launch the Division Summary Window, select "Active Contests", the appropriate event, "Division Summary".
      <br/><br/>
      Most of the functionality in the Room Summary Window exists in the Division Summary.  You may switch divisions using the "Select a Division" drop-down list at the top of the window.
      </p>
      
         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

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
