<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="514446" message="Discuss this article" />
</div>

<span class="bigTitle">Beginning TopCoder Competition with C#.Net</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/ali_raza_shaikh_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="20641048" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>
<span class="bodySubtitle">1. Introduction</span><br>
C# -- usually pronounced "CSharp" -- has been around since 2001. C# is an object oriented, programming language, with a C-based syntax much like C++ or Java. The first version of the C# programming language was released with the .NET Framework 1.0 back in 2001. From the beginning, C# showed great signs for rapid application development and is targeted for developing software components to be used in distributed environments. C# is such a language (or you could say that .NET is such a platform) that most programmers will be comfortable with it in no time and will continue to explore the rich class libraries provided by the framework. 
</p>
<div align="center"><img src="/i/education/022207_1.png" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<p>
Since its release, its usage at TopCoder has increased each year. C# is currently not the most common language for competitions at TopCoder, but <tc-webtag:handle coderId="10574855" /> demonstrated what C# is capable of with wins at the 2006 TCO and TCCC, along with 25 SRM wins. This article is intended to help newcomers, especially new High School competitors, get up to speed so that they, too, can take advantage of C#'s strengths in TopCoder competitions.
</p>
<p>
<span class="bodySubtitle">2. Getting Started - Registration</span><br>
To participate in any TopCoder Algorithm Competitions, you must first register with TopCoder. Registration will allow you to participate in the Single Round Matches as well as other competitions at TopCoder. To <a href="/reg">Register</a>. 
</p>
<p>
Once you're registered, check out the Competition Arena. You can launch the Arena from the TopCoder site or you can launch it directly by downloading the Java Web Start Application file. Don't have JWS? <a href="<tc-webtag:linkTracking link="http://java.sun.com/products/javawebstart/index.html"/>" target="_blank" refer="feature_022207"/>Download</a> it on java.sun.com.
</p>
<div align="center"><img src="/i/education/022207_2.png" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<p>
<span class="bodySubtitle">3. Getting Started - Environment</span><br>
So, if you are getting started with C# or are doing a lot of C# programming, you will probably find yourself using Visual Studio.Net. Visual Studio is an Integrated Development Environment (IDE) with a pretty fancy source code editor, edit-and-continue debugger, syntax highlighting, intelligence, code snippets, refactoring and many other cool features. Visual Studio is not the only IDE in the market to write C# programs -- there are many others, like <a href="<tc-webtag:linkTracking link="http://www.icsharpcode.net/"/>" target="_blank" refer="feature_022207"/>ISharpCode</a> and <a href="<tc-webtag:linkTracking link="http://www.monodevelop.com/Main_Page"/>" target="_blank" refer="feature_022207"/>MonoDevelop</a> (if you are a Linux fan), or you can also download the freely available <a href="<tc-webtag:linkTracking link="http://msdn.microsoft.com/vstudio/express/visualcsharp/"/>" target="_blank" refer="feature_022207"/>Microsoft C# 2005 Express Edition</a>. 
</p>
<p>
<span class="bodySubtitle">4. Getting Started - Practice</span><br>
New to TopCoder? New to Algorithm Competitions? Then it's a good idea to try out some practice problems in the Arena before you tackle your first SRM.

<ol>
	<li>Your first step in the Arena should be to set your default language to "C#" (this is under "Options"/"Setup User Preferences").</li>
<div align="center"><img src="/i/education/022207_3.png" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>

	<li>Next, move on to the practice rooms by clicking "Practice Rooms"/(Your Choice). Currently you can check out the past SRM, Tournaments and TCHS Problems. To get the feel of the competition go to any room you like.</li>
<div align="center"><A href="/i/education/022207_4_lrg.png" target="blank"><img src="/i/education/022207_4.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>

	<li>Once you've moved into one of the practice rooms, click the "select one" drop down box, and choose the "250" question (the easy question from that problem set) to get started. A new window will open up with the details of the problem. This window is divided into different sections like <b>Problem Statement</b>, which describes the problem, <b>Coding Area</b>, where you enter your solution, Competition Time & Status and different options to Save, Clear, Compiler, Test and Submit your code.</li>
