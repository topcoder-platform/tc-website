<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
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
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


            <jsp:include page="links.jsp" />
            <jsp:include page="links_summary.jsp" />

<table border="0" cellspacing="0" cellpadding="3" width="100%">
<tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
<tr><td class="tourney_subnav"><strong>Semifinal Room 4 Problem Analysis & Opinion</strong></td></tr>
<tr valign="top">
<td width="10%" class="bodyText">
<p>Friday, April 4, 2002</p>

<P><B>Problem Set Analysis & Opinion</B></P>
<p>
Semifinal rounds 1-3 were full of dramatic endings. In each match, it wasn't clear till the very 
end who would come away with a final's spot. Round 4 proved quite the opposite, with dgarthur 
defeating his opponents by a large margin. While the other coders struggled with the medium, 
dgarthur swept through the medium and hard attaining a score of 1233.47. DjinnKahn, the only 
other competitor to submit more than the easy, had both the hard and easy finished going into 
the challenge phase. DjinnKahn's hard ended up failing systests. Stunned by the ease with which 
dgarthur destroyed this set of problems, onlookers began to realize how exciting the final 
round will be. "The finals are stacked" said one spectator, eagerly awaiting tomorrow's main 
event. </p>

<font size="+2"><b>Circuits</b></font><BR />
Used as: Division 1 - Level 1:
<blockquote>
<table cellspacing="2" cellpadding="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">275</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">4 / 4  (100.00%) </td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">4 / 4  (100.00%)</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText"><b>DjinnKahn</b> for 248.25 points</td>
</tr>
</table></blockquote>
<p>
Finding the longest path in a directed graph is a difficult problem to solve. Luckily, the 
constraints ensured that the given graph would be acyclic, thus allowing for a simple solution. 
We will assign to each vertex, a cost that represents the longest path that can begin at that 
vertex. With a DFS (depth first search) we pass over all the vertices determining each ones' 
cost. At first, we can only determine the cost of the vertices whose outdegree (number of edges 
leaving) are 0 assigning each a cost of 0. Using those as our "base cases" we can build the 
costs for the rest of the vertices out of them using the following recursive definition:
cost of vertex v = Max[ cost of each vertex reachable in one step from v + cost of connecting 
edge]. The return value is the maximum cost of any vertex in the graph. This algorithm could be 
described as memoization on a graph. An alternative dynamic programming approach would be to 
topologically sort the vertices, and then build each cost bottom up. 
</p>

<font size="+2"><b>DecodeMoveToFront</b></font><BR />
Used as: Division 1 - Level 2:
<blockquote>
<table cellspacing="2" cellpadding="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">550</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">1 / 4  (25.00%) </td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">1 / 1  (100.00%)</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 326.61 points</td>
</tr>
</table></blockquote>
<p>
Reference implementation: brett1479 in practice room<br />

The process described in the problem allows us to take a plaintext string and a key, and make a 
cyphertext string. Reverse engineering this process, we can use the plaintext string and the 
cyphertext string to learn more about the key. The first thing to write, is a function that 
takes plaintext, cyphertext, and a guess at the key and will produce a more updated guess. 
To update our guess at the key, we go through the following process iterating through each 
character of the given strings. To aid in this process, we maintain a list representing where 
the initial key characters have moved to. That list begins as (0,1,2,3,...,26), whereas the 
initial key guess begins as "----...--". <br />
<ol>
<li>If the current character in the cyphertext is i then that will determine the position in 
the key to examine</li>
<li>If the current character in the plaintext is j then we know that is the character that must 
be found in the key</li>
<li>We assign j to the key at the location determined by position i in our list</li>
<li>We remove the number at position i from our list, and add it to the front</li>
</ol>
For example, lets say we have plaintext "A" and cyphertext "B". We assign "A" to the key at 
position 1 and then perform the removal. The finished list is (1,0,2,3,...,26) and the updated 
key guess is "-A--...--". This process is repeated on each pair of corresponding inputs, 
successively updating our guess at the key. In addition, if any conflicts occured, we can detect 
them at step 3 above. The only special case to check for, is whether or not all keys elements 
have been determined except 1. In this situation, we simply fill in the remaining '-' with the 
only unused letter. </p>

<font size="+2"><b>TreeTraversals</b></font><BR />
Used as: Division 1 - Level 3:
<blockquote>
<table cellspacing="2" cellpadding="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">950</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">2 / 4  (50.00%) </td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">1 / 2  (50.00%)</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 623.78 points</td>
</tr>
</table></blockquote>
<p>
Reference implementation: brett1479 in practice room<br />

The trick to this problem is realizing which order to process the inputs in. By using the 
breadth first traversal we know how each row should look, if we read them left to right. 
By using the in order traveral we can determine how wide each row is, and whose child each 
node is. The algorithm will iterate through the breadth first traversal elements 1 row at a 
time. The first row is clearly size 1. The size of future rows will be determined by their 
predecessors (higher rows). Assume v is the value of the current element we are observing in 
the breadth first traversal. First we determine iPos, the location of v in the in order 
traversal. Secondly, we see if we have already used the elements to the left and right of 
iPos in the in order traversal. If there are unused elements to the left we know v will have 
a left child. The same goes for the right side. We also know that when we process v's left 
child in the next row, it must lie to the left of iPos, and the same for v's right child 
(if they exist). This information can be used to figure out the characteristics of the next 
row by keeping track of the children discovered. Continuing this process till the tree is 
formed, or an error occurs produces our result. 

</p>




<IMG SRC="/i/m/brett1479_mug.jpg" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;brett1479<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&cr=251317" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
</td>
</tr>            
</table>

   <br><br>
   </div>
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
