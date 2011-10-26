<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.math
{
   font-family: times, times new roman, serif;
   font-weight: normal;
   font-style: italic;
   font-size: 15px;
}
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   font-size: 13px;
   font-weight: normal;
   line-height: 14px;
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
            <jsp:param name="node" value="algo_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="alg_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="518480" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">The Best Questions for Would-be C++ Programmers, Part 2</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22630158" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p><a href="/tc?module=Static&d1=tutorials&d2=tenBestQuestions">... read Part 1</a></p>
<p>In the second part of this installment we'll tackle some questions regarding more advanced features of the language (the experienced C++ programmers will consider some of these more on the basic side). So let's get to it and work on the second part of this "interview".</p>
<ol>
    <li><strong>What are virtual functions?</strong>
        <ul>
            <li>Virtual functions represent the mechanism through which C++ implements the OO concept of polymorphism. Virtual functions allow the programmer to redefine in each derived class functions from the base class with altered behavior so that you can call the right function for the right object (allow to perform the right operation for an object through only a pointer/reference to that object's base class)</li>
            <li>A member function is declared virtual by preceding its declaration (not the definition) with the <strong>virtual</strong> keyword
                <pre>
<font color="blue">class</font> Shape  
{
<font color="blue">public</font>:
    ...
    <font color="green">//a shape can be drawn in many ways</font>
    <font color="blue">virtual void</font> draw(){ };
};</pre>
"A virtual function must be defined for the class in which it is first declared ..." [Stroustrup]. The redefinition of a virtual function in a derived class is called <strong>overriding</strong> (complete rewrite) or <strong>augmentation</strong> (rewrite but with a call to the base class function)
                <pre>
<font color="blue">class</font> Rectangle : <font color="blue">public</font> Shape 
{
<font color="blue">public</font>:
    ...
    <font color="blue">void</font> draw() { };
};

<font color="blue">class</font> Square : <font color="blue">public</font> Rectangle
{
<font color="blue">public</font>:
    ...
    <font color="blue">void</font> draw() { };
};
    ...

Shape* theShape = <font color="blue">new</font> Square();
<font color="red">// with the help of virtual functions
// a Square will be drawn and not
// a Rectangle or any other Shape</font>
theShape->draw();</pre></li>
            <li>Through virtual functions C++ achieves what is called <strong>late binding</strong> (dynamic binding or runtime binding), that is actually connecting a function call to a function body at runtime based on the type of the object and not at compilation time (static binding)  <strong>(**)</strong></li>
        </ul>
    </li>
    <li><strong>What is a virtual destructor and when would you use one?</strong>
        <ul>
            <li>A virtual destructor is a class' destructor conforming to the C++'s polymorphism mechanism; by declaring the destructor virtual you ensure it is placed in the <strong>VTABLE</strong> of the class and it will be called at proper times</li>
            <li>You make a class' destructor virtual to ensure proper clean-up when the class is supposed to be subclassed to form a hierarchy and you want to delete a derived object thorough a pointer to it (the base class)</li>
            <li>E.g. :
                <pre>
<font color="blue">#include</font> <font color="brown">&lt;vector&gt;</font>
<font color="blue">#include</font> <font color="brown">&lt;iostream&gt;</font>

<font color="blue">using namespace</font> std;

<font color="blue">class</font> Base
{
<font color="blue">public</font>:
    Base(<font color="blue">const char</font>* name);
    <font color="red">// warning! the destructor should be virtual</font>
    ~Base();

    <font color="blue">virtual void</font> doStuff();
<font color="blue">private</font>:
    <font color="blue">const char</font>* m_name;
};

Base :: Base(<font color="blue">const char</font>* name) : m_name(name)
{

}

Base :: ~Base()
{

}



<font color="blue">void</font> Base :: doStuff()
{
    cout &lt;&lt; <font color="brown">"Doing stuff in Base"</font> &lt;&lt; endl;
}



<font color="blue">class</font> Derived : <font color="blue">public</font> Base
{
<font color="blue">public</font>:
    Derived(<font color="blue">const char</font>* name);
    ~Derived();

<font color="blue">virtual void</font> doStuff();
<font color="blue">private</font>:
    vector&lt;<font color="blue">int</font>&gt;* m_charCodes;
};

Derived :: Derived(<font color="blue">const char</font>* name) : Base(name)
{
    m_charCodes = <font color="blue">new</font> vector&lt;<font color="blue">int</font>&gt;;
} 

Derived :: ~Derived()
{
    <font color="blue">delete</font> m_charCodes;
}

<font color="blue">void</font> Derived :: doStuff() 
{
    cout &lt;&lt; <font color="brown">"Doing stuff in Derived"</font> &lt;&lt; endl;
}

<font color="blue">int</font> main(<font color="blue">int</font> argc, <font color="blue">char</font>* argv[])
{
    <font color="green">// assign the derived class object pointer to
    // the base class pointer</font>
    <font color="blue">char</font>* theName = <font color="brown">"Some fancy name"</font>;
    Base* b = <font color="blue">new</font> Derived(theName);

    <font color="green">// do some computations and then delete the
    // pointer</font>
    <font color="blue">delete</font> b;
    <font color="blue">return</font> 0;
}</pre>
What will happen in our rather lengthy example? Everything seems OK and most of the available C++ compilers will not complain about anything <strong>(*)</strong>. Nevertheless there is something pretty wrong here. The C++ standard is clear on this topic: <strong>when you want to delete a derived class object through a base class pointer and the destructor of the base class is not virtual the result is undefined</strong>. That means you're on your own from there and the compiler won't help you! What is the most often behavior in such situations is that the derived class' destructor is never called and parts of your derived object are left undestroyed. In the example above you will leave behind a memory leak, the m_charCodes member will not be destroyed because the destructor ~Derived() will not be called
            </li>
            <li>A thing to notice is that declaring all destructors virtual is also pretty inefficient and not advisable. That makes sense (declaring the destructor virtual) only if your class is supposed to be part of a hierarchy as a base class, otherwise you'll just waste memory with the class' <strong>vtable</strong> generated only for the destructor. So declare a virtual destructor in a class <strong>"if and only if that class is part of a class hierarchy, containing at least one virtual function. In other words, it is not necessary for the class itself to have that virtual function - it is sufficient for one of its descendents to have one."[<tc-webtag:handle coderId="152342" context="algorithm"/>]</strong></li>
        </ul>
    <li><strong>How do you implement something along the lines of Java interfaces in C++?[<tc-webtag:handle coderId="152342" context="algorithm"/>]</strong>
        <ul>
            <li>C++ as a language does not support the concept of "interfaces" (as opposed to other languages like Java or D for example), but it achieves something similar through <strong>Abstract Classes</strong></li>
            <li>You obtain an abstract class in C++ by declaring at least one <strong>pure virtual function</strong> in that class. A virtual function is transformed in a pure virtual with the help of the initializer <strong>"= 0"</strong>. A pure virtual function does not need a definition. An abstract class cannot be instantiated but only used as a base in a hierarchy
                <pre>
<font color="blue">class</font> MySillyAbstract
{
<font color="blue">public</font>:
    <font color="green">// just declared not defined</font>
    <font color="green">virtual void</font> beSilly() = 0;
};</pre>
A derivation from an abstract class must implement all the pure virtuals, otherwise it transforms itself into an abstract class</li>
            <li>You can obtain an <strong>"interface"</strong> in C++ by declaring an abstract class with all the functions pure virtual functions and public and no member variables - only behavior and no data
                <pre>
<font color="blue">class</font> IOInterface
{
<font color="blue">public</font>:
    <font color="blue">virtual int</font> open(<font color="blue">int</font> opt) = 0;
    <font color="blue">virtual int</font> close(<font color="blue">int</font> opt) = 0;
    <font color="blue">virtual int</font> read(<font color="blue">char</font>* p, <font color="blue">int</font> n) = 0;
    <font color="blue">virtual int</font> write(<font color="blue">const char</font>* p, <font color="blue">int</font> n) = 0;
};</pre>
[adapted after an example found in Stroustup The C++ Programming Language 3rd Edition]<br />In this way you can specify and manipulate a variety of IO devices through the interface.</li>
        </ul>
    </li>
    <li><strong>Could you point out some differences between pointers and references?</strong>
        <ul>
            <li>A reference must always be initialized because the object it refers to already exists; a pointer can be left uninitialized (though is not recommended)</li>
            <li>There's no such thing a s a <strong>"NULL reference"</strong> because a reference must always refer to some object, so the "no object" concept makes no sense; pointers, as we all know, can be <strong>NULL</strong></li>
            <li>References can be more efficient, because there's no need to test the validity of a reference before using it (see above comment); pointers most often have to be tested against <strong>NULL</strong> to ensure there are valid objects behind them</li>
            <li>Pointers may be reassigned to point to different objects (except constant pointers, of course), but references cannot be (references are "like" constant pointers that are automatically dereferenced by the compiler)</li>
            <li>References are tied to someone else's storage (memory) while pointers have their own storage they account for</li>
            <li>One would use the dot operator <strong>"."</strong> to access members of references to objects, however to access members of pointers to objects one uses the arrow <strong>"->"[<tc-webtag:handle coderId="275640" context="algorithm"/>]</strong></li>
        </ul>
    </li>
    <li><strong>When would you use a reference?</strong>
        <ul>
            <li>You should use a <strong>reference</strong> when you certainly know you have something to refer to, when you never want to refer to anything else and when implementing operators whose syntactic requirements make the use of pointers undesirable; in all other cases, "stick with pointers"</li>
            <li>Do not use references just to reduce typing. That (and that being the sole reason) is not an appropriate usage of the  reference concept in C++; using references having in mind just the reason of reduced typing would lead you to a "reference spree" - it must be clear in one's mind when to use references and when to use pointers; overusing any of the two is an inefficient path</li>
        </ul>
    </li>
    <li><strong>Can you point out some differences between new &amp; malloc?</strong>
        <ul>
            <li><strong>"new"</strong> is an operator built-in into the C++ language, <strong>"malloc"</strong> is a function of the C standard library</li>
            <li><strong>"new"</strong> is aware of constructors/destructors, <strong>"malloc"</strong> is not; e.g. :
                <pre>
string* array1 = <font color="blue">static_cast</font>&lt;string*&gt;(malloc(10 * <font color="blue">sizeof</font>(string)));
free(array1);</pre>
<strong>array1</strong> in the above example points to enough memory to hold 10 strings but no objects have been constructed and there's no easy and clean (proper) way from OO point of view to initialize them (see the question about <strong>placement new</strong> - in most day to day programming tasks there's no need to use such techniques). The call to <strong>free()</strong> deallocates the memory but does not destroy the objects (supposing you managed to initialize them).
                <pre>
