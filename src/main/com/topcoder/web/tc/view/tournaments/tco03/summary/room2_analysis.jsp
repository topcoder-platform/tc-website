<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Room 2 Problem Anaylsis</title>

<jsp:include page="../../../script.jsp" />

</head>

<body onLoad="timer(1);">

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="room2"/>
</jsp:include>

            <p class="terciary">
                <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room2">Play-by-Play</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room2_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;Problem Analysis
            </p>
            
            <h2>Problem Set Analysis &amp; Opinion</h2>

            <a href="/stat?c=member_profile&cr=299177"><img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" align="left" /></a>
            <p>by <a href="/stat?c=member_profile&cr=299177">vorthys</a>, <br/>
            <em>TopCoder Member</em><br />
            Thursday, December 4, 2003<br/><br/></p>

            <h3>RepeatedSubstrings<br/>
            <span class="bodyText">Used as: Division 1 - Level 1:</span></h3>
                        
            <p>Consider the compressed text "AB&amp;0-4", which decompresses to "ABABABA". How do we know that the last character is an A? 
            Because it is a copy of the character in position 4. How do we know that character is an A? Because it is a copy of the character 
            in position 2, which in turn is a copy of the character in position 0. We know the character in position 0 is an A because it 
            appears directly in the compressed text. Decompression, then, is all about propagating the known characters into all the positions 
            that depend on them, directly or indirectly. We also need to detect cyclic dependencies, in which case we can't tell what the 
            character is, so we write question marks to the relevant positions.</p>

            <p>The simplest solution is to propagate known characters to all positions that depend on them directly, and iterate until there 
            are no more changes. In pseudocode,</p>

<pre>
text = string of 256 question marks
loop
    current = ""
    for each token in compressed do
        if token is letter or space then append to current
        if token is &amp;i-j then
            s = substring of text from position i to position j
            append s to current 
if current == text then return text
text = current
</pre>

            <p>This simple solution is efficient enough for the small strings considered here, but would be too slow for large texts. In the 
            worst case, it takes time quadratic in the size of the decompressed text. A more efficient solution follows each chain of dependencies 
            all the way to its conclusion.</p>

<pre>
text = ""
dependsOn = array of 256 integers
for each token in compressed do
    if token is letter or space then append to text
    if token is &amp;i-j then
        for each position p from i to j do
            append '-' to text
            dependsOn[current position in text] = p
for each position p in text do
    if text[p] == '-' then
        q = p
        while text[q] == '-' do  // find known character
            text[q] = '?'
            q = dependsOn[q]
        known = text[q]
        if known == '?' continue // found cycle, leave as question marks
        q = p
        while text[q] == '?' do  // copy known into positions in chain
            text[q] = known
            q = dependsOn[q]
return text
</pre>

            <p>This revised algorithm runs in time proportional to the size of the decompressed text.</p>

            <p>Now, for your next challenge, write the corresponding compression algorithm that always produces the shortest possible output! 
            (Or, to be more precise, the shortest output that decompresses without any question marks.) The nice thing about this framework is 
            that the compression engine is adjustable on the fly. You can choose to trade off compression speed vs compression quality at your 
            whim without affecting the decompression engine at all.</p>
                        
            <h3>MazeImprovement<br/>
            <span class="bodyText">Used as: Division 1 - Level 2:</span></h3>
                        
            <p>First, notice that disconnecting a short deadend and reconnecting it to an adjacent deadend can eliminate up to three short deadends 
            at once: the short deadend that was disconnected, the deadend that it was reconnected to (if that deadend happened to also be short), and 
            a short deadend that happened to be connected to the same intersection as the original short deadend (if that intersection became a 
            corridor when the original short deadend was disconnected). However, this transformation can never create a new short deadend. 
            Therefore, we can process the candidates row-by-row in a single pass from north to south. Within each row, we should proceed 
            from west to east.</p>

            <p>The easiest part to get wrong is the tiebreakers for which deadend to reconnect a short deadend to, in case there is more than one to 
            choose from. The preference is first for other short deadends, then for the northernmost deadend, and finally for the westernmost 
            deadend. Putting these preferences together, the order of priority is</p>
            
            <ol>
                <li>a short deadend to the east,</li>
                <li>a short deadend to the south,</li>
                <li>a deadend to the north,</li>
                <li>a deadend to the west,</li>
                <li>a deadend to the east, and</li>
                <li>a deadend to the south.</li>
            </ol>
            
            <p>There cannot be short deadends to the north or the west because those would already have been eliminated. A short deadend to the 
            east takes precedence over a short deadend to the south because it is farther north.</p>

            <p>A final point to be careful about is your representation of the connections. A common approach is to use a three-dimensional 
            array of booleans, where <tt>connected[X][Y][D]</tt> is true if the node at coordinates <tt>&gt;X,Y&lt;</tt> is connected to the node in direction D. 
            However, connections are two-way. You could handle two-way connections by storing a separate boolean for each direction, so 
            that, for example, <tt>connected[X][Y][WEST]</tt> is duplicated in <tt>connected[X-1][Y][EAST]</tt>. But then you have to be careful to update 
            both booleans whenever you disconnect or reconnect a node. It is very easy to forget one of them. Alternatively, you could store 
            only a single boolean for each connection, perhaps only in the north and east directions. Then, for example, when you wanted to 
            lookup <tt>connected[X][Y][WEST]</tt>, you would have to lookup <tt>connected[X-1][Y][EAST]</tt> instead. I usually find this second approach 
            easier, but it does mean you have to be very careful about how you handle the borders.</p>
                        
            <h3>SkewHeaps<br/>
            <span class="bodyText">Used as: Division x - Level x:</span></h3>
                        
            <p>shapes. Recall that the root is the minimum element in the tree. All elements that were inserted after the minimum element end up 
            on alternating sides of the tree, whereas elements inserted before the minimum element end up on the same side of the tree (the larger 
            side). In other words, the insertion sequence in general has the form</p>
            
