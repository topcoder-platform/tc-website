<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.math
{
   font-family: times, times new roman, serif;
   font-weight: normal;
   font-style: italic;
   font-size: 15px;
}
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   font-size: 13px;
   font-weight: normal;
   line-height: 14px;
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
            <jsp:param name="node" value="algo_tutorials"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="alg_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="518219" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Using Tries</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/luison9999_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10200923" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">


<h3>Introduction</h3>
<p>There are many algorithms and data structures to index and search strings inside a text, some of them are included in the standard libraries, but not all of them; the trie data structure is a good example of one that isn't.</p>
<p>Let <strong>word</strong> be a single string and let <strong>dictionary</strong> be a large set of words.  If we have a dictionary, and we need to know if a single word is inside of the dictionary the tries are a data structure that can help us. But you may be asking yourself, "Why use <strong>tries</strong> if <strong>set</strong> &lt;<strong>string</strong>&gt; and hash tables can do the same?"  There are two main reasons:</p>
<ul>
    <li>The tries can insert and find strings in O(<em>L</em>) time (where <em>L</em> represent the length of a single word). This is much faster than set <string>, but is it a bit faster than a hash table.</li>
    <li>The <strong>set</strong> &lt;<strong>string</strong>&gt; and the hash tables can only find in a dictionary words that match exactly with the single word that we are finding; the trie allow us to find words that have a single character different, a prefix in common, a character missing, etc.</li>
</ul>
<p>The tries can be useful in TopCoder problems, but also have a great amount of applications in software engineering.  For example, consider a web browser.  Do you know how the web browser can auto complete your text or show you many possibilities of the text that you could be writing? Yes, with the trie you can do it very fast.  Do you know how an orthographic corrector can check that every word that you type is in a dictionary? Again a trie.  You can also use a trie for suggested <em>corrections</em> of the words that are present in the text but not in the dictionary.</p>


<h3>What is a Tree?</h3>
<p>You may read about how wonderful the tries are, but maybe you don't know yet what the tries are and why the tries have this name. The word trie is an infix of the word "re<strong>trie</strong>val" because the trie can find a single word in a dictionary with only a prefix of the word.  The main idea of the trie data structure consists of the following parts:</p>
<ul>
    <li>The trie is a tree where each vertex represents a single word or a prefix.</li>
    <li>The root represents an empty string (""), the vertexes that are direct sons of the root represent prefixes of length 1, the vertexes that are 2 edges of distance from the root represent prefixes of length 2, the vertexes that are 3 edges of distance from the root represent prefixes of length 3 and so on. In other words, a vertex that are <em>k</em> edges of distance of the root have an associated prefix of length <em>k</em>.</li>
    <li>Let <strong>v</strong> and <strong>w</strong> be two vertexes of the trie, and assume that <strong>v</strong> is a direct father of <strong>w</strong>, then <strong>v</strong> must have an associated prefix of <strong>w</strong>.</li>
</ul>
<p>The next figure shows a trie with the words "tree", "trie", "algo", "assoc", "all", and "also."</p>
<div align="center"><img src="/i/education/alg_tries.png" /></div>
<p>Note that every vertex of the tree does not store entire prefixes or entire words. The idea is that the program should remember the word that represents each vertex while lower in the tree.</p>


<h3>Coding a Trie</h3>
<p>The tries can be implemented in many ways, some of them can be used to find a set of words in the dictionary where every word can be a little different than the target word, and other implementations of the tries can provide us with only words that match exactly with the target word.  The implementation of the trie that will be exposed here will consist only of finding words that match exactly and counting the words that have some prefix. This implementation will be pseudo code because different coders can use different programming languages.</p>
<p>We will code these 4 functions:</p>
<ul>
    <li>addWord. This function will add a single string <strong>word</strong> to the dictionary.</li>
    <li>countPreffixes. This function will count the number of words in the dictionary that have a string <strong>prefix</strong> as prefix.</li>
    <li>countWords. This function will count the number of words in the dictionary that match exactly with a given string <strong>word</strong>.</li>
    <li>Our trie will only support letters of the English alphabet.</li>
</ul>
<p>We need to also code a structure with some fields that indicate the values stored in each vertex. As we want to know the number of words that match with a given string, every vertex should have a field to indicate that this vertex represents a complete word or only a prefix (for simplicity, a complete word is considered also a prefix) and how many words in the dictionary are represented by that prefix (there can be repeated words in the dictionary). This task can be done with only one integer field words.</p>
<p>Because we want to know the number of words that have like prefix a given string, we need another integer field <strong>prefixes</strong> that indicates how many words have the prefix of the vertex.  Also, each vertex must have references to all his possible sons (26 references).  Knowing all these details, our structure should have the following members:</p>
<pre>
<strong>structure</strong> Trie
    <strong>integer</strong> words;
    <strong>integer</strong> prefixes;
    <strong>reference</strong> edges[26];
</pre>