string* array2 = <font color="blue">new</font> string[10];
<font color="blue">delete</font>[] array2;</pre>
on the other hand <strong>array2</strong> points to 10 fully constructed objects (they have not been properly initialized but they are constructed), because <strong>"new"</strong> allocates memory and also calls the <strong>string</strong> default constructor for each object. The call to the <strong>delete</strong> operator deallocates the memory and also destroys the objects</li>
            <li>You got to remember to always use <strong>free()</strong> to release memory allocated with <strong>malloc()</strong> and <strong>delete</strong> (or the array correspondent <strong>delete[]</strong>) to release memory allocated with <strong>new</strong> (or the array correspondent <strong>new[]</strong>)</li>
        </ul>
    </li>
    <li><strong>What are the differences between "operator new" and the "new" operator?</strong>
        <ul>
            <li><strong>"new"</strong> is an operator built into the language and it's meaning cannot be changed; <strong>"operator new"</strong> is a function and manages <strong>how</strong> the <strong>"new"</strong> operator allocates memory its signature being: <strong>void* operator new(size_t size)</strong></li>
            <li>The <strong>"new"</strong> operator is allowed to call a constructor, because <strong>new</strong> has 2 major steps in achieving its goals : in step 1 it allocates enough memory using <strong>"operator new"</strong> and then in step 2 calls the constructor(s) to construct the object(s) in the memory that was allocated</li>
            <li><strong>"operator new"</strong> can be overridden meaning that you can change the way the <strong>"new"</strong> operator allocates memory, that is the mechanism, but not the way the <strong>"new"</strong> operator behaves, that is it's policy(semantics) , because what <strong>"new"</strong> does is fixed by the language</li>
        </ul>
    </li>
    <li><strong>What is "placement new"?</strong>
        <ul>
            <li>A special form of constructing an object in a given allocated zone of memory</li>
            <li>The caller already knows what the pointer to the memory should be, because it knows where is supposed to be placed. <strong>"placement new"</strong> returns the pointer that's passed into it</li>
            <li>Usage of <strong>"placement new"</strong> implies an explicit call to the object's destructor when the object is to be deleted, because the memory was allocated/obtained by other means than the standard <strong>"new"</strong> operator allocation</li>
            <li>E.g. :
                <pre>
