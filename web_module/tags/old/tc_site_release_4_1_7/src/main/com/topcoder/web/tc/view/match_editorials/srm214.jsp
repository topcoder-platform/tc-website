<?xml version="1.0"?>
<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505686" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 214</span><br>Wednesday, October 6, 2004
<br><br>

<span class="bigTitle">Match summary</span>
<p>

It is safe to say that few TopCoder members suffer from fear of math, but the results of the latest Single Round Match suggest that fear of text is epidemic. Both divisions were caught off guard by a set of problems in which parsing did not act as an obstacle to performing a task, as it usually does, but constituted the task itself. <b>Jan_Kuipers</b>, <b>gawry</b>, and <b>lars</b> topped the leader board in Division One.
Special mention goes to <b>skanthak</b> and <b>bmerry</b>, who made a game effort to solve the hard problem and fell just short on a day when no one in either division got the hard. Division Two saw a victory by <b>ggoprea</b>, followed by the harmoniously named runners-up <b>wizy</b> and <b>quazee</b>.

</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3020&amp;rd=5860" name="3020">bloggoShortcuts</a></b>
</font>
<A href="Javascript:openProblemRating(3020)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505686" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      250
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214 / 232 (92.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      195 / 214 (91.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>anomaly</b> for 246.66 points (3 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      210.38 (for 195 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

We are asked to replace the special characters '_' and '*' in a piece of text with the HTML tags for italics and boldface, respectively. The principal difficulty is in deciding whether to use the opening tag, "&lt;i&gt;" or "&lt;b&gt;", or rather the closing tag, "&lt;/i&gt;" or "&lt;/b&gt;", whenever we come across a special character. In my C implementation, I have a variable called <code>open</code> whose value I set to 1 when I print an opening tag, and to 0 when I print a closing tag.
Its value therefore tells me what I need to do at the next occurrence of a special character. I initialize it to 0, since I certainly haven't printed any opening tags at the outset.

</p>
<pre>
void expand(char *s) {
  int i, open = 0;
  for (i = 0; s[i] != '\0'; i++)
    if (s[i] == '_' || s[i] == '*') {
      if (open)
        printf("&lt;/%c&gt;", s[i] == '_' ? 'i' : 'b');
      else
        printf("&lt;%c&gt;", s[i] == '_' ? 'i' : 'b');
      open = (open+1)%2;
    }
    else
      printf("%c", s[i]);
  printf("\n");
}
</pre>
<p>

The <code>%</code> symbol I use above is the modulo operator in C and many other languages. For integers <code>N</code> and <code>D</code>, the operation <code>N%D</code> returns the remainder of the division <code>N/D</code>. Thus, <code>N%2</code> can only return 0 or 1.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3019&amp;rd=5860" name="3019">bloggoHyphenate</a></b>
</font>
<A href="Javascript:openProblemRating(3019)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505686" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      500
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      90 / 232 (38.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 90 (70.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>quazee</b> for 391.97 points (15 mins 51 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      234.04 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      250
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      156 / 181 (86.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      134 / 156 (85.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 231.36 points (8 mins 11 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      150.78 (for 134 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given a dictionary of syllabized words such as "squir rel" and "el e phant", we are to verify and if necessary correct a hyphenated word such as "eleph-ant". Among the five problems of the match, I would say that this one requires the most effort for the least reward. Rather than algorithmic prowess, it is swift fingers and attention to detail that lead to success here.

</p>
<p>

In my C implementation, I first make a copy <code>cand</code> of the candidate string, omitting the hyphen. At the same time, I identify the hyphen's position <code>hx</code>.

</p>
<pre>
void hyphenate(char **dictionary, int dnum, char **candidates, int cnum) {
  char cand[100], good[100], *dict;
  int ci, di, cx, hx, hh, bx;
  for (ci = 0; ci &lt; cnum; ci++) {
    for (cx = 0, hx = -1; candidates[ci][cx] != '\0'; cx++)
      if (candidates[ci][cx] == '-')
        hx = cx;
      else
        cand[cx - (hx == -1 ? 0 : 1)] = candidates[ci][cx];
    cand[cx - (hx == -1 ? 0 : 1)] = '\0'; </pre> <p>

For each item <code>dict</code> in the dictionary, I first consider whether it is the same as <code>cand</code>. If so, the word must be monosyllabic.

</p>
<pre>
    for (di = 0; di &lt; dnum; di++) {
      dict = dictionary[di];
      if (!strcmp(cand, dict)) {
        printf("%s\n", cand);
        break;
      }
</pre>
<p>

Otherwise, I step through <code>cand</code> and <code>dict</code> using the index variable <code>cx</code>. By initializing a hyphen counter <code>hh</code> to 0 and incrementing it on each hyphen, I know that the character at position <code>cx</code> of <code>cand</code> aligns with the character at position <code>cx+hh</code> of <code>dict</code>. At the same time, I keep track of the closest position <code>bx</code> of a dictionary hyphen to that of the candidate's hyphen. In the event of a mismatch between an aligned pair of characters, I reject the current dictionary item.

</p>
<pre>
      bx = -100;
      for (cx = hh = 0; cand[cx] != '\0' &amp;&amp; dict[cx+hh] != '\0'; cx++) {
        if (dict[cx+hh] == ' ') {
          if (abs(cx-hx) &lt; abs(bx-hx))
            bx = cx;
          hh++;
        }
        if (cand[cx] != dict[cx+hh])
          break;
      }
      if (bx == -100 || cand[cx] != '\0' || dict[cx+hh] != '\0')
        continue;
</pre>
<p>

If all non-space, non-hyphen characters match, I have the right dictionary item. Now, unless the best <code>dict</code> hyphen coincides with the <code>cand</code> hyphen, I print the candidate string in two parts with a hyphen in between.

</p>
<pre>
      if (bx == hx) {
        printf("correct\n");
        break;
      }
      strncpy(good, cand, bx);
      good[bx] = '-';
      strcpy(&amp;good[bx+1], &amp;cand[bx]);
      printf("%s\n", good);
      break;
    }
  }
}
</pre>
<p>

It is not difficult to verify hyphens, but mathematically inclined coders must recoil from this problem because it cannot be generalized or solved systematically. I think it resembles the tasks that professional software developers undertake regularly rather than the puzzles that attract academic researchers.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3023&amp;rd=5860" name="3023">bloggoSequenceSearch</a></b>
</font>
<A href="Javascript:openProblemRating(3023)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505686" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1000
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      5 / 232 (2.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 5 (0.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>null</b> for null points (NONE)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      No correct submissions
    </td>
  </tr>
</table></blockquote>

<p>

Given a query consisting of words separated by ellipses, such as "fourscore...years...ago", we are to find text passages that contain every query word order. If we wanted to perform this task at high speed, we would build a data structure that maps words to their positions in a document&#151;in other words, an index&#151;and look for sequences of word-position numbers. But we can get by with a solution that searches directly on the text, since each document is only 50 characters long. At worst, we would begin searching at each of the 50 characters and continue to the end of the document, for a total of about 50*50/2 = 1250 character comparisons. My solution starts matching only at the beginning of each word in the document, so I need no more than half that many comparisons.

</p>
<p>

The most important part of my C implementation is a function that takes a query <code>pat</code>, the <code>pi</code>-th character of which I am currently comparing to the <code>si</code>-th character of a string <code>str</code>. If I simultaneously reach the end of both the code and the pattern, I have found a match which I mark in the array <code>ends</code>. It is possible that several recursive calls to <code>match()</code> will mark the same location in the array, since I make branching calls and I make no effort to remember whether I have compared particular pairs of characters before.

<p>

The branching occurs when I come across a period character in the pattern, denoting the start of an ellipsis. I can now skip the next word in the string and make a recursive call to the matching function.

</p>
<pre>
void match(char *pat, int pi, char *str, int si, int *ends) {
  int skip;
  if (pat[pi] == '.') {
    while (!isalpha(str[++si]) &amp;&amp; str[si] != '\0');
    if (str[si] == '\0')
      return;
    skip = si;
    while (isalpha(str[++skip]));
    match(pat, pi, str, skip, ends);
    pi += 3;
  }
</pre>
<p>

On the other hand, I also try to match the current word in the string. The matching attempt has three possible outcomes: it fails in the event of different alphabetic characters in the string and pattern; succeeds if I reach the end of each; or continues with a recursive call if I reach a period in the pattern and a non-alphabetic character in the string.

</p>
<pre>
  while (tolower(pat[pi]) == tolower(str[si]) &amp;&amp; isalpha(str[si])) {
    pi++;
    si++;
  }
  if (pat[pi] == '\0' &amp;&amp; !isalpha(str[si])) {
    ends[si] = 1;
  }
  else if (pat[pi] == '.' &amp;&amp; !isalpha(str[si]) &amp;&amp; str[si] != '\0') {
    match(pat, pi, str, si, ends);
  }
}
</pre>
<p>

After <code>match()</code> has found all matching passages that begin from some point in a document, I shall record their endpoints in a two-dimensional array which I eventually sort to find the best passages over all documents. Each element of this array contains three integers denoting the starting position of the match, its ending position, and the number of the document in which it is found. Below is a comparison function written in the style demanded by the C standard library's <code>qsort()</code>. It returns a negative value if passage <code>a</code> comes earlier than <code>b</code>, or a positive value if the opposite is true. A zero value would result if the passages were identical in every respect, but this will never happen in my program.

</p>
<pre>
int cmp(const void *a, const void *b) {
  int *sa = *((int **) a), *sb = *((int **) b);
  int da = sa[1] - sa[0], db = sb[1] - sb[0];
  if (da != db)
    return da - db;
  if (sa[2] != sb[2])
    return sa[2] - sb[2];
  return sa[0] - sb[0];
}
</pre>
<p>

A quick calculation on the back of an envelope tells me that I won't find more than 20000 passages among all documents. There are roughly
25 possible points at which a passage may begin or end in any document, making a total of about 50*25*25/2=15625 passages over all documents.

</p>
<pre>
void sequence_search(char **docs, int doc_num, char *query) {
  int *ends = calloc(100, sizeof(int)), i, ix, beg, p, q;
  int dlen, flag = 0, **passages = calloc(20000, sizeof(int *)), pnum = 0;
  char *doc, buf[100];
  for (i = 0; i &lt; 20000; i++)
    passages[i] = calloc(3, sizeof(int)); </pre> <p>

I traverse each document, updating the <code>flag</code> variable to tell me whether I am in the middle of a word. At the start of each word, I initialize the <code>ends</code> array, launch a <code>match()</code> operation, and augment the <code>passages</code> array based on the marks left in <code>ends</code>.

</p>
<pre>
  for (i = 0; i &lt; doc_num; i++) {
    dlen = strlen(doc = docs[i]);
    for (beg = 0; doc[beg] != '\0'; beg++)
      if (isalpha(doc[beg]) &amp;&amp; !flag) {
        memset(&amp;ends[beg+1], 0, (dlen-beg)*sizeof(int));
        match(query, 0, doc, beg, ends);
        for (ix = beg+1; ix &lt;= dlen; ix++)
          if (ends[ix]) {
            passages[pnum][0] = beg;
            passages[pnum][1] = ix;
            passages[pnum++][2] = i;
          }
        flag = 1;
      }
      else if (!isalpha(doc[beg]))
        flag = 0;
  }
</pre>
<p>

Finally, I can sort the passages using my comparison function.

</p>
<pre>
  qsort(passages, pnum, sizeof(int *), cmp);
  for (i = 0; i &lt; (pnum &lt; 5 ? pnum : 5); i++) {
    p = passages[i][0];
    q = passages[i][1];
    strncpy(buf, &amp;docs[passages[i][2]][p], q-p);
    buf[q-p] = '\0';
    printf("%d %d [%s]\n", passages[i][2], p, buf);
  }
}
</pre>
<p>

If you are interested in the notion of building an index for each document, see my solution to the proximity-search problem below.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3025&amp;rd=5860" name="3025">bloggoDocStructure</a></b>
</font>
<A href="Javascript:openProblemRating(3025)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505686" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      33 / 181 (18.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      21 / 33 (63.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gawry</b> for 384.63 points (24 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      295.10 (for 21 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Given a pair of syntactically correct HTML documents, we are to compare their tag trees and determine whether one is an intree of the other, meaning that the latter contains every path of the former descending in order from the root. HTML documents can be parsed painlessly if we think of them as parenthesized expressions. Each opening tag is comparable to a left parenthesis, and each closing tag is like a right parenthesis. When building a tag tree, we use the name of each tag as a node label, discarding all other text.

</p>
<p>

Because I know from the input constraints that a node will not have more than 1000 children, my C implementation has a fixed-size child array in each node.

</p>
<pre>
struct Tree {
  char label[100];
  struct Tree *children[1000];
  int child_num;
};
</pre>
<p>

Some people like to push left parentheses or opening tags onto a stack, then pop them at a right parenthesis or closing tag. My preferred approach is to write a function that makes a recursive call at an opening tag and returns at a closing tag. The following function takes a string position <code>ix</code> and advances it to the end of the next closing tag, then returns the updated position.

</p>
<pre>
int parse(struct Tree *tree, char *str, int ix) {
  int jx;
  struct Tree *child;
  while (1) {
    while (str[ix++] != '&lt;');
    if (str[ix] == '/') {
      while (str[ix++] != '&gt;');
      return ix;
    }
    child = calloc(1, sizeof(struct Tree));
    jx = 0;
    while (str[ix++] != '&gt;')
      child->label[jx++] = str[ix-1];
    child->label[jx] = '\0';
    ix = parse(tree->children[tree->child_num++] = child, str, ix);
  }
}
</pre>
<p>

To find out whether one tree is an intree of another, I use a recursive function to compare the children of each. In the function below, <code>aix</code> is the number of the child I am currently considering in <code>atree</code>, while <code>bix</code> is the same for <code>btree</code>. The final <code>if</code> statement originally read

</p>
<pre>
  if (intree(atree->children[aix], 0, btree->children[bix], 0)
      &amp;&amp; intree(atree, aix+1, btree, bix+1))
    return 1;
</pre>

until <b>lbackstrom</b> pointed out to me that such a function would be too slow because it did a great deal of unnecessary work. If the current child of <code>atree</code> is an intree of the current child of <code>btree</code> but the later children fail, there is no need to go on and find a further match for the current child of <code>atree</code>.
Observe that if the later children fail starting from this point, they will fail again starting from a later point. We may as well pair the children greedily, using the earliest intree matches we come across.

</p>
<pre>
int intree(struct Tree *atree, int aix, struct Tree *btree, int bix) {
  if (aix == 0 &amp;&amp; bix == 0 &amp;&amp; strcmp(atree->label, btree->label))
    return 0;
  if (aix == atree->child_num)
    return 1;
  if (bix == btree->child_num)
    return 0;
  if (intree(atree->children[aix], 0, btree->children[bix], 0))
    return intree(atree, aix+1, btree, bix+1);
  return intree(atree, aix, btree, bix+1); 
} </pre> <p>

A fancy <code>intree()</code> function would count the number of identical nodes at the same time that it verified the intree relationship, but I like to keep my code simple by delegating the node count to a separate recursion.

</p>
<pre>
int count(struct Tree *tree) {
  int ct = 1, i;
  for (i = 0; i &lt; tree->child_num; i++)
    ct += count(tree->children[i]);
  return ct;
}
</pre>
<p>

To start the whole process off, I make a preliminary "html" node and advance a pointer in each document to the end of the first opening tag, which is guaranteed to be of "html" type.

</p>
<pre>
void compare(char *docA, char *docB) {
  struct Tree *treeA = calloc(1, sizeof(struct Tree));
  struct Tree *treeB = calloc(1, sizeof(struct Tree));
  int ix = 0, AinB, BinA;
  sprintf(treeA->label, "html");
  while (docA[ix++] != '&gt;');
  parse(treeA, docA, ix);
  sprintf(treeB->label, "html");
  while (docB[ix++] != '&gt;');
  parse(treeB, docB, ix);
  AinB = intree(treeA, 0, treeB, 0);
  BinA = intree(treeB, 0, treeA, 0);
  if (AinB &amp;&amp; BinA)
    printf("equivalent\n");
  else if (!AinB &amp;&amp; BinA)
    printf("incompatible\n");
  else if (AinB)
    printf("intree %d\n", count(treeB)-count(treeA));
  else
    printf("outtree %d\n", count(treeA)-count(treeB)); 
} </pre> <p>

If the trees are neither equivalent nor incompatible, I subtract their node counts in the appropriate order to find out how many nodes they have in common.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3026&amp;rd=5860" name="3026">bloggoProximitySearch</a></b>
</font>
<A href="Javascript:openProblemRating(3026)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505686" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1000
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 181 (1.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 2 (0.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>null</b> for null points (NONE)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      No correct submissions
    </td>
  </tr>
</table></blockquote>

<p>

Given a query expressing proximity relationships between pairs of passages, we are to find the shortest and earliest matches in a collection of documents. Although we have only 50 documents, each of which accommodates fewer than 400 passages, the structure of the search query may entail several pairwise comparisons between sets of matching passages in each document. A textual index is in order if we want to perform the comparisons at high speed.

</p>
<p>

Most languages offer a hashing facility that works as a ready-made data structure for mapping words to word positions, but I wrote my solution in C without resorting to any high-level functions. I implemented my index using a trie, which is just another name for a maximal DFA. Words are easily inserted into or retrieved from a trie by recursive descent. Each node stores the starting indices of the word that terminates at that node.

</p>
<pre>
struct Index {
  struct Index *next[128];
  int count, pos[100];
};

void put(struct Index *index, char *s, int pos, int ix, int end) {
  int ci = (int) tolower(s[ix]);
  if (ix == end) {
    index->pos[index->count++] = pos;
    return;
  }
  if (index->next[ci] == NULL)
    index->next[ci] = calloc(1, sizeof(struct Index));
  put(index->next[ci], s, pos, ix+1, end); }

struct Index *get(struct Index *index, char *s, int ix, int end) {
  int ci = (int) tolower(s[ix]);
  if (ix &lt; end &amp;&amp; index->next[ci] == NULL)
    return NULL;
  return ((ix == end) ? index : get(index->next[ci], s, ix+1, end)); 
} </pre> <p>

To build an index for a certain document, I scan its text and put each maximal sequence of alphabetic characters into the trie along with its word number. At the same time, I store the character indices of each word in the array <code>spans</code>, letting me subsequently extract document substrings based on word numbers.

</p>
<pre>
struct Index *make_index(char *text, int **spans) {
  int ix = 0, begin = -1, pos = 0;
  struct Index *index = calloc(1, sizeof(struct Index));
  do {
    if (isalpha(text[ix]) &amp;&amp; begin == -1)
      begin = ix;
    else if (!isalpha(text[ix]) &amp;&amp; begin != -1) {
      spans[pos][0] = begin;
      spans[pos][1] = ix;
      put(index, text, pos++, begin, ix);
      begin = -1;
    }
  } while (text[ix++] != '\0');
  return index;
}
</pre>
<p>

To parse a query, I take advantage of the fact that the outermost '+'
operator must be surrounded by balanced parenthetical expressions. Once I have found the position of this '+', I can split the query in two and continue parsing recursively.

</p>
<pre>
struct Parse {
  char word[100];
  struct Parse *left, *right;
  int distance;
};

struct Parse *make_parse(char *s, int begin, int end) {
  int ix = begin, bix = 0, depth = 0;
  char buf[1000];
  struct Parse *parse = calloc(1, sizeof(struct Parse));
  if (s[begin] == '(') {
    while (s[++ix] != '+' || depth &gt; 0) {
      depth += s[ix] == '(' ? 1 : 0;
      depth -= s[ix] == ')' ? 1 : 0;
    }
    parse->left = make_parse(s, begin+1, ix-1);
    while (s[++ix] != ' ')
      buf[bix++] = s[ix];
    buf[bix] = '\0';
    parse->right = make_parse(s, ix+1, end-1);
    parse->distance = atoi(buf);
    return parse;
  }
  strncpy(parse->word, &amp;s[begin], end-begin);
  parse-&gt;word[end-begin] = '\0';
  return parse;
}
</pre>
<p>

When I'm looking for passages matching a query, the base case is that the query consists of a single word. I can then reach into the index to retrieve a list of word positions, if any.

</p>
<pre>
int add_passages(int **passages, int pnum, int docid,
    struct Index *index, struct Parse *parse) {
  int i, j, *used = calloc(700, sizeof(int)), pnum1, pnum2;
  int a, b, c, d, distance, x, y;
  if (parse-&gt;word[0] != '\0') {
    index = get(index, parse-&gt;word, 0, strlen(parse-&gt;word));
    if (index == NULL)
      return pnum;
    for (i = index-&gt;count-1; i &gt;= 0; i--) {
      passages[pnum][0] = passages[pnum][1] = index-&gt;pos[i];
      passages[pnum++][2] = docid;
    }
    return pnum;
  }
</pre>
<p>

Otherwise, I call my passage-retrieval function recursively for the left and right branches of the parse tree. I compute pairwise intersections of the passages in each set, saving the resulting passages that are within the specified range. The <code>used</code> array serves to mark passages as I find them, since duplicate intersections may easily occur.

</p>
<pre>
  distance = parse-&gt;distance;
  pnum1 = add_passages(passages, pnum+400, docid, index, parse->left);
  pnum2 = add_passages(passages, pnum1, docid, index, parse->right);
  for (i = pnum+400; i &lt; pnum1; i++)
    for (j = pnum1; j &lt; pnum2; j++) {
      x = passages[i][0] &lt; passages[j][0] ? i : j;
      y = passages[i][0] &lt; passages[j][0] ? j : i;
      a = passages[x][0];
      b = passages[x][1];
      c = passages[y][0];
      d = passages[y][1];
      if ((c &lt; b || c-b &lt;= distance+1) &amp;&amp; !used[25*a+(b&lt;d?d:b)]) {
        passages[pnum][0] = a;
        passages[pnum][1] = b &lt; d ? d : b;
        passages[pnum++][2] = docid;
        used[25*a+(b&lt;d?d:b)] = 1;
      }
    }
  free(used);
  return pnum;
}
</pre>
<p>

Each element of <code>passages</code> is a three-dimensional integer array containing the start position, end position, and document number of the words in a passage. To compare these according to the problem specification and in a manner compatible with the <code>qsort</code> function, I define a comparison function thus.

</p>
<pre>
int cmp(const void *a, const void *b) {
  int *sa = *((int **) a), *sb = *((int **) b);
  int da = sa[1] - sa[0], db = sb[1] - sb[0];
  if (da != db)
    return da - db;
  if (sa[2] != sb[2])
    return sa[2] - sb[2];
  return sa[0]-sb[0];
}
</pre>
<p>

Preliminary to the search proper, I allocate space for the passages and characters spans, then parse the query.

</p>
<pre>
void proximity_search(char **docs, char *query) {
  struct Index *index;
  struct Parse *parse;
  int i, j, **passages = calloc(20000, sizeof(int *)), pnum = 0;
  int ***spans = calloc(50, sizeof(int **)), p, q, a, b, docid;
  char buf[1000];
  for (i = 0; i &lt; 20000; i++)
    passages[i] = calloc(3, sizeof(int));
  for (i = 0; i &lt; 50; i++) {
    spans[i] = calloc(25, sizeof(int *));
    for (j = 0; j &lt; 25; j++)
      spans[i][j] = calloc(2, sizeof(int));
  }
  parse = make_parse(query, 0, strlen(query)); </pre> <p>

For each document, I make an index and call my passage-retrieval function, which returns the number of passages found thus far. Finally, I sort the passages and cull the top ten.

</p>
<pre>
  for (i = 0; i &lt; 50; i++) {
    index = make_index(docs[i], spans[i]);
    pnum = add_passages(passages, pnum, i, index, parse);
  }
  qsort(passages, pnum, sizeof(int *), cmp);
  for (i = 0; j &lt; (pnum &lt; 10 ? pnum : 10); i++) {
    a = passages[i][0];
    b = passages[i][1];
    docid = passages[i][2];
    p = spans[docid][a][0];
    q = spans[docid][b][1];
    strncpy(buf, &amp;docs[docid][p], q-p);
    buf[q-p] = '\0';
    printf("%d %d [%s]\n", docid, p, buf);
  }
}
</pre>

<p>

The solution to this problem consists of three parts: building an index, parsing the query, and finding passage intersections. I do not find any one of these parts to be very dull or very difficult, but it appears from the match results that it would have been wiser to assign them as separate problems rather than rolling all three into one.

</p>

<p>
<img src="/i/m/Eeyore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273434" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
