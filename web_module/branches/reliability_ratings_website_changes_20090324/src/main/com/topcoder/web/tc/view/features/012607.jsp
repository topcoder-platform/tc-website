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
   width: 550;
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

<span class="bigTitle">Five Things You Didn't Know About C++</span>
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
 
 I've been using C++ for many years, but it is such an
 incredibly rich and complex language that I still learn new
     things about it from time to time. In this article, I  would like to point out five of the more surprising features that
        I've discovered, both for the &ldquo;Wow, I had no
        idea!&rdquo; factor as well as because some of them have
        proven useful to me.
        <br /><br />
		
 <span class="bodySubtitle">Case label placement</span><br />
 Did you know that a <tt>case</tt> label doesn't have to
        appear immediately inside a <tt>switch</tt> statement? It
        can appear at a deeper level, such as inside a loop that
        appears inside the switch statement. That means that it is
        possible to jump into the middle of a <tt>for</tt> loop!
        This kind of unstructured flow control is normally considered
        poor style, but there are some cases where it has advantages.
        The original and most famous use is <a href="<tc-webtag:linkTracking link="http://en.wikipedia.org/wiki/Duff%27s_device"/>" refer="feature 012607" target="_blank"/>Duff's Device</a>, 
        a method of handling the remainder when doing
        loop unrolling. It has also been used to implement
        state-machine-like functions that restart from where they
        left off (by putting a case label immediately after each
        return statement, and saving the index just before
        returning). I used this in the beta Marathon Match
        (<a href="http://www.topcoder.com/longcontest/?module=ViewProblemStatement&amp;compid=5503&amp;rd=9874">CostlySorting</a>),
        in which your function provides
        queries to the system in its return value, with replies being
        passed to the <em>next</em> iteration of the function. There
        are, however, some serious limitations to the technique:
        non-static local variables get clobbered by the restart,
        extra work is required to make the function re-entrant, and
        you cannot return from an inner case statement.
        <br /><br />

        <span class="bodySubtitle">Macro recursion</span><br />
Technically this one is more a feature of the C
        preprocessor than the C++ language, but since the two are so
        closely linked I thought it worth including. Have you ever
        wondered what happens if you use the name of a macro in the
        definition of that macro? For example:
		
        <pre class="code">#define foo (1+foo)</pre>
        
		Clearly, any attempt to expand such a macro recursively
        will cause an infinite loop, since there is no way to
        terminate the expansion at the chosen point. Thus, you may be
        forgiven for thinking that this leads to a preprocessor
        error. In fact, if a macro occurs in its own expansion (either
        directly or via another macro expansion), it is not expanded
        again but rather left as is.
		<br /><br />
		
		This has practical applications in writing transparent
        wrappers. Suppose you've implemented a solution to a TopCoder
        problem, and it is going wrong somewhere. You suspect that
        you're passing a negative value to one of many calls to
        <tt>sqrt</tt>. A simple way to test for this without
        modifying any of your <tt>sqrt</tt> calls is to put the
        following at the top of your file:
		
        <pre class="code">#define sqrt(x) (assert((x) &gt;= 0.0), sqrt(x))</pre>
        
		Compared to using a wrapper function, this has the advantage
        that the <tt>assert</tt> will report the line number of
        the actual call site, rather than the line number in the
        wrapper function.
        <br /><br />
        

   <span class="bodySubtitle">Template template parameters</span><br />

       Templates should be old hat to seasoned C++ programmers,
        especially if they are proficient with the STL. But how often
        do you see code that looks like this?

        <pre class="code">template&lt;typename T, template&lt;typename T&gt; typename I&gt; class Vector { ... }</pre>

        What the heck does a template class as a template parameter
        mean? I'll explain it in terms of a problem I had that I
        solved in this way. I wanted to write a vector class (in the
        mathematical sense of the word &ldquo;vector&rdquo;), with
        template parameters to say what internal storage type to use
        (e.g., <tt>float</tt> or <tt>double</tt>), and also an
        inner product operator (a dot product is a particular instance
        of an inner product). So I'd write a function object that
        implemented an inner product such as the dot product, and of
        course templatize it:

        <pre class="code">template&lt;typename T&gt; class DotProduct { ... }</pre>

        Here T is the underlying storage type, not the class of the
        Vector, since that would lead to cyclic dependencies later.
        Now, I want to make the type of the inner product function
        object a template parameter to the <tt>Vector</tt> class.
        However, if I just make it an ordinary template parameter,
        then nothing enforces the constraint that the storage class
        for the <tt>Vector</tt> itself and for the inner product
        object must be the same (other than some very obscure
        compilation errors). The templatized template parameter
        indicates that instead of taking a fully specialized class as
        the parameter, it takes a templatized class with the specified
        parameters; in this case, a single type parameter. I can then
        instantiate a <tt>Vector</tt> as <tt>Vector&lt;double,
        DotProduct&gt; v</tt>. Within the implementation of
        <tt>Vector</tt>, I use <tt>I&lt;T&gt;</tt> to refer to
        the particular inner product class that I want to use. In the
        example instantiation, that will resolve to
        <tt>DotProduct&lt;double&gt;</tt>.
        <br /><br />
        
        As another example, GCC's implementation of
        <tt>valarray</tt> has some extremely complicated use of
        template template parameters in order to evaluate expressions
        efficiently without redundant copies.
        <br /><br />

   <span class="bodySubtitle">Pointers to members</span><br />
     
        Pointers are the bread and butter of C and C++. But C++
        introduces a different sort of pointer (which is not
        interchangeable with a normal pointer), called the pointer to
        member. It points to a member in a class &mdash; note, not a
        particular instance of a class, but rather the class itself.
        For example, given the definition

