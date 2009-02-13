<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>       
        <TITLE>TopCoder :: Features</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->    		
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">features</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Functional Programming</B></FONT><BR/>
<!-- <I>A Complete Breakdown of the 2002 Invitational Championship Round</I><BR/><BR/> -->
Wednesday, January 8, 2003<BR/>
By&#160;radeye,<I>TopCoder Member</I><BR/>
</P>

<P>
During the next TopCoder competition, look at the code of some of the top reds and yellows. 
You'll often see a complex algorithm expressed with a few recursive subroutines, and few, 
if any, assignment statements. These solutions are usually much simpler to understand and 
to read than other solutions filled with loops and assignment statements. This is what 
functional programming is all about. 
</P>

<P>
About 80% of the code written in a TopCoder competition consists of assignment statements. 
Yet, every single TopCoder problem can be solved without a single assignment statement. 
Why would we want to do something like that? 
</P>

<P>
Consider the ubiquitous gcd function. A typical non-functional implementation might look like: 
</P>

<PRE>
int gcd(int a, int b) {
   while (b != 0) {
      int t = a % b ;
      a = b ;
      b = t ;
   }
   return a ;
}
</PRE>
Short and sweet, but even simpler is the functional style: 

<PRE>
int gcd(int a, int b) {
   if (b == 0)
      return a ;
   else
      return gcd(b, a % b) ;
}
</PRE>

<P>
Notice how much simpler it is; you can reason about it easily. On input, assume a and b are nonnegative integers. If b is 0, then the answer is simply a, whether a is zero or not. If b is not zero, we are asserting that 
</P>

<PRE>gcd(a, b) = gcd(b, a % b)</PRE>

<P>
which is true whenever b is not zero. We also need to prove termination, which is straightforward. But the point is, the expression of the algorithm is very close to a mathematical equation, which makes reading, writing, and reasoning much simpler. Each variable gets precisely one value from the evaluation of a single expression. The order the expressions are evaluated in is no longer relevant. It is no longer necessary to say "after statement 12, the following condition amongst these variables holds"; rather, all conditions hold at all times since all live variables contain their evaluated value. 
</P>

<P>
Assignment statements are the canonical "side effect": statements whose purpose is more than just returning a simple value. A side effect alters the universe in some way; it changes some variable, changes an array element, or does input or output. These changes can have a profound impact on what we have already proved; they can make untrue what was true before. For instance, if I know that the value held by variable a is relatively prime to that held by b, and then I invoke some function that, perhaps in some deeply nested call performs an assignment to b, unless I understand everything about those functions and that call chain, I can no longer assume that a is relatively prime to b. Essentially, with functional programming, variables can contain only a single value, rather than a bunch of different values over time. Side effects are evil, and functional programming is programming without side effects. 
</P>

<P>
So much for theory, which is good as far as it goes. If functional programming is programming without side effects, we can do functional programming in any language that allows functions. But to be effective, a functional programming language must allow you to express and combine your functions concisely and generally, and this is typically what sets functional programming languages apart from more conventional languages. 
</P>

<P>
Consider binary search over a discrete range. We have some monotonically increasing function f(), and we want to find the lowest value of x within a range [a..b] such that f(x) is nonnegative. For simplicity we assume the range is nonnegative, and we return -1 if no value in the range is nonnegative. In Java this is simply 
</P>

<PRE>
int binsearch(int a, int b) {
   if (a == b)
      if (f(a) &lt; 0)
         return -1 ;
      else
         return a ;
   int mid = (a + b) / 2 ;
   if (f(mid) &lt; 0)
      return binsearch(mid+1, b) ;
   else
      return binsearch(a, mid) ;
}
</PRE>