<div align="center"><A href="/i/education/022207_5_lrg.png" target="blank"><img src="/i/education/022207_5.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>
	<li>The Problem Statement section describes the problem in terms of Statement, Definition, Constraints and Example Test Cases. <b>Statement</b> basically describes the problem to be solved; <b>Definition</b> shows the Class Name and Method Signature that are required for submission, <b>Constraints</b> explains the input format and limits and <b>Examples</b> show some test cases you should run against your code before submission.</li>
</ol>
</p>
<p>
<span class="bodySubtitle">5. Working Toward Your Submission - Development</span><br>
You have registered, opened up your IDE, launched the arena and selected the practice room & problem -- now we are getting down to business. As you work on your submission, you can code the problem directly in the Coding Area, just like Notepad, but it becomes increasingly difficult to write code directly without a proper IDE as problems become more difficult and you need to debug your problem more often.  I probably spend 90% of my C# programming time using Visual Studio.Net and then copying the finished code back to the coding window. As you become more comfortable, you may also want to investigate some of the many <a href="/tc?module=Static&d1=applet&d2=plugins">Arena Plugins</a> available that will automate the use of an external IDE during development, generate stub and test code, or make the code window more feature rich.
</p>
<p>
Based on the definition in our practice problem's problem statement, we can build "stub code" that will look like this
</p>

<pre class="code">
public class Fractile
{
    public int fractile(int[] x, int p)
    {
        // Code Here
        return 0;
    }
}
</pre>