<font color="red">// supposing a "buffer" of memory large enough for 
// the object we want to construct was 
// previously allocated using malloc</font>
MyClass* myObject = <font color="blue">new</font> (buffer) MyClass(string&amp; name);


<font color="red">// !!ERROR</font>
<font color="blue">delete</font> myObject;
<font color="red">// the correct way is</font>
myObject->~MyClass();
<font color="red">// then the "buffer" must also be properly
// deallocated</font>
free(buffer);</pre></li>
        </ul>
    </li>
    <li><strong>What is a "virtual constructor"?[<tc-webtag:handle coderId="152342" context="algorithm"/>]</strong>
        <ul>
            <li>There is no such thing as a virtual constructor in C++ simply because you need to know the exact type of the object you want to create and virtual represent the exact opposite concept <strong>(***)</strong></li>
            <li>But using an indirect way to create objects represents what is known as <strong>"Virtual Constructor Idiom"</strong>. For example you could implement a <strong>clone()</strong> function as an indirect copy constructor or a <strong>create()</strong> member function as an indirect default constructor (<a target="_blank" href="http://www.parashift.com/c++-faq-lite/">C++ FAQ Lite</a>)</li>
            <li>The GoF calls a variant of this idiom the Factory Method Pattern - "define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses". A concrete example will speak for itself:<br />
                <div align="center"><img src="/i/education/alg_tenBestQuestions.png" /><br /><strong>[Created using the <a href="/tc?module=Static&d1=dev&d2=umltool&d3=description&node=des_uml_tool">TopCoder UML Tool</a>]</strong></div>
                <pre>
