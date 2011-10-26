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
<tc-webtag:forumLink forumID="505676" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Open <br> Qualification Problem Set 3</span><BR/>September 7-8, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
This set probably had the easiest hard problem, but it also had the most
difficult easy problem to balance things out.  reid was the quickest to finish
them both, and ended up less than 50 points ahead of snewman - if only there was
a challenge phase.  qubits, a TopCoder from way back showed up and took third
place, only a hair behind snewman.
</p> 
 
<p><H1> The Problems </H1></p> 

<font size="+2"> <b><a href="/stat?c=problem_statement&amp;pm=2990&amp;rd=5875" name="2990">Rank</a></b> </font> 
<A href="Javascript:openProblemRating(2990)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505676" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      175 / 200 (87.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      154 / 175 (88.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 295.59 points (2 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      214.45 (for 154 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
If you did this problem the hard way, it was surely the hardest of the qual
easies.  The hard way is to sort the elements, and then go through and rank
them, and finally to put the ranks in the right places in the return.  Granted,
this isn't that hard, but its a lot more work than the easy way that gave reid
over 295/300.  <br/><br/>

First, lets say there are no ties: in this case your rank is equal to one plus
the number of people who beat you.  Now, lets say you tied with one person, so
the two of you get ranks n and n+1, and the average is hence n+0.5.  Next, if
you tied with 2 other people, the three of you would get ranks of n, n+1, and
n+2, for an average of n+1.  The pattern developing here is that every tie adds
0.5 to your rank.  Hence, your ranks is one plus the number of people who beat
you, plus 0.5 times the number of people who tied you.  Therefore, two simple
nested loops are sufficient to calculate the ranks of all the competitors.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2974&amp;rd=5875" name="2974">GeneticCrossover</a></b> 
</font> 
<A href="Javascript:openProblemRating(2974)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505676" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 200 (41.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      62 / 82 (75.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 741.70 points (12 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      525.11 (for 62 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Was it the lower score, or was this problem really easier?  We'll never really
know, but it did end up with more submissions than any other hard.  The basic
principle needed to solve it is known as <i>linearity of expectations</i>.  This
says that, if you know the expected values of a number of variables, then the
expected value of the sum of those variables is equal to the sum of the expected
values of the variables, regardless of the dependencies among those
variables.<br/><br/>

In this problem, the variables were the values contributed by each gene, elements
of <b>dom</b> or <b>rec</b>.  The expected value of each of these variables was
equal to the <tt>p*dom+(1-p)*r</tt>, where p is the probability that a gene will
be expressed dominantly.  Since the return is simply the sum of all these
expected values (by linearity of expectations), we only need to find p for each
gene.<br/><br/>

If a gene does not depend on another gene, then p is equal to the probability
that one or both of the genes from the parents are dominant.  There are only 4
cases to consider for each gene, and it isn't hard to just look at all four
pairings.  Alternatively, <tt>p = 1-(2-q<sub>1</sub>)*(2-q<sub>2</sub>)/4</tt>,
where q<sub>1</sub> and q<sub>2</sub> are the numbers of recessive genes from
each parent has.  If gene i depends on gene j, we still have to compute the
above probability for gene i. Since gene i may only be dominant if gene j is
also, the we multiply the above value by the probability that gene j is
dominant, which gives us the probability that both j and i are dominant.
</p>
<pre>
   double[] p;
   int[] dep;
   public double cross(String p1a, String p1b, String p2a, String p2b, int[] dom, int[] rec, int[] dep){
      this.dep = dep;
      char[][] ch = new char[4][];
      ch[0]=p1a.toCharArray();
      ch[1]=p1b.toCharArray();
      ch[2]=p2a.toCharArray();
      ch[3]=p2b.toCharArray();
      p = new double[p1a.length()];
      for(int i = 0; i&lt;p1a.length(); i++){
        for(int j = 0; j&lt;2; j++){
            for(int k = 0; k&lt;2; k++){
               char c1 = ch[j][i];
               char c2 = ch[k+2][i];
               if(c1&gt;='A'&amp;&amp;c1&lt;='Z')p[i] += .25;
               else if(c2&gt;='A'&amp;&amp;c2&lt;='Z')p[i] += .25;
            }
         }
      }
      double ret = 0;
      for(int i = 0; i&lt;r.length; i++){
            double r = rec(i);
            ret += r * dom[i] + (1-r)*rec[i];
      }
      return ret;
   }
   double rec(int idx){
      if(dep[idx] == -1)return p[idx];
      else return p[idx] * rec(dep[idx]);
   }
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