<P>
This code is simple and functional (the "assignment" to mid in the middle isn't really an assignment. It's a binding of a value to a new variable; the variable does not contain a value before the assignment, so it's not really a side effect). But what is f()? How can we make this function generic so we can add it to our library of TopCoder functions? In Java we can, but it's really painful; we need to introduce a new type: 
</P>

<PRE>interface intint { int f(int a) ; }</PRE>

and use that type in the declaration of binsearch: 


<PRE>int binsearch(int a, int b, intint f) ...</PRE>

and in the invocation, we need to build a new anonymous class and object that implements intint: 


<PRE>binsearch(1, 100, new intint() { public int f(int a) { return a * a - 12 ; } }) ;</PRE>

Yuck! Compare this to Scheme, a very simple functional programming language: 

<PRE>
(define (binsearch a b f)
   (if (= a b)
      (if (&lt; (f a) 0) -1 a)
      (let ((mid (quotient (+ a b) 2)))
         (if (&lt; (f mid) 0)
            (binsearch (+ mid 1) b f)
            (binsearch a mid f)))))
(binsearch 1 100 (lambda (a) (- (* a a) 12)))
</PRE>

<P>
The new thing here is the lambda expression. Lambda is used to define an "anonymous function", which is just a function with no name, typically passed as an argument to another function or returned as a value. The above invocation line is for all practical purposes the same as 
</P>

<PRE>
(define (f a) (- (* a a) 12))
(binsearch 1 100 f)
</PRE>

<P>
but it is shorter and simpler, doesn't pollute the namespace with an unnecessary name, and you don't need to worry where else f might be used. 
</P>

<P>
You can define anonymous functions in many other languages; the invocation line for binsearch in Perl would be 
</P>


<PRE>binsearch(1, 100, sub { my $a = shift ; $a * $a - 12 }) ;</PRE>

and in OCaml (a variant of ML) would be 


<PRE>binsearch(1, 100, fun a -&gt; a * a - 12)</PRE>

In JavaScript, it is simply 


<PRE>binsearch(1, 100, function(a) { return a * a - 12 }) ;</PRE>

<P>
What makes this really work though is the type systems used by functional programming languages. Java and C++ are strongly and statically typed. Every variable and function has a declared type (although with templates that type may be a parameter of the template). This is safe, but verbose and restrictive. 
</P>

<P>
In Scheme and most other Lisps (the original functional programming languages), as well as JavaScript and to a certain extent Perl, types are dynamic. The value holds the type, not the variable, and all types are checked at runtime. So you can say 
</P>


<PRE>(define (plus a b) (+ a b))</PRE>

and this compiles, but if you then try 


<PRE>(plus "33" "44")</PRE>

<P>
you get a runtime error of a type mismatch. (In Common Lisp you can declare your types or not.) In OCaml and some other functional languages, strong typing is provided by a type inference system. You almost never need to mention types. If you define the above function in OCaml: 
</P>



<PRE>let plus a b = a + b ;;</PRE>

(yes, that is a function definition) it infers from the use of the + operator, which only works on ints, that the arguments are also required to be ints. Elimination of all of the type declarations not only makes your code more concise, but also makes it more general, since the types need not be fully instantiated. For instance, I only need to write once 


<PRE>let rec median a b c =
   if a &gt; b then median b a c else
      if b &gt; c then median a c b else b ;;</PRE>

<P>
and this automatically applies to all types (even lists of arrays of reals). 
</P>

<P>
In addition, most functional languages have built-in collections of various sorts and functions to iterate over them naturally. So to return a new list consisting of all elements of the original list, but doubled, one might write (in Common Lisp): 
</P>


<PRE>(map (lambda (a) (+ a a)) lst)</PRE>

In Perl it's even simpler: 


<PRE>map { $_ + $_ } @lst ;</PRE>

The map function knows how to iterate through an existing list, building a new list by applying the passed-in function to each element of the old list. To build a new array of array (matrix) of numbers out of an old one, with all elements squared, we can write in OCaml: 


<PRE>Array.map (fun a -&gt;
            Array.map (fun b -&gt; b * b) a)
   mat ;;</PRE>

<P>
Functional programming is a lot of fun; it's a very interesting way to think about problems, 
and frequently the solutions end up being more straightforward and concise than those 
implemented with side effects. But most standard algorithms use side effects extensively. 
Sorting algorithms use mutations on arrays; graph algorithms work by marking nodes in the 
graph. These are all side effects and therefore forbidden in strict functional programming. 
</P>

<P>
There are two easy solutions. The first one is to just not use mutation, but rather always 
return a suitably modified copy of the data structure. For instance, arrays can be "simulated" 
in a functional programming language, with no side effects, with about a log n slowdown 
(just use a binary tree and replace the nodes from the "modified" leaf to root). Or, many 
algorithms have variations or replacements that maintain the original runtime but without side effects. 
</P>

<P>
The second alternative is to go ahead and use side effects, but in a limited fashion. Almost 
all functional programming languages do include assignments, arrays, records, and all the usual 
slot/value programming tools, because sometimes they are the correct tools. And by providing the 
full power of concise and natural function definitions, the resulting language is tremendously powerful. 
</P>

<P>
Functional languages usually provide many other nice features, such as garbage collection, both 
interpreted and compiled execution, lexical scoping even for anonymous functions returned as 
values, and built-in aggregates (like lists and tuples); we have only touched on the highlights. 
Functional programming languages are worth knowing, even if only to help you write better Java and C++.
</P>


<P><BR/></P>

<IMG SRC="/i/m/radeye_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;radeye<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=277659" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="/?&amp;t=features&amp;c=feat_topics" CLASS="bodyGeneric">Would you like to write a feature?</A></P>
						</TD></TR>                                                                 
					</TABLE>
		<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

