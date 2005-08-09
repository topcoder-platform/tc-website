<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../../script.jsp" />
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

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">
            
            <h2>New Features of Java 1.5</h2>

         <p>
         <img src="/i/m/cucu_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
         By&#160;<tc-webtag:handle coderId="7545675" context="algorithm"/><br />
         <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
         </p>

<span class="outline1"><a href="#introduction">Introduction</a></span><br>
<span class="outline1"><a href="#autoboxing">Auto Boxing and Auto Unboxing</a></span><br>
<span class="outline1"><a href="#generics">Generics</a></span><br>
<span class="outline1"><a href="#foreachloop">The For-Each loop</a></span><br>
<span class="outline1"><a href="#variablelength">Variable-Length Arguments</a></span><br>
<span class="outline1"><a href="#enumerations">Enumerations</a></span><br>
<span class="outline1"><a href="#annotations">Annotations</a></span><br>
<span class="outline1"><a href="#staticimport">Static Import</a></span><br>
<span class="outline1"><a href="#apiupdates">Updates in the API</a></span><br>
   <span class="outline2"><a href="#formattedio">Formatted I/O</a></span><br>
   <span class="outline2"><a href="#collections">Collections</a></span><br>

<A name="introduction"></A>
<H3>Introduction</H3>
This new release of Java brings many significant improvements, not only in the APIs, but also in the language itself. Old code can still run with Java 1.5; but when writing code for this new version you must profit of the new great features that will make your code more robust, powerful and clearer. This feature intends to explain those new features so you can quickly start taking advantage of them.
<br><br>
<A name="autoboxing"></A>
<span class="bodySubtitle">Auto Boxing and Auto Unboxing</span><br>
May be something like this happened to you before: you wanted to insert numbers in a list or a map, so you wrote:
<pre class="code">
List l = new ArrayList();
l.add(new Integer (26));
</pre>
You need to use the Integer wrapper because the add method expects an object, and a literal integer is an int, which is not an object.  Something similar happens if you have the value stored in a variable.
<br><br>
Then, for retrieving an element, let's say the first one, you can do:
<pre class="code">
int x = ((Integer) l.get(0)).intValue();
System.out.println (x);
</pre>
Beautiful!  Actually not very much, that code is relatively hard to read for what it does. This kind of situation arises very often, because primitive types are mainly used to manipulate data but they can't be stored in a collection or passed as a reference.  Conversions from primitives to their respective wrappers and vice versa are very common in many Java applications. Since Java 1.5, those conversions are handled automatically by the compiler.  That means, if an int value is passed where an Integer or an Object is required; the int is automatically boxed into an Integer.  If an Integer is passed where an int is expected, the object is unboxed to an int.
<br><br>
For example, in Java 1.5 this is perfectly valid:
<pre class="code">
Integer value = 26;
</pre>
And has the same effect as writing:
<pre class="code">
Integer value = new Integer (26);
</pre>
For the reverse conversion (unboxing), just use the following:
<pre class="code">
int x = value;
</pre>
That is equivalent to:
<pre class="code">
int x = value.intValue();
</pre>
As you can see, autoboxing and autounboxing makes code look clearer, and it makes code more robust, because the compiler will never box or unbox to a wrong type.
<br><br>
If you box and unbox manually, this could happen:
<pre class="code">
Integer x = new Integer (300);
-
byte y = x.byteValue(); // wrong value: x doesn't fit in a byte
System.out.println(y);
</pre>
This compiles but will give wrong values when x is not in the byte range, and this can be quite hard to debug. If you use Java 1.5 and you let the compiler do its work, you would just write:
<pre class="code">
Integer x = 300;
-
byte y = x;
System.out.println(y);
</pre>
This code is still wrong, but now it doesn't even compile and you'll immediately notice the problem.  Even if the compiler cares for those conversions, you must understand that this is being implicitly done in order to avoid doing things like:
<pre class="code">
Integer x=1;
Integer y=2;
Integer z=3;
Integer a;
a= x+y+z;
</pre>
Even if this works the compiler will box the int values to put them in the Integer variables, then it will unbox them to sum its values, and box again to store the Integer variable a, performing much worse than if you would have used int variables. The rule of thumb is that wrappers should be used just when an object representation of a primitive type is needed.
<br><br>
<A name="generics"></A>
<span class="bodySubtitle">Generics</span><br>
Probably you've already used the collection classes from Java, which provides classes the means for storing data and applying algorithms on it.  For example, the ArrayList class makes easy to use an array that automatically grows as you need.  But you might need an array of integers, strings or a Person class you've defined.  The algorithms for working on any of those kinds of data are identical, so it won't make sense to rewrite the code for each data type. In previous versions of Java, they solved this by making the collection classes take Object as their elements; and because any object inherits from that class, any instance could be passed to the collections.
<br><br>
For example:
<pre class="code">
List list = new ArrayList();
list.add("hello");

-

