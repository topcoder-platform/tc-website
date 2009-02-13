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
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->   
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>Java for C++ coders, and vice versa</strong></font><br />
                        Tuesday, June 2, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251184"><strong>dplass</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
Three out of the four languages used in TopCoder competitions derive from a common language, C.  
But there are still differences (and similarities) between C++, Java, and C#.  In this feature, I will point 
out the more significant, and interesting, features that distinguish these three languages.   I'll assume 
that you know at least one of these languages well; I myself have used C++ and Java for the last 8 
years but have only competed in Java thus far on TopCoder. 
</p>
<p><span class="bodySubtitle">Primitives</span><br/>
C# and C++ have both signed and unsigned integer classes ranging from 8 to 64 bits.  In Java, all 
integer types are signed.  Traditionally (i.e., in C), the <span class="code">char</span> primitive was an 8-bit data type (i.e. byte); 
Java provides both a signed byte and the <span class="code">char</span> type, which is 16 bits and represents a Unicode 
character. 
</p>
<p>
In addition, in Java, unlike C++, primitives are not first-class objects.  You cannot extend a primitive 
data type in Java, nor can you call methods on a primitive.  Furthermore, as a result, in Java you 
cannot pass a primitive to a method that accepts an <span class="code">Object</span> (or any class that extends <span class="code">Object</span>).  
This becomes a problem in Java collections, which only store <span class="code">Objects</span> (this will change in Java 1.5 
with the addition of generics, see below).
</p>
<p>
To get around these limitations, Java has "wrapper" classes with similar names to the primitives that 
they wrap.  For example, the Integer class wraps int; you can cheaply make an Integer with the int 
that it wraps.   The wrapper classes in Java also provide utility methods and constants that are 
associated with the primitive itself.  For example, <span class="code">Integer.MAX_VALUE</span> is the most positive <span class="code">int</span> (2<sup>31</sup>-1).  
Other very useful methods include <span class="code">Integer</span>.<span class="code">parseInt</span>, which parses a <span class="code">String</span> into an <span class="code">int</span> (aside: why 
doesn't it parse it into an <span class="code">Integer</span>?), and <span class="code">Integer.toBinaryString</span>.
</p>
<p><span class="bodySubtitle">Strings</span><br/>
Java <span class="code">Strings</span> are immutable; another class, <span class="code">StringBuffer</span>, represents a mutable sequence of 
characters.  Unfortunately, string concatenation creates new objects, a classic "memory hog" in Java.  
Happily, near-universal support for the standard <span class="code">toString</span> method allows you to easily convert many 
standard datatypes to strings for printing, debugging or display. 
</p>
<p>
In C++ <span class="code">strings</span> are mutable and adhere to the <span class="code">[]</span> style for both get and set.  This is one of my pet 
peeves about the Java <span class="code">String</span> and <span class="code">StringBuffer</span> classes; you must use awkward <span class="code">charAt(int)</span> and 
<span class="code">setCharAt(int, char)</span> methods to get and set individual characters within the string.  Because C++ 
supports operator overloading (see below), the string class defines <span class="code">operator[]</span> to support this syntax. 
</p>
<p><span class="bodySubtitle">Classes and inheritance</span><br/>
When extending classes in C++, you must specify <span class="code">public</span>, <span class="code">protected</span> or <span class="code">private</span> inheritance.  This allows 
you to inherit the implementation of a class without inheriting the interface it provides.  There is no 
such analogy in Java, as all class inheritance is public.  In Java, you can prevent a class from 
being subclassed by declaring it <span class="code">final</span>.
</p>
<p>
An interesting feature of Java lets you declare a class as <span class="code">abstract</span> with no <span class="code">abstract</span> methods.  This 
will prevent that particular class from being instantiated.  C++ has no such analogous concept; by 
definition in C++, an abstract class is one in which at least one abstract method is defined.
</p>
<p><span class="bodySubtitle">Interfaces</span><br/>
An interface in C# and Java is a description of a set of methods that a class that implements it must 
define.  It is similar to an abstract class in C++ which only has abstract methods.  C# and Java both 
allow multiple interface inheritance.   Two common uses of interfaces are for "Mix-ins" and "tagging".  
</p>
<p>
"Mix-ins" are typically single-method interfaces which allow you to use the class in a certain way.  
For example, the <span class="code">Comparable</span> interface in Java allows you to define the <span class="code">compareTo</span> method, which 
will allow Java utility methods and classes to sort your objects.  In this case, it is equivalent to defining 
the operator&lt; method in C++.
</p>
<p>
"Tagging" interfaces are used to signify to the application server that it should do something special 
with the class. For example, in Java, the <span class="code">Serializable</span> interface signifies to the container that it can 
write out the bytes of the object and read it back later with the same exact state.  The developer 
does not need to actually implement anything when a class implements <span class="code">Serializable</span>.
</p>
<p><span class="bodySubtitle">Virtual methods</span><br/>
Java programmers might be confused by the term 'virtual method,' since in Java all methods are 
virtual.  This means, that at runtime, no matter what type an object is referenced as (i.e. the class 
itself or a parent class), the "right" method will be called.  Example:
</p>
<pre>
public class Parent
   {
      void method() { System.out.println("parent"); }
   }
   
public class Child extends Parent
   {
      void method() { System.out.println("child"); }
   }


   Parent c = new Child();
   c.method();   // outputs "child"
</pre>
<p>
In C++, you must explicitly tag <span class="code">Parent.method</span> as virtual for this to work. Example:
</p>
<pre>
class Parent
{
    public:
   virtual void method() { printf("parent\n"); }
   void method2() { printf("parent 2\n"); }   // note not virtual
};

class Child: public Parent
{
    public:
void method() { printf ("child\n"); }
void method2() { printf("child 2\n"); }
};

int main()
{
Parent *c = new Child();
   c-&gt;method();      // outputs "child"
   c-&gt;method2();    // outputs "parent 2"
}
</pre>
<p>
This is known as the "Slicing Problem" in C++, and can wreak havoc on systems.  It makes it hard 
to track down the behavior of a child class when the problem isn't in the child class!  If the child class 
overrides a method defined in the parent as not virtual, you have to change the parent class to make 
it virtual.  Java doesn't have this problem, since all methods are virtual there is no way to induce the 
Slicing Problem.
</p>
<p><span class="bodySubtitle">Operator overloading</span><br/>
As one of my favorite features of C++, operator overloading allows for natural arithmetic and other 
expressions when building custom classes.  The classic example is the 'complex' class.  Example:
</p>
<pre>
   class Complex
   {
   public: 
double real, imag;
      
Complex &amp; operator+(Complex &amp;that)
{
   this-&gt;real += that.real;
   this-&gt;imag += that.imag;
   return this;
      }
   };
</pre>
<p>
Then you can write very natural code with Complex objects, e.g., 
</p>
<pre>
   Complex a;
   a.real = 1.0; a.imag = 2;
   Complex b;
   b.real = 3.0; b.imag = 4.0;
   Complex c = a + b;   // very natural, and does what you think
</pre>
<p>
This facility is absolutely not supported in Java.  All I can say is, "Why, oh why not!?"  It makes C++ 
so much readable, especially when it comes to custom classes that represent mathematical entities 
(as in the Complex example above), or array-ish classes.  For example, the <span class="code">vector</span> template class 
defines the <span class="code">operator[]</span> method, which allows you to write array-like code for accessing and modifying 
members of the vector.
</p>
<p><span class="bodySubtitle">Standard libraries</span><br/>
All three languages provide standard libraries which define many similar constructs:
</p>
<ul>
<li>Collections - lists, arrays, maps, sets, iterators</li>
<li>Algorithms: sort, binary search</li>
<li>Dates</li>
</ul>
<p>
The big difference is that Java does not support templatized data types (until recently, when Sun 
announced the addition of generics to the next version of the language).  So, when you define a Vector 
in Java, it is only a Vector of Objects.  In C++ you specifically declare vector&lt;int&gt;, and you can 
only put ints into the vector.  When you retrieve objects out of a Java Vector, you must then cast it 
to the actual object that it is.  Get it wrong, and you get a run-time exception (which, of course, you 
can catch.)  
</p>
<p>
As mentioned above, the C++ vector template class defines <span class="code">operator[]</span>, allowing you to treat vectors 
as if they were arrays.  Even better, the C++ map class also defines <span class="code">operator[]</span>.  As a result, you can 
write efficient, and understandable, code like this:
</p>
<pre>
   map&lt;string, int&gt; wordCount;   // allocated on the stack
   wordCount["the"] = 1;
</pre>   
<p>
The equivalent in Java would be:
</p>
<pre>
   HashMap wordCount = new HashMap(); // no stack allocation in Java
   WordCount.put("the", new Integer(1));   
// remember, no primitives in collections 
// [until Java 1.5 is released -- in 2004?]
</pre>

<p><span class="bodySubtitle">Memory allocation</span><br/>
There are vast differences between the memory management process between Java, C++ and C#.  
This has been the subject of more religious wars than I care to go into.  I'll point out some of the 
differences, advantages and disadvantages of each here.
</p>
<p>
Java and C# support garbage collection of unreachable memory.  For example:
</p>
<pre>
   public void JavaAllocate()
   {
      Object reclaimable = new Object();
      reclaimable.doSomething();
   } 
</pre>
<p>
After the method exists, <span class="code">reclaimable</span> will not be reachable from any other object in memory.  Eventually, 
the Java garbage collector, when it needs memory, or at some other time, will find this object on the 
heap and reclaim its memory. Garbage collection is the only way memory is reclaimed in Java.  The 
advantage of this system is that the burden is not put onto the developer to remember to deallocate 
memory.  The disadvantage is that you have no control over when the garbage collector will run, and 
it consumes system resources (i.e. CPU cycles).  [Aside: real-time extensions to Java have 
addressed this problem.]
</p>
<p>
In contrast, C++ supports explicit deallocation of unwanted memory.  For example:
</p>
<pre>
   void cpp_cleanup()
   {
      Thing *thing = new Thing();
      thing-&gt;do_something();
      delete(thing);
   }
</pre>
<p>
If you forget to deallocate <span class="code">thing</span>, it will remain on the heap forever (or at least until your program 
terminates).   Example:
</p>
<pre>
   void cpp_hanging()
   {
      Thing *thing = new Thing();
      thing-&gt;do_something();
   }
</pre>
<p>
In this example, you will never be able to deallocate the memory allocated originally after this method 
terminates.  The advantage of C++'s memory allocation model is that you are guaranteed that as soon 
as you deallocate the memory, it is available (in contrast, you might have to wait for Java's garbage 
collector to run.)  Of course, the disadvantage is that you have to be extremely careful to remember 
to deallocate things once you're done with them.  Many companies have made much money providing 
tools to find, detect, debug, and eliminate these kinds of memory problems in both C++ and Java.
</p>
<p><span class="bodySubtitle">Pointers, references and handles</span><br/>
C# and C++ both support raw pointers which are in reality just numbers (often just 32 or 64-bit integers, 
depending on implementation).  
</p>
<p>
Java, on the other hand, only uses handles to memory.  This is due to the desire of the Java designers 
to allow the same class files (see below) to support any number of physical implementations (i.e. CPUs).  
Thus they could not expose something so close to the hardware as a pointer.  Instead, the specific JVM 
that the code is running on is responsible for mapping handles to memory.
</p>
<p>
The following snippet (in a method) defines a handle in Java, but doesn't actually allocate any memory:
</p>
<pre>
    Myclass object;
