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
    <tc-webtag:forumLink forumID="506264" message="Discuss this article" />
</div>

<span class="bigTitle">Five things you didn't know about C++, Part 3</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="251074" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

        <span class="bodySubtitle">Introduction</span>
        <p>The previous two articles in this series discussed a number
        of features of C++ which are not well known, but are
        nevertheless useful for some tasks. By popular demand, I'm
        concluding with a list of another five features, this time
        featuring ones that you're almost certain never to use in your code. Amaze
        your friends, confuse your teachers, enter the <a href="<tc-webtag:linkTracking link="http://www.ioccc.org/"/>" target="_blank" refer="feature021907"/>IOCCC</a> 
        and ask yourself how on Earth these features ended up in the standard.</p>

        <span class="bodySubtitle">Returning void</span>
        <!-- {{{ -->
        <p>I'll start with the one feature on this list that is used
        in practice, although very rarely. In a
        void function, the return statement can usually only be used
        without an argument. However, it is legal to return an
        expression of void type, for example
        </p>
        
        <pre class="code">return (void) (a + b);</pre>
        
        <p>This seems quite useless, since any expression could just
        as easily be written on a previous line (or eliminated,
        provided it has no side effects), and in fact the above
        statement is illegal in C.</p>
        
        <p>The reason that this syntax was introduced in C++ is to
        facilitate template-based function wrappers, which are used by
        the STL. In the <a href="/tc?module=Static&d1=features&d2=012607">first
        article</a>, I referred to <tt>mem_fun</tt>, which wraps a
        pointer to member function as a function object.  An
        abbreviated version of this might look like this:</p>
        
<pre class="code">
template&lt;typename Result, typename X&gt;
struct wrapper
{
    Result (X::*ptmf)();
    Result operator()(X *x) { return (x-&gt;*ptmf)(); }
};
</pre>
        <p>Without this feature, it would be necessary to specialize
        this class for a void return type.</p>
        <!-- }}} -->

        <span class="bodySubtitle">Trigraphs</span>
        <!-- {{{ -->
        <p>See if you can guess what the following program will
        produce, if compiled with a C++98 conforming compiler (you
        can use GCC with the <kbd>-std=c++98</kbd> switch).</p>
        
<pre class="code">
#include &lt;iostream&gt;
int main()
{
    std::cout &lt;&lt; "`What the heck??' he cried.\n";
}
</pre>
        <p>In fact, it prints out</p>
        <blockquote>
            <p><tt>`What the heck^ he cried.</tt></p>
        </blockquote>
        <p>The reason is that C and C++ specify 9
        <dfn>trigraphs</dfn>: sequences of 3 characters (the first
        two being question marks) that are substituted by certain
        other characters in the first phase of lexical analysis. The
        replacement characters all appear on any keyboard, so this is
        generally considered to be one of the most useless features of
        C. In fact, GCC doesn't even process them by default, which is
        why you have to give it the <kbd>-std</kbd> flag.</p>
        <!-- }}} -->

        <span class="bodySubtitle"><tt>auto</tt> variables</span>
        <!-- {{{ -->
        <p>The award for the most useless keyword goes to
        <tt>auto</tt>. If you've read about the upcoming version
        of C++, you'll know that it is being assigned a new meaning,
        which makes it possible to write code like</p>
        
<pre class="code">for (auto i = container.begin(); i !=  container.end(); i++)</pre>
        
        <p>and have the compiler figure out the correct type for
        <tt>i</tt>. However, the keyword already exists in C++
        today (the language designers like to recycle keywords in
        order to minimize the chance of a new keyword conflicting with
        identifiers in old code). It can be applied to a local
        variable to indicate that it has automatic storage duration
        &mdash; which is the default, so it has no actual effect.</p>

        <p>The C++ standard suggests that it may be used to
        disambiguate statements that could be either expressions or
        declarations (for example, <tt>A (*a)()</tt> is either a
        declaration of a function pointer <tt>a</tt>, or a
        typecast of <tt>*a</tt> to type <tt>A</tt> followed by
        a function call on the resulting object). However, the
        standard also requires that such ambiguous statements are
        always treated as declarations, so once again the keyword has
        no effect.</p>
        <!-- }}} -->

        <span class="bodySubtitle">Conversion constructors and explicit typecasts</span>
        <!-- {{{ -->
        <p>In C++, one can define ways to convert objects to new
        classes that you define, simply by writing a constructor that
        accepts an object of the old type. Of course, not every
        single-argument constructor is intended for this purpose, so
        the <tt>explicit</tt> keyword is available to indicate
        constructors that should not be used for implicit conversions.
        An example  is the <tt>vector&lt;T&gt;</tt> constructor
        that takes an integer argument: it certainly doesn't make
        sense to allow an integer to be passed to a function that
        expects a vector and have an automatic conversion take
        place, and if you try it you will get an error.</p>

        <p>However, a quirk in the standard means that
        <em>explicit</em> typecasts will still be handled with such
        constructors. In other words, the expression</p>
        
        <pre class="code">(vector&lt;int&gt;) 3</pre>
        <p>is legal and will construct a temporary
        <tt>vector&lt;int&gt;</tt> with 3 elements.</p>
        <!-- }}} -->

        <span class="bodySubtitle">Array subscripting order</span>
        <!-- {{{ -->
        <p>I believe this one is fairly quite well known to old-school
        C programmers, but it carries over to C++. Unless the operator
        is overloaded, the expression <tt>a[b]</tt> is defined to
        be equivalent to <tt>*(a + b)</tt>, and one of
        <tt>a</tt> and <tt>b</tt> must be integral and the
        other must be a pointer. Look at that definition again and
        look for an asymmetry: there is none!  That means that
        <tt>2[a]</tt> and <tt>a[2]</tt> are exactly the same,
        although one would have to question the coding style of
        anyone who used the former.</p>

        <p>Operator overloading actually makes this (in theory)
        fractionally more useful in C++ than in C. If <tt>a</tt>
        has an overloaded <tt>operator[]</tt>
        as well as an implicit conversion to a pointer type, then
        <tt>a[2]</tt> will use <tt>operator[]</tt> while
        <tt>2[a]</tt> will first convert <tt>a</tt> to a
        pointer before doing normal subscripting. I very much doubt
        that this is useful in practice, though.</p>
        <!-- }}} -->
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
