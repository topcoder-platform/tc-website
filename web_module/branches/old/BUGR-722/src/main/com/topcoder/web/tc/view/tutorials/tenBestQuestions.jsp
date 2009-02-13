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
 
<span class="bigTitle">The Best Questions for Would-be C++ Programmers, Part 1</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22630158" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>It seems that an almost obligatory and very important part of the recruitment process is "the test." "The test" can provide information both for the interviewer and the candidate. The interviewer is provided with a means to test the candidate's practical know-how and particular programming language understanding; the candidate can get an indication of the technologies used for the job and the level of proficiency the company expects and even decide if he still wants (and is ready for) the job in question.</p>
<p>I've had my fair share of interviews, more or less successful, and I would like to share with you my experience regarding some questions I had to face. I also asked for feedback from three of the top rated TopCoder members: <tc-webtag:handle coderId="251074" context="algorithm"/>, <tc-webtag:handle coderId="152342" context="algorithm"/> and <tc-webtag:handle coderId="275640" context="algorithm"/> , who were kind enough to correct me where I was not accurate (or plain wrong) and suggest some other questions (that I tried to answer to my best knowledge). Of course every question might have alternative answers that I did not manage to cover, but I tried to maintain the dynamics of an interview and to let you also dwell on them (certainly I'm not the man that knows all the answers).  So, pencils up everyone and "let's identify potential C++ programmers or C++ programmers with potential."</p>
<ol>
    <li><strong>What is a class?</strong>
        <ul>
            <li>A <strong>class</strong> is a way of encapsulating data, defining abstract data types along with initialization conditions and operations allowed on that data; a way of hiding the implementation (hiding the guts &amp; exposing the skin); a way of sharing behavior and characteristics</li>
        </ul>
    </li>
    <li><strong>What are the differences between a C struct and a C++ struct?</strong>
        <ul>
            <li>A C <strong>struct</strong> is just a way of combining data together; it only has characteristics (the data) and does not include behavior (functions may use the structure but are not tied up to it)</li>
            <li>Typedefed names are not automatically generated for C structure tags; e.g.,:
                <pre>
<font color="green">// a C struct</font>
<font color="blue">struct</font> my_struct {
    <font color="blue">int</font> someInt;
    <font color="blue">char*</font> someString;
};

<font color="green">// you declare a variable of type my_struct in C</font>
<font color="blue">struct</font> my_struct someStructure;

<font color="green">// in C you have to typedef the name to easily
// declare the variable</font>
<font color="blue">typedef</font> my_struct MyStruct;
MyStruct someOtherStuct;

<font color="green">// a C++ struct</font>
<font color="blue">struct</font> MyCppStruct {
    int someInt;
    char* someString;
};

<font color="green">// you declare a variable of type MyCppStruct in C++</font>
MyCppStruct someCppStruct;
<font color="green">// as you can see the name is automatically typedefed</font></pre></li>
            <li>But what's more important is that a C <strong>struct</strong> does not provide enablement for OOP concepts like encapsulation or polymorphism. Also <strong>"C structs can't have static members or member functions"</strong>, [<tc-webtag:handle coderId="251074" context="algorithm"/>]. A C++ <strong>struct</strong> is actually a <strong>class</strong>, the difference being that the default member and base class access specifiers are different: <strong>class</strong> defaults to private whereas <strong>struct</strong> defaults to public.</li>
        </ul>
    </li>
    <li><strong>What does the keyword const mean and what are its advantages over #define?</strong>
        <ul>
            <li>In short and by far not complete, <strong>const</strong> means <strong>"read-only"</strong>! A named constant (declared with <strong>const</strong>) it's like a normal variable, except that its value cannot be changed. Any data type, user-defined or built-in, may be defined as a <strong>const</strong>, e.g.,:
                <pre>
<font color="green">// myInt is a constant (read-only) integer</font>
<font color="blue">const int</font> myInt = 26; 

<font color="green">// same as the above (just to illustrate const is
// right and also left associative)</font>
<font color="blue">int const</font> myInt = 26; 

<font color="green">// a pointer to a constant instance of custom 
// type MyClass</font>
<font color="blue">const</font> MyClass* myObject = <font color="blue">new</font> MyObject();

