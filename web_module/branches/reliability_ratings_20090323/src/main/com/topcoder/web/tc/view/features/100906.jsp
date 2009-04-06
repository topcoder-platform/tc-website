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
   width: 620;
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
<span class="bigTitle">Design Patterns in C++, Part 2</span>

      <p>
      <%--<img src="/i/m/XXX.gif" alt="" border="0" align="left" class="myStatsPhoto"/>--%>
      By&#160;<tc-webtag:handle coderId="21195715" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

Part One of this article covered the Strategy, Adaptor and Iterator design patterns.  This part will cover the Facade and Composition design patterns and the idea of Object Factories.  It will also reference the following libraries: Boost.Parameter, Boost.Spirit, Phoenix V1, Boost.Function, Boost.Variant and Boost.Any.  Boost.Variant is not used in any code, though.
<br><br>
<span class="bodySubtitle">Facade</span><br>
In systems where a substantial amount of abstraction has been applied -- whether through the use of design patterns, generic programming or something else entirely -- the scope of each programmatic entity will be rather small.  Such systems can be very flexible, but can also be somewhat hard to use.  In these cases, the Facade design pattern can provide a simple, unified way to use the system.  Facade classes that hold and manage some state must be represented in C++ as, well, classes.  Facades that do not manage any state, however, can be better represented as free functions (or immutable global function objects).  An example of such a Facade would be the GoF's Compiler class.
<br><br>
Facades, while useful, do not normally retain genericalness (yes, that is a word), as, by definition, they are meant to simplify.  For example, the GoF's Compiler class provides one method to compile that takes a std::istream, the stream of characters used as input, and a ByteCodeStream, the output stream to which compiled bytecode is written.  It then goes ahead and assumes that the Scanner, Parser, ProgramNodeBuilder and RISCCodeGenerator classes should be used.  This may be enough for conventional use of the system, but in the off chance that a custom parser or code generator is called for the Facade class does little to help.  The process of compilation is exactly the same no matter what types are used, however, so the code the Compiler class uses would need to be duplicated.  Theoretically, this problem can be mended by moving those types to the particular function's argument list, and providing default arguments:
<pre class="codeBox">
// Free function used, instead of a Compiler class to reduce the amount of overall text.
template &lt;
	typename ScannerT,
	typename NodeBuilderT,
	typename ParserT,
	typename CodeGeneratorT
&gt;
inline void compile(
	std::istream &amp;        input,
	ByteCodeStream &amp;      output,
	ScannerT const&amp;       scanner   = Scanner(),
	NodeBuilderT const&amp;   builder   = ProgramNodeBuilder(),
	ParserT const&amp;        parser    = Parser(),
	CodeGeneratorT const&amp; generator = RISCCodeGenerator()
)
{
	...
}
</pre>
Unfortunately, this is will not work as expected, but assuming it will, it would allow users to use both, the default behavior and custom, user specified behavior, all through the same interface. It would also come with a rather annoying side effect. Say it is desired only to replace the RISCCodeGenerator with a custom generator, for example, the custom generator would obviously need to be supplied; since it is the last argument in the compile function, though, all others must be provided as well. This effectively defeats the purpose of using default parameters. Further, in cases where function calls pass parameters in an incorrect order, subtle, hard to find bugs may arise. The only way around this is to use named parameters, a feature that is not part of C++.  Fortunately, there is library support, in the form of Boost.Parameter.  A call to an implementation of the compile function that uses Boost.Parameter (not shown here) would look like this:
<pre class="codeBox">
	std::istream &amp; in = ...;
	ByteCodeStream &amp; out = ...;

	// Parameter names may conflict with other names, so it would be a good idea
	// to place them in their own namespace, or use a common naming convention.
	//
	// All parameters that are not given are set to their default values.
	compile(param::input = in, param::output = out, param::generator = MyGenerator());

	// Compiling normally...
	compile(in, out);

	// And custom compilation with a bit of normalcy:
	compile(in, out, param::generator = MyGenerator());
</pre>
It is now easy to do what is common, and just as simple to create custom behavior.
<br><br>
<span class="bodySubtitle">Composition</span><br>
With regard to structural composition, the Composite Design pattern can be used the same way it is in most other languages, though in some cases Boost.Variant can be very, very useful.  Composition also occurs frequently in C++ Functional Programming.  Individual function objects are composed on the fly using templates and so are used with no abstraction penalty, allowing large systems to be broken down into their simplest functional elements.
<br><br>
<b>Function Composition</b><br>
In cases where further abstraction can be realized in encapsulated algorithms, the composition of function objects can be used to promote code reuse.  In C++, the composition is accomplished through overloaded operators and/or functions, usually, outside the class definition.  These operators compose the function objects they are supplied into another function object that will use them to do a higher level operation of the same sort.  The Spirit Parser Generator Framework uses this technique, among others, to approximate EBNF in C++:

