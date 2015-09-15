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
<tc-webtag:forumLink forumID="505706" message="Discuss this match" /></div>
<span class="bodySubtitle">2005 TopCoder Collegiate Challenge <br> Qualification Problem Set 3</span><BR/>January 11-12, 2005
<br><br>

<span class="bigTitle">Summary</span> 

<p> 
This was one of the harder problem sets, though the examples on the easy
problem were sufficiently comprehensive to ensure that almost the full 100
advanced.  lingo took top honors, with a narrow victory over Jan_Kupiers.  
</p> 
 
<H1> The Problems </H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3505&amp;rd=6525" name="3505">DictionarySorter</a></b> 
</font> 
<A href="Javascript:openProblemRating(3505)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505706" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      123 / 162 (75.93%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      89 / 123 (72.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Per</b> for 234.32 points (5 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      159.84 (for 89 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
For those who had never heard of the ash and thorn characters, they are &#230;
and &#254;, respectively, and occur often in most old germanic
languages.<br/><br/>  The best way to solve this problem is to use the built-in
sort method that your language of choice provides.  Then, all you have to do is
write a comparator that tells which of two words should come first.  There are a
lot of different ways to write the comparator, but one observation will simplify
things a little.  You don't really need to worry about the fact that the escaped
sequences count only as a single letter.  If you are comparing "/ae" or "/th" to
an unescaped sequence, the rest of the letters don't matter.  Therefore, you can
write the comparator with a single for loop:

<pre class="code">
int value(string a, int idx){
    if(a.charAt(idx) == '/')return a.charAt(idx+1)*2+1;
    else return a.charAt(idx)*2;
}
int compare(string a, string b){
    for(int i = 0; i&lt;min(a.length(),b.length()); i++){
        if(a.charAt(i) != b.charAt(i)){
            int v1 = value(a,i);
            int v2 = value(b,i);
            return v1-v2;
        }
    }
    return a.length()-b.length();
}
</pre>
Finally, if you really knew your Java API well, you could use the relatively
obscure java.text.RuleBasedCollator:
<pre class="code">
RuleBasedCollator r = (RuleBasedCollator)
    Collator.getInstance(new Locale("en","US",""));
Comparator c = new RuleBasedCollator(r.getRules() + 
    " &amp; a &lt; '/'ae &lt; b &amp; t &lt; '/'th &lt; u");
Arrays.sort(words,c);
return words;
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3502&amp;rd=6525" name="3502">TimeAnalysis</a></b> 
</font> 
<A href="Javascript:openProblemRating(3502)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505706" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      44 / 162 (27.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      27 / 44 (61.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dgarthur</b> for 668.55 points (18 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      488.23 (for 27 correct submissions)
    </td>
  </tr>
</table></blockquote> 

<p>
This problem can best be broken into two parts.  First, parse the expression,
and calculate the result in nanoseconds.  Then, pick the correct units, and
adjust the result.  The grammar for the equation was fairly simple, since it
didn't have any parentheses in it (the ones from lg() don't really count, since
they can only have a variable inside them).  If there is a '+' in the eqation,
you should split the equation at the plus, then recursively evaluate the two
halves, and add the results together.  Otherwise, if there is no plus,
but there is an '*', you should again split the equation in half, recursively
evaluate, and then multiply the results.  If the equation has neither '*' nor '+' in
it, then it must have one of the 4 possible TERM forms, each of which is
relatively easy to evaluate (just be careful to do everything using doubles):
</p><pre class="code">
double evaluate(string equation){
    if(equation.contains('+')){
        int idx = equation.indexOf('+');
        string a = equation.substring(0,idx);
        string b = equation.substring(idx+1);
        return evaluate(a)+evaluate(b);
    }else if(equation.contains('*')){
        int idx = equation.indexOf('*');
        string a = equation.substring(0,idx);
        string b = equation.substring(idx+1);
        return evaluate(a)*evaluate(b);
    }else{
        return term(equation);
    }
}
</pre>
Once you have the result in nanoseconds, you can hard code the different ranges
as constants, or calculate them doing something like the following.
<pre class="code">
int[] factors = {1000,1000,1000,60,60,24,365};
String[] units = {
    "nanoseconds",
    "microseconds",
    "milliseconds",
    "seconds",
    "minutes",
    "hours",
    "days",
    "years"};
for(int i = 0; i &lt; units.length; i++){
    if(ops&lt;factors[i]){
        return (int)ops + " " + units[i];
    }
    ops /= factors[i];
}
return (int)ops+" years";
</pre>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
