<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="off"/>
      </jsp:include>

      <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT colspan=2><img src="/i/corp/screening/clear.gif" alt=""/></td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- LEFT NAV --%>
            <td class=bodyNav>
            <jsp:include page="helpLeft.jsp" >
                <jsp:param name="selected" value="codingWindow"/>
            </jsp:include>
            </td>

<%-- CONTENT --%>
            <td class=bodyContent>

            <p class=pL>
            <span class=bodyBigTitle>The Coding Window</span>
            <br /><br />

                        The coding window is the most important part of the Technical Assessment Application.  It is in the coding window that the <a href="#problem">problem statement</a> is shown,
                        and the solutions are <a href="#coded">coded,</a> <a href="#compiled">compiled,</a> <a href="#tested">tested,</a> and <a href="#submitted">submitted.</a><br><br>

                        <a name="problem"></a><span class="bodySmallTitle">The Problem Statement</span><br>
                        The top pane of the coding window contains the problem statement in its entirety.  The problem statement explains exactly what it is
                        that you are attempting to accomplish.  It includes an explanation of the task, the class and method definitions that your solution must
                        adhere to, all of the constraints for any input parameters, and examples to help clarify the statement. <br><br>

                        <span class="bodySmallTitle">Choosing a Language</span><br>
                        Currently the Technical Assessment Application supports three programming languages - Java, C++, and C#.  Employers decide which options you
                        will be given, so it is possible that you will not see all three languages as choices.  If you do have the option of choosing a language, you
                        may do so on a problem-by-problem basis.  You can find the language selection area in the upper right of the coding window called
                        <strong>Choose your style</strong>.  Remember to select the appropriate language before you attempt to compile your code.  Strange compilation
                        results can be a symptom of having the wrong language selected.<br><br>

                        <span class="bodySmallTitle">Creating a Solution</span><br>
                        The solution class you create and all of its members must be defined as public in order for the TopCoder servers to have access to
                        your class members and invoke the appropriate methods.  Bellow you will find code templates for Java, C++ and C#:<br><br>

                        <a name="coded"></a><span class="bodySmallTitle">Java Code Template</span><br>
                        <pre>import &lt;necessary classes&gt;

public class &lt;class-name&gt; {
    public &lt;return-type&gt; &lt;method-name&gt;(&lt;argument-type&gt; arg1) {
        //your source here
        return &lt;result&gt;;
    }
}
                        </pre>

                        <span class="bodySmallTitle">C++ Code Template</span><br>
                        <pre>#include &lt;necessary classes&gt;

using namespace std; //Required for TopCoder gcc compiler

class &lt;class-name>
{
    public:
    &lt;return-type&gt; &lt;method-name&gt; (&lt;argument-type&gt; arg1)
    {
        //your source here
        return &lt;result&gt;;
    };
};
                        </pre>

                        <span class="bodySmallTitle">C# Code Template</span><br>
                        <pre>using &lt;necessary classes&gt;;

