<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
		<jsp:param name="node" value="algo_match_editorials"/>
	</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505536" message="Discuss this match" /></div>
<span class="bodySubtitle">2002 TopCoder Invitational<br>Online Round #2</span><BR/>Thursday, October 17, 2002
<br><br>

<H1> The Problems </H1> 

<font size="+2"><b>Bullets</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505536" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 1<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">428/435 (98%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">414/428 (97%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>mbarb</b> for 248.60 points
        </td>
      </tr>    
    </table>
    </blockquote>
<P>Considering the difficulty of the Level Two problem, perhaps it's a good thing that this one was so easy. Many people found testing took longer than writing the actual problem (myself included) even using copy'n'paste tricks - one case where an autotester plugin would be superbly helpful. mbarb completed his implementation in two minutes and eight seconds, which on its own would have won him a place in Round 3 (though mbarb also solved the Level Two, bringing him up to room leader status.)</P>

<P>The simplest way to accomplish this was brute-force. Take each set of gun markings and rotate them as many times as necessary to make a full circuit, comparing at each step. If they match the bullet markings, return that element number. If none of them match, return -1.</P>

<P>Implementations can be split into basically three groups. The way I implemented it was to use three nested loops and do single-character comparisons in the deepest one, using the second-deepest as an offset, and modulus to find the actual character. My innermost test looked rather like if( gunmarkings[ currentgun ][ ( currentlocation + offset ) % size ] != bulletmarkings[ currentlocation ] ) this_isnt_it();</P>

<P>Some people decided to rotate the gun markings one character at a time, often making use of substring operations in the process. This had the advantage that they could get rid of a loop. The cleverest solutions I saw simply doubled the string, then did a substring search, looking for the bulletmarkings inside the doubled gunmarkings. If the gunmarkings could be rotated to match, there will be a
substring match, and if not, then not. This could be implemented as a single loop and a test.</P>

<P>Speed wasn't an issue, as in the worst-case you're doing 50^3 tests, which is well within the eight-second boundary.</P>

<font size="+2"><b>MatArith</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505536" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 1<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">500 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">219/435 (50%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">86/219 (39%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>bstanescu</b> for 336.60 points
        </td>
      </tr>    
    </table>
    </blockquote>
<P>This one wasn't as hard as the numbers would have you believe . . . just very very long, bugprone, and with a flaw in the problem description. The first thing you did should have been to turn the input into a more usable form. I decided to use a vector&lt; vector&lt; int &gt; &gt;, due to its resizability and pass-by-value semantics. This won't have any meaning to anyone who isn't C++ - I honestly don't know what you'd use otherwise, but since you're basically going for a 2-d integer array, it shouldn't be hard to find something.</P>

<P>Once you've parsed the input arrays into your data format of choice, you should also write multiply and add functions. They should return something special if the arrays aren't compatible - in my case, an empty array, which happened to conveniently translate to exactly the error return. Remember to check for overflow in *both* addition and multiplication - many people didn't. Also remember to use the exact overflow numbers, or alternatively, just see if it's the same number after it's been cropped to 32 bits, since those are the 32-bit overflow points.</P>

<P>Addition is easy, and nobody should have trouble with it. Multiplication can be a bit harder, and anyone who didn't already know it was probably doomed. I personally am not an expert in matrices - I've never gotten the hang of them for some reason - but your basic algorithm will look like three nested for loops. Unfortunately this is exactly where the glitch in the problem description was, and it went unnoticed for a long time because people who knew matrix multiplication simply skipped it, whereas people who didn't know it obviously had some trouble.</P>

<P>In any case, once those were completed, there was still the order-of-operations to deal with. Quite honestly, my expression parsing technique is horrible - in this case I made one pass through the string to take care of multiplication, adding new matrix names as I went ( &quot;A*B&quot; would be replaced with &quot;D&quot;, and I'd add a D matrix to my matrix database), then passed through again for addition. There are doubtless better ways, but for this situation, this worked beautifully.</P>

<P>After all that, of course, you've got to take your 2-d array format and turn it back into strings, being very careful to avoid terminating spaces on the end of each string.</P>

<P>You might be a bit worried about efficiency, but it's unnecessary. A pessimistic look at it gives us a maximum of 50^4 calculations, which is 6,250,000, well under the ten-million point where I even start worrying. Looking a bit closer yields even smaller numbers - at most there are 24 operations (two letters each, plus one for the first operation, and 50 letters at most in the equation), and the arrays go up to 25 width at most - one space and one digit per item. As long as you're not being blatantly inefficient, it should be just fine.</P>

<font size="+2"><b>Doorknobs</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505536" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 1<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1000 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">53/435 (12%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">27/53 (51%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>memetic</b> for 721.24 points
        </td>
      </tr>    
    </table>
    </blockquote>
<P>This is one of those problems where the only thing that saves you is the problem restrictions. Luckily, we only need to deal with six doorknobs, and that's what makes this problem possible.</P>

<P>First off, a bit of semantics. I realized pretty early on that it would simply things enormously if I considered the start position a &quot;doorknob&quot;. No, it isn't a doorknob, but if we consider it one, the question changes from &quot;find the shortest distance from start to any doorknob, then n-1 more doorknobs&quot; to &quot;starting at doorknob 0, find the shortest distance to n more&quot;, which is much much easier.</P>

<P>So we're going to call the start position a doorknob.</P>

<P>Now what we want is the shortest distance from any one doorknob to any other. This actually isn't all that hard. You can do a floodfill-like algorithm, or a breadth-first search, on the map. Efficiency might be a little worrying on the floodfill, since you might be doing it seven times on a 50x50 grid, so I found breadth-first worked quite nicely. In any case, just keep in mind not to go through walls, and assign a suitably high infinity value (one million works fine) if you can't get there from here. </P>

<P>At that point it's trivial - just brute-force all the combinations. At worst there's well under 1000 of them.</P>

<P>Problem solved.</P>



<P>A few other interesting stats. The lowest ranked competitor remaining in the tournament is Fingers, with a rating of 1037. Fingers actually did quite well this round, submitting a successful Level One problem in under five minutes for 243.04 points. Fingers was seeded #822 at the start of the tournament. The cutoff score from last round was gmenhorn, who spent 8 minutes and 40 seconds on the Level One to yield 229.34 points.</P>

<P>This means that if you spent more than 8 minutes and 40 seconds to complete the Level One, and didn't get any successful challenges, you didn't continue to the next round. I expect Round 3 to be hard enough that simply getting the Level One won't be enough, and by Round 4, there'll be figurative blood
in the water.</P>

<P><B>Good luck.</B></P>
<BR/>

<div class="authorPhoto">
    <img src="/i/m/ZorbaTHut_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="152347" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
