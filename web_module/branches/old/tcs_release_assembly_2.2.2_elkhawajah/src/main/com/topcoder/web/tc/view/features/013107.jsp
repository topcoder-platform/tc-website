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

<span class="bigTitle">Five Things You Didn't Know About C++, Part 2</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="251074" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

        <span class="bodySubtitle">Initialisation and Destruction</span><br />
        This is a follow-up to my previous article, <a href="/tc?module=Static&d1=features&d2=012607">Five Things
        You Didn't Know About C++</a>, a collection of obscure,
        surprising and (possibly) useful C++ features. This article
        is more of the same, but focuses on aspects of C++ that deal
        with initialisation, constructors, destructors and memory
        management.<br /><br />

        <span class="bodySubtitle"><tt>B b = a</tt> vs <tt>B b(a)</tt></span><br />
                Assuming that <tt>B</tt> is a class and <tt>a</tt>
        is a variable (not necessarily of type <tt>B</tt>),
        what is the difference between these declarations?
        
		<pre class="code">B b = a;
B b(a)</pre>

        Well, the first looks like an assignment, but it is
        actually an initialisation, so if you thought the first
        involved the assignment operator you would be mistaken. Some
        textbooks may tell you that the two are equivalent, and this
        is true for non-classes and where <tt>a</tt> is of type
        <tt>B</tt> (or a descendant class). In the latter case,
        both declarations initialise <tt>B</tt> using the copy
        constructor.<br /><br />

        If <tt>a</tt> is not a descendant of <tt>B</tt>,
        then things get a little more interesting. In the second case,
        this is a normal constructor call (assuming that there is
        a matching constructor; there are other things
        that happen if not). However, in the first case, the
        constructor is used to create a <em>temporary</em> of type
        <tt>B</tt>, which in turn is used to initialise
        <tt>b</tt> through the copy constructor.<br /><br />

        Now before you test this by writing a program that uses
        <tt>cout</tt> in its copy constructor, keep in mind that
        the C++ standard allows the compiler to eliminate these kind
        of redundant copies (and GCC does so in this case), so in fact
        the two versions may end up executing identically. You can
        still detect that this is really going on, however, by
        changing the access control on the copy constructor (which the
        compiler is required to check even when it eliminates the
        copy). Define a private copy constructor for <tt>B</tt>,
        and the first declaration will fail while the second will
        work.<br /><br />

        This is potentially useful to know because copy
        constructors can sometimes have unwanted consequences. For
        example, if a class holds a pointer to data and frees that
        pointer on destruction, then a bit-level copy is a dangerous
        thing to have around as it will cause the pointer to be freed
        twice. A more serious case is an object that encapsulates a
        lock or otherwise non-clonable resource. In these cases it is
        good programming practice to declare the copy constructor and
        assignment operator as <tt>private</tt>, so that copies
        cannot be made accidentally. In the event that you have such a
        class which needs to be initialised from some other object,
        you will need to use the second form of initialisation.<br /><br />

        A consequence of the implicit conversion of <tt>a</tt>
        is that only conversion constructors qualify for the
        conversion, in particular those without the
        <tt>explicit</tt> keyword. For example, if you
        write <tt>vector&lt;int&gt; p = 3</tt> rather than
        <tt>vector&lt;int&gt; p(3)</tt>it will not work, because
        the constructor that takes an integer is marked
        <tt>explicit</tt>.<br /><br />
        

        <span class="bodySubtitle">Initialisation of variables</span><br />
        
        It is common wisdom that variables in C and C++ are not
        initialised to any particularly value. In fact, this is not
        true for variables of &ldquo;static storage duration&rdquo;
        (basically, global variables). They are initially all
        zero-initialised (meaning that all the fundamental values are
        filled with zeros). The second stage is static initialisation,
        where specified constant values are filled in. The third stage
        is dynamic initialisation, which means calling constructors
        on objects.<br /><br />

        For local variables the situation is a little different. To
        understand the rules it is necessary to under the concept of
        POD (Plain Old Data) types. The definition is quite complex,
        but essentially types that would be valid in C are POD,
        while full-blown classes with destructors and the like are not.
        Non-POD classes will always be initialised by a constructor,
        possibly an implicit one. This isn't necessary a good thing,
        because POD members within these classes will <em>not</em> be
        implicitly initialised.

        POD local variables are not initialised by default, but
        if an incomplete initialiser is given, then the remaining
        elements are set to zero. For example, in the code below, all
        the local variables will be completely zeroed out:
        
		<pre class="code">