<pre class="codeBox">
	using namespace boost::spirit;

	// The scanner type is a utility Spirit uses to iterate over the supplied text, 
	// provide skipping functionality, etc. It is to be deprecated in Spirit 2.
	typedef ... scanner_t;

	// int_p is a constant global variable that, alone, parses integers.  '+' gets 
	// converted to chlit&lt;char&gt;('+') in the &gt;&gt; operator's execution.
	// chlit&lt;char&gt; parses a single character.
	rule&lt;scanner_t&gt; my_rule = int_p &gt;&gt; '+' &gt;&gt; int_p;

	// Parse some text by calling the parse free function.  parse returns a 
	// parse_info&lt;...&gt; instance which has a member, full, that tells
	// if parsing succeeded.
	bool success = parse("123 + 321", my_rule, space_p /*the skip parser*/).full;
</pre>

This code creates a parser, my_rule, that parses an integer followed by a '+' character, followed by another integer through its hidden parse member function.  This is accomplished by first composing int_p and a constructed instance of chlit<char> into an instance of a boost::spirit::sequence parser, in a specialized version of the >> operator.  The resulting composite parser then undergoes the same process to create a composition of itself and int_p.  The result of this ensuing operation is then stored in the rule&lt;...&gt; class by non-intrusively inducing runtime polymorphism (Type Erasure again).  By using operators to assign meaning in addition and with regard to the scope and intentions of other sorts of code (functions, classes, etc.), a generic library can provide an easy way for the user to master the library without having to learn its specific design.
<br><br>
<b>Example: .NET Search Builder</b><br>
The .NET Search Builder Component uses the Composite design pattern to create SQL statements that are composites of other statements.  This is accomplished by first creating two search filters, and then a new composite filter using the former two. In more complicated situations, this becomes more annoying than useful.  Overloading operators makes such problems disappear.  Instead of writing bulky, hard to manage code, like the following:

<pre class="codeBox">
ISearchFilter filter = new AndFilter(
	new NotFilter(
		new SomeFilter(...)
	),
	new OrFilter(
		new SomeOtherFilter(...),
		new AnotherRandomFilter(...)
	)
);
string str = filter.GetWhatever();
</pre>

It should be possible to write cleaner and much simpler code, such as:

<pre class="codeBox">
// static creation methods used to avoid 'new', and the resultant parentheses
ISearchFilter filter =
	!Filters.like(...) & (Filters.in(...) | Filters.greaterThan(...))
;
string str = filter.GetWhatever();
</pre>

In C++, this becomes:

<pre class="codeBox">
using namespace search_builder;

search_filter filter = !like(...) & (in(...) | greater_than(...));

// using () operator in place of GetWhatever()
std::string str = filter();
</pre>

Before explaining how this code is accomplished, let's first simplify the above code, and just explain:

<pre class="codeBox">
search_filter filter = !like(...);
</pre>

First, the like(...) free function is called which returns an instance of like_filter&lt;...&gt;.  A free function is used, as opposed to directly constructing the desired type, as constructing a templated type by hand every time it's necessary can become rather cumbersome.  (Note:  This example assumes like_filter&lt;...&gt; to be templated, but it may not need to be.)

<pre class="codeBox">
namespace search_builder
{
	template &lt;...&gt;
	inline like_filter&lt;...&gt; like(...)
	{
		return like_filter&lt;...&gt;(...);
	}
}
</pre>

Afterwards, an overloaded version of the ! operator returns a composite not filter:

<pre class="codeBox">
namespace search_builder
{
	// filter&lt;...&gt; is the base type of all filters.  The reason for this is below 
	// this code snippet.
	//
	// The template argument to filter&lt;...&gt; is the type doing the inheriting.
	template &lt;typename FilterT&gt;
	struct not : filter&lt;not&lt;FilterT&gt; &gt;
	{
		not(FilterT const& filter_) : filter(filter_) {}

		// Since a filter is more or less a functional unit, the () operator is 
		// used.  There's really no other reason to do it, except for this 
		// example's eventual use of boost::function&lt;...&gt;.  This operator is 
		// defined in all filters.  In this particular filter, the operator will 
		// manipulate then return the result of this-&gt;filter().
		std::string operator()() const
		{
			...
		}

		FilterT filter;
	};

	template &lt;typename FilterT&gt;
	inline not&lt;FilterT&gt; const
	operator ! ( filter&lt;FilterT&gt; const& f )
	{
		return not&lt;FilterT&gt;(f.derived());
	}
}
</pre>