<p>
Note that your class name, method name, and parameter types must all match the <b>problem definition</b>. You can name the parameter names whatever you want, but it is convenient to just copy and paste the entire <b>Method Signature</b>.
</p>
<p>
When using Visual Studio.Net for development (C# Console Project), your "stub code" will look like this
</p>

<pre class="code">
using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace TopCoder
{
    public class Fractile
    {
        public int fractile(int[] x, int p)
        {
            // Code Here
            return 0;
        }

        static void Main(string[] args)
        {
            // Fractile Class Object
            Fractile objFractile = new Fractile();

            // Input
            int[] x ={ -3, -5, 2, 1 };

            // Calls the method and output the result
            Console.WriteLine(objFractile.fractile(x, 50));
        }        
    }
}
</pre>

<p>
C# is a case-sensitive programming language, therefore Main() and main() are two different methods. The entry point for a C# program must be called <b>Main()</b>. The <b>Using</b> statement helps us to play around with the Framework Class Library, which provides useful functionalities. By default Visual Studio uses the following namespaces:
</p>
<pre class="code">
using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
</pre>
<p>
It's worth exploring the namespaces that will help you during the competitions.  Some of the cool functions that are provided include:
<ul>
	<li><b>System.Math</b> - provide useful things like Abs, BigMul, Ceiling, DivRem, Exp, Floor, Min, Max, Pow, Log, Round, Truncate and many more.</li>
	<li><b>System.DateTime</b> - provides useful functions for date processing.</li>
	<li><b>System.TimeSpan</b> - provides useful functions for time processing.</li>
	<li><b>System.Convert</b> - Really helpful for Typecasting </li>
	<li><b>System.Collections</b> - provides LinkList, Queues, Stack, List, ArrayList, Dictionary and many more</li>
	<li><b>System.Text</b> - provides really good regular expression class for pattern matching & input validation and also the StringBuilder class for string manipulation.</li>
</ul>
</p>
<p>
<b>Working with Data Types</b><br>
The following tables shows some of the basic data types that are used during algorithm competitions. 
</p>
<p>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
        <tr class="sidebarTitle" nowrap="nowrap">
            <td>C# Primitive</td>
            <td>C# Alias</td>
            <td>Description</td>
        </tr>
        <tr class="GAtableText">
            <td>Boolean</td>
            <td>bool</td>
            <td>Indicates a true or false value.</td>
        </tr>
        <tr class="GAtableText">
            <td>Char</td>
            <td>char</td>
            <td>16-bit Unicode character.</td>
        </tr>
        <tr class="GAtableText">
            <td>Decimal</td>
            <td>decimal</td>
            <td>High-precession numerical type.</td>
        </tr>
        <tr class="GAtableText">
            <td>Double</td>
            <td>double</td>
            <td>Double precession floating point value.</td>
        </tr>
        <tr class="GAtableText">
            <td>Single</td>
            <td>float</td>
            <td>Single precession floating point value.</td>
        </tr>
        <tr class="GAtableText">
            <td>Int32</td>
            <td>Int</td>
            <td>32-bit signed value.</td>
        </tr>
        <tr class="GAtableText">
            <td>Int64</td>
            <td>long</td>
            <td>64-bit signed value.</td>
        </tr>
        <tr class="GAtableText">
            <td>String</td>
            <td>string</td>
            <td>Immutable string of character values</td>
        </tr>
</table>
</p>
<p>
During the competition, you will also face problem statements dealing with arrays of the above mentioned data types like the <b>Fractile Class</b> where <b>X</b> is a one dimensional integer array. One important thing here is that all the arrays in C# are 0 based, so if you want to access the first element of <b>X</b> you will write it as <b>X[0]</b>.
</p>

<pre class="code">
// A two dimensional array of Int's
int[,] intArray = new int[10,10];

// A one dimensional array of references to Strings 
string[] stringArray = new string[10];
</pre>

<p>
<b>Parsing Your Input</b><br>
This is one of the things you'll face more often than not during competitions: the input is provided as a string or string[], where the string contains several text fragments separated with delimiters. Suppose that you get a input something like this <b>"Karachi 21 Hyderabad 221 Lahore 41 Islamabad 51"</b>, here the input contains the data in the following format <b>CityName CityCode</b>, so you have to parse through the string to get the required information. One of the handy functions in C# is to <b>Split()</b> the string. If your input is in a format like this "12:13:14", then you can also use <b>Split(':')</b>.
</p>

<pre class="code">
public static int GetCode(string CityNameAndCode, string CityName)
{
      int Length=CityNameAndCode.Split().Length;

      // Iterate through the City Names and then return the City Code
      for (int i = 0; i < Length; i += 2)
      {
          if (CityNameAndCode.Split()[i] == CityName)
                return Convert.ToInt32(CityNameAndCode.Split()[i + 1]);
      }

       // If City is not found return -1
       return -1;
}
</pre>

<p>
<b>Formatting Your Output</b><br>
Some of the SRM problems require you to format the output as well, such as the <a href="/stat?c=problem_statement&pm=1313&rd=4550">FormatAmt</a> (SRM 149, Div2 Easy) problem, in which you must output the number with dollar sign, commas and zeroes up to 2 decimal places. By using the standard numeric format specifiers, though, you can get the desired output format within no time and have a quick submission. Check out the list of all the standard numeric format specifiers <a href="<tc-webtag:linkTracking link="http://msdn2.microsoft.com/en-us/library/dwhawy9k.aspx"/>" target="_blank" refer="feature_022207"/>here</a>.
</p>

<pre class="code">
public class FormatAmt
{
    public string amount(int dollars, int cents)
    {
        double d = dollars;
        d += ((double)cents) / 100;
        return d.ToString("C");
    }
}
</pre>
<p>
<span class="bodySubtitle">6. Compile, Test and Submit</span><br>
So, you have coded the problem and are ready to make your submission. You should copy and paste the code from Visual Studio (or the IDE of your choice) to the <b>Coding Area</b>, remove the Main Function and the namespace before submitting, and compile the code -- after a successful compilation, test the code against the provided test cases. After running a test case, a window will pop up to show the test case result, including the time taken by the code and the program output. You can change the input argument and provide the custom values on which you want to test your code. One important thing here is to check your code with the boundary cases, since the TopCoder system only allows <b>2 seconds</b> for code execution. If the code passes all the test cases then submit the solution.
</p>
<div align="center"><img src="/i/education/022207_6.png" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<p>
During practice sessions, you can run the <b>System Test</b> by clicking <b>Practice Option -&lt; Run System Test</b>, which will verify your code against different test cases. A new window will open up showing different test case results, including the expected value, the received value and the time taken by the problem.
</p>
<div align="center"><A href="/i/education/022207_7_lrg.png" target="blank"><img src="/i/education/022207_7.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>
<p>
<span class="bodySubtitle">Further Reading</span><br>
This article only covered a few things regarding C#.NET, but hopefully it will help you get started. You may also want to check out the article "<a href="/tc?module=Static&d1=features&d2=010407">Beginning Algorithm Competitions with VB.NET</a>," which covers many of the commonalities between C# and Visual Basic. Keep on practicing, and you'll have the basics down in no time. Good luck!
</p>
<p><br></p>


        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