struct T { bool b; int *p; }
int int_array[15] = {0};
T structure = { false };
T structure_array[10] = {{false, NULL}, {false}};</pre>
        
		The situation is even more complicated than I've presented
        it, but this should be enough to let you feel confident in not
        initialising some things and only partially initialising
        others, while at the same time realising that it isn't obvious
        and playing it safe when in doubt.<br /><br />
        
 
        <span class="bodySubtitle">Internals of <tt>new</tt></span><br />
		
		The <tt>new</tt> keyword is the standard way to
        allocate memory in C++, such as <tt>new int</tt> or
        <tt>new Object(123)</tt>. You probably think about it just
        as a memory allocator that also handles object construction,
        but in fact there is a lot of machinery under the hood. The
        object construction is mostly straightforward, so I'm going to
        leave that and look at the internals of the memory
        allocation.<br /><br />

        So when you use <tt>new</tt>, how does the compiler
        allocate the memory? The first layer of abstraction is that it
        looks for a function called <tt>operator new</tt>, first
        in the scope of <tt>Object</tt>, then at global scope, and
        passes it the number of bytes that should be allocated and
        expects to get a <tt>void *</tt> back. The user can thus
        either override the global allocator, or provide a per-class
        allocator (e.g., allocating aligned memory for a class that
        contains data for SSE).<br /><br />

        Not surprisingly, the standard library is required to
        provide an implementation of <tt>operator new</tt>. But
        even here, it is more than just a wrapper around
        <tt>malloc</tt>. It is required to attempt an allocation
        (the method is not specified, although GCC uses
        <tt>malloc</tt>). If that fails, and the user has provided
        a &ldquo;new handler&rdquo;, it should call that before
        starting again. Presumably, the handler could attempt to free
        up some caches or other memory to make room for a new
        allocation.<br /><br />

        So far, I've referred to <tt>operator new</tt> as a
        single function, but in fact there can be multiple versions
        with different signatures. These are used by passing arguments
        to the <tt>new</tt> keyword, for example
        <tt>new(nothrow) </tt> or <tt>new(ptr) Object</tt>.
        The arguments are passed to <tt>operator new</tt>
        immediately after the size. The standard library provides a
        few convenient implementations. The first is &ldquo;nothrow
        new&rdquo;, where the magic argument <tt>nothrow</tt> is
        passed.  This indicates that if allocation fails, a
        <tt>NULL</tt> pointer should be returned rather than a
        <tt>bad_alloc</tt> exception. The second is
        &ldquo;placement new&rdquo;, where a pointer is provided by
        the user and is used instead of any allocation. Placement new
        is used to separate memory allocation from object
        construction. This is heavily used in STL implementations,
        where for example a <tt>vector</tt> may contain spare
        memory, and calling <tt>resize</tt> may result in objects
        being constructed in the existing memory.<br /><br />

        I have glossed over the handling of array allocation; it's
        mostly the same but using <tt>operator new[]</tt> instead
        of <tt>operator new</tt>.<br /><br />
        

        <span class="bodySubtitle">Internals of <tt>delete</tt></span><br />
        
        The first and probably most practical thing I discovered
        about <tt>delete</tt> is that it is safe to call it on a
        <tt>NULL</tt> pointer; this is specified to have no
        effect. This means that if you might or might not be holding a
        pointer to an object, you're free (excuse the pun) to delete
        it without first having to check whether the pointer is
        <tt>NULL</tt>. C programmers may be happy to know that
        <tt>free</tt> and <tt>realloc</tt> have the same
        property i.e., <tt>free(NULL)</tt> is a no-op while
        <tt>realloc(NULL, size)</tt> is equivalent to
        <tt>malloc(size)</tt>.<br /><br />

        As you may expect by now, a <tt>delete</tt> expression
        calls the destructor for the object then calls
        <tt>operator delete</tt> to deallocate the memory. The
        operation is somewhat symmetric to <tt>new</tt>, except
        that you can't pass parameters to the <tt>delete</tt>
        expression, so there is only one signature for <tt>operator
        delete</tt> &mdash; or is there? In fact, there is one
        case where an overloaded version may be used. If the
        constructor throws an exception, the same parameters that were
        given to <tt>new</tt> are also passed to <tt>operator
        delete</tt>. This is probably not very useful information
        for most people, but it is at least comforting to know that
        you can throw exceptions from a constructor and it will not
        cause a memory leak or otherwise wreak havoc.<br /><br />
        

        <span class="bodySubtitle">Destructor and pseudo-destructor calls</span><br />
        
        Earlier on we saw how placement <tt>new</tt> can be
        used to construct an object in previously allocated memory.
        What about the reverse, destroying an object without
        reclaiming the memory? The syntax for this turns out to be a
        lot more obvious: you just call the destructor as if it were a
        method.  For example, if <tt>a</tt> is of type
        <tt>A</tt>, then <tt>a.~A()</tt> destroys the
        object.<br /><br />

        The part that makes this interesting is that it works (as a
        no-op) on scalar types as well, in which case it is known as a
        pseudo-destructor. It doesn't work if you pass the actual name
        of the type (e.g., <tt>int</tt>), but does work if it is
        aliased by a <tt>typedef</tt> or template parameter.  This
        allows the STL memory management to call the destructor when
        you call <tt>pop_back</tt> on a vector, without concern
        for whether a destructor really exists.
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