Note that the ! operator takes as an argument, filter&lt;FilterT&gt;, the base type of all filters.  This is required because, if ! were defined to just take FilterT, there would be no way to tell if the given FilterT is really a filter and not some other random type, which would create an ambiguity in calling the ! operator.  With language-supported concepts, however, this would no longer become necessary.  The derived() member function in filter&lt;FilterT&gt; downcasts itself to a FilterT const&, thereby allowing the construction of not&lt;FilterT&gt;.  After the composite result of !like(...) is created and returned by the ! operator, it is assigned to a search_filter.  Since all filters use a non-templated () operator, we can take a shortcut and use boost::function&lt;...&gt;, of Boost.Function:

<pre class="codeBox">
// Since search_filters themselves must be able to be used in operators, we must wrap 
// boost::function&lt;...&gt; in a type that derives from filter&lt;...&gt;.
struct search_filter : public filter&lt;search_filter&gt;
{
	template &lt;typename F&gt;
	search_filter(filter&lt;F&gt; const& f)
		: embedded(f.derived())
	{}

	std::string operator()() const
	{
		return embedded();
	}

	template &lt;typename F&gt;
	search_filter &amp; operator = (filter&lt;F&gt; const&amp; f)
	{
		embedded = f;
		return *this;
	}

	// The template argument to boost::function is the signature of the function 
	// that we will be using it as.  In this particular case, we give it a function 
	// type that returns a string and takes no arguments.
	boost::function&lt;std::string ()&gt; embedded;
};
</pre>

Boost.Function provides runtime polymorphism in the storing and calling of function objects.  Which means this shortcut will only work if the () operator is used, and the operator is not templated, as the signature of the operator is needed as a template parameter.  Also, it should be noted that boost::function&lt;...&gt; gives value semantics to a polymorphic type, which may not be what you want.
<br><br>
<span class="bodySubtitle">Object Factories</span><br>
Object factories are used in Object Oriented languages as a means of information hiding in the creation of objects.  By declaring an interface that generates an abstract object, the concrete type of the object and the steps used in creating it can be hidden, so the responsibility of creation can be more easily managed or delegated to a third party, i.e. the user.  Further, the generation of objects can be varied based on sub-classes the user chooses or values determined at runtime.  Since a factory only does one thing -- create an object -- they can be easily represented through functional programming.
<br><br>
<b>Creation Based On Runtime Values</b><br>
Often, situations will arise where you want to create objects based on values determined solely at runtime.  Using a factory, Creator objects are associated with values via a factory class and, when certain values are encountered, the associated Creator is invoked.  In C++, the approach can be very similar, though instead of explicitly declared Creator objects, values are associated with instances of boost::function&lt;...&gt; that are not conceptually restricted to simply creating and returning an object.  Also, there may not always be a need for a physical factory class to manage the objects.
<br><br>
Also, it is sometimes more efficient and/or cleaner to pass the object being modified to the specific function object, so the needed object may be created and then used to modify the passed object.  In some cases this removes an unnecessary level of runtime polymorphism, and in all cases it removes unnecessary copying (due to a lack of language supported move semantics).  In this case the code becomes more of an implementation of the Strategy design pattern, instead of the Factory design pattern.
<br><br>
<b>Example: Java Excel Utility</b><br>
TopCoder's Java Excel Utility Component uses an approach very similar to the above in reading Excel files.  Instead of using explicitly declared Creator objects, it uses Reflection, by associating integers that identify Record types in Excel files, with java.lang.Class objects.  When a particular integer is encountered in loading the file, the specific metadata is found, and the needed Record is created.  In C++, the approach, assuming the same structure used in the Java Excel Utility Component, would use an associative container of integers and boost::function&lt;...&gt; objects:

<pre class="codeBox">
// All Records in the Excel Utility take a RecordDataSource in their constructor, so 
// this must be passed when generating records.  For this example, we use a fictional 
// source_t.
std::map&lt;size_t, boost::function&lt;record * (source_t &)&gt; &gt; records_map;
records_map[...] = create&lt;some_record&gt;();
...
</pre>

Each integer ID is associated with a create&lt;...&gt; function object, which creates the specific type of record:

<pre class="codeBox">
template &lt;typename RecordT&gt;
struct create
{
	// Blech!!!
	RecordT * operator()(source_t & source) const
	{
		return new RecordT(source);
	}
};
</pre>

The map would be used later when reading records:

<pre class="codeBox">
// records_map[id] returns a function object, that is invoked using the () operator.
// source is the source_t that will be used to create whatever record is associated
// with id.
size_t id = ... ;
record * r = records_map[id](source);
</pre>

