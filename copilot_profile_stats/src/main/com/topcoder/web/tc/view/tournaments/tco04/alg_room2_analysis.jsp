<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room2"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>SnapDragon takes it</p>

		<img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tco04/onsite_photos/shot_room2.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption"><br/>SnapDragon thinking his way right into the finals<br/></span>
		</div>

		<a href="/tc?module=MemberProfile&cr=269554"><img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/tc?module=MemberProfile&cr=269554">Yarin</a>, <br/>
		<em>TopCoder Member</em><br />
		Thursday, November 11, 2004<br/>
		introduction by lbackstrom
		<br/><br/>
		</p>
<p>
3 out of 4 of the 2002 TCO finals competitors rematched in round 2 of the semifinals.  The first problem was rated at 325, which is always a bad sign.  However, after 15 minutes, SnapDragon was the first to submit.  John Dethridge was next to submit, but was about 8 minutes behind, followed shortly by monsoon.  SnapDragon was also first to submit the medium problem, despite the fact that he missed a crucial constraint for a few minutes.  Many of the other coders also submitted two problems, and at the end of coding six of them had two submissions.
<br/><br/>
In the challenge phase, SnapDragon was first to act, putting himself almost out of reach, providing his submissions suceeded.  Towards the end of the challenge phase, jms137 also moved up 50 points, but it wasn't enough for him to advance.
<br/><br/>
Things were far from over, however.  The examples were rather scant, and half of the surviving submissions were destined to go down.  dgarthur lost both his problems, while John Dethridge, jms137, and cnettel each lost one.  Only SnapDragon and monsoon ended up with two successful submissions, and took first and second, respectively.  John Dethridge had the only other surviving medium submission, and narrowly edged out jms137.
<br/><br/>

<span class=bodySubtitle>BadXML</span>

<p>
Modern programming languages, such as Java and C#, have classes in their system libraries that
deals with XML documents. However, in this problem those classes are of virtually no use.
Loading an XML document like the one in the first example would most likely cause an exception
due to undefined namespace or undefined entity (hence the name of the problem, BadXML).
</p>

<p>
The task is solved easiest by splitting it up into two steps: first split up the
text in it's elements (tags and plain text) and store this in an array, and then
use this array to create the formatted XML document.
</p>

<p>
The first step is pretty simple, and can be done with a regular expression for instance.
The second step is a bit trickier. We maintain an indentation count, keeping track of the depth
of the stack. Note that it's not necessary to remember the actual tags that have been put on the stack;
we are guaranteed that the tags will be properly closed. Now, for each start tag we find when
looping over the XML elements (including plaintext), determine if the closing
tag is the next element or the element after that.
If so, add all these data on the current line in the output and continue. Otherwise post-increase
or pre-decrease the indentation count if the element is a start-tag or an end-tag.
</p>

<span class=bodySubtitle>DamagedTree</span>

<p>
The first thing one should notice is the constraints: there will be at most 15 unknown bits
in the input data. Hence there is no problem in trying all 2<sup>15</sup> ways to replace
the question marks, and for each replacement check if the tree is a valid coding tree.
If it is, try and decode the message. If all bits in the encoded message are used in the decoding
process, compare the decoded message with any previous result. If there is a mismatch, then there
is an ambiguity and we can return the empty string.
</p>

<p>
The hardest part in all this is checking whether the tree is a coding tree. One way to do
this is to actually create the binary tree, adding nodes where necessary. We just have to make
sure that no path is a prefix of another path; that is, that the leaf node of every branch
is a leaf in the tree. It turns out that you don't have to check if a node has only one child,
because this will never happen if the previous condition is true. Decoding the message
is then simply a traversal of this tree.
</p>

<p>
Another way to check whether the tree is a proper binary tree is to pair wise compare the binary
codes and check if any is a prefix of another (this requires three nested loops, so some
care must be taken to avoid time out). This approach requires that you understand that
it's not necessary to check whether the tree is complete. The message can then be decoded
by prefix matching the binary codes with the encoded message. One has to be a bit careful
here and not do too many string operations, since this could cause the solution to time out.
</p>


<span class=bodySubtitle>CircularSequence</span>

<p>
There are <i>n*(n-1)+1</i> different contiguous sequences, so we obviously can't test them one-by-one,
since <i>n</i> might be 1 million. A smarter approach is needed. Dealing with circular structures is always
tricky, so a good idea is to reduce the problem into two similar problems with a linear
structure instead. Finding this reduction might very well be the hardest part of the problem.
</p>

<p>
Let's enumerate the elements in the circular sequence in the order they are generated, starting
with <i>1</i> and ending with <i>n</i>. For any contiguous sequence with the maximum sum, all elements
that are <i>not</i> part of this sequence (the complement) will be a contiguous sequence with the
minimum sum. Furthermore, at least one of those two sequences will not wrap around
from element <i>n</i> to <i>1</i>. By finding all contiguous sequences with the maximum sum in the linear interval from <i>1</i> to <i>n</i>
and all contiguous sequences with the minimum sum in the linear interval <i>2</i> to <i>n-1</i> (this will ensure that
no sequence is counted twice) and merging those results, we have the final result. It's
important to realize why the minimum sequences must be found between <i>2</i> and <i>n-1</i>, because a minimum
sequence found between, say, <i>1</i> and <i>5</i>, would correspond to a maximum sequence between <i>6</i> and <i>n</i>,
and this sequence would already have been found and must not be counted twice. By only considering
the interval <i>2</i> to <i>n-1</i>, we will ensure that there is a wrap-around in the complement sequence.
</p>

<p>
Finding a contiguous subsequence with the maximum sum is a fairly
straightforward task, and is something that several algorithm text books mention. The algorithm looks like this:
</p>

<pre>
int sum=0, maxSum=0;
for(int i=0; i&lt;n; i++) {
    sum += a[i]; 
    if (sum &lt; 0) sum = 0;
    if (sum &gt; maxSum) maxSum = sum;
}
</pre>

<p>
We greedily add elements to the contiguous sequence, until the sum of those elements drop below 0.
Then all elements are removed, and we begin anew. After every element added, check if got a new
maximum sum.
</p>

<p>
Counting the number of maximum sequences is a bit trickier. A first attempt would be to just increase
a count when sum equals maxSum, but then we will not find all starting positions. Consider for instance
the linear sequence {1,-1,1} which has three different ways to get the sum 1. The trick here is to also
count the number of times the accumulating sum drops to precisely 0, since then there is an option
to either restart the contiguous sequence, or to reset it. The following code handles this:
</p>

<pre>
int sum=0, maxSum=0, noSeq=0, noStart=1;
for(int i=0; i&lt;n; i++) {
    sum += a[i];
    if (sum &lt; 0) { sum = 0; noStart = 0; }
    if (sum == 0) noStart++;
    if (sum &gt; maxSum) { maxSum = sum; noSeq = 0; }
    if (sum == maxSum) noSeq += noStart;	
}
</pre>

<p>
Only a few more lines of code are needed to handle both the minimum sum and maximum sum case.
</p>
            
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
