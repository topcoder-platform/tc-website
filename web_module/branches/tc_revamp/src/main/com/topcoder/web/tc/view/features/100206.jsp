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

<div style="float: right; text-align:right;">
<tc-webtag:forumLink forumID="506131" message="Discuss this article" /><br>
<div id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A></div>
<div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A></div>
</div>
<span class="bigTitle">Design Patterns in C++</span>

      <p>
      <%--<img src="/i/m/XXX.gif" alt="" border="0" align="left" class="myStatsPhoto"/>--%>
      By&#160;<tc-webtag:handle coderId="21195715" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

<span class="bodySubtitle">Introduction</span><br>
Long ago, in the annals of object oriented history, two programmers -- Ward Cunningham and Kent Beck -- experimented with the use of pattern languages in Smalltalk. Seven years later, another group, known as the Gang of Four (GoF), published <i>Design Patterns: Elements of Reusable Object-Oriented Software</i>, catapulting the idea of design patterns into mainstream programming.  This book chronicled several tested solutions to recurring problems in object oriented design, and introduced a manner in which these solutions could be communicated and reused by the software development community as a whole.
<br><br>
At around the time of Ward and Kent's work, Alexander Stepanov and David Musser were muddling with generic programming in Ada.  In the same year that the GoF published <i>Design Patterns</i>, the C++ standards committee adopted a specification for the Standard Template Library.  This library defined several generic concepts, and implemented algorithms in terms of these concepts, so they could be universal with no negative impact on efficiency.  Though these developments complemented each other rather nicely, they were not used together to any real effect until Andreii Alexandrescu did so in <i>Modern C++ Design: Generic Programming & Design Patterns Applied</i>.  Since then, through the use of generic programming, (a few) design patterns and C++ idioms have been encapsulated in libraries, ready to be used over and over again.
<br><br>
While design patterns and generic programming are for the most part independent of each other, both are based in the same basic concepts that permeate software design, such as abstraction and code reuse. Due to this commonality -- and the concept of compile time polymorphism, which is ubiquitous in C++ code -- several design patterns are not explicitly used in C++ and others are handled differently than in other languages.
<br><br>
So, what does any of this have to do with TopCoder? Because TopCoder is planning to introduce C++ design and development competitions, it is a good time to examine the use of design patterns in the language. This article will examine several design patterns affected by modern C++ practices and present some of their manifestations in generic C++ code, along with a few examples of how parts of some TopCoder components may look like in C++.
<br><br>
This article assumes proficiency in C++ and knowledge of common design patterns.  This article will also use several Boost libraries, but will not explain them in detail.  For more information, consult the very comprehensive documentation found at <A href="http://www.boost.org" target="_blank">www.boost.org</A>.
<br><br>
<span class="bodySubtitle">Strategy</span><br>
Strategy is the explicit abstraction of like-minded algorithms.  An interface that abstracts a set of common algorithms is declared, thereby allowing the specific implementations to be used interchangeably.  With such an interpretation, Strategy is almost ubiquitous in generic C++ code.  It is fundamental to generic programming and, at the compile time level, it is an inherent part of the language.  Using compile time polymorphism to abstract away algorithmic details, Strategy may appear in any of the following ways (along with many, many others):

<ul>
<li>Function Overloading:  Using one function name (the interface) and defining it based on the types it is supplied; essentially implementing generic algorithms.  The filtering of types can be accomplished through non-templated function overloading or templated function overloading with or without SFINAE<sup>[i]</sup> (substitution-failure-is-not-an-error).</li>
<li>Partial Template Specialization:  Declaring a templated class or struct and defining it based on the template arguments supplied.  Here the interface is implicit in the code.</li>
<li>Argument Dependent Lookup (aka Koenig Lookup): Defining a function in the namespace of the type(s) it uses, and calling without qualification. The function call will resolve to the definition in the namespace of the types it is given. Currently this is not normally done due to the unexpected problems that arise with ADL.</li>
<li>Define a generic concept or reuse a generic concept, and define a number of types that model it.</li>
</ul>

