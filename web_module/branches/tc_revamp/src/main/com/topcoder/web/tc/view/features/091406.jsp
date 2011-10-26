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
.codeBox2
{
   width: 640;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}

.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE; 
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
<tc-webtag:forumLink forumID="506105" message="Discuss this article" />
<div id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A></div>
<div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A></div>
</div>
<span class="bigTitle">Introduction to OpenMP, Part 2</span>

      <p>
      By&#160;<tc-webtag:handle coderId="21464956" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

In <A href="/tc?module=Static&d1=features&d2=091106">Part 1</A>, we looked at an overview of multi-threading, introduced OpenMP, and began to review its directives. Part 2 continues with a look at the reduction directive.
<br><br>

<b>Reduction:</b> Let's imagine we want to sum the elements in an array. We might have some code which looks like this:

<pre class="codeBox">
int sum=0,i;
float array[100]; //imagine this is pre-populated
#pragma omp for shared(sum, array)
for(i=0;i&lt;100;++i)
{
#pragma omp atomic
	sum+=array[i];
}
</pre>
This is perfectly correct, in that it functions as expected (note the use of synchronisation directives). However, it is not an optimal technique, because atomic operations are slow compared to the operations they replace. What reduction does is to create a private copy of a shared variable for each thread, into which the values found for all iterations performed by that thread are combined (by summation, for example). At the end of the parallelised loop, the private copies of this reduction variable are then 'reduced' back into the original shared variable. This might sound a little complex, so I'll try to use examples to clarify it
<br><br>
First, let's see the syntax for using reduction variables:
<pre class="codeBox">
Reduction (op: variable-list)
</pre>
Now a simple example, reimplementing summation:
<pre class="codeBox">
int sum=0,i;
float array[100]; //imagine this is pre-populated
#pragma omp for shared(array) reduction(+:sum)
for(i=0;i&lt;100;++i)
{
	sum+=array[i];
}
</pre>
The main thing that's been accomplished is that we no longer need synchronisation. So what's going on here?
<br><br>
We've declared <tt>sum</tt> as a reduction variable for addition. There are 3 parts to how this works:
<ol>
<li>For each thread, a private copy of <tt>sum</tt> is created and initialised, based on <tt>op</tt> as follows:<br><br>
<table class="formFrame" width="200" cellpadding="6" cellspacing="2" align="center">
<tr class="sidebarTitle"><td valign="top">op</td><td valign="top">Initial value</td></tr>
<tr class="GAtableText"><td valign="top">+</td><td valign="top">0</td>
<tr class="GAtableText"><td valign="top">*</td>	<td valign="top">1</td></tr>
<tr class="GAtableText"><td valign="top">-</td>	<td valign="top">0</td></tr>
<tr class="GAtableText"><td valign="top">&</td>	<td valign="top">-0</td></tr>
<tr class="GAtableText"><td valign="top">|</td>	<td valign="top">0</td></tr>
<tr class="GAtableText"><td valign="top">^</td>	<td valign="top">0</td></tr>
<tr class="GAtableText"><td valign="top">&&</td> <td valign="top">1</td></tr>
<tr class="GAtableText"><td valign="top">||</td> <td valign="top">0</td></tr>
</table>
<br></li>
<li>Each thread will perform some subset of the iterations done by the loop, and each thread's copy of <tt>sum</tt> will contain a summation of <tt>array[i] </tt> for that subset. For instance if we had two threads and one processed  i=1,3,5,7,&#8230;,99 and the other processed i=0,2,4,6,&#8230;,98 then the two copies of <tt>sum</tt> would end up with one containing a summation of array[1],array[3],array[5],&#8230; and the other a summation of array[0],array[2],array[4],&#8230;</li>
<li>Finally the thread-private versions of <tt>sum</tt> are reduced back into the shared <tt>sum</tt> variable. This is done by using the operator specified in the reduction clause - we've used '<tt>+</tt>' in this case, which means the values will be added.</li>
</ol>
<br>
Some things to note about reduction variables:
<ul>
<li>Reduction variables cannot also be present in the private/shared modifier lists</li>
<li>Many reduction variables can be used with different operators but each variable may be listed only once - e.g. <tt>#pragma omp for reduction(+: x,y) reduction(||: z) </tt> is quite allowable. </li>
<li>Reduction variables must be of scalar (simple) type. </li>
<li>The reduction operator must be valid for the type of the reduction variable. </li>
<li>Pointer and reference types are not allowed. </li>
<li>Within the body of the parallel loop, you have a lot of freedom with your reduction variables. You don't have to use the same operator as <tt>op</tt> - in fact, you can even use function calls instead of operators.</li>
</ul>