String s;
s = (String) list.get(0);
</pre>
Note than when retrieving elements, very often a cast must be used because the returned type is an Object, and the stored object is probably from another class.
<br><br>
The main problem with this approach is that you're "loosing" the type of your objects and then doing a cast because you know beforehand what type they're.  But this is very error prone, because if you do the wrong cast, the program will run but give a runtime error. Java 1.5 introduced Generics, which make this kind of code much clearer and type safe.
<br><br>
The above code will be written as:
<pre class="code">
List&lt;String&gt; list = new ArrayList&lt;String&gt;();
list.add("hello");

String s;
s = list.get(0);
</pre>
The class List is now generic, that means that it takes parameterized types; in that case the type is String.  With List&lt;String&gt; you're saying to the List class that this instance will work with the type String. Then, the constructor is also called with the parameter type in order to make the instance be of that type. Now the cast is removed, because the get method returns a String, as a consequence of the list declaration. That way, you work with your instance as if it were specifically designed to work with Strings, making you save casts that are risky.
<br><br>
Also it's possible, and sometimes very useful, to have more than one type as parameter; for example the maps needs two types, one for the key and one for the values:
<pre class="code">
Map<String, Integer> map = new HashMap<String, Integer>();

map.put("Bill", 40);
map.put("Jack", 35);

System.out.println(map.get("Jack"));
</pre>
This forces the keys to be Strings and the values to be Integers.
<br><br>
Now, let's see how we can declare a generic class, doing a class that holds any kind of object:
<pre class="code">
public class Holder&lt;T&gt; {
    private T value;

    void set(T value) {
        this.value = value;
    }