<pre class="code"> class A
 {
 public:
     int x, y;
     int f(void *p);
 };</pre>

        <tt>&amp;A::x</tt>, <tt>&amp;A::y</tt> are pointers
        to data members and <tt>&amp;A::f</tt> is a pointer to
        member function. The first two are of type <tt>int
        A::*</tt> while the last is of type <tt>int (A::*)(void
        *)</tt>. Note how this compares to normal pointers: the
        <tt>*</tt> is replaced by <tt>A::*</tt> to indicate
        that this is a pointer to a member of <tt>A</tt>.
        <br /><br />

        These pointers are in a sense incomplete, because they
        don't reference any particular instance of <tt>A</tt>. The
        instance is provided when you dereference the pointers, using
        the <tt>-&gt;*</tt> or <tt>.*</tt> operator. Given the
        definitions

<pre class="code">A a, *aptr;
int A::* aintptr;
int (A::*afuncptr)();</pre>

        One can write <tt>a.*aintptr</tt>,
        <tt>aptr-&gt;*intptr</tt>, <tt>(a.*afuncptr)()</tt> or
        <tt>(aptr-&gt;*funcptr)()</tt>.<br /><br />

        For pointers to member functions, the compiler handles
        virtual functions correctly and will call the version from the
        appropriate class. As a result, most compilers (including GCC)
        will use more bytes for a pointer to member function than for
        a normal pointer, to keep track of necessary information. It
        is thus perhaps not surprising that the standard is
        particularly strict about conversions of pointers to members.
        For example, you can't convert everything to and from a void
        pointer as one can with normal pointers.
        <br /><br />

        That's all very well, but what use is it? As an example, I
        have used them in an algorithm that did some processing on a
        3D mesh. Each face of the mesh has edges, which can be walked
        clockwise or anti-clockwise using <tt>Edge::prev()</tt>
        and <tt>Edge::next()</tt> member functions. The algorithm
        in question needed to process a face twice, once clockwise and
        once anti-clockwise. Rather than duplicating the code or
        littering it with conditionals, I used a pointer to member
        function that pointed to either <tt>Edge::next</tt> or
        <tt>Edge::prev</tt>, depending on the direction that the
        algorithm wished to walk.
        <br /><br />

        Be aware that this isn't necessarily the most efficient
        way to do it, since calling any function pointer is general
        unfriendly to branch prediction, and a pointer to member
        function has extra complications due to handling virtual
        functions. It is a very maintainable approach though,
        particularly if you use some abstraction to hide the uglier
        pieces of syntax. The STL has a wrapper called
        <tt>mem_fun</tt>, which accepts a pointer to member
        function and wraps it in a function object that can be called
        with the object on which to apply the pointer to member
        function. Unfortunately it only works for member functions
        that take no arguments, but you can apply the same idea in
        your own code.
        <br /><br />
       

        <span class="bodySubtitle">Mutable members</span><br />
       C++ allows references to an object to be marked as
        constant. This promotes good programming practice, since you
        can declare a function parameter to be a constant reference that is self-documenting (anyone reading the function
        description will know that the function won't clobber his/her
        object), and any accidental modifications will be rejected by
        the compiler.
        <br /><br />
        
		However, in some cases, what appears at the language level
        to be a modification is actually not a modification at a
        higher semantic level. The best example of this is any caching
        technique (such as memoization). If a value is entered into a
        cache, the object will not behave any differently (apart from
        it being faster to compute the same value again), and thus it
        hasn't really changed. Here, the <tt>mutable</tt> keyword
        can help. It can be applied to a data member in a class,
        and indicates that the member may be modified even when the
        object is being used as a constant. In our caching example, it
        would be applied to the cache to allow a query function to
        update it.
        <br /><br />

        <span class="bodySubtitle">Coming soon</span><br />
        Watch for a <a href="/tc?module=Static&d1=features&d2=013107">follow-up article</a> coming soon, featuring five things you didn't know about initialization and destruction in C++.
        <br><br>
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
