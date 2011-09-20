<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

                        <p><font size="4"><strong>Immutable Objects</strong></font><br />
                        Thursday, July 10, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=299177"><strong>vorthys</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>
<b>Introduction</b><br />
How many times have you been bitten by the following bugs?  You pass
an object to an innocent-looking method and it makes changes to the
object that you weren't expecting.  Or you update an object in one
thread and some other thread makes incompatible changes to the same
object.  Or you place an object in a hash table and then somebody
makes a change to the object that alters its hash code, so the object
is now in the wrong place in the hash table.  All of these bugs&#8212;and
a horde of similar bugs&#8212;can be avoided by using objects that are
<i>immutable</i>.
</p>

<p>
An immutable object is read-only&#8212;once it is created, it can never be
changed.  All of the bugs mentioned above involve undisciplined or 
incompatible changes to an existing object.  Such bugs simply go away when
you switch to using immutable objects.
</p>

<p>
Of course, we have to be able to update our data structures.  For example,
when implementing collections, we obviously want to be able to add and remove

elements.  The key is that when we update an immutable object, we get back
a <i>new</i> object that reflects the update&#8212;we do not change the 
<i>existing</i> object.  Java programmers will be familiar with this
behavior from the <tt>String</tt> class.  In Java, strings are immutable and

concatenating two strings, for example, produces a third string but does
not alter either of the original strings.
</p>

<p>
Besides reducing bugs, immutable objects have several other advantages.  
Perhaps most importantly, threads that manipulate immutable objects have
drastically reduced synchronization requirements.  Two threads can safely
access or even update the same object without any synchronization whatsoever.

See <b>schveiguy</b>'s recent article on <A href="/tc?module=Static&d1=features&d2=052703">Threads and Atomicity</A> for a discussion of the kinds
of headaches caused by threads when working with ordinary, mutable objects.

</p>

<p>
Immutable objects are particularly handy for implementing certain
common idioms such as undo/redo and abortable transactions.  Take
undo for example.  A common technique for implementing undo is to
keep a stack of objects that somehow know how to run each command
in reverse (the so-called "Command Pattern").  However, figuring

out how to run a command in reverse can be tricky.  A simpler 
technique is to maintain a stack of immutable objects
representing the state of the system between successive commands.
Then, to undo a command, you simply revert back to the previous
system state (and probably store the current state on the redo stack).
</p>

<p>
As an extended example of the kind of idiom supported by immutable objects,

consider an application that processes the nodes of a tree top-down, where
each node is processed in an environment that contains all of the node's 
ancestors.  This pattern is extremely common in interpreters 
and compilers.  Now, as you move down the tree, you obviously add
information about each node to the environment, but what about when you
move back up the tree?  Using ordinary, mutable objects, you have to explicitly

remove nodes from the environment, as in the following code:
<pre>
   void visit(TreeNode t, MutableEnvironment env) {
     ...do something at t involving env...

     env.add(t);    // moving down the tree, add to environment
     if (t.left != null) visit(t.left, env);
     if (t.right != null) visit(t.right, env);
     env.remove(t); // moving up the tree, remove from environment
   }
</pre>
On the other hand, using immutable objects, you simply throw away the new 
environment and go back to using an earlier environment.
<pre>
   void visit(TreeNode t, ImmutableEnvironment env) {
      ...do something at t involving env...

      ImmutableEnvironment newEnv = env.add(t);
      if (t.left != null) visit(t.left, newEnv);
      if (t.right != null) visit(t.right, newEnv);
      // discard newEnv, no need to remove t!
   }
</pre>
Notice that the recursive visit to the left child will update its environment,

but when that recursive visit returns, those updates will be discarded.
The recursive visit to the right child will revert back to <tt>newEnv</tt>,

which was unaffected by any changes made while processing the left
child.
</p>

<p>
So far, the differences between the two versions of <tt>visit</tt> may
seem minor, but now suppose you want to modify <tt>visit</tt> to process
both children of the node concurrently.  In the version using immutable
environments, this modification would be trivial, but in the version using 

mutable environments, the changes would be all-encompassing.  You would 
essentially have to rewrite the code from scratch!
</p>

<p>
I been have extolling the virtues of immutable objects, but they
have their downsides as well.  Immutable objects are commonly less efficient

that their mutable counterparts, in both time and space.  The
efficiency problems are particularly severe for flat objects like
strings, making it most unfortunate that many programmers' first
introduction to immutable objects is the <tt>String</tt> type in
Java.  However, the efficiency differences are typically much smaller for
structured data like trees.  The space issue is exacerbated by the
fact that immutable objects are frequently shared, making it unclear
who should be responsible for their deallocation.  Garbage collection
is a big help here.  On the other hand, the increased sharing possible
with immutable objects can make immutable objects use <i>less</i> space
for some applications, such as those using the so-called "Flyweight Pattern".

</p>

<p>
The most serious downside of immutable objects is that they require a
different mindset from mutable objects, one that many programmers
initially find foreign.  For example, it is often easier to process
immutable objects using a recursive, functional style (see
<b>radeye</b>'s article on <A href="/tc?module=Static&d1=features&d2=feat_010803">Functional Programming</A>) 
than the loops and assignments many programmers are most
comfortable with.  But if you can get past this initial discomfort, you will

find that immutable objects are often just the right tool for writing
reliable, thread-safe code.
</p>



                        <p><br/></p>

                        <p>Would you like to <a href="/tc?module=Static&d1=features&d2=topics" class="bodyGeneric">write a feature?</a></p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
