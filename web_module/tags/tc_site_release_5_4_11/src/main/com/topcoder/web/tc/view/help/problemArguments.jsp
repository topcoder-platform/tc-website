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

      <h2>The Problem Arguments Window</h2>

      <p>
      When you click on the "Test" button from within the coding window, the "Problem Arguments Window" will appear.  The problem arguments window is where you will input the test case (input arguments) with which you wish to use to test your code (during the coding phase) or challenge another competitor's code (during the challenge phase).  Each argument to the problem statement will be represented by either an input area (simple data type), or by a "Create" button if the argument is an array (complex data type).
      </p>
      
      <a name="examples"></a>
      <p><span class="bodySubtitle">1 Examples</span><br/>
      The easiest way to populate the arguments of a test case is to select one of the examples from the "Select Example" drop-down.  Selecting a specific example from this list will populate the arguments to match the arguments of the corresponding example test case in the problem statement.  Keep in mind that even though your code may provide the correct expected result for all of the example cases, it is not necessarily correct.

      <a name="simpledata"></a>
      <p><span class="bodySubtitle">2 Simple Data Types</span><br/>
      For all non-array data types - such as int, long, char and String - the test box input dialog will present you with a field to input the data.  The data should be input without any quotes or other extra characters.  So, if you want to test with the String "abc" you should just type abc into the input field, not "abc".
      </p>
      
      <a name="complexdata"></a>
      <p><span class="bodySubtitle">3 Complex Data Types</span><br/>
      When one of the inputs is an array such as int[] (vector<int> in C++), the test case dialog will present you with a button to create the array.  Clicking this will bring up a new dialog box where you can enter the data elements.  There are a couple of ways to enter data here.  The most obvious is to enter the elements of the array one at a time and click the '+' button (or press enter) after each one.  You can move the elements up or down using the '^' and 'v' buttons, respectively.  You can also remove items either one at a time, with the '-' button, or all at once with the 'C' button.  If you want to modify an element that is already entered, you can double click on the element in the panel above the entry field and modify it.
      <br/><br/>
      Adding elements one at a time can be slow, so there are also two buttons that allow batch adding of elements.  The simpler of the two is the "++" button.  To use this button, you should enter all of the data elements as a comma delimited list, and then press the "++" button.  For example, typing 1,3,6,4 and pressing "++" will create the array {1,3,6,4}.  This button works exactly the same with all types of arrays.  The other batch add button is the "{}" button.  To use this, you should enter the data exactly as you would in your source code.  So, to input {1,3,6,4} you would enter {1,3,6,4} and click "{}".  While this may seem extraneous, given the "++" button, it has the advantage that it will parse String arrays that use double quotes, so that you can copy and paste the example test cases directly from the problem statement.  For example, to enter the String[], {"a","b","c"}, you would simply have to enter {"a","b","c"} and press "{}".  If you want to use the characters " or \ in a String[], you have to escape them with a \.  Thus, \" represents a double quote, and \\ represents a single backslash.  For example {"\"\\\""} represents a String[] with the single element: "\".  The advantage to the "{}" button is that any array sample input can be copied directly from the problem statement, and created by pasting and clicking "{}".  A couple of notes about the "{}" button are that the curly brackets at the front and end are optional, and the button will work without them.  Also, whitespace that is not enclosed by double quotes is ignored.  Furthermore, the dialog works exactly the same with all types of arrays.  Thus, with the "{}" button {1,2,3} will create an int[],{1,2,3}, if the data type is an int[], and will create a String[], {"1","2","3"}, if the data type is a String[].
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
