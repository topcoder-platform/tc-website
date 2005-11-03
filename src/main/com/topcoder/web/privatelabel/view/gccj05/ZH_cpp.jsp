<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
<title>Google China Code Jam 2005, Powered by TopCoder</title>
</head>
<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
   <tr>
      <td width="49%">&#160;</td>
      <td align="center">
         <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
               <td width="49%"></td>
               <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gccj05_logo.gif" alt="Google China Code Jam logo"></td>
               <td width="49%"></td>
            </tr>
         </table>
      </td>
      <td width="49%"></td>
   </tr>
   <tr>
      <td width="49%">&#160;</td>
      <td>
         <div class=greenBigBox>

         <!-- Tab bar links-->
         <div align="center">
         <jsp:include page="ZH_links.jsp" >
         <jsp:param name="selectedTab" value=""/>
         </jsp:include>
         </div>

         <br><br>

         <span class="bigTitle">TopCoder C++ for C Programmers</span>
         <span valign=top>
         <jsp:include page="ZH_right.jsp" />
         </span>

<br><br>
C++ is an object oriented extension to the C programming language.  C++ provides many benefits over traditional C while still maintaining C compatibility, allowing people to use C and C++ program in the same program.  Within a competition, you'll be required to use some basic C++ functionality to sovle problems.  What follows is a basic explanation for programmers who are currently familiar with C.
<br><br>
<span class="greenSubtitle">Classes and Methods</span><br>
The most important new feature in C++ is the addition of classes.  A class is a structure that contains methods as well as variables.  During a competition, you'll need to write one class containing (at least) one method.  For example, take the following problem definition:
<br><br>
Class: CellTower<br>
Method: best<br>
Parameters: vector &lt;string&gt;, int, int<br>
Returns: int<br>
Method signature: int best(vector &lt;string&gt; towers, int x, int y)<br>
<br><br>
To solve the problem you'll need to create a class named <strong>CellTower</strong> containing a method <strong>best</strong> that takes three arguements (<strong>vector&lt;string&gt;</strong>, <strong>int</strong>, and <strong>int</strong>), and returns an <strong>int</strong>.
<br><br>
Classes are defined using the <strong>class</strong> keyword.  The definition follows a similar pattern as the C <strong>struct</strong> keyword.  To define the class above we'd use the following code:
<pre>
class CellTower {
    public:
        int best(vector&lt;string&gt; towers, int x, int y) {
            //your code here
    }
};
</pre>
Note how the method is defined like you would define a standard C function.  The <strong>public</strong> keyword tells the compiler that the method we're defining is accessable to any object, allowing the testing process to properly execute your code.
<br><br>
<span class="greenSubtitle">The STL</span><br>
Many of the classes and functions used in competition come from the Standard Type Library, also known as the STL.  The STL provides a set of common libraries to perform everything from basic string work to complicated sorting algorithms.
<br><br>
To be able to compete, you'll need to be familiar with two classes: <strong>vector</strong> and <strong>string</strong>.
<br><br>
<span class="greenSubtitle">Includes</span><br>
Before you can use any of the STL classes, you'll need to include the appropriate header files.  The <strong>vector</strong> class comes from the header "vector" and the <strong>string</strong> class comes from the header "string".  In addition, you'll need to add the line <pre>using namespace std;</pre> to your code to tell the compiler to look for objects in the std namespace.
<br><br>
<span class="greenSubtitle">Vector</span><br>
A <strong>vector</strong> is the C++ replacement for arrays.  Vectors solve many of the problems of tradidional C arrays by allowing dynamic resizing and providing methods to inspect the current size of the array.  You declare a vector as <strong>vector&lt;type&gt;</strong> where type is the type of variable stored in the array.  To create a vector of <strong>ints</strong>, you'd write <pre>vector&lt;int&gt; myVar;</pre>Newly created <strong>vectors</strong> are of size 0.  To declare a <strong>vector</strong> with a specific size, you can use <pre>vector&lt;int&gt; myVar(10);</pre>In this case the newly created <strong>vector</strong> has a size of 10.
<br><br>
To set / retrieve the elements in a <strong>vector</strong>, you can use the same syntax you'd use to work with a C array.

<pre>
vector&lt;int&gt; myVar(10);

myVar[0] = 1; //sets the first element to 1
printf("%i", myVar[0]); //prints 1
</pre>