</pre>
<p>
In C++ the above code would actually allocate an instance of the <span class="code">Myclass</span> object on the stack.  But in 
Java nothing is allocated.  Only a slot, named object, in the stack frame has been defined.  The value 
in this slot is actually undefined and the compiler will throw an error if you attempt to use object before 
assigning it to a value (or allocating something.)
</p>
<p>
This is similar to references in C++, which always must reference an object, whether on the stack or 
in memory on the heap.  The big difference is that C++ references must always reference an object, 
but handles in Java can be null, or 'undefined' as described above.
</p>
<p>
Because you can allocate on the stack, and define a pointer to any allocated object, the "dangling 
reference" problem plagues C++.  (This cannot occur in Java, because you cannot allocate objects 
on the stack). Example:
</p>
<pre>
   Thing *cpp_dangling()
   {
      Thing stackThing;    // calls no-arg constructor
      return &amp;stackThing;   // valid syntax!
   }

   void main()
   {
      Thing *bad = cpp_dangling();
      bad-&gt;do_something();   // likely will CRASH
   }
</pre>
<p>
When <span class="code">cpp_dangling</span> terminates, the stack memory where <span class="code">stackThing</span> was allocated has been 
deallocated.  As a result, the pointer "bad" points to a place in memory which has been deallocated 
(that stack frame), and possibly already overwritten by some other object.  This usually results in a 
fatal runtime error (a.k.a. a CRASH.) 
</p>
<p><span class="bodySubtitle">Compilation and run-time environment</span><br/>
Put simply, C++ is compiled down to the native binary level.   The binary that you get can only run on 
the CPU for which it is targeted.  The output is generally an executable, or library.
</p>
<p>
C#, like Java, runs within a virtual machine. This is one of the selling points of Java - "Write once, run 
anywhere".  The <span class="code">.class</span> files that a Java compiler produces can (theoretically)  be run on any operating 
system that has a JVM.  Both C# and Java support further compilation (usually at run-time) to native 
code to improve performance.
</p>
<p>
The runtime environment for both Java and C# also provide run-time checks for other potential errors, 
such as array out of bounds (or string access out of bounds), which C++ does not.  You can catch this 
exception in Java, but in C++ it is much harder to trap this kind of operating-system-level exception.
</p>
<p><span class="bodySubtitle">Conclusion</span><br/>
This feature has touched upon only a few of the features of C++, Java and C#.  Hopefully it gave you a better idea of how the "other half lives", and maybe will inspire some of you to investigate these interesting languages further.  I myself intend to try to write and submit SRM solutions in C++ when it will give me an advantage over Java (sometimes simply for the use of <span class="code">vector&lt;int&gt;</span>). 
</p>
<p><span class="bodySubtitle">References and further information</span><br/><br/>
<A target="_blank" href="http://www.amazon.com/exec/obidos/tg/detail/-/0201543303/qid=1085364255/sr=8-13/ref=sr_8_xs_ap_i13_xgl14/102-2094095-5866533?v=glance&amp;s=books&amp;n=507846">Design and Evolution of C++</A>, Bjarne Stroustrup<br/><br/>

