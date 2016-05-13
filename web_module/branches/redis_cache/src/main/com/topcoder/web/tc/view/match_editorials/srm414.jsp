<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 414 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&er=5&amp;rd=13505">Match Overview</a><br />
    <tc-webtag:forumLink forumID="522866" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 414</span><br />Saturday, August 16, 2008
<br /><br />



<h2>Match summary</h2>
<p>In both divisions competitors faced relatively strightforward easy and medium problems, but tough hard problems which only elicited a single passing submission between them. The only passing hard submission from <tc-webtag:handle coderId="22686851" context="algorithm"/> handed him the win in division 1. An excellent performance from <tc-webtag:handle coderId="22713193" context="algorithm"/> in only his fifth rated event put him in second place, with <tc-webtag:handle coderId="22074760" context="algorithm"/> completing the top three. In division 2, fast submissions on the easy and medium problems with a couple of successful challenges won <tc-webtag:handle coderId="22707682" context="algorithm"/> the division by a comfortable margin, with <tc-webtag:handle coderId="22678083" context="algorithm"/> coming second and <tc-webtag:handle coderId="300003" context="algorithm"/> third.</p>
<h1>The Problems </h1>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8786&amp;rd=13505" name="8786">RestaurantManager</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8786)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522866" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division Two - Level One:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">250 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">579 / 795 (72.83%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">488 / 579 (84.28%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>nitdgp</strong> for 247.21 points (3 mins 1 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">160.05 (for 488 correct submissions)
</td>
</tr>
</tbody>
</table>
</blockquote>
<p>This restaurant operates a first-come, first-served policy on its tables and you are tasked with working out how much business they will lose with this policy. As with many division II easy problems, the solution simply involves carefully simulating the process to arrive at the answer. Step through the arrivals in sequence and as each group arrives determine which table it should be allocated. A useful trick is to maintain a list of the times at which each table will become available. This is set to the departure time of the group to which the table is allocated. It is then very simple to determine whether a table is available at a given time.</p>
<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9895&amp;rd=13505" name="9895">Embassy</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9895)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522866" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division Two - Level Two:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">500 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">154 / 795 (19.37%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">63 / 154 (40.91%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>ahmed_aly</strong> for 458.37 points (8 mins 43 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">267.78 (for 63 correct submissions) </td>
</tr>
</tbody>
</table>
</blockquote>
Used as: Division One - Level One:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">250 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">444 / 557 (79.71%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">315 / 444 (70.95%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>krijgertje</strong> for 247.42 points (2 mins 54 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">172.71 (for 315 correct submissions)
</td>
</tr>
</tbody>
</table>
</blockquote>

<p id="j5y12">First notice that if we know the time that we start filling in the forms, then solving this problem is very simple: just fill in every form as soon as you have received it and get it approved at the first point in time when the embassy is open after you have finished filling it in. But how do we know when to start? With a day being potentially 10<sup id="j5y13">6</sup> time units long, a brute force over start time will work if it is efficiently implemented. However, there is a much more efficient solution, which is nearly as easy to implement. The key here is noticing that there is always an optimal solution where some form is approved just as the embassy is opening. This is straightforward to prove: take any optimal solution where this isn't the case. If at any point you had completed a form before the embassy had opened, you would be waiting and would get it approved right as the embassy opens. Otherwise, you never have to wait and such a solution can be shifted back in time, without changing the length of time it takes until the point where some form is filled out right at the opening time.</p>
<p id="j5y14">We therefore have a maximum of 50 starting times, so we can try them all. Assume for simplicity that the embassy opens each day at time 0 and closes at time <strong id="j5y15">openTime</strong>. Initially set the starting time to zero, then for each form, first shift the starting time back by the length of time it takes to fill it in, so that we arrive at the embassy just as it opens, then simulate the whole process. The optimal time is just the minimum over all the starting times you try. A helpful trick in this problem is noticing that you can work modulo <strong id="j5y16">dayLength</strong>, which makes it easy to work out whether the embassy is open or not.</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8394&amp;rd=13505" name="8394">Shape3D</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8394)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522866" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division Two - Level Three:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">1000 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">6 / 795 (0.75%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">0 / 6 (0.00%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee">No correct submissions </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">No correct submissions </td>
</tr>
</tbody>
</table>
</blockquote>
<p id="j5y191">This question asks you to canonicalize the description of a 3D volume. Such a canonicalization might be useful if you wanted to check whether 2 shapes were the same, for example. Unfortunately, this was rather tricky for a division 2 problem and nobody managed to get a working solution during the contest.</p>
<p id="j5y192">The first step is to realise that there are only a finite number of rotations the we need to consider, 24 to be exact. We can therefore simply try every possible rotation and take the one that gives the lexicographically minimum description. However, generating all 24 rotations is a tricky little problem in itself. The are many different ways to do this, such as by successive rotation around each coordinate axis, but you have to be very careful to ensure you generate all the possible rotations. A simpler and less error-prone way of generating the rotations is to use vectors. Notice that rotating the shape is the same as describing the shape in a rotated set of axes. However, we are only interested in coordinate systems whose axes are parallel with the current axes. We can therefore pick any two non-parallel directions out of the 6 axis directions to be our new <strong id="j5y193">i</strong> and <strong id="j5y194">j</strong> axes and then calculate <strong id="j5y195">k</strong> to form a right-handed set. We then resolve the shape into this new coordinate system. This sounds an awful lot more complicated than it actually is, particularly if you have a pre-written 3D vector class. c++ pseudocode follows.</p><pre id="j5y196">int Axis1 [] = {1,0,0,-1,0,0};<br id="tg785">int Axis2 [] = {0,1,0,0,-1,0};<br id="tg786">int Axis3 [] = {0,0,1,0,0,-1};<br id="tg787"><br id="tg788">vector &lt;vec3&gt; vShape;<br id="tg789">// vShape stores the coordinates of the cubes as 3D vectors<br id="tg7810"><br id="tg7811">for (int i=0;i&lt;6;i++)<br id="tg7812">    for (int j=0;j&lt;6;j++)<br id="tg7813">        if ((i%3) != (j%3)){ // 2 non-parallel directions<br id="tg7814"><br id="tg7815">            // i, j and k need to form a right-handed set<br id="tg7816">            vec3 iAxis(Axis1[i], Axis2[i], Axis3[i]);<br id="tg7817">            vec3 jAxis(Axis1</sub></tt>[j], Axis2[j], Axis3[j]);<br id="tg7818">            vec3 kAxis = iAxis.cross(jAxis);<br id="tg7819"><br id="tg7820">            // Resolve the shape into the new axes<br id="tg7821">            vector &lt;vec3&gt; rShape(vShape.size());<br id="tg7822">            for (int k = 0;k&lt;vShape.size();k++)<br id="tg7823">                rShape[k] = (vShape[i].dot(iAxis),<br/>                                    vShape[i].dot(jAxis), vShape[i].dot(kAxis));<br id="tg7824"><br id="tg7825">            ... process the rotated shape ...<br id="tg7826">        }<br id="tg7827"></pre>

<p id="j5y1109">That's all there is to generating the rotations. So we have our rotated shape, what now? We need to generate the lexicographically minimum description of that shape under some translation. Firstly, notice that we can always get some x-coordinate to beome 0, since if every coordinate is greater than 0 (we can't have any negative coordinates in our answer), we can always translate the entire shape in the negative x-direction until some x-coordinate becomes 0. So let's work out which x-coordinate will become 0 first and translate the entire shape to make that happen. It now helps to do the same for the y- and z-coordinates. This means that any further translation in the negative x-, y- or z-directions would lead to some coordinate becoming negative, so we only have to consider positive translations. Put differently, we can now increase the coordinates in our shape without limit, but from this point on we can't reduce them any further.</p>
<pre id="j5y1110">
int xmin = INF, ymin = INF, zmin = INF;
for (int k=0;k&lt;rShape.size();k++){
    xmin = min(xmin, rShape.x);
    ymin = min(ymin, rShape.y);
    zmin = min(zmin, rShape.z);
}
for (int k=0;k&lt;rShape.size();k++){
    rShape.x -= xmin;
    rShape.y -= ymin;
    rShape.z -= zmin;
}
</pre>

<p id="j5y1111">So now for the lexicographical minimization. For this we need to minimize the first element of the return, then the second element and so on. However, in this case it is sufficient to only consider the first element. Why? Because the only weapon in our armory is to translate the shape around and no two translations will cause some cube to have the same string representation. So, whichever cube is in the first position of the array will have some translation that minimizes it, and that translation will then determine the positions of the rest of the cubes as well. Consider, therefore, the cube in the first position of the array. Remembering that we can only increase the value of its coordinates, what translation causes it to become lexicographically minimal? It is easy to see that for each coordinate, we need to find the lexicographically minimum number that is greater than, or equal to it. For a number X, the number with this property is either X, if X is 0 or 1, or the smallest power of 10 that is greater than or equal to X. To see that we always end up with a power of 10, just consider the digits in order: unless X is 0, the first digit must be greater than 0, so we look for solutions where this digit is 1. We can always find some number greater than X whose first digit is 1. Similarly, considering the remaining digits, we can always find some number greater than X where each successive digit is set to 0. Therefore, we are always looking for a power of 10.</p>
<p> So now our translation is fully specified and we can apply it to the whole shape. We can then convert each of our cubes to the string representation and sort these in ascending order to given the overall lexicographically minimum array. However, we need to backpedal a bit: how do we know which element is going to end up in the first position? Since there are at most 50 cubes in the shape, we can just try every cube in the first position and take the lexicographically minimum description that results. If the cube that we have tried doesn't actually end up in the first position after sorting, it doesn't matter, as there is no way it could be the first element of the return anyway, because the translation that causes it to become lexicographically minimal causes another cube to be lexicographically less than it.</p><pre id="j5y1112">for (int first=0;first&lt;rShape.size();first++){<br id="tg7840"><br id="tg7841">    // Find the translation that we want<br id="tg7842">    int dx = rShape[first].x == 0 ? 0 : 1;<br id="tg7843">    int dy = rShape[first].y == 0 ? 0 : 1;<br id="tg7844">    int dz = rShape[first].z == 0 ? 0 : 1;<br id="tg7845">    while (dx &lt; rShape[first].x) dx *= 10;<br id="tg7846">    while (dy &lt; rShape[first].y) dy *= 10;<br id="tg7847">    while (dz &lt; rShape[first].z) dz *= 10;<br id="tg7848">    dx -= rShape[first].x;<br id="tg7849">    dy -= rShape[first].y;<br id="tg7850">    dz -= rShape[first].z;<br id="tg7851"><br id="tg7852">    // Generate the translated shape<br id="tg7853">    vector &lt;vec3&gt; tShape(rShape.size());<br id="tg7854">    for (int k=0;k&lt;rShape.size();k++)<br id="tg7855">        tShape[k] = vec3(rShape[k].x+dx, rShape[k].y+dy, rShape[k].z+dz);<br id="tg7856"><br id="tg7857">    // Generate the lexicographically minimum string representation<br id="tg7858">    vector &lt;string&gt; stringShape = toString(tShape);<br id="tg7859">    sort(stringShape.begin(),stringShape.end());<br id="tg7860"><br id="tg7861">    ... store the lexicographically minimum answer that we find ...<br id="tg7862">}<br id="tg7863"><br id="tg7864"></pre>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8772&amp;rd=13505" name="8772">StringInterspersal</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8772)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522866" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level Two:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">500 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">417 / 557 (74.87%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">285 / 417 (68.35%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>LayCurse</strong> for 488.65 points (4 mins 20 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">363.54 (for 285 correct submissions)
</td>
</tr>
</tbody>
</table>
</blockquote>
<p id="j5y18">This problem seems to be a simple ordering problem at first glance, but it has a boundary case that requires a little thinking. Most competitors realised very quickly that the solution is to work from the start of the string and add a single letter at a time. Since we need to minimize the first letter, we choose the smallest first letter out of the words in <strong id="j5y19">W</strong>, remove it from that word and add it to the return string. We then have a slightly smaller set of words and can simply repeat the process for the remaining letters. Simple, isn't it? Well, not quite, since we also have how to handle the case where 2 or more words start with the same letter. Which word should we choose to remove the first letter from? It seems intuitive that if the first letters are the same, then we should compare the second letter and if they're the same, compare the third letters and so on. This looks very similar to a lexicographic ordering, but there is one very important difference, as we will see later. First of all, let us take a look at why this intuition is correct.</p>

<p id="j5y110">Consider 2 words <tt id="j5y111">S<sub id="j5y112">1</sub></tt> and <tt id="j5y113">S<sub id="j5y114">2</sub></tt>, with some maximal shared prefix <tt id="j5y115">P</tt>, where the letter following <tt id="j5y116">P</tt> in <tt id="j5y117">S<sub id="j5y118">1</sub></tt> is <tt id="j5y119">x<sub id="j5y120">1</sub></tt> and the corresponding letter in <tt id="j5y121">S<sub id="j5y122">2</sub></tt> is <tt id="j5y123">x<sub id="j5y124">2</sub></tt>. Now consider some final interspersal in which <tt id="j5y125">c<sub id="j5y126">1</sub></tt> occurs before <tt id="j5y127">c<sub id="j5y128">2</sub></tt>: what we can show is that we can always generate this exact string up to and including <tt id="j5y129">c<sub id="j5y130">1</sub></tt>, by choosing the first letter of <tt id="j5y131">S<sub id="j5y132">1</sub></tt> first. This is because the prefix of both strings is the same, such that corresponding letters are interchangeable between the strings without changing the result. So if any block of characters from <tt id="j5y133">S<sub id="j5y134">2</sub></tt> is chosen before the characters from <tt id="j5y135">S<sub id="j5y136">1</sub></tt>, when can simply swap them over and choose that block of characters from <tt id="j5y137">S<sub id="j5y138">1</sub></tt> first. This is most easily demonstrated by example. If the strings are <tt id="j5y139">S<sub id="j5y140">1</sub></tt> = "COMMONPREFIXA" and <tt id="j5y141">S<sub id="j5y142">2</sub></tt> = "COMMONPREFIXB" with lexicographically minimum interspersal "CCOMMOMMONONPPREFIREFIXAXB", interspersed as follows: </p><pre id="j5y143">C&nbsp;&nbsp;&nbsp;&nbsp;<font id="j5y144" color="red">OMM&nbsp;&nbsp;ON</font>P&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="j5y145" color="green">REFI</font>XA<br id="tg78">&nbsp;C<font id="j5y146" color="red">OMM&nbsp;&nbsp;&nbsp;ON</font>&nbsp;&nbsp;&nbsp;P<font id="j5y147" color="green">REFI</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XB<br id="tg780">CCOMMOMMONONPPREFIREFIXAXB<br id="tg781"></pre>

<p id="j5y148">There are two blocks here where a letter of <tt id="j5y149">S<sub id="j5y150">2</sub></tt> is chosen before a letter of <tt id="j5y151">S<sub id="j5y152">1</sub></tt>, shown in red and green above. Note that a "block" here is a sequence of consecutive letters in one of the generating strings, which might not be consecutive in the interspersal. Since the blocks are the same in each string, we can simply swap them over:</p><pre id="j5y153">C&nbsp;OMM&nbsp;&nbsp;&nbsp;ON&nbsp;&nbsp;P&nbsp;REFI&nbsp;&nbsp;&nbsp;&nbsp;XA<br id="tg782">&nbsp;C&nbsp;&nbsp;&nbsp;OMM&nbsp;&nbsp;ON&nbsp;P&nbsp;&nbsp;&nbsp;&nbsp;REFI&nbsp;&nbsp;XB<br id="tg783">CCOMMOMMONONPPREFIREFIXAXB<br id="tg784"></pre>

<p id="j5y154">Now every letter in <tt id="j5y155">S<sub id="j5y156">1</sub></tt> (including the first) is chosen before the corresponding letter in <tt id="j5y157">S<sub id="j5y158">2</sub></tt>. The other thing to notice is that if we swapped the strings entirely and chose every letter from the other string, then the resulting interspersal wouldn't change before the original position of <tt id="j5y159">c<sub id="j5y160">1</sub></tt>, but rather than <tt id="j5y161">c<sub id="j5y162">1</sub></tt> appearing there <tt id="j5y163">c<sub id="j5y164">2</sub></tt> would appear in its place. This means that <tt id="j5y165">c<sub id="j5y166">1</sub></tt> must be alphabetically earlier than <tt id="j5y167">c<sub id="j5y168">2</sub></tt>, since otherwise we could generate a lexicographically smaller interspersal just by swapping the strings in the input. So what we have shown is that for any two strings, the alphabetically earlier character in the first position at which they differ will come earlier in the resulting interspersal, and it is always possible to achieve this by choosing letters from the string that contains the earlier letter before the corresponding letters of the other string. </p>

<p id="j5y169">However, there is a catch: what if there are no differing letters and one string is a proper prefix of another? Actually, it's quite easy to extend the logic above to show that any interspersal can be changed to one where letters from the <i id="j5y170">longer</i> string are chosen first without changing the resulting string. This leads us to a "tie-breaking" rule that is the opposite of the standard lexicographical comparison. </p>
<p id="j5y171">So the correct solution to this problem is as follows: define an ordering of the strings, where that a string <tt id="j5y172">S<sub id="j5y173">1</sub></tt> occurs before a string <tt id="j5y174">S<sub id="j5y175">2</sub></tt> if <tt id="j5y176">S<sub id="j5y177">1</sub></tt> either has the earlier character at the first position at which they differ, or <tt id="j5y178">S<sub id="j5y179">2</sub></tt> is a proper prefix of <tt id="j5y180">S<sub id="j5y181">1</sub></tt>. Then simply repeatedly extract the first letter of the earliest string under this ordering. There are a few other tricks that work as well, such as comparing <tt id="j5y182">S<sub id="j5y183">1</sub></tt> + <tt id="j5y184">S<sub id="j5y185">2</sub></tt> to <tt id="j5y186">S<sub id="j5y187">2</sub></tt> + <tt id="j5y188">S<sub id="j5y189">1</sub></tt> or padding the strings with very late characters (e.g. 'Z' + 1). Showing that the method that you employed is correct is homework.</p>
<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8673&amp;rd=13505" name="8673">KPlanetaryAlignment</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8673)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522866" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level Three:
<blockquote>
<table cellspacing="2">
<tbody>
<tr>
<td class="bodyText" style="background:#eee"><strong>Value</strong> </td>
<td class="bodyText" style="background:#eee">1000 </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Submission Rate</strong> </td>
<td class="bodyText" style="background:#eee">22 / 557 (3.95%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Success Rate</strong> </td>
<td class="bodyText" style="background:#eee">1 / 22 (4.55%) </td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>High Score</strong> </td>
<td class="bodyText" style="background:#eee"><strong>zhuojie</strong> for 427.89 points (50 mins 10 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background:#eee"><strong>Average Score</strong> </td>
<td class="bodyText" style="background:#eee">427.89 (for 1 correct submission) </td>
</tr>
</tbody>
</table>
</blockquote>
<p>This was an innocuous, but actually quite tricky counting problem with an evil boundary case that knocked out all but one of the submissions. Many competitors counted the number of distinct lines that were formed, when you were asked for the number of distinct times. Certain tricky test cases lead to 2 disjoint alignments happening simultaneously, and most of the solutions double-counted these events.</p> 
<p id="j5y1114">The first step in solving this problem is to answer the question: given some subset of the planets, how often are they all aligned? We can find the pairwise alignments between the planets in the subset, then work out when they all happen simultaneously. Alternatively, another way to visualize this is to pick some planet in the subset and imagine that we are rotating around the star, such that to us, this planet appears to remain stationary. The advantage to this is that now, rather than having to consider that the planets have to line up along some arbitrary line, this planet is sitting on the same line constantly, so we only have to consider the points in time when the planets pass this stationary line. If we calculate the new periods of our planets in this rotating frame of reference, each planet will lie on this line every half a period. The new period of each planet is given by:</p><tt id="j5y1115">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1<br id="j5y1116">&nbsp;&nbsp;&nbsp;&nbsp;--------- = ---&nbsp;-&nbsp;---<br id="j5y1117">&nbsp;&nbsp;&nbsp;&nbsp;T<sub id="j5y1118">i rotating</sub>&nbsp;&nbsp;&nbsp;&nbsp;T<sub id="j5y1119">i</sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T<sub id="j5y1120">0</sub> <br id="j5y1121"><br id="j5y1122"><br id="j5y1123">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T<sub id="j5y1124">i</sub>&nbsp;*&nbsp;T<sub id="j5y1125">0</sub><br id="j5y1126">=&gt;&nbsp;&nbsp;T<sub id="j5y1127">i rotating</sub> = -------<br id="j5y1128">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T<sub id="j5y1129">i</sub>&nbsp;-&nbsp;T<sub id="j5y1130">0</sub> </tt>

<br/><br/>where T<sub id="j5y1130">0</sub> is the period of the planet we have chosen to remain stationary and T<sub id="j5y1130">i</sub> is the period of some other planet in the subset. Remember to take the absolute value of this if one of the planets has negative period. Alignments of planet 0 and planet i happen with a period given by a half this value.</p>

<p id="j5y1131">We now have to work out how often these crossings all happen simultaneously. This is simply the lowest common multiple (LCM) of all the periods divided by 2. However, the periods are all fractions, so we need to work out how we can calculate the LCM of a set of fractions. First of all write all the fractions in their lowest terms. Next, consider that we are looking for a set of smallest integers, such that we can multiply each fraction by its respective integer and we will arrive at the same value for each one. For this to be true, both the numerator and the denominator must be the same. Let's start with the denominator: when we multiply a fraction by an integer, the denominator only changes due to cancellation when it shares a factor with then number by which we are multiplying. We therefore need to cancel out factors of the denominators until they are all the same. The only factors that will be left will be those that are shared between all the fractions. The denominator of the answer is therefore the greatest common divisor (GCD) of the denominators of the original fractions. Now, once all the denominators are the same, we need to work out how to make the numerators the same. With the denominators the same, this is now just a standard LCM calculation. The LCM of a set of fully reduced fractions is therefore:</p><tt id="j5y1132">&nbsp;&nbsp;&nbsp;&nbsp;LCM(numerators)<br id="j5y1133">&nbsp;&nbsp;&nbsp;-----------------<br id="j5y1134">&nbsp;&nbsp;&nbsp;GCD(denominators)<br id="j5y1135"></tt>
<p id="j5y1136">So now that we can work out the period of alignment of some subset of the planets, we simply take every k-sized subset, work out its period of alignment, use a simple division to work out how many of them occur in the specified time range and add them all together to get the total, right? Nearly, but not quite: the problem is that the sets of times that these alignments happen overlap and we are asked for the number of distinct times. We need some way of calculating the size of the union of a number of overlapping sets when the potential size of the answer is way too big to consider each time separately. Luckily, the inclusion/exclusion principle proves exactly such a method. This describes the size of a union of sets in terms of the sizes of their intersections, which are often much easier to calculate. An intersection here is the number of times within the specified time-period when two or more different k-subsets are aligned simultaneously. Noticing that each k-subset alignment is periodic with a fractional period and we want to work out how often several of them happen simultaneously. We see that this is exactly the same calculation that we have just performed with the pairwise planetary alignments. The inclusion/exclusion principle tells us to consider every possible subset of the sets we are trying to union and calculate the size of the intersection of these sets. If we have just chosen an odd number of sets, then we add this size to the total, otherwise we subtract it from the total. That's all there is to it!
</p><p id="j5y1137">A note on complexity: inclusion/exclusion takes time exponential in the number of sets. The worst case here is when we have the largest number of k-subsets, which happens when <strong id="j5y1138">N</strong> is 5 and <strong id="j5y1139">k</strong> is 2 or 3, where there are 10 subsets to consider. This is small enough that inclusion/exclusion easily works in time. With <strong id="j5y1140">N</strong> = 6 it is very hard to write a solution that doesn't time out. Notice also that the constraints were carefully set so that none of the values in the calculation would overflow a 64-bit integer, so it is unnecessary to use library integer classes.</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/StevieT_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21911760" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