<p>And we also need the following functions:</p>
<pre>
initialize(vertex)
addWord(vertex, word);
<strong>integer</strong> countPrefixes(vertex, prefix);
<strong>integer</strong> countWords(vertex, word);
</pre>

<p>First of all, we have to initialize the vertexes with the following function:</p>
<pre>
<strong>initialize</strong>(vertex)
    vertex.words=0
    vertex.prefixes=0
    <strong>for</strong> i=0 <strong>to</strong> 26
        edges[i]=NoEdge
</pre>

<p>The addWord function consists of two parameters, the vertex of the insertion and the word that will be added.  The idea is that when a string <strong>word</strong> is added to a vertex <strong>vertex</strong>, we will add <strong>word</strong> to the corresponding branch of <strong>vertex</strong> cutting the leftmost character of word. If the needed branch does not exist, we will have to create it. All the TopCoder languages can simulate the process of cutting a character in constant time instead of creating a copy of the original string or moving the other characters.</p>
<pre>
<strong>addWord</strong>(vertex, word)
    <strong>if</strong> isEmpty(word)
        vertex.words=vertex.words+1
    <strong>else</strong>
        vertex.prefixes=vertex.prefixes+1
        k=firstCharacter(word)
        <strong>if</strong>(notExists(edges[k]))
            edges[k]=createEdge()
            initialize(edges[k])
        cutLeftmostCharacter(word)
        addWord(edges[k], word)
</pre>

<p>The functions countWords and countPrefixes are very similar. If we are finding an empty string we only have to return the number of words/prefixes associated with the vertex. If we are finding a non-empty string, we should to find in the corresponding branch of the tree, but if the branch does not exist, we have to return 0.</p>
<pre>
<strong>countWords</strong>(vertex, word)
    k=firstCharacter(word)
    <strong>if</strong> isEmpty(word)
        return vertex.words
    <strong>else if</strong> notExists(edges[k])
        return 0
    <strong>else</strong>
        cutLeftmostCharacter(word)
        return countWords(edges[k], word);

<strong>countPrefixes</strong>(vertex, prefix)
    k=firstCharacter(prefix)
    <strong>if</strong> isEmpty(word)
        return vertex.prefixes
    <strong>else if</strong> notExists(edges[k])
        return 0
    <strong>else</strong>
        cutLeftmostCharacter(prefix)
        return countWords(edges[k], prefix)
</pre>


<h3>Complexity Analysis</h3>
<p>In the introduction you may read that the complexity of finding and inserting a trie is linear, but we have not done the analysis yet.  In the insertion and finding notice that lowering a single level in the tree is done in constant time, and every time that the program lowers a single level in the tree, a single character is cut from the string; we can conclude that every function lowers <em>L</em> levels on the tree and every time that the function lowers a level on the tree, it is done in constant time, then the insertion and finding of a word in a trie can be done in O(<em>L</em>) time.  The memory used in the tries depends on the methods to store the edges and how many words have prefixes in common.</p>


<h3>Other Kinds of Tries</h3>
<p>We used the tries to store words with lowercase letters, but the tries can be used to store many other things.  We can use bits or bytes instead of lowercase letters and every data type can be stored in the tree, not only strings. Let flow your imagination using tries!  For example, suppose that you want to find a word in a dictionary but a single letter was deleted from the word.  You can modify the countWords function:</p>
<pre>
<strong>countWords</strong>(vertex, word, missingLetters)
    k=firstCharacter(word)
    <strong>if</strong> isEmpty(word)
        return vertex.word
    <strong>else if</strong> notExists(edges[k]) and missingLetters=0
        return 0
    <strong>else if</strong> notExists(edges[k])
        cutLeftmostCharacter(word)
        return countWords(vertex, word, missingLetters-1)
        <em>Here we cut a character but we don't go lower in the tree</em>
    <strong>else</strong>
        <em>We are adding the two possibilities: the first
        character has been deleted plus the first character is present</em>
        r=countWords(vertex, word, missingLetters-1)
        cutLeftmostCharacter(word)
        r=r+countWords(edges[k], word, missingLetters)
        return r
</pre>
<p>The complexity of this function may be larger than the original, but it is faster than checking all the subsets of characters of a word.</p>


<h3>Problems to Practice</h3>
<p><a href="/stat?c=problem_statement&pm=3972">WordFind SRM 232</a><br />
<a href="/stat?c=problem_statement&pm=8019&rd=10773">SearchBox SRM 361</a><br />
<a href="/stat?c=problem_statement&pm=7694">CyclicWords SRM 358</a><br />
<a href="/stat?c=problem_statement&pm=7411">TagalogDictionary SRM 342</a><br />
<a href="/stat?c=problem_statement&pm=6215">JoinedString SRM 302</a><br />
<a href="/stat?c=problem_statement&pm=3490">CmpdWords SRM 268</a><br />
<a href="/longcontest/?module=ViewProblemStatement&rd=10500&pm=7861">Scruffle 2007 TCCC Marathon Online Round 1</a></p>



<p>&nbsp; </p>

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