<A target="_blank" href="http://www.amazon.com/exec/obidos/tg/detail/-/0201379236/qid=1085364945/sr=8-1/ref=sr_8_xs_ap_i1_xgl14/104-7848139-0932719?v=glance&amp;s=books&amp;n=507846">STL Tutorial and Reference Guide: C++ Programming with the Standard Template Library</A><br/><br/>

<A target="_blank" href="http://java.sun.com/">Sun Microsystem's Java website</A>; specifically, I rely heavily on the <A target="_blank" href="http://java.sun.com/j2se/1.4.2/docs/index.html">Java API</A><br/><br/>

<A target="_blank" href="http://java.sun.com/docs/books/javaprog/">The Java Programming Language</A><br/><br/>

<A target="_blank" href="http://genamics.com/developer/csharp_comparative.htm">A Comparative Overview of C#</A><br/><br/>

<A target="_blank" href="http://www.softsteel.co.uk/tutorials/cSharp/cIndex.html">C# Tutorial</A><br/><br/>

<A target="_blank" href="http://www.amazon.com/exec/obidos/tg/detail/-/0201612461/qid=1084588963/sr=8-1/ref=sr_8_xs_ap_i1_xgl14/002-1908682-7692009?v=glance&amp;s=books&amp;n=507846">C++ for Java programmers</A>; slides are available <A target="_blank" href="http://budd.cs.orst.edu/PNF:byName:/FTP/cforj/slides/">online</A>
</p>


                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

