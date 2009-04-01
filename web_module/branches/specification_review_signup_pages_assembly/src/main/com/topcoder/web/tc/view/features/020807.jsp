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
    <tc-webtag:forumLink forumID="506278" message="Discuss this article" />
</div>

<span class="bigTitle">Beginning TopCoder Competition with C++</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="251074" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<span class="bodySubtitle">Introduction</span><br />
This article is aimed at programmers who are thinking of
using C++ as a programming language for TopCoder algorithm matches
&mdash; either because they are new to TopCoder, or because
they want to switch languages. You should already be familiar
with the basics of C++. I'll look at how C++ is used in the
arena and consider some pros and cons of using C++ as a competition
language.
<br />
<br />
If you haven't used the arena before, start with the
official <a href="/tc?module=Static&d1=help&d2=index">How to compete</a> guide. You may also want to take a look at some
<a href="/tc?module=Static&d1=help&d2=sampleProblems">sample problems</a> to get a feel for the style of the contests. If you sign up and enter the arena,
all the previous contests are available for practice. The default editor is a bit
lacking, so you should also check out the available <a href="tc?module=Static&d1=applet&d2=plugins">plugins</a>;
these include several alternative editors (KawigiEdit is quite
popular), a plugin to let you use your normal desktop editor
(FileEdit), as well as other plugins to help automate
testing.
<br /><br />

<span class="bodySubtitle">Why C++?</span><br />
Every language offers a slightly different set of tools,
and a good knowledge of the available tools can reduce coding
time and lead to more reliable code. C++ is the most
popular language in the arena; let's take a look at what it
has to offer.
<br /><br />

<span class="bodySubtitle">The Standard Template Library</span><br />
The <a href="<tc-webtag:linkTracking link="http://www.sgi.com/tech/stl/"/>" target="_blank" refer="feature020807"/>Standard Template Library</a> (STL) 
is by far the most important set of
tools that a C++ programmer has. While expert competitors will
know the details of most of the classes, there are two that
you need to be familiar with because they may be used to hold
the input or output data: <tt>vector</tt> and
<tt>string</tt>.  Fortunately, they are also the simplest
to use. They both have a <tt>size()</tt> method that
returns the number of elements (or characters), and they can
be indexed like a normal array. You'll need to know a bit more
than that to use them for output, but you can read up on them
at the link above. To see what other TopCoder members have had to say about the STL, 
check out this <a href="/tc?module=Static&d1=features&d2=082803">crash course</a> or this 
<a href="/tc?module=Static&d1=tutorials&d2=standardTemplateLibrary">more in-depth coverage</a>.
<br /><br />
        
A big advantage of the STL over the Java Collections
Framework is that it uses operator overloading to provide
natural syntax for operations. For example, two
<tt>string</tt>s can be lexicographically compared using
the normal comparison operators.
<br /><br />

<span class="bodySubtitle">Macros</span><br />
Macros are one of the dirtier parts of C++, but they also
let you do things that are impossible in other languages.
The most common use in the arena is in code templates that
define short macros for long-winded pieces of syntax. A common
example is:
		
<pre class="code">#define FOR(i, n) for (int i = 0; i &lt; n; i++)</pre>
        
after which one may write <tt>FOR(i, n)</tt>
instead of the full loop specification.
<br /><br />
        
There are a few things to keep in mind when you do this:
<ol>
 <li>In the real world, this is considered very poor
 style. Don't do it outside of programming contests.</li>
 <li>Have a look at other programmers' submissions to get
 some ideas (<tc-webtag:handle coderId="8355516" context="algorithm" />'s template
 shows off the possibilities as well as several 
 <a href="tc?module=Static&d1=features&d2=022006">GCC extensions</a>), but any code you submit in the arena
 has to have been written by you (no copy-and-paste).</li>
 <li>The contest rules limit the amount of unused code
 that you submit, so you need to keep your template to a
 minimum.</li>
</ol>

<span class="bodySubtitle">Speed</span><br />
C++ is generally regarded as the fastest of the
TopCoder-provided languages (for the compilers used
in the arena). This is seldom a major issue, since the
administrators usually do a good job of making sure that
speed differences don't make it easier for C++, but from time
to time it is possible to get away with a less algorithmicly
efficient solution. This occurred in <a href="/stat?c=round_overview&er=5&rd=10658">SRM 334</a>: top-ranked
coder <tc-webtag:handle coderId="10574855" context="algorithm" /> had to re-submit a
problem because his C# solution was too slow, while my
C++ solution using the same algorithm was fast enough.<br /><br />

<span class="bodySubtitle">Popularity</span><br />
Roughly three quarters of TopCoder competitors use C++ in
the arena. While that doesn't necessarily mean that you should
submit in C++, a decent knowledge of C++ (including the
subtle tricks and shortcuts) will help you in the challenge
phase.<br /><br />

<span class="bodySubtitle">Why not C++?</span><br /><br />

<span class="bodySubtitle">Debugging difficulty</span><br />
While modern languages like Java and C# have well-defined
behaviour in most error situations (such as overrunning the
end of an array, or using memory that hasn't been
initialised), C++ programs tend to crash, or, worse, produce
unexpected and variable results. A good debugger or IDE can be
immensely helpful in tracking down such errors and I believe
that all C++ competitors should at least know how to use a
debugger to determine where a program crashed. Nevertheless,
tracking down memory-related bugs can be a difficult and
time-consuming process that isn't necessary with safer
languages.<br /><br />

A related problem is that the heavy use of templates in the
STL means that compiler errors can be almost incomprehensible.
It gets easier with practice, but nevertheless this can
slow you down.<br /><br />

<span class="bodySubtitle">Missing library functionality</span><br />
There are a few things that can be done in other languages
but not in C++. Two notable examples are arbitrarily large
integers (<tt>BigInteger</tt> in Java) and computational
geometry operations (line intersections, etc.). This is less of
a problem in TopCoder than in other contests, since nothing
prevents you from maintaining pre-written libraries and
just pasting them into your code when the need arises (subject
to the rules that you have to have written the library
yourself, of course, and the limit on the amount of unused code).
<br /><br />

<span class="bodySubtitle">Conclusions</span><br />
Ultimately, the particular language you choose will be less
important than how familiar you are with it. If you switch
languages, you should not expect to do better unless you get
to know the new language as well as you know the old one.<br /><br />

For someone who knows all its secrets, C++ submissions will
be both faster to write and faster to execute, but generally
slower to debug. There is a lot more that can be said about
C++ in competitions than I have space for here, so I'd like to
invite the experts to share their wisdom in the forums:
What's your advice on writing reliable code and testing? What's your favorite C++
tutorial? What practice problems would you recommend for a C++ beginner?<br /><br />

        <br /><br />
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
