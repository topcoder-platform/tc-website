<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />

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
                <jsp:param name="level1" value="support"/>
                <jsp:param name="level2" value="guide"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="support"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Algorithm Competition Guide"/>
        </jsp:include>

        <h2>The Coding Window</h2>

      <p>
      The coding window is the most important part of a TopCoder competition.  It is in the coding window that the problem statement is shown, and the solutions are created, compiled, tested, and ultimately submitted.
      </p>
      
      <a name="problemstatement"></a>
      <p><span class="bodySubtitle">1 The Problem Statement</span><br/>
      The top pane of the Coding Window contains the problem statement in its entirety.  The problem statement explains exactly what it is that you should be attempting to accomplish.  It includes an explanation of the task, the class and method definitions (that your solution must adhere to), all of the constraints for any input parameters, and examples to help clarify the rest of the statement.  
      </p>

      <a name="language"></a>
      <p><span class="bodySubtitle">2 Choosing a Language</span><br/>
      TopCoder currently allows coders to utilize Java, C++, C#, or Visual Basic .Net as a competition programming language.  You have the option to choose a programming language on a problem-by-problem basis.  It is legal for you to use two different programming languages to solve two problems in a single competition.  For this reason, you have the option of choosing the programming language from within the coding window.  You can find the language selection area in the upper right area of the coding window - under "Choose your Language".  The programming language that is automatically selected by default will match the "Default Language" setting in your member profile on TopCoder's website.  Remember to select the appropriate language before you attempt to compile your code.  Strange compilation results can be a symptom of having the wrong language selected.  For information on exactly how TopCoder performs compilations and tests in each language check here:
      <br/><br/>
      <A href="http://www.topcoder.com/?&t=support&c=index#java1">Java</A><br/>
      <A href="http://www.topcoder.com/?&t=support&c=index#181">C++</A><br/>
      <A href="http://www.topcoder.com/?&t=support&c=index#c1">C# or VB</A>
      </p>

      <a name="createsolution"></a>
      <p><span class="bodySubtitle">3 Creating a Solution</span><br/>
      Your solution will essentially be a class that contains at least one method - as defined in the problem statement.  You may add as many methods as you would like, as long as the class name and the method name (and signature) that are outlined in the problems statement exist.  The capitalization and spelling must be precise.  In order for a submission to work correctly, the class and method declaration that is specified in the problem statement must be "public" in your code.
      <br/><br/>
      Many TopCoder members will utilize their own local editors or development environments to write the code and simply paste the code into the standard editor for compilation, testing, or submitting.   To copy and paste from and to the editor you must use CTRL-V (paste) and CTRL-C (copy) - even if you are using the Mac OS.
      <br/><br/>
      There are <A href="/?t=arena&c=plugins">TopCoder Arena plug-ins</A> available that will better integrate a local IDE with the TopCoder Arena.
      <br/><br/>
      Any standard output (i.e. System.out.println) from the execution of your class/method will be returned to you along with the results of your test.  This may be useful for debugging your code.  
      <br/><br/>
      In all cases, your solution must run in under 2 seconds for every allowable test case in order to be considered correct.  User testing your code for a specific case will notify you of the results as well as the run time.
      <br/><br/>
      If you've inserted iterative system output in your solution for debugging purposes, it is a very good idea to delete or comment out these lines prior to submitting your code (of course, you'll need to compile first).  System output will be applied against your memory limit and will likely slow down the execution of your code.
      </p>
      
      <a name="compiling"></a>
      <p><span class="bodySubtitle">4 Compiling</span><br/>
      Code compilations from within the coding window take place on TopCoder's servers.  The language that is chosen in the coding window at the time of the compilation will dictate which language compiler the compilation request is sent to.  A compilation request will send the code that is currently in the coding window to the TopCoder compiler.  If a compilation is successful, you will be notified of such.  If the compilation is not successful, the errors that are returned by the compiler will be displayed to you in the compilation results window.  Once a successful compilation is accomplished, the resultant compiled object will be stored on TopCoder's server.  Any user test or code submission will always utilize the most recent successfully compiled code.
      </p>

      <a name="usertesting"></a>
      <p><span class="bodySubtitle">5 User Testing</span><br/>
      Once your code has been successfully compiled, you have the option of executing a user test against the compiled code.  The user test will simply show you what your submission will produce for a given set of inputs parameters that you provide.  A user test <b>will not</b> provide information as to whether or not your submission is producing the correct result.  You will need to make your own determination as to the correctness of the return result.  Performing a user test based on the examples in the problem statement will provide a fairly good measure of the correctness of your solution since the examples will specify what the return value for a given set of input parameters should be.  However, the examples do not represent an exhaustive test suite for a given problem - just because your code produces the proper results for all examples does not necessarily mean that it will produce the proper result for other input parameters.  Think about potential border cases that may cause variations in the behavior of your solution and test these cases thoroughly.
      <br/><br/>
      In order to test your latest compiled code, click on the "Test" button in the coding window.  Doing so will launch the <A href="/tc?module=Static&d1=help&d2=problemArguments">Problem Arguments window</A> which will allow you to input the testing arguments for a specific test case.
      <br/><br/>
      If your compiled code executes successfully (without errors) for the input parameters that you've provided, you will be presented with the return value(s) that your code produced.  In the event that an error occurs during the execution of your code, you will be presented with the error message(s) that the execution of your code produces.
      <br/><br/>
      While user testing your code, be aware of the execution time that is provided to you for each case.  Remember that any execution time that exceeds 2 seconds (for any single test case) will cause your entire submission to fail the system tests (or a challenge).  The execution time may vary a bit - especially when it comes to garbage collection.  Even if your solution executes in under 2 seconds for a specific case - it is still possible that it may fail during another execution (like when it really matters!).  It is always risky to be even close to 2 seconds.
      </p>
 
      <a name="submitting"></a>
      <p><span class="bodySubtitle">6 Submitting</span><br/>
      At any point after a successful compilation and prior to any subsequent unsuccessful compilation, you have the option to submit your code.  Upon code submission, you will receive some amount of points - based on the length of time that has elapsed between opening that problem and submitting it.  The longer it takes for you to submit, the less points you will receive.  It is important to realize that upon submission, the points will be assigned to you regardless of whether or not your submission is correct.  At the end of the coding phase, the final point values for each competitor do not take into consideration correctness in any way.  Point values initially received for incorrect submissions will be eventually subtracted from the total score - either during the challenge phase or during the system-testing phase.
      <br/><br/>
      You do have the option of submitting a problem multiple times.  If, after you've already submitted a problem, you discover an error in your submission, you may submit that problem again.  However, there is a penalty for doing so.  Upon re-submission, two things will happen to your score:  1) the additional time elapsed between the previous submission and the most recent will be factored into your new point total, and 2) you will be penalized 10% of the maximum value of the problem that you've resubmitted.  In other words, if you resubmit a problem worth 500 points, you will incur a 50-point penalty in addition to the loss of points associated with the additional elapsed time.  Both of these penalties will be applied each time you resubmit (beyond the initial submission) a given problem.
      <br/><br/>
      Keep in mind that when you submit your code, you are submitting the most recently compiled version.  If you have made changes to your code since the last compile, a submission will ignore the changes and submit the compiled code.  Remember to compile (and maybe even test) prior to submitting.
      </p>

      <a name="saving"></a>
      <p><span class="bodySubtitle">7 Saving</span><br/>
      At any time during the coding phase, you may save your code.  Clicking on the Save button will place the current version of your code on our server.  It is good to save every-so-often so that you can ensure a recent version of your code will be available in the event that something happens to your TopCoder Arena program (i.e. you lose your Internet connection).  Compiling your code also has the effect of saving it.
      </p>

      <a name="clearingcode"></a>
      <p><span class="bodySubtitle">8 Clearing the Code</span><br/>
      Using the "Clear" button, you can quickly clear out the coding window.  Use this option only if you wish to start over for that particular problem.
      </p>

      <a name="thetimer"></a>
      <p><span class="bodySubtitle">9 The Timer</span><br/>
      The timer in the coding window will be always counting down to the end of the current phase of competition (unless your are in a practice room).  Remember that there is variable latency between your computer and our servers.  It is ALWAYS best to perform any submissions with at least 30 seconds left in the coding phase - anything less than that is a risk to you.
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