<font color="green">// a constant pointer to an instance of custom 
// type MyClass</font>
MyClass* <font color="blue">const</font> myObject = <font color="blue">new</font> MyObject();

<font color="green">// myInt is a constant pointer to a constant integer</font>
<font color="blue">const int</font> someInt = 26;
<font color="blue">const int</font>* <font color="blue">const</font> myInt = &someInt;</pre></li>
            <li><strong>#define</strong> is error prone as it is not enforced by the compiler like <strong>const</strong> is. It merely declares a substitution that the preprocessor will perform without any checks; that is <strong>const</strong> ensures the correct type is used, whereas <strong>#define</strong> does not. "Defines" are harder to debug as they are not placed in the symbol table.</li>
            <li>A constant has a scope in C++, just like a regular variable, as opposed to "defined" names that are globally available and may clash. A constant must also be defined at the point of declaration (must have a value) whereas "defines" can be "empty."</li>
            <li>Code that uses <strong>const</strong> is inherently protected by the compiler against inadvertent changes: e.g., to a class' internal state (<strong>const</strong> member variables cannot be altered, <strong>const</strong> member functions do not alter the class state); to parameters being used in methods (<strong>const</strong> arguments do not have their values changed within methods) [<tc-webtag:handle coderId="275640" context="algorithm"/>]. A named constant is also subject for compiler optimizations.</li>
            <li>In conclusion, you will have fewer bugs and headaches by preferring <strong>const</strong> to <strong>#define</strong>.</li>
        </ul>
    </li>
    <li><strong>Can you explain the private, public and protected access specifiers?</strong>
        <ul>
            <li><strong>public</strong>: member variables and methods with this access specifier can be directly accessed from outside the class</li>
            <li><strong>private</strong>: member variables and methods with this access specifier cannot be directly accessed from outside the class</li>
            <li><strong>protected</strong>: member variables and methods with this access specifier cannot be directly accessed from outside the class with the exception of child classes</li>
            <li>These access specifiers are also used in inheritance (that's a whole other story, see next question). You can inherit publicly, privately or protected (though I must confess, I cannot see the benefits of the latter).</li>
        </ul>
    </li>
    <li><strong>Could you explain public and private inheritance?[<tc-webtag:handle coderId="152342" context="algorithm"/>, <tc-webtag:handle coderId="275640" context="algorithm"/>]</strong>
        <ul>
            <li>Public inheritance is the "default" inheritance mechanism in C++ and it is realized by specifying the public keyword before the base class
                <pre>
<font color="blue">class</font> B : <font color="blue">public</font> A
{
};</pre></li>
            <li>Private inheritance is realized by specifying the private keyword before the base class or omitting it completely, as private is the default specifier in C++
                <pre>
<font color="blue">class</font> B : <font color="blue">private</font> A 
{
};
or
<font color="blue">class</font> B : A 
{
};</pre></li>
            <li>The public keyword in the inheritance syntax means that the publicly/protected/privately accessible members inherited from the base class stay public/protected/private in the derived class; in other words, the members maintain their access specifiers. The private keyword in the inheritance syntax means that all the base class members, regardless of their access specifiers, become private in the derived class; in other words, private inheritance degrades the access of the base class' members - you won't be able to access public members of the base class through the derived one (in other languages, e.g., Java, the compiler won't let you do such a thing).</li>
            <li>From the relationship between the base and derived class point of view, 
                <pre>
<font color="blue">class</font> B : <font color="blue">public</font> A {}; B <strong>"is a"</strong> A but <font color="blue">class</font> B : private A {};</pre> means B <strong>"is implemented in terms of"</strong> A.</li>
            <li>Public inheritance creates subtypes of the base type. If we have <font color="blue">class</font> B : <font color="blue">public</font> A {}; then any B object is substituteable by its base calls object (through means of pointers and references) so you can safely write
                <pre>A* aPointer = <font color="blue">new</font> B();</pre> Private inheritance, on the other hand, <font color="blue">class</font> B : <font color="blue">private</font> A {};, does not create subtypes making the base type inaccessible and is a form of object composition. The following illustrates that:
                <pre>
<font color="blue">class</font> A 
{
<font color="blue">public</font>:
    A();
    ~A();
    <font color="blue">void</font> doSomething();
};

<font color="blue">void</font> A :: doSomething()
{

}

<font color="blue">class</font> B : <font color="blue">private</font> A 
{
public:
    B();
    ~B();
};
B* beePointer = <font color="blue">new</font> B();

<font color="red">// ERROR! compiler complains that the 
// method is not accessible</font>
beePointer->doSomething();
<font color="red">// ERROR! compiler complains that the 
// conversion from B* to A* exists but
// is not accessible</font>
A* aPointer = <font color="blue">new</font> B();
<font color="red">// ! for the following two the standard
// stipulates the behavior as undefined;
// the compiler should generate an error at least
// for the first one saying that B is not a
// polymorphic type</font>
A* aPointer2 = dynamic_cast&lt;A*&gt;(beePointer);
A* aPointer3 = reinterpret_cast&lt;A*&gt;(beePointer);</pre></li>
        </ul>
    </li>
    <li><strong>Is the "friend" keyword really your friend?[<tc-webtag:handle coderId="275640" context="algorithm"/>]</strong>
        <ul>
            <li>The <strong>friend</strong> keyword provides a convenient way to let specific nonmember functions or classes to access the private members of a class</li>
            <li>friends are part of the class interface and may appear anywhere in the class (class access specifiers do not apply to friends); friends must be explicitly declared in the declaration of the class; e.g., :
                <pre>
<font color="blue">class</font> Friendly;

<font color="green">// class that will be the friend</font>
<font color="blue">class</font> Friend 
{
<font color="blue">public</font>:
    <font color="blue">void</font> doTheDew(Friendly&amp; obj);
};

<font color="blue">class</font> Friendly 
{
    <font color="red">// friends: class  and function; may appear
    // anywhere but it's 
    // better to group them toghether;
    // the default private access specifier does
    // not affect friends</font>
    <font color="blue">friend class</font> Friend;
    <font color="blue">friend void</font> friendAction(Friendly&amp; obj);
<font color="blue">public</font>:
    Friendly(){ };
    ~Friendly(){ };
<font color="blue">private</font>:
    <font color="blue">int</font> friendlyInt;
};

<font color="red">// the methods in this class can access
// private members of the class that declared
// to accept this one as a friend</font>
<font color="blue">void</font> Friend :: doTheDew(Friendly&amp; obj) {
    obj.friendlyInt = 1;
}

<font color="red">// notice how the friend function is defined
// as any regular function</font>
<font color="blue">void</font> friendAction(Friendly&amp; obj)
{
    <font color="red">// access the private member</font>
    <font color="blue">if</font>(1 == obj.friendlyInt)
    {
        obj.friendlyInt++;
    } <font color="blue">else</font> {
        obj.friendlyInt = 1;
    }
}</pre></li>
            <li>"friendship isn't inherited, transitive or reciprocal," that is, your father's best friend isn't your friend; your best friend's friend isn't necessarily yours; if you consider me your friend, I do not necessarily consider you my friend.</li>
            <li>Friends provide some degree of freedom in a class' interface design. Also in some situations friends are syntactically better, e.g., operator overloading - binary infix arithmetic operators, a function that implements a set of calculations (same algorithm) for two related classes, depending on both (instead of duplicating the code, the function is declared a friend of both; classic example is Matrix * Vector multiplication).</li>
            <li>And to really answer the question, yes, <strong>friend</strong> keyword is indeed our friend but always "prefer member functions over nonmembers for operations that need access to the representation."[Stroustrup]</li>
        </ul>
    </li>
    <li><strong>For a class MyFancyClass { }; what default methods will the compiler generate?</strong>
        <ul>
            <li>The default constructor with no parameters</li>
            <li>The destructor</li>
            <li>The copy constructor and the assignment operator</li>
            <li>All of those generated methods will be generated with the <strong>public</strong> access specifier</li>
            <li>E.g. MyFancyClass{ }; would be equivalent to the following :
                <pre>
<font color="blue">class</font> MyFancyClass 
{
<font color="blue">public</font>:
    <font color="green">// default constructor</font>
    MyFancyClass(); 
    <font color="green">// copy constructor</font>
    MyFancyClass(<font color="blue">const</font> MyFancyClass&amp;); 
    <font color="green">// destructor</font>
    ~MyFancyClass(); 

    
    <font color="green">// assignment operator</font>
    MyFancyClass&amp; <font color="blue">operator</font>=(<font color="blue">const</font> MyFancyClass&amp;); 
};
</pre></li>
            <li>All of these methods are generated only if needed</li>
            <li>The default copy constructor and assignment operator perform <strong>memberwise</strong> copy construction/assignment of the non-static data members of the class; if references or constant data members are involved in the definition of the class the assignment operator is not generated (you would have to define and declare your own, if you want your objects to be assignable)</li>
            <li>I was living under the impression that the unary &amp; (address of operator) is as any built-in operator - works for built-in types; why should the built-in operator know how to take the address of your home-brewed type? I thought that there's no coincidence that the "&" operator is also available for overloading (as are +, -, &gt;, &lt; etc.) and it's true is not so common to overload it, as you can live with the one generated by the compiler that looks like the following:
            <pre>
<font color="blue">inline</font> SomeClass* SomeClass::<font color="blue">operator</font>&amp;() 
{
    <font color="blue">return this</font>;
}</pre></li>
        </ul>
        <p>Thanks to <tc-webtag:handle coderId="251074" context="algorithm"/> for making me doubt what seemed the obvious. I found out the following:</p>
        <p><strong>From the ISO C++ standard:</strong><br />
        Clause 13.5/6 [over.oper] states that operator =, (unary) &amp; and , (comma) have a predefined meaning for each type. Clause 5.3.1/2 [expr.unary.op] describes the meaning of the address-of operator. No special provisions are mode for class-type objects (unlike in the description of the assignment expression). Clause 12/1 [special] lists all the special member functions, and states that these will be implicitly declared if needed. The address-of operator is not in the list.<br />
        <strong>From Stroustrup's The C++ Programming Language - Special 3rd Edition:</strong><br />
        "Because of historical accident, the operators = (assignment), &amp; (address-of), and , (sequencing) have predefined meanings when applied to class objects. These predefined meanings can be made inaccessible to general users by making them private:... Alternatively, they can be given new meanings by suitable definitions."<br />
        <strong>From the second edition of Meyer's Effective C++:</strong><br />
        "A class declaring no operator& function(s) does NOT have them implicitly declared. Rather, compilers use the built-in address-of operator whenever "&" is applied to an object of that type. This behavior, in turn, is technically  not an application of a global operator& function.  Rather, it is a use of a built-in operator." In the errata <a target="_blank" href="http://www.aristeia.com/BookErrata/ec++2e-errata_frames.html">http://www.aristeia.com/BookErrata/ec++2e-errata_frames.html</a></p>
    </li>
    <li><strong>How can you force the compiler not to generate the above mentioned methods?</strong>
        <ul>
            <li>Declare and define them yourself - the ones that make sense in your class' context. The default no-parameters constructor will not be generated if the class has at least one constructor with parameters declared and defined.</li>
            <li>Declare them private - disallow calls from the outside of the class and DO NOT define them (do not provide method bodies for them) - disallow calls from member and friend functions; such a call will generate a linker error.</li>
        </ul>
    </li>
    <li><strong>What is a constructor initialization list?</strong>
        <ul>
            <li>A <strong>special</strong> initialization point in a constructor of a class (initially developed for use in inheritance).</li>
            <li>Occurs only in the definition of the constructor and is a list of constructor calls separated by commas.</li>
            <li>The initialization the constructor initialization list performs occurs before any of the constructor's code is executed - very important point, as you'll have access to fully constructed member variables in the constructor!</li>
            <li>For example:
                <pre>
<font color="green">// a simple base class just for illustration purposes</font>
<font color="blue">class</font> SimpleBase
{
<font color="blue">public</font>:
    SimpleBase(string&amp;);
    ~SimpleBase();
<font color="blue">private</font>:
    string&amp; m_name;
};

<font color="green">// example of initializer list with a call to the
// data member constructor</font>
SimpleBase :: SimpleBase(string&amp; name) : m_name(name)
{

}

<font color="green">// a class publicly derived from SimpleBase just for 
// illustration purposes</font>
<font color="blue">class</font> MoreComplex : <font color="blue">public</font> SimpleBase
{
<font color="blue">public</font>:
    MoreComplex(string&amp;, vector&lt;<font color="blue">int</font>&gt;*, <font color="blue">long</font>);
    ~MoreComplex();
<font color="blue">private</font>:
    vector&lt;int</font>&gt;* m_data;
    <font color="green">const long</font> m_counter;
};


<font color="green">// example of initializer list with calls to the base 
// class constructor and data member constructor;
// you can see that built-in types can also be
// constructed here</font>
MoreComplex :: MoreComplex(string &amp;name, 
    vector&lt;<font color="blue">int</font>&gt;* someData, <font color="blue">long</font> counter) :
    SimpleBase(name), m_data(someData),
    m_counter(counter)
{
    
}</pre></li>
            <li>As you saw in the above example, built-in types can also be constructed as part of the constructor initialization list.</li>
            <li>Of course you do not have to use the initialization list all the time (see the next question for situations that absolutely require an initialization list) and there are situations that are not suitable for that: e.g., you have to test one of the constructor's arguments before assigning it to your internal member variable and throw if not appropriate.</li>
            <li>It is recommended that the initialization list has a consistent form: first the call to the base class(es) constructor(s), and then calls to constructors of data members in the order they were specified in the class' declaration .  Note that this is just a matter of coding style: you declare your member variables in a certain order and it will look good and consistent to initialize them in the same order in the initialization list.</li>
        </ul>
    </li>
    <li><strong>When "must" you use a constructor initialization list?</strong>
        <ul>
            <li><strong>Constant</strong> and <strong>reference</strong> data members of a class may only be initialized, never assigned, so you <strong>must</strong> use a constructor initialization list to properly construct (initialize) those members.</li>
            <li>In inheritance, when the base class does not have a default constructor or you want to change a default argument in a default constructor, you have to explicitly call the base class' constructor in the initialization list.</li>
            <li>For reasons of correctness - any calls you make to member functions of sub-objects (used in composition) go to initialized objects.</li>
            <li>For reasons of efficiency. Looking at the previous question example we could rewrite the SimpleBase constructor as follows:
                <pre>
SimpleBase :: SimpleBase(string &amp;name)
{
    m_name = name;
}</pre></li>
        </ul>
        <p>The above will generate a call to the default string constructor to construct the class member m_name and then the assignment operator of the string class to assign the name argument to the m_name member. So you will end up with two calls before the data member m_name is fully constructed and initialized.</p>
            <pre>
SimpleBase :: SimpleBase(string &amp;name) : m_name(name)
{

}</pre>
        <p>The above will only generate a single call, which is to the copy constructor of the string class, thus being more efficient.</p>
    </li>
</ol>

<p>That's it for the first part of this installment. Stay tuned for the <a href="/tc?module=Static&d1=tutorials&d2=tenBestQuestions2">second one</a>, as we're going to go deeper into the language features. Good luck on those interviews!</p>
<br />

<h3>References</h3>
<p>[1] - Bjarne Stroustrup - The C++ Programming Language Special 3rd Edition<br />
[2] - Stanley B. Lippman, Josee Lajoie, Barbara E. Moo   - C++ Primer<br />
[3] - <a target="_blank" href="http://www.parashift.com/c++-faq-lite/">C++ FAQ Lite</a><br />
[4] Herb Sutter - Exceptional C++: 47 Engineering Puzzles, Programming Problems, and Solutions<br />
[5] Scott Meyers - Effective C++: 55 Specific Ways to Improve Your Programs and Designs<br />
[6] Scott Meyers - More Effective C++: 35 New Ways to Improve Your Programs and Designs<br />
[7] Bruce Eckel - Thinking in C++, Volume 1: Introduction to Standard C++</p>


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

