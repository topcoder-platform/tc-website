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
                        <p><font size="4"><strong>Threads and Atomicity</strong></font><br />
                        Tuesday, May 27, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=273217"><strong>schveiguy</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>
<b>Introduction</b><br />
It has been quite a while since I was introduced to the concept of threads.
Since then, I have learned many interesting features -- and headaches --
associated with them.  This article discusses probably the most important
concept that you as a thread programmer need to know: atomicity.
</p>

<p>
For those of you who have not used threads before, they are simply processes
that share the same memory and name space.  Each has its own stack and is run
preemptively by the system scheduler.  However, they all access the same
variables with the same names, which makes communication between threads much
simpler than communication between processes.  In addition, creating a thread
is much less taxing on the OS since new memory space is not needed.
</p>

<p>
<b>Atomicity</b><br />
Atomicity brings in the notion of atomic operations.  An atomic operation is
one that cannot be divided.  In the world of computers, this can be a single
machine instruction.  What makes atomic operations special is that they can be
executed by one thread without worrying that another thread will change or
read the value that is changed or read by the first thread.
</p>

<p>
It is very important to understand that normally <i>any</i> operation can be
non-atomic.  Even machine instructions can be non-atomic if multiple CPUs
are running the threads.  To demonstrate, let's view the following simple
C/C++ code:
</p>

<pre>
int var = 0;

void thread_main()
{
  var++;
}
</pre>

<p>
If you execute one instance of thread_main, then var will have a value of 1
after the thread is done.  What happens if you execute multiple instances of
thread_main?  To see, we will dissect the instruction in question.  The
compiler breaks the instruction "var++;" into three machine instructions:<br />
<ol>
  <li>Load the value of var into a register.</li>
  <li>Increment the register</li>
  <li>Load the value in the register back to var.</li>
</ol>
</p>

<p>
Let's say there are two threads executing, and after one undergoes the first
step, it is preempted by the second thread.  The second thread performs all
three steps, so now the value of var is 1.  When the first thread wakes back
up, it still has a value of 0 in the register, which it increments and stores
back to var.  The result is that var is now 1 after both threads have
executed.  This corrupted access of the var variable is a good example of a
race condition.  Of course, the threads may both execute steps 1, 2, and 3
before being preempted, which will result in var having a value of 2.  This
is what makes thread debugging so difficult -- you may only have a one in a
million shot at seeing erroneous behavior.  The best way to avoid this is to
synchronize the threads with a mutex lock.  By synchronizing the threads, you
are forcing them to cooperate and let only one of them execute certain
instructions at a time.  A mutex lock works by putting a thread to sleep until
the lock can be acquired, and once the lock is obtained, no other threads can
obtain the lock.  Not coincidentally, mutex locks are usually implemented
using atomic machine instructions.  With mutex locks, the code above now reads
(in pthread style):
</p>

<pre>
int var = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void thread_main()
{
  pthread_mutex_lock(&amp;mutex);
  var++;
  pthread_mutex_unlock(&amp;mutex);
}
</pre>

<p>
This code will <i>always</i> result in var having a value equal to the number of
threads run.  By using the locks, the "var++;" instruction now looks atomic to
the two threads.  I say "looks atomic", because there is nothing stopping some
other function from changing the value of var in another thread.  In order to
maintain atomicity for instructions that operate on a variable, all places
that change or read the variable need to lock the mutex before accessing it.
</p>

<p>
<b>Always Use Mutexes</b><br />
You may say to yourself "Hey, one in a million, that will never happen!".
Trust me.  It will.  I've debugged threaded systems with variables that were
not correctly synchronized, which would run for weeks before hanging.
Decreasing the frequency of thread problems only makes them worse, because
they are harder to find and reproduce.
</p>

<p>
As a general rule, whenever you access variables that are shared between
threads -- including reading the variable -- you should use a mutex lock.
There are some exceptions, and generally this is when the read operation is
atomic.  For example, in our above code, we could have a thread that reads the
value of var without changing it.  This code would not require a mutex lock
because the save from memory to var (step 3) IS atomic.  However, this
shortcut is not portable.  For example, on an 8-bit system, if var is a 16-bit
value, the save to memory is NOT atomic (2 instructions are required).  Very
bizarre errors could occur if var is only partially written when it is read.
In short, the answer is always to lock.  Locking cannot hurt, it can only
help.
</p>

<p>
<b>Further Resources</b><br />
There are more gotchas with threads that have not been discussed here, such as
deadlocking.  For more information on these topics, pick up a good threading
book.  Which book you get depends on the threading system you use.
</p>

<p>
For (POSIX) pthreads, and other UNIX-supported thread libraries: 
<ul>
  <li><a href="http://www.gnu.org/software/pth/related.html" target="parent">GNU's multithreading library links</a>.</li>
  <li><a HREF="http://www.amazon.com/exec/obidos/tg/detail/-/0201633922/ref=pd_sr_ec_ir_b/103-7861235-7935836?v=glance&amp;s=books" target="parent">Programming with POSIX Threads</a> by David R. Butenhof.  
  This is a good thread reference, and describes most of the issues with threads programming.</li>
</ul>
</p>

<p>
For Win32 threads:
<ul>
  <li>Go to <a href="http://msdn.microsoft.com/library" target="parent">MSDN library</a> and search for "CreateThread" for the APIs for threads.</li>
  <li><a HREF="http://www.amazon.com/exec/obidos/tg/detail/-/0201442345/qid=1046881916/sr=1-1/ref=sr_1_1/103-7861235-7935836?v=glance&amp;s=books" target="parent">Multithreading 
  Applications in Win32</a> by James E. Beveridge.  A book that I found on Amazon.com.</li>
</ul>
</p>

<p>
For Java threads:
<ul>
  <li>Of course, the API resides at <a href="http://java.sun.com/j2se/1.4.1/docs/api" target="parent">Sun</a>.</li>
  <li><a href="http://www.amazon.com/exec/obidos/ASIN/0672315858/qid=1046884007/sr=2-1/ref=sr_2_1/103-7861235-7935836" target="parent">Java 
  Thread Programming</a> by Paul Hyde.  Another book I found on Amazon.</li>
</ul>
</p>

<p>
It is a good idea to look through at least one threading book instead of just
jumping into the APIs.  Most of the APIs do not tell you about how to code
with threads correctly, they just tell you the function calls.  Coding
with threads can bring great benefits to your application, but it can
also bring great problems.  Thread responsibly!
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