    public T get() {
        return value;
    }
}
</pre>
The parameterized types are right after the class name, enclosed between angle brackets.  If using more than one, they must be comma separated, for example "&lt;K,V&gt;" is used for Map class. Then, we can use T almost (later we'll see the differences) as if it were a class, even if we don't know which one is it.  This class must be specified when declaring instances, for example we could use the Holder class as follows:
<pre class="code">
Holder&lt;String&gt; h = new Holder&lt;String&gt;();
h.set("hello!");
System.out.println(h);
</pre>
In the first line we are declaring h as an instance of Holder&lt;String&gt;, so we can think of T as being a String and read the Holder class doing a mentally search and replace.  As you can see, the set method takes an argument of type T (in this case String), so if another class is used instead, it will generate a compilation error.  The method get returns an object of type T (again String), so we don't need to cast to String when calling it. The way the compiler does that is through erasure; that means that it actually compiles generic classes as if they work with Object instances and then it applies casts and do checks for type safety.  This is different as how C++ works (it generates one copy of the class for each different type instantiated) and has some consequences on its use. I said before that T should be treated *almost* as if it were a class, because there are things that you can't do, due to the erasure procedure.
<br><br>
For example,
<pre class="code">
value = new T();
</pre>
will not compile even if it seems to be right and quite useful.  The problem is that the compiler doesn't have the information of which type is T at compile time, so it can't create the instance.  For the same reason, you can't create an array of T's:
<pre class="code">
value = new T[5];
</pre>
will also give a compiler error. Let's make a class for handling complex numbers using generics, so it can work with different numeric types:
<pre class="code">
public class Complex&lt;T&gt; {

    private T re;
    private T im;

    public Complex(T re, T im) {
        this.re = re;
        this.im = im;
    }

    public T getReal() {
        return re;
    }

    public T getImage() {
        return im;
    }

    public String toString() {
        return "(" + re + ", " + im + ")";
    }
}
</pre>
The constructor will take two variables of type T, the real and imaginary parts.
<br><br>
We can use that class as follows:
<pre class="code">
Complex&lt;Integer&gt; c= new Complex&lt;Integer&gt;(3,4);
System.out.println (c);
</pre>
Getting as output: "(3, 4)"
<br><br>
Notice that Integer is used because only classes can be parameters; primitive types are not allowed.  However, thanks to autoboxing we can pass int parameters to the constructor to make life easier; if not we should do:
<pre class="code">
Complex&lt;Integer&gt; c= new Complex&lt;Integer&gt;(new Integer(3), new Integer(4));
</pre>
We could do some other things with the Complex class, for example:
<pre class="code">
Complex&lt;String&gt; c= new Complex&lt;String&gt;("hello","world");
</pre>
But hey, this is not the idea of a complex number! We wanted to use generics so it could hold different types of numbers. Let's leave that aside for a brief moment to add a method to calculate the modulus:
<pre class="code">
public double getModulus() {
       return Math.sqrt(Math.pow(re, 2) + Math.pow(im, 2));
}
</pre>
But this doesn't even compile! However this behavior seems reasonable; if it would have compiled, how would it have solved the modulus of the last complex instantiated?
<br><br>
We need to get a numeric value from re and im, and this could be done using doubleValue() method:
<pre class="code">
return Math.sqrt(Math.pow(re.doubleValue(), 2) + 
Math.pow(im.doubleValue(), 2));
</pre>
We're nearer now, but the compiler still doesn't like it-how can it know that re and im have the doubleValue method? If we pass a String, how would it solve that? The answer to all those questions is to promise the compiler that re and im will be numbers; that is, they'll be instances of classes that inherit from Number. To do that, you just have to modify the declaration of the class to be:
<pre class="code">
public class Complex&lt;T extends Number&gt; {
</pre>
That way, you're saying that T must be a Number or a subclass. This is called a bounded type.  Now, you won't be able to compile Complex&lt;String&gt; because String is not a Number subclass. Because Number class defines the method doubleValue() - and thus it is defined for all its subclasses - you can use this method on re and im variables, as well as you can call any method defined in Number or its superclasses.
<br><br>
Let's go further and define a method to compare the vector length (i.e. its modulus) with other vector:
<pre class="code">
public boolean isLarger(Complex&lt;T&gt; c) {
  return getModulus() &gt; c.getModulus();
}
</pre>
This can be used as follows:
<pre class="code">
Complex&lt;Integer&gt; x= new Complex&lt;Integer&gt;(3,4);
Complex&lt;Integer&gt; y = new Complex&lt;Integer&gt;(4,5);

System.out.println (x.isLarger(y)); 
</pre>
And it works as expected.  However, we might also want to do:
<pre class="code">
Complex&lt;Integer&gt; x= new Complex&lt;Integer&gt;(3,4);
Complex&lt;Double&gt; y = new Complex&lt;Double&gt;(4.2,5.8);

System.out.println (x.isLarger(y)); 
</pre>
And this doesn't even compile, because x is a vector of Integer and it expects the same type in the isLarger method.  However, we know that this is a valid operation, because even if they real and imaginary parts are of different types, we still can compare their modulus. What we need now is to use wildcards to tell the isLarger method that we really don't care for the type of complex we receive, and this is very simple to do:
<pre class="code">
public boolean isLarger(Complex&lt;?&gt; c) {
</pre>
The interrogation sign stands for the wildcard, meaning any type.  Because the Complex type is already bounded to Number, actually the type can't be other than a Number. Wildcards can also be bounded in the same way we bounded T to be a Number.
<br><br>
You may have noticed that at the beginning of the section I used the ArrayList class as follows:
<pre class="code">
new ArrayList&lt;String&gt;();
</pre>
But ArrayList is an old class, at least older than Java 1.5, so how does it comes that now it takes a type? Is it in another package? Is the same class and they've broken backwards compatibility? The answer is that is the same class as in previous versions of Java; but this new version wouldn't be well received if it wouldn't be backwards compatible, so even if it can used as a generic class, omitting the type will result in a raw class, which works over the Object class as the previous Java versions.  That way, the old code won't break, but new code should use the parameterized form to be type safe.  When using the raw type, the Java compiler issues a warning about that. Generic classes can be inherited or can inherit from other generic or non generic classes; all the possibilities are valid.
<br><br>
For example, you could have another complex class that has some extra functionality and declare it as:
<pre class="code">
public class BetterComplex&lt;T extends Number&gt; extends Complex&lt;T&gt; {
</pre>
Note that T should be declared at least to be bounded to Number, otherwise it won't compile because Complex is not guaranteed to have its parameter bounded to Number.  It could also be bounded to a subclass of Number, but not to anything else. The parameter list could have more than the T parameter in BetterComplex; however you should always give Complex exactly one type. You can also make a non generic class inheriting from a generic class.
<br><br>
For example if you define some kind of Complex that you know their values are always of type Double:
<pre class="code">
class BetterComplex extends Complex&lt;Double&gt; {
</pre>
That way, you don't even need to specify a type (actually you can't) to BetterComplex type.
<br><br>
<A name="foreachloop"></A>
<span class="bodySubtitle">The For-Each loop</span><br>
A task that is done often is to iterate through a collection, and do something with each element. For example, this shows all the elements in an array:
<pre class="code">
String fruits[]= {"apple", "orange", "strawberry"};

      for (int i = 0; i &lt; fruits.length; i++) {
            System.out.println (fruits[i]);
      }
</pre>
We could also think of a method to show all the elements in a list:
<pre class="code">
public void Show(List l) {
     for (int i = 0; i &lt; l.size(); i++) {
          System.out.println (l.get(i));
     }
}
</pre>
This code seems right; however it could be very inefficient. Surprised? Try to guess why - And if not, just run the following:
<pre class="code">
List l = new LinkedList();
for (int i = 0; i &lt; 10000; i++) {
      l.add("number " + i);
}
Show(l);
</pre>
You'll have some time to think why it is inefficient while you wait for it to finish running. The reason is that a linked list doesn't have random access to its elements, so when you ask for an element, the linked list will sequentially search your element.  For getting the 10000th element, the entire list will be iterated.  So, the problem with that approach is that depending on the list implementation you could get an algorithm of order O(n^2) whereas an algorithm O(n) is easily obtained.
<br><br>
One way of making this algorithm work in O(n)  independently of the list implementation is using iterators.  This is the new version of the show method:
<pre class="code">
public static void ShowFast(List l) {
     for (Iterator it = l.iterator(); it.hasNext();) {
          System.out.println (it.next());
     }
}
</pre>
When you ask for an iterator of the collection using the method iterator(), a reference to the beginning of the list is retrieved.  Then, the hasNext() method returns whether there are still more elements to come, and it.next() does two things: it advances the reference to the next element in the collection and retrieves the current element.  This gives the LinkedList the opportunity to iterate through the list in O(n). For the moment, all that can be done in earlier versions of Java. Even if the above code works, it's not nice and quite error prone.  For example, if in the hurry you call again to it.next() in the for block in order to retrieve again the element, you'll get half the list in one place and half in another.  Of course that this can be solved storing the value of it.next() in a local variable, but Java 1.5 brings a nicer and safer way to do the same: the for-each loop.
<br><br>
The method is written this way:
<pre class="code">
public static void ShowFastAndNice(List l) {
     for (Object o : l) {
          System.out.println (o);
     }
}
</pre>
You can read the for sentence as "for each Object o in l". As you can see, the for keyword is still used, but now it takes the syntax:
<pre class="code">
for(type iteration_var : iterable_Object) code
</pre>
The break keyword can be used in the same way as in the regular for. Observe that the type is mandatory; for example this won't compile:
<pre class="code">
Object o;
   for (o : l) {
         System.out.println (o);
   }
</pre>
With the compiler forcing the iteration variable to be in the iteration block, a little flexibility is lost, because that variable can't be used after exiting the for, a practice that is common, for example, if the for is broken when something is found.  However these kinds of practices are not very clear and robust, so the compiler is making you to write better code, even if it might require an additional flag. The iterable_object is any object that implements the Iterable interface, which only defines the method Iterator&lt;T&gt; iterator(). The type must be compatible with the type returned by the next() method of the iterator.
<br><br>
Arrays can also be used, so the loop of the first example in this section could be written as:
<pre class="code">
for (String fruit : fruits) {
    System.out.println (fruit);
}
</pre>
To make your own types compatibles with the for-each  loop, you must implement that interface and return the appropriate iterator, that often is the object itself, who is also implementing Iterator. You should use this form of for as much as you can; however there are some cases where it is not possible or straightforward:
<ul>
<li>When you will remove some elements in the collection; in that case you need to have the iterator to call the remove method.</li>
<li>When you're iterating through more than one collection at the same time, for example you have an array of names and one of values and you know that value(i) belongs to name(i)</li>
</ul>
 
<A name="variablelength"></A>
<span class="bodySubtitle">Variable-Length Arguments</span><br>
Imagine that you're programming an application that repeatedly needs to know the maximum of some integer variables.  You probably will want to put the code in a method.
<br><br>
For example, you might do:
<pre class="code">
int x0, x1;
-
int z = max(x0, x1);
</pre>
And define a method max that takes 2 arguments and returns the bigger of the two.  So, you code that method and happily continue programming until you find that sometimes you need to calculate the maximum between x0, x1 and x2, and sometimes between 10 variables.  One approach would be to overload the max method, defining it with different quantities of parameters, which is laborious and ugly.
<br><br>
A better approach is to receive an array, so your method max could be:
<pre class="code">
public int max(int []x) {
  int maxValue = x[0];
  for (int value : x)  {
      if (value &gt;  maxValue) {
          maxValue = value;
      }
  }
  return maxValue;
}
</pre>
The method uses the for-each to get the maximum element in the array.  Note that if an empty array is passed, an ArrayIndexOutOfBoundsException will be thrown; you could check that case and throw another exception to explain that it can't be called with an empty array. Now that we have a nice method that takes any number of arguments, let's use it:
<pre class="code">
int x0, x1, x2, x3;
-
int y = max(new int[] {x0, x1});
int z = max(new int[] {x0, x1, x2, x3});
</pre>
Even if it works, it makes the code very unclear, but with Java 1.5, you can have your cake and eat it, too! With variable-length arguments you can make the method take any number of arguments and call it in a straightforward way. The variable-length arguments are specified using three dots before the variable name.
<br>br>
For example, the above method will be written now as:
<pre class="code">
public int max(int ...x) {
  int maxValue = x[0];
  for (int value : x)  {
      if (value &gt;  maxValue) {
          maxValue = value;
      }
  }
  return maxValue;
}
</pre>
The only difference is in the signature; observe that x is treated as a normal array. The advantage is when you have to call that method. Now you can use:
<pre class="code">
int y = max(x0, x1);
int z = max(x0, x1, x2, x3);
int error = max(); // it will throw an exception
</pre>
The compiler will internally do something very similar as we did before: create an array with all the values and pass it to the method that will receive them as an array.
<br><br>
You're still able to call the method with an array of integers, which can be useful if you need to build it programmatically, or if you want to upgrade your methods to variable arguments without breaking compatibility.
<br><br>
When using variable-length arguments, zero arguments are permitted, which sometimes is an advantage, and others, as in that case, is something that you don't desire.
<br><br>
You might be tempted to write the method declaration in the following way:
<pre class="code">
public int max(int y, int ...x) {
// get the maximum between y and the elements of the array x
}
</pre>
This will force the user to pass at least one parameter.  Doing this brings a complication: if you want to pass an array, you have to pass its first element as the first parameter and the rest as the second parameter, and that code will look really bad.  Normal and variable-length parameters can be combined, but not any combination is valid.  The variable-length argument must be the last parameter, which implies that it's not possible to have more than one variable-length argument in a method declaration.  Sometimes there can be ambiguity between overloaded methods that take variable-length arguments.
<br><br>
For example, consider the following declarations:
<pre class="code">
public int method(int ...x) {
// do something
}

public int method(String ...x) {
// do something
}
</pre>
I'm sure you can deduct which method will be called in those statements:
<pre class="code">
method(3);
method("3");
method(1, 2, 3);
method("hello", "world");
</pre>
But, you can't know which method will be called if I do:
<pre class="code">
method();
</pre>
Both method declarations match, so you can't know, and neither the compiler does, so the above statement will not compile.  You'll have an error message saying: "reference to method is ambiguous,". The ambiguity also happens if you declare:
<pre class="code">
public int method(int ...x) {
// do something
}

public int method(int y, int...x) {
// do something
}
</pre>
And try to call the method with one or more arguments; those declarations will probably be useless. Variable-length arguments make code look clearer in many common situations.  However, there are situations where they can't help: for example a method that takes names and values for the names, could be written as:
<pre class="code">
public void multiple(String names[], int values[]) {
// do something with names and values.
}
</pre>
But it can't be translated to variable-length arguments, because this won't compile:
<pre class="code">
public void multiple(String -names, int -values) {
   /-
}
</pre>
There's no way to use variable-length arguments in this example, but don't worry; just use the arrays in the old way.
<br><br>
<A name="enumerations"></A>
<span class="bodySubtitle">Enumerations</span><br>
Sometimes you need to manage information that doesn't fit well in the existent types. Imagine for example a method that needs to receive which programming language a coder uses. The method could be:
<pre class="code">
public void doSomething(String handle, String language) {
   if (language.equals("Java")) {
       System.out.println ("Hope you already know 1.5!");
   }
   -
}
</pre>
And then, it will be called using, for example
<pre class="code">
doSomething("abc","Java")
</pre>
This has lots of problems: you could misspell the name, you might not know all the available names, you could pass an inexistent language and so on. A better approach is to use constants, for example you could write the following code:
<pre class="code">
public class Languages {
    public static final int JAVA = 1;
    public static final int CPP = 2;
    public static final int CSHARP = 3;
    public static final int VBNET = 4;
}
</pre>
Then, your method doSomething will be:
<pre class="code">
public void doSomething(String handle, int language) {
   if (language == Languages.Java) {
       System.out.println ("Hope you already know 1.5!");
   }
   -
}
</pre>
And your call will be:
<pre class="code">
doSomething("abc",Languages.JAVA)
</pre>
This is better; at least you're sure that any misspelling is caught at compile time; however if you do:
<pre class="code">
doSomething("abc", 6)
</pre>
You're giving the method a code for a language that doesn't exist. Java 1.5 introduced enumerations, that is something that exist in many older languages; however Java 1.5 has enumerations far more powerful than the ones found on those languages. Let's first see how the above example will be done.
<br><br>
We define the enumeration type as following:
<pre class="code">
enum Language { JAVA, CPP, CHSARP, VBNET }
</pre>   
Now we have a new type called Language and we can define variables of that type, and assign any of the declared values:
<pre class="code">
Language lang;
lang = Language.JAVA;
</pre>
Note that Lanuage.JAVA is like an instance of Language, which is similar to a class, but can't be instantiated. The method will be coded now as:
<pre class="code">
public void doSomething(String handle, Language language) {
    if (language== Language.JAVA) {
        System.out.println ("Hope you already know 1.5!");
    }
}
</pre>
And the call will be:
<pre class="code">
doSomething("abc", Language.JAVA)
</pre>
Now, it's impossible to pass anything else than the defined values, making the method safer. But Java doesn't stop here.  While in some languages the enumerations are a bit more than a collection of integer constants, in Java many nice additional features are provided.
<br><br>
Try this one:
<pre class="code">
System.out.println (Language.JAVA);
</pre>
This will print "JAVA", so that you don't have to do a map from the enumeration values to its names; Java already stores the name of the constant. You can also know all the available values for a type using values() method, that returns an array of the enumeration type, and can be used as follows:
<pre class="code">
System.out.println ("Available Languages:");
for(Language l : Language.values())
   System.out.println(l);
</pre>
This will print the list of the four available languages. Now, imagine that the user is asked for the language he's willing to use, this could be done using a "combo box" where the values are retrieved as above, so that if new languages are added, they automatically appear in the combo box as soon as you add the constant in the enumeration. If you want to call the method doSomething, you'll notice that a Language constant is needed, but we have a string constant from the combo box (or may be some free text input).  To translate it, you have a very easy way: the method valueOf(String str) that returns the enumeration constant corresponding to that name, or throws an IllegalArgumentException if not found. You could do:
<pre class="code">
doSomething("abc", Language.valueOf(selectedLang));
</pre>
where selectedLang is the String variable that holds the user selection. Now, imagine that our method doSomething needs to know the extension of the file for saving it. We could do:
<pre class="code">
String extension;
switch (language) {
  case JAVA: extension = ".java"; break;
  case CPP: extension = ".cpp"; break;
  case CSHARP: extension = ".cs"; break;
  case VBNET: extension = ".vb"; break;
  default: throw new IllegalArgumentException 
              ("don't know that language extension");
}
// do something using extension variable
</pre>   
This example shows that the switch sentence can be used with enumerations. Notice that the languages in the switch are referred without specifying the enumeration type. If you try to compile the above code without the default in the switch, you'll got an error saying that extension might not be initialized.  But you're sure it is!! language variable is bounded to be one of the four defined constants, so there's no way to escape! You might be tempted to just initialize the extension to an empty string or null to shout the compiler's mouth, and even if it will perfectly work for the moment, is not the best for being extensible.  If other language is added and you forget to add the case statement, the extension variable will be null or empty string, and the error might be much more complicated to find than if you throw an exception as we did. But this solution is still not the best; as we've been talking, you could easily forget to declare the case statement, and you might have many "maps" as the above in different parts of code, making it hard to maintain. Because the extension is linked to the language itself, why not store the extension itself on the constant? An enumeration is actually a special kind of class, and it can have methods and attributes, so you can do:
<pre class="code">
enum Language {
        JAVA   (".java"),
        CPP    (".cpp"),
        CSHARP (".cs"),
        VBNET  (".vb");

        private String extension;

        Language(String ext) {
            extension = ext;
        }

        public String getExtension() {
            return extension;
        }
}
</pre>
Now the constant definition must match the only available constructor. The constructor can't be declared as public, you'll get a compile error because enums can't be instantiated.  You could overload the constructor to provide many ways to initialize the constants, in the same way you would do in a normal class. Now, our method doSomething will simply do:
<pre class="code">
String extension = language.getExtension();
// do something using extension variable,
// that actually is not even needed now.
</pre>
The code is more robust now, because when adding a new language is impossible to forget to initialize the extension; you won't be able to compile if you don't specify it.  And as a plus, you are declaring the extension in the same place as the language, so you don't need to search all the code for switch'es to add the extension.
<br><br>
In conclusion, Java provides a new kind of enumerations that is very powerful because the constants are more like a singleton instance than an integer variable, so more information can be stored in the constant; and even singletons won't be so good to use as constants because enums provide extra functionality like listing all the constants for a type and mapping from a constant to its string representation and vice versa.
<br><br>
<A name="annotations"></A>
<span class="bodySubtitle">Annotations</span><br>
Annotations, or metadata, introduce a new dimension in your code.  They enable you to embed information in your source code.  That information does nothing by itself; the idea is that another program can use it. For example, when writing unit tests, the JUnit framework needs to know which methods are you willing to test; and it does that using reflection to get all the methods whose name starts with "test", as well as to look up for methods "setUp", "tearDown" and so on. Annotations can help here, marking that a method is a test method, that an exception is expected and so on.  Actually, it's quite probable that in a near future JUnit will implement this, because NUnit is already using the analogous idea in .Net platform. Now, a method that tests if a constructor throws NullPointerException looks like this:
<pre class="code">
public void testNullConstructor () {
   try {
       new TestedClass(null);
   } catch (NullPointerException e) {
   }
}
</pre>
Using annotations, it could look like:
<pre class="code">
@TestMethod
@ExpectedException(NullPointerException.class)
   public void nullConstructor () {
   new TestedClass();
}
</pre>
As you can see, there are two annotations before the method that are recognized by their starting "@".  The name of the first annotation is TestMethod and it doesn't take any parameters.  The second annotation (ExpectedException) takes one parameter. Now thay you understand what they can be used for, let's see how they're declared and accessed.
<br><br>
An annotation is based on an interface, but it can just have method declarations that take no parameters and the return type must be one of the primitive types, String, Class, an enum type, an annotation type, or an array of one of the preceding types. For example, this is an annotation declaration:
<pre class="code">
@interface Note {
   String author();
   String note();
   int version();
}
</pre>
This annotation will be called, for example, in the following way:
<pre class="code">
@Note(author="TCSDEVELOPER", note="Working fine", version=3)
</pre>
You might want some of the fields to take default values, so you don't have to specify them each time.  This can be easily done using:
<pre class="code">
@interface Note {
   String author() default "TCSDEVELOPER";
   String note();
   int version();
}
</pre>
And then, if you don't specify the author, the default will be used:
<pre class="code">
@Note(note="Working fine", version=1) // "TCSDEVELOPER" is used
</pre>
If your annotation just takes one parameter, you can omit its name when using it, however for this purpouse, the name of the field must be "value":
<pre class="code">
@interface ExpectedException {
    Class value() default String.class;
}
</pre>
With this declaration, the annotation can be used as shown in a previous example, saving some typing:
<pre class="code">
@ExpectedException(NullPointerException.class)
</pre>
Also annotations without parameters can be declared, and they're very useful to mark something, for example that a method must be tested. The annotations we've defined can be used in fields, methods, classes, etc.  Often you want the annotation to be used just in some of those targets.  This is done using the @Target annotation on our annotation:
<pre class="code">
@Target(ElementType.METHOD)
@interface Note {
   String author() default "TCSDEVELOPER";
   String note();
   int version();
}
</pre>
Now, the Note annotation can be used just for methods.  You can also specify more than one element type using the following syntax:
<pre class="code">
@Target({ElementType.TYPE, ElementType.METHOD})
</pre>
Annotations can have different Retention Policies, which specify when the annotation is discarded.  The SOURCE retention policy makes the annotation just available in the source code, discarting it on the compilation.  This could be used in a similar way as javadocs are used: a tool that extracts information from source code to do something. The CLASS retention police, used by default, stores the annotation in the .class file but it won't be available in the JVM.  The last retention policy is RUNTIME, that makes the annotation to be available also in the JVM. The retention policy is specified using the @Retention annotation.
<br><br>
For example:
<pre class="code">
@Retention(RetentionPolicy.RUNTIME)
</pre>
We've learned to declare and use annotations; however they do nothing by themselves.  Now, we need to access them to do something, and this is done using reflection. The AnnotatedElement interface represents an element that can be annoted, and thus it declares the methods we need to retrieve the annotations.  The reflection classes (Class, Constructor, Field, Method, Package)  implement this interface.
<br><br>
For example, this is a sample program that gets the Note annotations for the AnnotDemo class and shows them:
<pre class="code">
@Note(note="Finish this class!", version=1)
public class AnnotDemo {
    public static void main (String args[]) {
      Note note = AnnotDemo.class.getAnnotation(Note.class);
      if (note != null) {
         System.out.println("Author=" + note.author());
         System.out.println("Note=" + note.note());
         System.out.println("Version=" + note.version());
      } else {
         System.out.println("Note not found.");
      }
    }
}
</pre>
If you run this and it says that the note was not found don't panic.  Try to discover what the problem is. Did you find it? If the Note annotation doesn't have a retention policy specified, it uses CLASS by default, so the annotations are not available in the JVM.  Just specify the RUNTIME retention police and it will work. The important line in the above code is: 
<pre class="code">
Note note = AnnotDemo.class.getAnnotation(Note.class);
</pre>
With AnnotDemo.class we get a Class object representing that class, and the getAnnotation method asks for an annotation of the type specified in the argument.  That method retrieves the note if it exists or null if there are no notes of such type. The AnnotatedElement interface provides more methods in order to retrieve all the annotations for an element (without specifying the type) and to know if an annotation is present.  For more information refer to the API documentation of this interface.
<ul>
<li>Java defines seven built in annotations.</li>
<li>In java.lang.annotation: @Retention, @Documented, @Target, @Inherited</li>
<li>In java.lang: @Override, @Deprecated, @SuppressWarnings</li>
</ul>
Some of them were already explained on this feature.  For the rest, please see the API documentation.
<br><br>
If you want to go deeper in this interesting subject, I recommend you to start by doing a mini-Junit class with annotations.   You have to look for a @Test annotation in each method of the class, and if found, execute that method. Then, you can improve it by using the @ExpectedException as we defined above.
<br><br>
<A name="staticimport"></A>
<span class="bodySubtitle">Static Import</span><br>
Let's do some math:
<pre class="code">
x = Math.cos(d * Math.PI) * w + Math.sin(Math.sqrt(Math.abs(d))) * h;
</pre>
This looks horrible! Not only is the formula hard to understand, but also the "Math." takes a lot of space and doesn't help to understand. It will be much clearer if you could do:
<pre class="code">
x = cos(d * PI) * w + sin (sqrt(abs(d))) * h;
</pre>
Well, with Java 1.5 this is possible.  You just have to do a static import over the members you're using, so you must add at the beginning of the file:
<pre class="code">
import static java.lang.Math.cos;
import static java.lang.Math.sin;
import static java.lang.Math.abs;
import static java.lang.Math.sqrt;
import static java.lang.Math.PI;
</pre>
Those lines make the static methods and constants visible without the need of the class name. You could also do:
<pre class="code">
import static java.lang.Math.*;
</pre>
But this is not recommended; almost sure you're importing a lot of things that you don't need and you don't event know that you're importing.  Also, when reading the code, if you used ".*" in many static import's, you won't know from which one an attribute or method is coming. Also this could result in ambiguities when there is a static member with the same name in two different places. You should use static imports with care, just when they'll make your code look clearer because you're repeatedly accessing some static members of a class.  Abusing of the import static recourse will make the code less clear. 
<br><br>
<A name="apiupdates"></A>
<span class="bodySubtitle">Updates in the API</span><br>
A lot of updates were done in the API, adding methods, classes and packages. The new API definition is backwards compatible, so your previous code must compile without any modifications. We'll briefly see some of the most important changes. If you want to know the full list of updates, please see http://java.sun.com/j2se/1.5.0/docs/relnotes/features.html#base_libs
<br><br>
<A name="formattedio"></A>
<b>Formatted I/O</b><br>
The new class java.util.Formatter enables you to use formatted strings in the old and loved C style.  For example, you can do:
<pre class="code">
Formatter f = new Formatter ();
f.format("Decimal: %d, hexa: %x, character %c, double %1.4f.", 
50,50,'A', 3.1415926);
System.out.println (f.toString());
</pre>
The constructor of Formatter can be used in different ways so that the buffer for the formatted output is somewhere else, for example in a file. If you want to show the input on the screen, instead of the above form, you can do it directly with printf:
<pre class="code">
System.out.printf("Decimal: %d, hexa: %x, character %c, 
double %1.4f.", 50,50,'A', 3.1415926);
</pre>
Although this is similar to the formatting strings in C, there are some differences and improvements, so you should have a look at the Formatter class documentation for more detail. On the other side, you can read formatted input and convert to its binary form using the java.util.Scanner. For example, if you have any strings containing an unknown number of integers, you can sum them using:
<pre class="code">
int x=0;
Scanner scan = new Scanner("10 5 3 1");
while (scan.hasNextInt()) {
   x+=scan.nextInt();
}
</pre>
When you create the Scanner object, you must specify a string to read from, or some other source like an InputStream. Then, you have methods to determinate if you have an element of a specified type using hasNext*, and you can read those elements with the methods next*. Of course that if you know beforehand the number of each type, you don't need the hasNext* methods.  Let's see another example, where we know that we have a string and two doubles, separated either by ";" or "&":
<pre class="code">
Scanner scan = new Scanner("Hello World;15.4&8.4");
scan.useLocale(Locale.US);
scan.useDelimiter("[;&]");
String s;
double x,y;
s = scan.next();
x = scan.nextDouble();
y = scan.nextDouble();
</pre>
Here, we set the locale to be US, so that the decimal separator is the dot.  You have to be very careful with locales, because this might work perfect in your computer but in someone else's it might throw an exception because his locale is set to use the comma as decimal separator. Then, we set the delimiter with the method useDelimiter, that takes a regular expression pattern. As we know that we'll have a string and two doubles, we just read them from the scanner.
<br><br>
<A name="collections"></A>
<b>Collections</b><br>
The Collections package has changed from its roots, by supporting generic types.  The old code will compile and work, but it will produce compiler warnings.  New code should be written using generics.
<br><br>
For example, here we create a list of Integers and then show it:
<pre class="code">
List&lt;Integer&gt; l = new ArrayList&lt;Integer&gt;();
l.add(10);
l.add(20);

for (int value : l) {
   System.out.println(value);
}
</pre>
Notice that we can add ints directly thanks to autoboxing, but the type of the collection is always a class. Some other collection classes, like  HashMap, take two types.  See the generics section for an example. Also, new class collections are defined:  enumMap and enumSet to make working with maps keys and sets in enums more efficient; AbstractQueue that provides some basic common functionality of the queues, and PriorityQueue, which can be very useful in SRMs.
<br><br>
Let's see an example of a PriorityQueue:
<pre class="code">
PriorityQueue&lt;Double&gt; pq = new PriorityQueue&lt;Double&gt;();
pq.add(4.5);
pq.add(9.3);
pq.add(1.7);

while(true) {
   Double d = pq.poll();
   if (d == null) break;
   System.out.println(d);
}
</pre>
Adding elements it's done - not very surprisingly - with the add method.   Then, the poll method retrieves the next element in the priority queue or null if it's empty, and removes it. You can also use the peek method, which works like poll but doesn't remove the element. There are also new methods in the Collections utility class.  Two of them can be particularly useful in SRM's: the frequency method that counts the number of times that an element appears in a collection, and the disjoint method that returns whether two collections have no common elements. The other two added methods are addAll, which enables you to add all the elements in an array to a collection, and reverseOrder, that returns a Comparator representing the reverse order of the comparator provided as parameter.
            
        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
