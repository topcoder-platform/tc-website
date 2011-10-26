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
<tc-webtag:forumLink forumID="505675" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Open <br> Qualification Problem Set 2</span><BR/>September 7-8, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
This set contained a rather straightforward, but long hard problem.  Antimatter,
known for his impressive speed, won this set handily, though perhaps because he got to
warm up on set 1.  He beat out two yellow coders oldbig, and Olexiy, who took
second and third, each over 100 points behind.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2975&amp;rd=5874" name="2975">FileFilter</a></b> 
</font> 
<A href="Javascript:openProblemRating(2975)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505675" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      204 / 216 (94.44%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      152 / 204 (74.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Im2Good</b> for 248.02 points (2 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      204.98 (for 152 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
As always, knowledge of the libraries in your language of choice makes solving
problems much easier.  In this problem, all you needed was the .endsWith() (or
its equivalent) method, and you were pretty much set.  Even if you didn't know
about that one, it only takes a single loop to check of one string ends with
another.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2978&amp;rd=5874" name="2978">ResultsTable</a></b> 
</font> 
<A href="Javascript:openProblemRating(2978)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505675" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      52 / 216 (24.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      28 / 52 (53.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 657.55 points (18 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      427.99 (for 28 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
In this problem, I think that its best to make some sort of a class or struct
for each competitor.  If you do this, you can write a method to compare two
instances of the class or struct, and I think it makes your code more elegant,
and hence less error prone.  Also, if you have a class for competitors, you only
need to write a comparator, and the built in sorting functions will do the
rest.<br/><br/>
Whatever approach you took, however, there weren't really any subtleties that
you needed to think much about.  When you parse the data, you should throw out
all the irrelevant entries with lower COUNT's.  Next, assuming you have a
class for your competitors, you should write a comparator.  The comparator
should simply loop through the elements of sort, and make the necessary
comparisons.  There is a decent amount of logic here, as you need to consider a
number of different cases, but none of them are that tricky.  If you get the
comparator right, you're home free, as you just need to call Arrays.sort() in
Java or whatever the equivalent is in your favorite language, and then convert
each competitor to a single string.<br/><br/>
All told, there wasn't anything tricky, but it required a pretty good sized
chunk of code, and ended up having the second fewest submissions of all the
hards.
</p>

<pre>
import java.util.*;
public class ResultsTable{
   int[] sort;
   String order;
   class Rec implements Comparable{
      int[] score;
      int[] cnt;
      String t;
      public Rec(int n){
         score = new int[n];
         cnt = new int[n];
         Arrays.fill(cnt,-1);
      }
      public String toString(){
         String ret = t;
         for(int i = 0; i&lt;cnt.length ;i++){
            if(cnt[i] == -1)ret += " -";
            else ret += " "+score[i];
         }
         return ret;
      }
      public int compareTo(Object o){
         Rec r = (Rec)o;
         for(int i = 0; i&lt;sort.length; i++){
            if(Math.abs(sort[i]) == 1){
               return t.compareTo(r.t)*sort[i];
            }
            int idx = Math.abs(sort[i])-2;
            if(cnt[idx] == -1 &amp;&amp; r.cnt[idx] == -1)continue;
            else if (cnt[idx] == -1) return sort[i];
            else if (r.cnt[idx] == -1) return -sort[i];
            else if(r.score[idx] != score[idx])return (r.score[idx] - score[idx])*(order.charAt(idx)=='H'?1:-1)*sort[i];
         }
         return 0;
      }
   }
   public String[] generateTable(String[] results, int[] sort, String order){
      this.sort = sort;
      this.order = order;
      HashMap hm = new HashMap();
      for(int i = 0; i&lt;results.length; i++){
         String[] sp = results[i].split(" ");
         int met = Integer.parseInt(sp[1])-1;
         int cnt = Integer.parseInt(sp[2]);
         int score = Integer.parseInt(sp[3]);
         Rec r = (Rec)hm.get(sp[0]);
         if(r == null)r = new Rec(order.length());
         if(cnt &gt; r.cnt[met]){
            r.cnt[met] = cnt;
            r.score[met] = score;
         }
         r.t = sp[0];
         hm.put(sp[0],r);
      }
      Rec[] recs = (Rec[])hm.values().toArray(new Rec[0]);
      Arrays.sort(recs);
      String[] ret = new String[recs.length];
      for(int i = 0; i&lt;ret.length; i++)ret[i] = recs[i].toString();
      return ret;
   }
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