Reduction is in theory quite simple. However it's quite an unusual concept in the scope of C++, which makes it hard to explain. In most cases, though, you probably want to use a reduction variable to avoid synchronisation, in which case the reduction operation will just be the operation performed in the loop - if you're summing values use '<tt>+</tt>', if you're bit-wise and-ing values use '<tt>&</tt>', and so on.
<br><br>
<b>#pragma omp <i>parallel</i> for</b><br>
Often, all you want to use OpenMP for is to parallelise a loop. Quite frankly it's a bit messy to declare a parallel section using <tt>#pragma omp parallel</tt>, and then within that to declare a work-sharing loop using <tt>#pragma omp for</tt>. Luckily, OpenMP provides a nice neat way to accomplish this using a combination of the two constructs - <tt>#pragma omp parallel for</tt>. There's really nothing new to this construct - let's modify Example 5 to use it:
<br><br>
Example 5b:
<pre class="codeBox">
void example5b()
{
	omp_set_num_threads(4);

	int val[8];
	//we'll use our 4 threads to calculate & store the cubes of 1 - 9
#pragma omp parallel default(none) shared(val,thread)
	for(int i=1;i&lt;9;++i)
	{
		val[i-1] = i*i*i;
		int thread=omp_get_thread_num;
#pragma omp critical
		{
		cout&lt;&lt;i&lt;&lt;"^3="&lt;&lt;val[i-1]&lt;&lt;", using thread "&lt;&lt;thread&lt;&lt;endl;
		}
	}
}
</pre>

All that this construct does is squash the parallel region declaration and the work-sharing loop declaration together. It saves you a few lines and makes it clearer what's going on. Particularly while you're getting to grips with using OpenMP, I would strongly recommend using this form.
<br><br>
<b>#pragma omp sections & #pragma omp section</b><br>
When I first saw how easy OpenMP made loop-parallelisation, I was immensely impressed. I was able to use it effectively in a couple of marathon matches in which the core of my algorithm came down to performing a few loops over some pretty big data sets. However, anyone who's done some standard multi-threaded programming will probably already have realised that <tt>#pragma omp for</tt> is pretty restrictive in the styles of multi-threaded program that can be written using it.
<br><br>
There are two major ways to parallelise an application - the first is simply to distribute loop iterations over multiple threads, which we've just seen. But often an application won't be performing the same operation on some huge data set, but may instead have a few distinct tasks to do. One example is a video game, in which the central loop might look a little like this:
<pre class="codeBox">
void playGame
{
	while(!GameOver())
	{
		UpdateGamePhysics();
		UpdateGameAI();
		Draw();
	}
}
</pre>
In traditional multi-threaded programming, a programmer might look to create two additional threads so that physics and AI calculations can be done in parallel - the following is a <i>very</i> simple illustration of such an approach...
<pre class="codeBox">
void playGameMT
{
	HTHREAD hPhysicsThread = CreateGameThread(UpdateGamePhysicsLoop);
	HTHREAD hAIThread = CreateGameThread(UpdateGameAILoop);
	while(!GameOver)
	{
		Draw();
	}
	KillThread(hPhysicsThread);
	KillThread(hAIThread);
}