All four of these are used in the abstraction of purely procedural entities, while the second and fourth can also be used in more general uses of Strategy.
<br><br>
<b>What's a concept?</b><br>
A concept is in essence a set of type requirements, such as functions that must be able to be called, associated types, and/or further requirements of those types.  If a type fulfills these requirements it is said to model the concept.  Concepts are somewhat equivalent to interfaces, though there are a few marked differences.  First, since there is currently no language support for concepts, they are defined almost solely through external documentation, though there is limited library support<sup>[ii]</sup>.  Second, the modeling relationship is completely non-intrusive.  Instead of inheriting from a concept, the declaration that says a type models a concept is done outside the type's definition, providing an extra layer of extensibility and adaptability.  Also, modeling a type can be implicit, if specified.  In such a case, any type that fulfills a concept's requirements will automatically model the concept.  In other cases the modeling relationship must be explicitly declared.  Finally, reuse in concepts is greatly stressed.  While interfaces are rather lightweight, and are defined again and again for the same basic purposes, concepts should not be (though that is not to say concepts must be used sparsely).  Design of concepts should be done very carefully.
<br><br>
<b>Example: Java Web Spider</b><br>
The Java Web Spider component traverses graph-like structures, such as web pages.  The priority in which vertices are crawled is decided by the CrawlStrategy interface, which just happens to use Strategy.  The CrawlStrategy interface abstracts the manner in which the next vertex to crawl is obtained, as well as the way in which to-be-crawled vertices are stored, thus allowing different forms of crawling to be used interchangeably.  The interface is used, by the Crawler class, in an iterative manner, through multiple calls to getNextAddress and addAddress/addAddressList.  Therefore, the respective C++ implementations would be iterators.  The specific concepts that the iterators will be required to model must be determined and specified by the entity that uses them:

<pre class="codeBox">
template &lt;typename CrawlingIterator&gt;
struct crawler
{
	...
};
</pre>
 
The Crawler class only uses its associated CrawlStrategy to obtain the next vertex to crawl, and to queue more vertices for crawling.  The vertex itself is not modified in any way, so the CrawlingIterator type must model the Readable Iterator concept.  Also, the Crawler class only increments, so the CrawlingIterator type must also model the Incrementable Iterator concept.  Using Boost Concept Check Library (BCCL), the crawler&lt;...&gt; class becomes:

<pre class="codeBox">
template &lt;typename CrawlingIterator&gt;
struct crawler
{
	// This macro makes sure the type, specified by the first argument, is a model
	// of the specific concept, specified by the third argument.  The second
	// argument is the namespace in which the concept resides.
	BOOST_CLASS_REQUIRE(CrawlingIterator,boost_concepts,ReadableIteratorConcept);
	BOOST_CLASS_REQUIRE(CrawlingIterator,boost_concepts,
		IncrementableIteratorConcept);

	...
};
</pre>

The BreadthFirstCrawlStrategy, an implementation of CrawlStrategy, returns vertices based on when they were added.  Vertices are pushed onto a queue when added, and the front is popped when the next vertex to crawl is requested.  Using Boost.Iterator's iterator_facade<...> and the BGL, the C++ version would then be:

<pre class="codeBox">
namespace web_spider
{
	// BGL graphs use a vertex_descriptor typedef to identify vertices in a graph.  
	// The breadth_first_iterator will hold and return these.
	template &lt;typename VertexDescT&gt;
	struct breadth_first_iterator
		: public boost::iterator_facade&lt;
			breadth_first_iterator&lt;VertexDescT&gt;,	// The derived 
type.
			VertexDescT,				// The value type.
			boost::incrementable_traversal_tag,	// The traversal 
category.
			VertexDescT				// The reference type.
		>
	{
		typedef VertexDescT vertex_desc_t;

		breadth_first_iterator() : queue(), visited() {}

		// Due to a lack of move semantics in C++<sup>[iii]</sup>, copying the iterator will
		// be rather slow, but since this example is not concerned with speed, 
		// this is not addressed.  Of course, it could also be indicative that
		// queue and visited should not be managed by this class, but by some 
		// other entity.  But this is also outside of this example's scope.
		breadth_first_iterator(breadth_first_iterator const& x)
			: queue(x.queue), visited(x.visited)
		{}

		void add_address(vertex_desc_t v)
		{
			if (visited.find(v) == visited.end())
			{
				queue.push_back(v);
				visited.insert(v);
			}
		}

		// Converting to bool can sometimes create ambiguities and unwanted 
		// conversions to other data types, so instead of directly converting  
		// to bool, the Safe Bool Idiom<sup>[iv]</sup> is used.  unspecified_bool_t is 
		// essentially a pointer to a member variable.  Such a type cannot be 
		// implicitly converted to anything but bool.
		operator unspecified_bool_t() const
		{
			return !queue.empty();
		}

	protected:
		// Give access to the base type, without breaking encapsulation.
		friend class boost::iterator_core_access;

		// The base type, iterator_facade<...> defines the necessary operators 
		// in terms of certain methods defined by this class.  For a Readable 
		// Iterator/Incrementable Iterator, this includes dereference and 
		// increment.
		vertex_desc_t dereference() const
		{
			return queue.front();
		}

		void increment()
		{
			queue.pop_front();
		}

		std::deque&lt;vertex_desc_t&gt; 	queue;
		std::set&lt;vertex_desc_t&gt;	visited;
	};
}
</pre>

