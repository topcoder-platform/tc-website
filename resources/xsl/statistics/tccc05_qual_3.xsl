<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>TCCC05 Qualification 3 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#FFFFFF">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC05 Qualification Problem Set 3</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">January 11-12, 2005</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
This was one of the harder problem sets, though the examples on the easy
problem were sufficiently comprehensive to ensure that almost the full 100
advanced.  lingo took top honors, with a narrow victory over Jan_Kupiers.  
</p> 
 
<H1> The Problems </H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3505&amp;rd=6525" name="3505">DictionarySorter</a></b> 
</font> 
<A href="Javascript:openProblemRating(3505)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      127 / 167 (76.05%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      96 / 127 (75.59%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
    <b>lingo</b> for 232.04 points (6 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      163.40 (for 96 correct submissions) 
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
<A href="Javascript:openProblemRating(3502)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br /> 
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
      47 / 167 (28.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      32 / 47 (68.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dgarthur</b> for 668.55 points (17 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      515.85 (for 32 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
This problem can best be broken into two parts.  First, parse the expression,
and calculate the result in nanoseconds.  Then, pick the correct units, and
adjust the result.  The grammar for the equation was fairly simple, since it
didn't have any parentheses in it (the ones from lg() don't really count, since
they can only have a variable inside them).  If there is an '*' in the eqation,
you should split the equation at the asterisk, then recursively evaluate the two
halves, and multiple the results together.  Otherwise, if there is no asterisk,
but there is a '+', you should again split the equation in half, recursively
evaluate, and then add the results.  If the equation has neither '*' nor '+' in
it, then it must have one of the 4 possible TERM forms, each of which is
relatively easy to evaluate (just be careful to do everything using doubles):
</p>
<pre class="code">
double evaluate(string equation){
    if(equation.contains('*')){
        int idx = equation.indexOf('*');
        string a = equation.substring(0,idx);
        string b = equation.substring(idx+1);
        return evaluate(a)*evaluate(b);
    }else if(equation.contains('*')){
        int idx = equation.indexOf('+');
        string a = equation.substring(0,idx);
        string b = equation.substring(idx+1);
        return evaluate(a)+evaluate(b);
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

                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>

            <p><br /></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>