In this case, declaring a function object type to create records is a bit elongated compared to what could be used.  Using Phoenix V1 (a functional programming library packaged with Spirit) , filling the map is simplified to:

<pre class="codeBox">
// phoenix::arg1 is a lambda placeholder that will echo the first argument it's given.
records_map[...] = phoenix::new_&lt;some_record&gt;( phoenix::arg1 );
...
</pre>

phoenix::new_&lt;...&gt; is a free function that returns a function object that creates the specified type on the heap, using the given arguments (which may include lambda placeholders, phoenix function objects, or "inlined C++") if any.
<br><br>
Of course, explicitly tying our classes with runtime polymorphism isn't the best way to go, as we must now manage the lifetimes of the records explicitly.  Fortunately, we can use Type Erasure.  In this case, the list of records is rather long, and we have no way to tell how many we will add, or others may add, so Boost.Variant cannot be used, as it requires the types that will be used before hand.  But, since records don't have any important common operations, Boost.Any may be used.  Boost.Any provides a class, boost::any, that can hold, well, anything:

<pre class="codeBox">
boost::any some_obj(int(34));
BOOST_ASSERT(some_obj.type() == typeid(int));

some_obj = my_type();
BOOST_ASSERT(some_obj.type() == typeid(my_type));

some_obj = boost::any();
BOOST_ASSERT(some_obj.empty());
BOOST_ASSERT(some_obj.type() == typeid(void));
</pre>

The underlying data is obtained through calls to the boost::any_cast&lt;...&gt;(...) free function:

<pre class="codeBox">
// Passing a pointer to boost::any_cast&lt;...&gt;(...) will not throw if the passed any
// pointer doesn't hold the requested type ...
if (int * value = boost::any_cast&lt;int&gt;(&some_obj))
{
	// do something with an integer value
}
else if (my_type * value = boost::any_cast&lt;my_type&gt;(&some_obj))
{
	// do something with a my_type value
}

// ... passing a reference to boost::any_cast&lt;...&gt;(...), however, may throw.
try
{
	int & value = boost::any_cast&lt;int&gt;(some_obj);
}
catch(...)
{
	// some_obj does not hold an int
}
</pre>

Using boost::any instead of pointers to records, the associative container declared above becomes:

<pre class="codeBox">
std::map&lt;size_t, boost::function&lt;boost::any ()&gt; &gt; records_map;
</pre>

And instead of using phoenix::new_(...), we use phoenix::construct_(...):

<pre class="codeBox">
records_map[...] = phoenix::construct_&lt;some_record&gt;( /*Constructor arguments.*/ );
</pre>

As an added note, it must be said that using Phoenix function objects may not be the fastest route.  boost::function&lt;...&gt; instances hold the function objects they are assigned on the heap, and so must call new/delete accordingly.   Function pointers (including member function pointers) are the exception to this rule, and are stored on the stack, so it may be more efficient to fill the map with pointers to templated functions, such as:

<pre class="codeBox">
namespace detail
{
	template &lt;typename T, typename A0&gt;
	inline T construct(A0 const& a0)
	{
		return T(a0);
	}
}
</pre>

In the case of this example, using the above free function will be more efficient, since we pass the stream to the particular boost::function&lt;...&gt; instance.  If, however, one record type had a constructor that took an extra argument, while the others still did not, we would have to explicitly specify what that value is when we fill the map.  In Phoenix, this may look like:

<pre class="codeBox">
// If we know what the value is now, we just supply it:
records_map[...] = phoenix::construct_&lt;some_record&gt;( phoenix::arg1, some_value );

// If, however, the value that must be used is to be determined later, we instead pass 
// a reference to a value that may change later ...
records_map[...] = phoenix::construct_&lt;some_record&gt;(
	phoenix::arg1,
	phoenix::var(some_value)
);

// ... or, better yet, we use a Phoenix function object that will determine the value 
// to be used at runtime:
records_map[...] = phoenix::construct_&lt;some_record&gt;(
	phoenix::arg1,
	some_function_object( /*Arguments to be passed, if any.*/ )
);
</pre>

<span class="smallText">
[i] Phoenix V2 is currently very close to being released, and it should soon be put on Boost's review queue.  For information on Phoenix V1 see <A href="http://www.boost.org/libs/spirit/phoenix/index.html" target="_blank">http://www.boost.org/libs/spirit/phoenix/index.html</A>.<br>
[ii] It is also possible for boost::function&lt;...&gt; to only hold a reference to a function object.  More information can be found in Boost.Function's documentation.
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