public class &lt;class-name> {
    public &lt;return-type&gt; &lt;method-name&gt;(&lt;argument-type&gt; arg1) {
        //your source here
        return &lt;result&gt;;
    }
}
                        </pre>

                        <a name="compiled"></a><span class="bodySmallTitle">Compiling</span><br>
                        Code compilations from within the coding window will take place on TopCoder servers.  The language that is chosen in the coding
                        window at the time of the compilation will dictate to which language compiler the compilation request is sent.  A compilation request
                        will send the code that is currently in the coding window to the TopCoder compiler.  If a compilation is successful, you will be
                        notified of such.  If the compilation is not successful, the errors that are returned by the compiler will be displayed to you in the
                        compilation results window.  Once a successful compilation is accomplished, the resultant compiled object will be stored on
                        TopCoder's server.  Any user test or code submission will always utilize the most recent successfully compiled code.<br><br>

                        <a name="tested"></a><span class="bodySmallTitle">User Testing</span><br>
                        Once your code has been successfully compiled, you have the option of executing a user test against the compiled code.  The user
                        test will simply show you what your submission will produce for a given set of input parameters that you provide.  A user test
                        will not provide information as to whether or not your submission is producing the correct result.  You will need to make your
                        own determination as to the correctness of the return result.  Performing a user test based on the examples in the problem
                        statement will provide a fairly good measure of the correctness of your solution since the examples will specify what the return
                        value for a given set of input parameters should be.  However, the examples do not represent an exhaustive test suite for a
                        given problem - just because your code produces the proper results for all examples does not necessarily mean that it will
                        produce the proper result for other input parameters.  Think about potential border cases that may cause variations in the
                        behavior of your solution and test these cases thoroughly.<br><br>

                        If your compiled code executes successfully (without errors) for the input parameters that you've provided, you will be
                        presented with the return value(s) that your code produced.  In the event that an error occurs during the execution of your code,
                        you will be presented with the error message(s) that the execution of your code produced.<br><br>

                        <span class="bodySmallTitle">The Problem Arguments Window</span><br>
                        When you click on the <strong>Test</strong> button from within the coding window, the "Problem Arguments Window" will appear.  The
                        problem arguments window is where you will input the test case with which you wish to use to test your code.  Each argument to
                        the problem statement will be represented by either an input area (simple data type), or by a <strong>Create</strong> button if the argument
                        is an array (complex data type).<br><br>

                        <span class="bodySmallTitle">Simple Data Types</span><br>
                        For all non-array data types&#151;such as int, long, char and String&#151;the test box input dialog will present you with a field to
                        input the data.  The data should be input without any quotes or other extra characters.  So, if you want to test with the String
                        "abc" you should just type abc into the input field, not "abc".<br><br>

                        <span class="bodySmallTitle">Complex Data Types</span><br>
                        When one of the inputs is an array such as int[] (vector<int> in C++), the test case dialog will present you with a button
                        to create the array.  Clicking this will bring up a new dialog box where you can enter the data elements.  There are a couple
                        of ways to enter data here.  The most obvious is to enter the elements of the array one at a time and click the <strong>+</strong> button
                        (or press enter) after each one.  You can move the elements up or down using the <strong>^</strong> and <strong>v</strong> buttons, respectively.  You can
                        also remove items either one at a time, with the <strong>-</strong> button, or all at once with the <strong>C</strong> button.  If you want to modify an
                        element that is already entered, you can double click on the element in the panel above the entry field and modify it.<br><br>

                        Adding elements one at a time can be slow, so there are also two buttons that allow batch adding of elements.  The simpler
                        of the two is the <strong>++</strong> button.  To use this button, you should enter all of the data elements as a comma delimited list, and
                        then press the <strong>++</strong> button.  For example, typing 1,3,6,4 and pressing <strong>++</strong> will create the array {1,3,6,4}.  This button
                        works exactly the same with all types of arrays.  The other batch add button is the <strong>{}</strong> button.  To use this, you should enter
                        the data exactly as you would in your source code.  So, to input {1,3,6,4} you would enter {1,3,6,4} and click <strong>{}</strong>.  While
                        this may seem extraneous, given the <strong>++</strong> button, it has the advantage that it will parse String arrays that use double
                        quotes, so that you can copy and paste the example test cases directly from the problem statement.  For example, to enter
                        the String[], {"a","b","c"}, you would simply have to enter {"a","b","c"} and press <strong>{}</strong>.  If you want to use the
                        characters " or \ in a String[], you have to escape them with a \.  Thus, \" represents a double quote, and \\ represents a
                        single backslash.  For example {"\"\\\""} represents a String[] with the single element: "\".  The advantage to the <strong>{}</strong>
                        button is that any array sample input can be copied directly from the problem statement, and created by pasting and
                        clicking <strong>{}</strong>.  A couple of notes about the <strong>{}</strong> button are that the curly brackets at the front and end are optional, and the
                        button will work without them.  Also, whitespace that is not enclosed by double quotes is ignored.  Furthermore, the dialog
                        works exactly the same with all types of arrays.  Thus, with the <strong>{}</strong> button {1,2,3} will create an int[],{1,2,3}, if the
                        data type is an int[], and will create a String[], {"1","2","3"}, if the data type is a String[].<br><br>

                        <a name="submitted"></a><span class="bodySmallTitle">Submitting</span><br>
                        At any point after a successful compilation, you have the option to submit your code.  It is important to realize that
                        submission can be made regardless of whether or not your submission is correct. <br><br>

                        You do have the option of submitting a problem multiple times.  If, after you've already submitted a problem, you
                        discover an error in your submission, you may submit that problem again.  However, the additional time elapsed between
                        the previous submission and the most recent will be included in your time.<br><br>

            </p>

            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB colspan=2>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>