One of the major problems with C arrays is that there is no way at runtime to know how large the array is, making looping over the contents of the array difficult.  Using <strong>vectors</strong>, this task becomes simple.  The <strong>size()</strong> method will return the current size of the <strong>vector</strong>.

<pre>
for(int i = 0; i &lt; myVar.size(); i++) {
    printf("%i", myVar[i]); //prints element i
}
</pre>

To resize a <strong>vector</strong>, use the <strong>resize</strong> method.

<pre>
myVar.resize(15); //sets the size of myVar to 15
</pre>

The <strong>vector</strong> class contains many additional useful functions, which you can read more about by following the reference links below.

<br><br>

<span class="greenSubtitle">String</span><br>
The <strong>string</strong> class is designed to replace using the <strong>char*</strong> type to represent text.  <strong>Strings</strong> allow for basic manipulation, and provides the ability to use the string class in functions that require a <strong>char*</strong>.  To assign values to a string, you can use the = and + operators.

<pre>
string s;
s = "Hello";
s = s + ", world";
</pre>
The <strong>string</strong> s is initially created as an empty string (a string of size zero), is assigned the value "Hello", then has ", world" appended to the end of the string.  The <strong>string</strong> s now contains "Hello, world".
<br><br>

The method <strong>size()</strong> will return the length of the <strong>string</strong>.  The code
<pre>
string s = "Hello";
printf("%i", s.size());
</pre>

will output 5.
<br><br>
You can access specific characters in the <strong>string</strong> by using the object as if it were a <strong>char</strong> array.

<pre>
string s = "Hello";
printf("%c", s[0]); //outputs "H"
s[0] = 'h'; //string is now "hello"
</pre>
To use the string in a function that expects a <strong>char*</strong>, use the <strong>c_str()</strong> method.
<pre>
string s = "Hello";
printf("%s", s.c_str()); //outputs "Hello"
</pre>

<span class="greenSubtitle">Example Submission</span><br>
Consider the following sample problem:
<br><br>
Our input program has recorded keyboard input into an array of characters.  We want to convert the input sequence to a single string for further processing.  Make a method <strong>buildString</strong> that takes a <strong>vector&lt;char&gt;</strong> representing the keyboard input and returns a concatenated <strong>string</strong>.
<br><br>
Class: StringBuilder<br>
Method: buildString<br>
Parameters: vector &lt;char&gt;<br>
Returns: string<br>
Method signature: string buildString(vector &lt;char&gt; array)
<br><br>
The following submission would use the <strong>string</strong> and <strong>vector</strong> classes to solve the problem:

<pre>
#include&lt;vector&gt;
#include&lt;string&gt;

using namespace std;

class StringBuilder {
    public:
        string buildString(vector&lt;char&gt; array) {
            //create string for return value
       string s;

       //loop over every element in the array
       for(int i = 0; i &lt; array.size(); i++) {
          s = s + array[i];
       }

       //return the created string
       return s;
    }
};
</pre>

<span class="greenSubtitle">Additional References</span><br>
The C++ and STL libraries contains hundreds of functions and classes designed to increase coding speed and efficiency.  The references below should provide a good overview of other capabilities of the objects discussed, and C++ in general.
<br><br>

C++:<br>
<a href="http://www.cplusplus.com/doc/tutorial/">C++ Tutorial</a><br>
<a href="http://www.4p8.com/eric.brasseur/cppcen.html">C++ Tutorial for C users</a>
<br><br>
Namespaces:<br>
<a href="http://www.cplusplus.com/doc/tutorial/tut5-2.html">Namespace Tutorial</a><br>
<a href="http://www-h.eng.cam.ac.uk/help/tpl/languages/C++/namespaces.html">C++ Namespaces</a>
<br><br>
Vectors:<br>
<a href="http://www.sgi.com/tech/stl/Vector.html">Vector Reference</a><br>
<a href="http://www.cprogramming.com/tutorial/stl/vector.html">The Vector Class</a>
<br><br>
STL:<br>
<a href="http://www.sgi.com/tech/stl/">STL Programmer's Guide</a><br>
<a href="http://www.topcoder.com/index?t=features&c=feat_082803">A Crash Course in the C++ Standard Template Library</a>

         <br><br>
         To find out more detailed information about the Google China Code Jam 2005, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">Terms and Conditions</a>.
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="ZH_foot.jsp" />
</body>
</html>