<pre>[all X's] M [alternating X's and Y's]</pre>

            <p>where X's are the elements from the larger subtree, Y's are the elements from the smaller subtree, and M is the minimum element. 
            Furthermore, by the rules of insertion, the alternating X's and Y's must end with an element from the left subtree. Altogether, there are 
            four possibilities:</p>

<pre>1) L...L M RL...RL
2) R...R M L RL...RL</pre>

<pre>3) R...R M RL...RL
4) L...L M L RL...RL</pre>

            <p>where L's are the elements from the left subtree and R's are the elements from the right subtree. In fact, however, cases 3 and 4 are 
            impossible, because the first element inserted after M will go on the opposite side of the tree from all the elements inserted before M.</p>

            <p>We can determine which case applies by looking at the sizes of the two subtrees. If the left subtree is at least two elements bigger than 
            the right subtree, then we must fall under case 1. If the right subtree is bigger than the left subtree, then we must fall under case 2. But 
            we have a choice if the left and right subtrees are the same size, or if the left subtree is one bigger. If the subtrees are the same size, then 
            we could fall under either case 1 or case 2:</p>

<pre>1) M RL...RL
2) R M L RL...RL</pre>

Because M is the overall minimum element, case 1 is lexicographically smaller, so we choose that case. Similarly, if the left subtree is one element bigger than the right subtree, then we could fall under either case 1 or case 2:
<pre>1) L M RL...RL
2) M L RL...RL</pre>

            <p>This time case 2 is lexicographically smaller, so we choose that case.</p>

            <p>Finally, we need to figure out the internal orderings of the L's and R's. These can be obtained by recursive calls to history on the left 
            subtree and the right subtree, respectively. Altogether, the final algorithm is</p>

<pre>
history(tree) is
    if tree is empty then return empty sequence

    M = the element at the root
    LH = history(left subtree)  // #LH is size of LH
    RH = history(right subtree) // #RH is size of RH
    HIST = empty sequence
    if #LH == #RH or #LH > #RH+1 then
        // Case 1: L...L M RL...RL
        append first #LH-#RH elements of LH to HIST
        append M to HIST
        alternate appending elements of RH and remaining elements of LH to HIST
    else
        // Case 2: R...R M L RL...RL
        append first #RH-(#LH-1) elements of RH to HIST
        append M to HIST
        alternate appending elements of LH and remaining elements of RH to HIST
return HIST
</pre>

            <p>Notice that there is no need for special logic to handle the situations where</p>
            <ul>
                <li>both subtrees are empty (falls under case 1),</li>
                <li>the right subtree is empty but the left is not (falls under case 1 if the left subtree contains at least two elements, 
                or under case 2 if the left subtree contains exactly one element), or</li>
                <li>the left subtree is empty but the right is not (such trees are forbidden as input because they are impossible to 
                construct using only insertions).</li>
            </ul>

            <p>Your sense of algorithmic aesthetics may differ from mine, but this is quite possibly the most elegant new algorithm I've seen all year!</p>

            <p>Skew heaps, by the way, are another excellent data structure to keep in your toolbox. Do not be frightened away by the difficulty of 
            this problem. Skew heaps themselves are ridiculously easy to implement, and they perform comparably to ordinary binary heaps (the 
            kind used in heapsort). In addition, skew heaps allow you to merge two priority queues in logarithmic time, which ordinary binary heaps 
            do not.</p>
                        
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