<b>Runtime Strategies</b><br>
Usually when Strategy is used, it is used to provide implementations that may be mixed and matched at runtime, a venture in which compile-time polymorphism doesn't seem helpful. Thanks to the flexible and non-intrusive nature of templates, though, quite a bit (but not enough) of what exists in the compile time arena can be mirrored into the runtime arena.  Libraries such as Boost.Function, Boost.Variant, Adobe's any_iterator&lt;...&gt; and to a lesser extent Boost.Any allow one to mask and use an object without knowing its type and without having to explicitly use runtime polymorphism through a technique termed Type Erasure.  Generic components can, then, be written using compile-time polymorphism, and when these components are used, the above utilities, or home-brewed utilities, can be used to induce runtime polymorphism.  Thus the user is not limited to what may be unnecessary and/or inefficient.
<br><br>
<span class="bodySubtitle">Adaptor</span><br>
When there is a need to use a class of one interface as another incompatible, but related, interface, the Adaptor design pattern can be used to adapt the class to the other interface.  This is accomplished by creating a class that uses the other class but conforms to the incompatible interface.  This situation will only arise, however, due to the fundamentally intrusive nature of runtime polymorphism, i.e. there is no way to tell a class what interfaces it implements outside of its definition.  In a non-intrusive environment, such as C++'s compile-time environment, adaptation can be done in a much simpler, more flexible way.
<br><br>
Like Strategy, the Adaptor design pattern can manifest itself in several ways though, unlike Strategy, there is a "best" way.  The STL has adaptors that take container types as template arguments, and use those types to conform to a slightly different interface.  As an example take std::stack&lt;...&gt; -- stack&lt;...&gt; masks a Back Insertion Sequence, only providing methods to push elements onto the stack, pop elements from the stack and query the top of the stack.  These methods each call the supplied Back Insertion Sequence's push_back, pop_back and back methods, respectively.  While handy for types that provide those methods, it becomes unwieldy when the desired sequence provides similar methods with different names.  In such a case, the stack&lt;...&gt; template would have to be explicitly coded, through partial template specialization.  Using free-functions -- in other words, more compile time Strategy -- instead of a stack&lt;...&gt; class helps deal with this problem:

<pre class="codeBox">
template &lt;typename T, typename BackInsertionSequence&gt;
inline void push(T const& value, BackInsertionSequence & sequence)
{
	sequence.push_back(value);
}

template &lt;typename T&gt;
inline void push(T const& value, some_non_conformant_sequence&lt;T&gt; & sequence)
{
	sequence.add(value);
}
</pre>

Since each method that stack&lt;...&gt; exposes is separated from the others, it becomes much easier to adapt other sequences to the stack&lt;...&gt; interface.
<br><br>
<span class="bodySubtitle">Iterator</span><br>
Iterators are by far one of the most used abstractions in C++ code, though never quite like the GoF Iterator design pattern.  The GoF Iterator provides methods for value access, incrementing, validation and construction.  It does not take into account mutability of values, decrementing or non-uniform traversal.  The original STL iterator abstraction took all this into account, and defined concepts based on these distinct types of behavior.  It did not, however, separate iterator traversal from the accessing of values, which created contradictions such as vector&lt;bool&gt;::iterator not being random access.  The new iterator abstraction, specified in Boost.Iterator, solves this problem.  Boost.Iterator also provides a very useful set of specialized iterators and two very powerful utilities, boost::iterator_facade&lt;...&gt; and boost::iterator_adaptor&lt;...&gt;.  The former makes the creation of iterators child's play, as was seen in the Java Web Spider example.  The latter makes the manipulation and tweaking of existing iterators just as simple.
<br><br>
<b>Coming in Part 2:</b> More information on the Composition, Object Factories, and Facade classes.
<br><br>
<span class="smallText">
[i] For more information on SFINAE, see the documentation for <A href="http://boost.org/libs/utility/enable_if.html" target="_blank">boost::enable_if&lt;...&gt;</A>.<br>
[ii] The Boost Concept Check Library gives support for declaring concepts and making sure types conform to those concepts, but compilation will halt on failure, which may not be desired. Also, using concepts will slow compilation some, which in some cases is not tolerable. Recently a new approach at simulated concept support has arisen, though it is still in development.<br>
[iii] For more information on move semantics, see <A href="http://anubis.dkuug.dk/jtc1/sc22/wg21/docs/papers/2004/n1610.html" target="_blank">"Clarification of Initialization of Class Objects by rvalues"</A>, by David Abrahams and Gary Powell or <A href="http://www.ddj.com/dept/cpp/184403855" target="_blank">"Generic&lt;Programming&gt;: Move Constructors"</A>, by Andreii Alexandrescu.<br>
[iv] For more information on the Safe Bool Idiom, see <A href="http://www.artima.com/cppsource/safebool.html" target="_blank">"The Safe Bool Idiom"</A> by Bjorn Karlsson.
</span>

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
