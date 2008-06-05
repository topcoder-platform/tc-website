<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.codeBox
{
   width: 600;
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
    <tc-webtag:forumLink forumID="506222" message="Discuss this article" />
</div>

<span class="bigTitle">Beginning Algorithm Competitions with VB.NET</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/jmzero_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15498334" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">


<span class="subtitle">Introduction</span><br>
Visual Basic, or VB, has been around since 1991.  It is a simple language to work with and is common in business both as a standalone development language and as a scripting language for use with Microsoft applications.  With the advent of VB.NET in 2002, VB has matured into a solid language with good support for object-oriented programming and a solid, somewhat portable framework/API in the form of the CLR and .NET in general.
<br><br>
While it is not the most common language for competitors at TopCoder, VB.NET is a capable language for algorithm development.  Performance, flexibility, and available APIs are all "up to snuff", and competitors such as HiltonLange have demonstrated that VB.NET is capable of turning in winning performances. That said, you should be prepared for some quirks in the language. Hopefully this article will steer you clear of some of these pitfalls and give you a head start in doing TopCoder algorithm competitions with VB.NET.
<br><br>
<span class="subtitle">Getting Started</span><br>
Your first step is to become familiar with VB.net.  If you're currently using VB6, or if you're just getting started with VB, you'll likely want to get a VB.net compiler/IDE to experiment with.  If you're using Windows, you can get a simple IDE free from Microsoft: <a  href="<tc-webtag:linkTracking link="http://msdn.microsoft.com/vstudio/express/vb/"/>" refer="feature_010407"/>Microsoft VB 2005 Express Edition</a>.  It's reasonably streamlined, has a good edit-and-continue debugger, syntax highlighting, Intellisense, and other features that will help you learn.  Microsoft provides a bunch of tutorials and documentation that should prove worthwhile as well.
<br><br>
If you are new to TopCoder in general, it's a good idea to try out some practice problems in the Arena before your first competition.  Your first step in the Arena should be to set your default language to "VB" (this is under "Options"/"Setup User Preferences").  Where you go from there is up to you, but I recommend starting off with some problems from TopCoder High School competitions.  You can find these by clicking on "Practice Rooms"/"TCHS" - and then picking one of the available problem sets from past competitions.  There's some good, fun problems there that will get you used to the basic format you'll need to follow to get a piece of code to compile, run, and return an answer in the TopCoder environment.  Once you've moved to one of the practice rooms, click the "select one" drop down box, and choose the "250" question (the easy question from that problem set) to get started.
<br><br>
You'll be presented with a problem statement and a coding window where you'll enter your solution.  The problem statement should be fairly self-explanatory, detailing the problem you'll need to solve, the type of input you'll get, and the type of output expected.  The key section for starting off is the "Definition" section, which specifies the basic form your code will need to take.  It might look something like this:

<pre class="codeBox">
Class: NumberMuliplier
Method: howMany
Parameters: Integer, Integer
Returns: Integer
Method signature: Public Function getProduct(x As Integer, y As Integer) As Integer
</pre>

From that definition, we can build the "stub code" from which you'll develop your solution:

<pre class="codeBox">
Public Class NumberMultiplier

  Public Function getProduct(x As Integer, y As Integer) As Integer
	
	'Begin actual code...
	return x * y
	'End actual code.

  End Function

End Class
</pre>

Note that your class name, method name, and parameter types must all match the problem definition exactly.  The parameter names don't have to match, so you're welcome to call your parameters whatever you want - but it's convenient to just copy and paste the entire "method signature" from the definition right into your code window.  Also note that all your code doesn't have to go in one class.  You can define other helper classes outside the required one, and you'll also likely use "imports" command (which goes above your defined classes) to reference other standard objects and methods.
<br><br>

<span class="subtitle">Debugging</span><br>
The regular code window is a capable text editor and provides functionality to compile and test your code against different inputs.  In many cases, though, you'll need to do some debugging to figure out why your program isn't doing what you want.  To add some debugging output, use code like this:

<pre>System.Console.Write("x=" & x)</pre>

When you run your tests, whatever you output using the above command will show up in the "program output" section.  Remember to remove these statements before submitting your solution, as you don't want to slow down your code during the testing phase.
<br><br>
As you face more difficult challenges, you may find that you want to work on the problem with a true debugger/IDE.  You are welcome to develop your code in something like VB.net Express or Visual Studio 2005 and then copy the finished code back to the coding window.  As you become more comfortable, you may also want to investigate some of the many "Arena Plugins" available that will automate the use of an external IDE during development, generate stub and test code, or make the code window more feature rich.
<br><br>
<span class="subtitle">Working With Data Types</span><br>
Your input and output will usually be just the basic types: "integer" (32 bit signed integer), "long" (64 bit signed integer), "double" (for non-integer numbers) and "string".  You'll also process one-dimensional arrays of any of the above types.  When a more complex input or output is required, it will often be given to you as an array of strings.  For example, a 3 by 3 array of integers might be specified as "1 2 3","4 5 6","7 8 9".  Figuring out how to deal with this kind of input can take precious time during competition, so it is worthwhile to have some string manipulation functions ready to deal with inputs in this kind of format.  For example, we might process the 3 by 3 grid in the following manner:

<pre class="codeBox">
public sub processGrid(grid() as String)

	dim x, y as integer
	dim myGrid(2,2) as integer
	dim temp() as string

	for y = 0 to 2
		temp=split(grid(y)," ")
		for x = 0 to 2
			myGrid(x,y) = val(temp(x))
		next
	next

end sub
</pre>

We now have the information from "grid" in a more convenient 2 dimensional array of integers.  Remember to check the problem constraints to ensure that your program can handle all valid inputs.  You don't have to worry about inputs that don't meet the problem constraints - as these will be filtered out before your solution is called.
<br><br>
Also, remember that in VB.net, arrays start with zero and are declared by specifying the highest element in the array (not the length!).  Thus to declare an array with 3 elements, we do "dim thing(2) as type", and when processing an array you should process up to thing.length - 1. This is especially important to note when you are returning an array, as it must be exactly the correct size.  For example, if you are returning 3 elements, your code might look like this:

<pre class="codeBox">
	dim myReturn(2) as integer
	'put some values in myReturn
	return myReturn</pre>

This is especially easy to mess up when dealing with cases when you are returning zero elements, as your code should then look like this:

<pre class="codeBox">	dim myReturn(-1) as integer
	'myReturn has no elements, but we MUST return it anyway - never return nothing!
	return myReturn</pre>

If you are coming from a VB6 background, you are welcome to continue using the old return syntax of "functionName=returnValue" - but you will find the "return returnValue" syntax is often faster to type and can increase your code's readability.
<br><br>
<span class="subtitle">Helpful Objects/Methods</span><br>
There are many objects and methods available in .NET that are either helpful or absolutely essential for TopCoder success.  You will want to "import" many of these items in order to use them in your TopCoder code (even though many items are "pre-imported" in the Microsoft IDEs, you'll need to specifically import them to use them in TopCoder).  Here are some of the more common items to import: 

<pre class="codeBox">  imports System
  imports Microsoft.VisualBasic
  imports System.Collections
  imports System.Text</pre>

There's a lot of good stuff there, and I recommend you spend some time experimenting with the methods under System.Math (which includes things like sqrt, min, max, floor, log, and trigonometric functions) and Microsoft.VisualBasic (which has functions for string manipulation, date processing, and other handy stuff).  You'll also want to check out the "regular expressions" support under System.Text.
<br><br>
Under System.Collections there's a variety of objects you'll find useful in different situations.  A good object to start off with here is the ArrayList, which is an array object that can be used for any type.  It's convenient because it dynamically resizes itself as you add or remove items, and it provides a simple way to sort as well.  The .sort() method takes a number of different forms with varying options - and there's a lot of problems that will be easier to solve if you get a handle on all of the ways .sort() can be used.
<br><br>
One caveat with .sort() is that it defaults to sorting objects in a way that is not correct for many TopCoder problems.  In TopCoder, sorting of strings is usually done in ASCII order, which produces orderings like "A","B","a","b".  The default .sort() method works in case-invariant order, producing orderings like "a","A","b","B".  To work around this, you can either sort the elements manually or you can write your own comparer object (which is a handy thing to know how to do anyways).  A comparer object might look like this:

<pre class="codeBox">  Public Class myComparer : Implements IComparer
    Public Function Compare(ByVal x As Object, ByVal y As Object) As Integer
    Implements System.Collections.IComparer.Compare
      If x < y Then Return -1
      If x > y Then Return 1
      Return 0
    End Function
  End Class
</pre>

To use your comparer object to sort some strings, you'd do something like this:

<pre class="codeBox">  dim al as new ArrayList, comp as new myComparer
  al.add("A")
  al.add("B")
  al.add("a")
  al.sort(al,comp)</pre>

Now you probably don't want to write all of that every time you want to sort some strings, but thankfully you don't need to.  During TopCoder algorithm competitions, you are allowed to use code that you have written previously.  In practicing, you'll find that there are some basic things you do a lot - and it's worthwhile to start building a library of little snippets that you can paste in as necessary.  Be careful to make sure that the snippets truly are your own, though, as you are not allowed to paste in someone else's code.
<br><br>
<span class="subtitle">Operators</span><br>
There are a number of new operators in VB.net, and some that may work differently than you might expect.  Here are some things to keep in mind:

<ul>
<li>Avoid using the "+" operator for string appends. Use "&" instead in order to avoid accidentally adding instead of appending.  "5" + 4 = 9.  "5" & 4 = 54.</li>
<li>Avoid using "/" when dividing integers and taking an integer result (for example, when you know the number is evenly divisible).  The "/" operator will convert all of the values involved into doubles.  Not only is that slower, but you may lose precision when working with longs (and thus get a wrong result).  Use the "\" operator instead; it does integer based division.  Similarly, avoid using "\" when doing operations with doubles - unless you want 5\2 to equal 2 instead of 2.5.</li>
<li>Use the new bit shift operators "<<" and ">>" where appropriate to speed up multiplications, exponents and divisions with powers of 2.  Instead of "2^5", use "1<<5".</li>
<li>Be careful when using "and" and "or" as bitwise operators, especially around "=" signs.  For example, "5 and 4 = 4" evaluates to "5" - and that can be a tricky bug to track down.  What you probably wanted to say was "(5 and 4) = 4", which evaluates to "true".  The safest practice is to add brackets until there's no chance of ambiguity.</li>
<li>The "mod" operator returns the remainder of a division.  For example, 27 mod 10 = 7.</li>
<li>The "andalso" and "orelse" logical operators work just like "and" and "or", except that they "short circuit".  This speeds up execution, and makes certain expressions cleaner.  For example, consider the code "if myArray.length=0 or myArray(0)=1 then ...".  That's not going to work, as if the array has no elements it will error out when it tries to evaluate myArray(0).  With the "orelse" operator, the second part of the expression isn't checked at all if the array is zero length - saving you an error.</li>
<li>Instead of writing "i=i-1", you can use the shortcut "i-=1".  There are a bunch of similar "assignment operators" ("*=", "\=", "&gt;&gt;=", etc..), each of which serves as a shortcut for the respective regular operator.  </li>
<li>The "iif" function is similar to the "?:" operator in C.  It takes 3 parameters: a condition, a value "if true" and a value "if false" - and it can be a lot quicker to write than a full "if/else" statement.  For example, instead of writing

<pre class="codeBox">if a=b then
  myCompareString="Same"
else
  myCompareString="Different"
end if
</pre>

Try writing:

<pre class="codeBox">myCompareString = iif(a = b, "Same", "Different")</pre>
</li>
</ul>

<span class="subtitle">Further Reading</span><br>
This article has only covered a few of the items particular to competing with VB.net.  There is a wealth of educational content at TopCoder, and most of it is "language neutral".  Between the tutorials, forums, and looking over past problem submissions, there is plenty of material to assimilate - and you will get better quickly as you compete regularly.
<br><br>
Good luck, and drop me a message if you have any questions or ideas related to TopCoding with VB.
<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
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
