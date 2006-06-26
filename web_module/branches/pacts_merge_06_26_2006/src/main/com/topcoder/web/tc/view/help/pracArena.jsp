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
         <jsp:include page="../page_title.jsp" >
         <jsp:param name="image" value="alg_support_faqs"/>
         <jsp:param name="title" value="How to Compete"/>
         </jsp:include>

        <h2>Practicing / Training in the TopCoder Arena</h2>
        <a name="practicerooms"></a>
      <p><span class="bodySubtitle">1 The Practice Rooms</span><br/>
      After each rated event, a practice room will be added to the Arena that contains the problem set that was used in that rated event.  This gives the event participants a chance to identify their errors or fine-tune their solutions, and it gives others a chance to get a feel for the types of problems that are used in a rated event.  Although the practice rooms behave a bit differently than an actual rated event, utilizing the practice rooms is the best way for a non-rated member to become familiar with the most important part of the TopCoder Arena.  The practice rooms are labeled based on the match and division in which they were used as actual problems.
      <br/><br/>
      It is highly recommend that all new members visit the practice rooms prior to competing in an algorithm rated event.  By visiting a practice room you will learn the Arena interface, the nature of the problems, and the expected structure of your solution.  You will also get a chance to look at thousands of submissions in various languages from other competitors who have visited the practice rooms.  At the very least, looking at some submissions from others who use your intended language will show you:  1) exactly how to structure your class, 2) the various input and output types that are specific to your language, and 3) how to import libraries in your language.  Even though the submissions in the practice rooms are not necessarily correct, you do know that they have been successfully compiled.
      </p>
      
      <ul>
      <li>
        <a name="timing"></a>
         <p><span class="bodySubtitle">1.1 Timing in the Practice Room</span><br/>
         The practice room is designed to allow you to take your time and get a feel for the user interface.  Once a problem is opened, you will have an unlimited amount of time to come up with a solution to the problem.  However, the method of scoring is based on a total of 75 minutes - which is the amount of time that is given to complete a full set of problems during a rated event.  The advantage of this is that the score that you receive upon submission of a solution will compare to the score that you would have received had you participated in that event.  However, since there is no time limit in the practice area, if you exceed the 75 minutes, your score will bottom out at the lowest allowable score for that problem.
         During a rated event, the competition phases will proceed as such: coding phase, intermission, challenge phase, and finally the system-testing phase.  In contrast, when in a practice room all of the functionality from the coding phase, the challenge phase, and the system-testing phase will be available all the time (see below for descriptions of each).  There is no concept of changing phases in the practice rooms.  In addition, the timer in the practice room will always show the phase as "Coding" and the remaining time as "00:00:00".  During a rated event, the timer will always count down to the end of each phase along with indicating the current phase.
      </li>
      <li>
        <a name="selectingproblems"></a>
         <p><span class="bodySubtitle">1.2 Selecting a Problem</span><br/>
         Once in a practice room, you will need to select a problem before you can begin coding.  To select a problem, click on the "Select One" drop-down box.  In the list you will see point values that correspond to the difficulty of the problem - the higher the value, the more difficult the problem will be.  Problems with higher point values have the potential to yield higher points for a successful submission.  Once a problem is selected, TopCoder's server will begin keeping track of how long the problem has been open.  The elapsed time between opening a problem and submitting a solution for that problem is the biggest factor in determining how many points are received upon submission of a solution.  You may open more than one problem at a time - but keep in mind that the clock will be ticking for each problem, independent of one another.  Once a problem is selected, the <A href="/tc?module=Static&d1=help&d2=codingWindow">Coding Window</A> will appear.
      </li>
      <li>
        <a name="systemtesting"></a>
         <p><span class="bodySubtitle">1.3 System Testing</span><br/>
         After you've submitted one or more problems in a practice room, you have the option of running the system tests. During the system tests, various sets of valid input parameters are applied to your submission, with the output from your submission being compared against the expected output for each test case. If the expected output does not match the received output for one or more of the test cases, your submission will "fail" the system tests.  Failing the system tests in a practice room will not mark your submission as failed, nor will it deduct any points from your final score (as it would during a rated event).  The execution time for system tests in a practice room will vary depending on the number of submissions you have, the number of test cases there are, and the efficiency of your submissions. Just keep in mind that you may need to wait a minute or more for all tests to finish. The system test results will appear in a pop-up window when they are done - the results in the window will be for any/all problems that you have submitted in that room.  The system testing option is only available in a practice room - it will not be available in a competition room during a rated event. In a rated event, the system tests will run automatically - following the challenge phase.  You may run the system tests by choosing "Practice Options / Run System Tests" from within a practice room.
      </li>
      <li>
        <a name="roomsummary"></a>
         <p><span class="bodySubtitle">1.4 The Room Summary</span><br/>
         The room summary window allows you to view information about other competitors and is also the interface for the challenge functionality.  Check here for a detailed description of the <A href="/tc?module=Static&d1=help&d2=roomSummary">Room Summary Window</A>.
      </li>
      <li>
        <a name="challenging"></a>
         <p><span class="bodySubtitle">1.5 Challenging</span><br/>
         When you are in a practice room, the phases behave as if the coding phase and the challenge phase are running simultaneously and perpetually.  At any time, you may view the source code of any other competitors in a practice room - and you have the option to challenge any of the submissions.  The challenge restrictions that are regularly in place during a rated event have been lifted for the practice rooms.  Therefore, you may challenge regardless of your current point total and you may challenge any submission at any time, regardless of its status.
         <br/><br/>
         Here's a link for a description of the <A href="/tc?module=Static&d1=help&d2=ratedEvent#challenge">Challenge Phase</A> during a rated event.
      </li>
      <li>
        <a name="clearingproblems"></a>
         <p><span class="bodySubtitle">1.6 Clearing Problems</span><br/>
         Since this is a practice room, you are welcome to start over on any or all of the problems in any of the practice rooms.  Under the "Practice Options" menu item that appears when in a practice room, you'll see a "Clear All Problems" option along with a "Clear Problem(s)" option.  The "clear all" will remove all of your submissions and history for all problems in that particular practice room.  The "clear problem" option will allow you to specify a particular problem (or multiple problems) that should be cleared.
      </li>
      </ul>
      
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