<font color="green">// Product</font>
<font color="blue">class</font> Page
{
};

<font color="green">// ConcreteProduct</font>
<font color="blue">class</font> SkillsPage : <font color="blue">public</font> Page
{
};

<font color="green">// ConcreteProduct</font>
<font color="blue">class</font> ExperiencePage : <font color="blue">public</font> Page
{
};

<font color="green">// ConcreteProduct</font>
<font color="blue">class</font> IntroductionPage : <font color="blue">public</font> Page
{
};

<font color="green">// ConcreteProduct</font>
<font color="blue">class</font> TableOfContentsPage : <font color="blue">public</font> Page
{
};

<font color="green">// Creator</font>
<font color="blue">class</font> Document
{
<font color="green">// Constructor calls abstract Factory method</font>
<font color="blue">public</font>:
    Document();

    <font color="green">// Factory Method</font>
    <font color="blue">virtual void</font> CreatePages() { };
<font color="blue">protected</font>:
    std::list&lt;Page*&gt; thePageList;
};

Document :: Document()
{
    CreatePages();
};

<font color="green">// ConcreteCreator</font>
<font color="blue">class</font> Resume : public Document
{
<font color="blue">public</font>:
    <font color="green">// Factory Method implementation</font>
    <font color="blue">void</font> CreatePages();
};