void UpdateGamePhysicsLoop()
{
	while(true)
	{
		UpdateGamePhysics();
	}
}
void UpdateGameAILoop()
{
	while(true)
	{
		UpdateGameAI();
	}
}
</pre>
In this example, CreateGameThread is a function that creates a thread; this thread simply runs the function passed to it. What this code demonstrates is a rough idea of how multiple threads can be used to distribute work over more than one core, in a very different way to what we've seen so far. In theory you could conceive of some way of coding this in such a fashion that loop parallelism might be possible, but luckily you don't need to - OpenMP provides a mechanism for doing exactly this! In fact the same multi-threaded approach implemented using OpenMP might look a little like this:
<pre class="codeBox">
void playGame
{
	while(!GameOver())
	{
	#pragma omp sections
		{
		#pragma omp section
			{
				UpdateGamePhysics();
			}
		#pragma omp section
			{
				UpdateGameAI();
			}
		#pragma omp section
			{
				Draw();
			}
		}//end of sections construct
	}
}
</pre>
The way that OpenMP allows us to perform several sections of code in parallel uses two constructs. Firstly we have the <tt>section</tt> construct. This informs OpenMP that the following code block is a 'chunk' of code that should all be executed by a single thread.
<br><br>
Second is the <tt>sections</tt> construct. This construct should contain a set of <tt>section</tt> constructs, and informs OpenMP that they should be executed in parallel. As usual, it's probably easier to see an example...
<br><br>
Example 6:
<pre class="codeBox2">
void example6()
{
	omp_set_num_threads(8);
	int val[9],thread[9];
#pragma omp parallel default(none) shared(val,thread)
	{
	#pragma omp sections
		{
		#pragma omp section
			{
				for(int i=0;i&lt;3;++i)
				{
					val[i]=1&lt;&lt;i;
					thread[i] = omp_get_thread_num();
				}
			}
		#pragma omp section
			{
				for(int i=3;i&lt;6;++i)
				{
					val[i]=1&lt;&lt;i;
					thread[i] = omp_get_thread_num();
				}
			}
		#pragma omp section
			{
				for(int i=6;i&lt;9;++i)
				{
					val[i]=1&lt;&lt;i;
					thread[i] = omp_get_thread_num();
				}
			}
		}
	}
	//output the results AFTER the parallel region
	for(int i=0;i&lt;9;++i)
		cout &lt;&lt; "2^"&lt;&lt;i&lt;&lt;" = "&lt;&lt;val[i]&lt;&lt;", calculated by thread "&lt;&lt;thread[i]&lt;&lt;endl;
}
</pre>

<b>Results from Example 6:</b><br>
<tt>2^0 = 1, calculated by thread 0</tt><br>
<tt>2^1 = 2, calculated by thread 0</tt><br>
<tt>2^2 = 4, calculated by thread 0</tt><br>
<tt>2^3 = 8, calculated by thread 1</tt><br>
<tt>2^4 = 16, calculated by thread 1</tt><br>
<tt>2^5 = 32, calculated by thread 1</tt><br>
<tt>2^6 = 64, calculated by thread 2</tt><br>
<tt>2^7 = 128, calculated by thread 2</tt><br>
<tt>2^8 = 256, calculated by thread 2</tt><br><br>

What we're doing in this example is very similar to Example 5, except that we're calculating powers of 2 instead of cubes. However, instead of parallelising a single loop we're performing three distinct pieces of code - each <tt>section</tt> will be executed by a single thread. Although in our simple example we actually do something that a parallel loop would be well suited for, the point is that each <tt>section</tt> can contain completely different functionality - one section could calculate the cubes of the first 100 integers while a second computes Fibonacci numbers and a third reads some data from a file.
<br><br>
There are some important things to note about using the <tt>sections</tt> work-sharing construct:
<ul><li>The maximum number of threads it can use is normally not greater than the number of <tt>section</tt> constructs - each <tt>section</tt> is a distinct piece of work so cannot be shared across multiple threads. In our example we allow OpenMP to create up to 8 threads, but only one for each <tt>section</tt> will actually be used - 3 in total. This can place limits on the scalability of your application for systems with many cores - a parallelised <tt>for</tt> loop can utilise as many cores as the loop has iterations, but our <tt>sections</tt> example is always limited to using 3 cores whether the system has 3 or 33.<br><br>
<b>NOTE:</b> <i>Some OpenMP implementations allow nested parallel constructs. For instance in each section, you could parallelise the loop. In this situation you may utilise more threads than there are sections because the code in each section is now parallelised. However this is advanced material beyond the scope of this article.</i></li> 
<li>You may have more sections in a work-sharing construct than the maximum number of allowed threads, in this case OpenMP will simply start of with the maximum number of threads, taking a <tt>section</tt> each and then allocating further sections to threads as they become available.</li>
<li>The default behaviour is that there is a barrier present at the end of the <tt>sections</tt> construct - if you have two consecutive <tt>sections</tt> constructs in the same parallel region then the second will not begin until the first has completed - even if there are unused threads with nothing to do during the first sections construct. For instance if, in our example, we had a second <tt>sections</tt> construct also containing 3 sections, then 3 threads would execute the first <tt>sections</tt> construct and would only execute the second <tt>sections</tt> construct after all 3 had finished.</li>
</ul>