<font color="green">// Factory Method implementation</font>
<font color="blue">void</font> Resume :: CreatePages()
{
    thePageList.push_back(<font color="blue">new</font> SkillsPage());
    thePageList.push_back(<font color="blue">new</font> ExperiencePage());
}

<font color="green">// ConcreteCreator</font>
<font color="blue">class</font> Report : <font color="blue">public</font> Document
{
<font color="blue">public</font>:
    <font color="green">// Factory Method implementation</font>
    <font color="blue">void</font> CreatePages();
};

<font color="green">// Factory Method implementation</font>
<font color="blue">void</font> Report :: CreatePages()
{
    thePageList.push_back(<font color="blue">new</font> TableOfContentsPage());
    thePageList.push_back(<font color="blue">new</font> IntroductionPage());
}

<font color="blue">int</font> main(<font color="blue">int</font> argc, <font color="blue">char</font>* argv[])
{
    <font color="green">// Note: constructors call Factory Method</font>
    vector&lt;Document*&gt; documents(2);
    documents[0] = <font color="blue">new</font> Resume();
    documents[1] = <font color="blue">new</font> Report();

    <font color="blue">return</font> 0;
}</pre></li>
        </ul>
    </li>
    <li><strong>What is RAII?</strong>
        <ul>
            <li><strong>RAII</strong> - <strong>R</strong>esource <strong>A</strong>cquisition <strong>I</strong>s <strong>I</strong>nitialization - is a C++ technique (but not limited to the C++ language) that combines acquisition and release of resources with initialization and uninitialization of variables</li>
            <li>E.g. :
                <pre>
<font color="green">// this is a hypothetic LogFile class using an
// hypothetic File class just for the illustration 
// of the technique</font>
<font color="blue">class</font> LogFile
{
<font color="blue">public</font>:
    LogFile(<font color="blue">const char</font>*);
    ~LogFile();

    <font color="blue">void</font> write(<font color="blue">const char</font>*);
<font color="blue">private</font>:
    File* m_file;
};

LogFile :: LogFile(<font color="blue">const char</font>* fileName) : 
<font color="red">// ! acquisition and initialization</font>
m_file(OpenFile(fileName))
{
    <font color="blue">if</font>(NULL == m_file) 
    {
        <font color="blue">throw</font> FailedOpenException();
    }
}

LogFile :: ~LogFile()
{
    <font color="red">// ! release and uninitialization</font>
    CloseFile(m_file);
}

<font color="blue">void</font> LogFile :: write(<font color="blue">const char</font>* logLine)
{
    WriteFile(m_file, logLine);
}

<font color="green">// a hypothetical usage example</font>
<font color="blue">void</font> SomeClass :: someMethod()
{
    LogFile log(<font color="brown">"log.tx"</font>);
    log.write(<font color="brown">"I've been logged!"</font>);

    <font color="red">// !exceptions can be thrown without
    // worrying about closing the log file
    // or leaking the file resource</font>
    <font color="blue">if</font>(...)
    {
    <font color="blue">throw</font> SomeException();
    }
}</pre></li>
            <li>Without <strong>RAII</strong> each usage of the LogFile class would be also combined with the explicit management of the File resource. Also in the presence of exceptions you would have to be careful and clean-up after yourself, thing that is taken care of with the proper usage of <strong>RAII</strong> as illustrated in the example above</li>
            <li><strong>RAII</strong> is best used with languages that call the destructor for local objects when they go out of scope (implicit support of the technique) like C++. In other languages, like Java & C#, that rely on the garbage collector to destruct local objects, you need finalization routines (e.g. try-finally blocks) to properly use <strong>RAII</strong></li>
            <li>Real usage examples of the technique are the C++ Standard Library's file streams classes and STL's auto_ptr class (to name just very, very few)</li>
        </ul>
    </li>
</ol>

<p>That was it, folks! I hope that even if those questions did not pose any challenges, you still had fun doing/reading this quiz and refreshing your memory on some aspects of the C++ language. Good luck on those interviews!</p>

<h3>Notes</h3>
<p><strong>(*)</strong> <tc-webtag:handle coderId="251074" context="algorithm"/> suggested that my claim is not accurate but I've tested the example on <a target="_blank" href="http://www.microsoft.com/downloads/details.aspx?FamilyId=B2C27A7F-D875-47D5-B226-E2578A116E12&displaylang=en">Windows XP: Visual Studio 2005 Professional Edition</a> (the evaluation one that you can get from the Microsoft site ) did not warn, not even after setting the warnings level to Level 4 (Level 3 is the default one); Mingw compiler based on GCC (that comes with the <a target="_blank" href="http://www.bloodshed.net/">Bloodshed DevCpp</a> version 4.9.9.2) also did not warn (the compiler settings from within the IDE are minimalist; tried to pass -pedantic and -Wextra  to the compiler command line but still no success); <a target="_blank" href="http://www.digitalmars.com/">Digital Mars C++ compiler</a> (dmc) also did not warn with all warnings turned on; Code Warrior Professional Edition 9  does not warn also (this is pretty old, but Metrowerks compilers were renowned for the robustness and standard conformance). So, unless you start digging through the documentation of those compilers to find that right command line switch or start writing the right code, you're in the harms way at least with the "out of the box" installations of these compilers.</p>
<p><strong>(**)</strong> The compiler does all the magic: first, for each class that contains virtual functions (base and derived), the compiler creates a static table called the <strong>VTABLE</strong>. Each virtual function will have a corresponding entry in that table (a function pointer); for the derived classes the entries will contain the overridden virtual functions' pointers. For <strong>each base</strong> class (it's not static, each object will have it) the compiler adds a hidden pointer called the <strong>VPTR</strong>, that will be initialized to point to the beginning of the <strong>VTABLE</strong> - in the derived classes the (same) <strong>VPTR</strong> will be initialized to point to the beginning of the derived class' <strong>VTABLE</strong>. So when "you make a virtual function call through a base class pointer (that is, when you make a polymorphic call), the compiler quietly inserts code to fetch the <strong>VPTR</strong> and look up the function address in the <strong>VTABLE</strong>, thus calling the correct function". This might seem overly complicated but on a typical machine it does not take much space and it's very, very fast as a smart man said once "fetch, fetch call".</p>
<p><strong>(***)</strong> For that and other fine C++ gems go to <a target="_blank" href="http://www.research.att.com/~bs/bs_faq2.html#virtual-ctor">Stroustrup</a>.</p>

<h3>References</h3>
<p>[1] Bjarne Stroustrup - The C++ Programming Language Special 3<sup>rd</sup> Edition<br />
[2] Stanley B. Lippman, Josee Lajoie, Barbara E. Moo - C++ Primer<br />
[3] <a target="_blank" href="http://www.parashift.com/c++-faq-lite/">C++ FAQ Lite</a><br />
[4] Gamma, Helm, Johnson, Vlissides (GoF) - Design Patterns Elements of Reusable Object-Oriented Software<br />
[5] Herb Sutter - Exceptional C++: 47 Engineering Puzzles, Programming Problems, and Solutions<br />
[6] Scott Meyers - Effective C++: 55 Specific Ways to Improve Your Programs and Designs<br />
[7] Scott Meyers - More Effective C++: 35 New Ways to Improve Your Programs and Designs<br />
[8] Bruce Eckel - Thinking in C++, Volume 1: Introduction to Standard C++</p>




<p>&nbsp; </p>

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