<b>NOTE:</b> <i>It is possible to change the default behaviour of the for and sections constructs with regard to barriers, using the NOWAIT modifier clause. This falls beyond the scope of this article however.</i>
<br><br>
<b>#pragma omp <i>parallel</i> sections</b><br>
As <tt>#pragma omp parallel for</tt> is to <tt>#pragma omp for</tt>, so <tt>#pragma omp parallel sections</tt> is to <tt>#pragma omp sections</tt>. It simply combines a parallel region declaration with a single <tt>sections</tt> construct, saving you a little typing and making your code easier to read. Here's the code from Example 6, altered slightly to use this construct:

<pre class="codeBox2">
void example7()
{
	omp_set_num_threads(8);
	int val[9],thread[9];
#pragma omp parallel sections default(none) shared(val,thread)
	{
	#pragma omp section
		{
			for(int i=0;i&lt;3;++i)
			{
				val[i]=1&lt;&lt;i;
				thread[i] = omp_get_thread_num();
			}
		}
	#pragma omp section
		{
			for(int i=3;i&lt;6;++i)
			{
				val[i]=1&lt;&lt;i;
				thread[i] = omp_get_thread_num();
			}
		}
	#pragma omp section
		{
			for(int i=6;i&lt;9;++i)
			{
				val[i]=1&lt;&lt;i;
				thread[i] = omp_get_thread_num();
			}
		}
	}
	//output the results AFTER the parallel region
	for(int i=0;i<9;++i)
		cout &lt;&lt; "2^"&lt;&lt;i&lt;&lt;" = "&lt;&lt;val[i]&lt;&lt;", calculated by thread "&lt;&lt;thread[i]&lt;&lt;endl;
}
</pre>
<span class="bodySubtitle">Conclusion</span><br>
OpenMP borders on the revolutionary. Without having to ever 'touch' a thread you are able to inform the compiler how it should try to parallelise your program with a minimum of extra code. Loop parallelism is incredibly simple to use and remarkably flexible. Section parallelism is the area where OpenMP is still not as powerful as raw thread programming, but it is certainly still a powerful tool - and OpenMP is still being developed.
<br><br>
We've covered the basics here, and maybe some mid-level stuff too. However, while OpenMP is relatively compact there is a fair bit more to it. We've not covered the <tt>single</tt> work-sharing construct, the master synchronisation directive, the <tt>nowait</tt> clause or quite a few data scoping modifiers like <tt>firstprivate</tt>. I've avoided nested parallel constructs and neglected nearly all the <tt>omp_...</tt> functions.
<br><br>
As I wrote this my aim was not an exhaustive guide to every facet of OpenMP, but a reasonably thorough guide to the basics. I've focussed on the areas of OpenMP that I actually find myself using, assuming that these are the areas you'll find most useful too. My aim was to give enough sufficient examples for you to start using OpenMP in your applications; once you are comfortable I would certainly recommend reading the OpenMP 2.0 specification for full details of just what you can and cannot do. You can find this and all kinds of other stuff at <a href="http://www.openmp.org" target="_blank">www.openmp.org</a> -- take a look. Good luck!
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
