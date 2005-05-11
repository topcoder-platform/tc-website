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

<title>TCCC04 Qualification 2 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">TCCC04 Qualification Problem Set 2</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">February 23-24, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
Qualification Round 2 turned out to be the hardest of the set, and unfortunately only 58 coders ended up with scores greater than 0.  2<sup>nd</sup> and 3<sup>rd</sup> seeds reid and John Dethridge both ended up in this room, and reid ended up taking the win by a large margin.  John Dethridge also advanced, but only got 4<sup>th</sup>, as a first time coder, hsaniva, and a yellow, zbogi, took 2<sup>nd</sup> and 3<sup>rd</sup>, respectively.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>ASeries</b> 
</font> 
<A href="Javascript:openProblemRating(1758)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      100 / 134 (74.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      55 / 100 (55.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>LunaticFringe</b> for 287.54 points (4 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      226.93 (for 55 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
An arithmetic series is a sequence of numbers where a<sub>i+1</sub>-a<sub>i</sub>=C, for some constant C and for all i.  Hence, once we know the first two terms of the series, we can tell what all the rest of the terms will be, if they exist.  This observation suggests an approach for finding a solution: take all pairs of numbers in the input, and set one of them to be the first term, and the other to be the second.  Then, see how far we can go from there, given the first two terms.  The tricky part of all this is that if the first two terms are equal, then we need to be careful to mark the used terms as having been used, or else treat this as a special case.  Alternatively, rather than worrying about marking some terms used, we can start be sorting all the terms.  Then, if we pick terms i and j as our first two terms, respectively, with i &lt; j, we know that all terms in the series must be greater than or equal to the j<sup>th</sup> term.  Hence, we can iterate starting from j+1 and we will be sure to only count each value once.  Note that we can assume, without loss of generality that the first term is less than or equal to the second term since every series is symmetrical:
<pre>
    public int longest(int[] values){
        Arrays.sort(values);
        int ret = 0;
        for(int i = 0; i&lt;values.length; i++){
            for(int j = i+1; j&lt;values.length; j++){
                int cnt = 2;
                int next = 2 * values[j] - values[i];
                for(int k = j+1; k&lt;values.length; k++){
                    if(values[k] == next){
                        next += values[j] - values[i];
                        cnt++;
                    }
                }
                ret = Math.max(ret,cnt);
            }
        }
        return ret;
    }
</pre>
Coming up with the algorithm proved difficult for a lot of people, as evidenced by the low submission rate, and there were a few special cases, like when there are only 2 elements in the input to deal with.  I also saw a few submissions where people incorrectly assumed that the first two terms of the series must be adjacent in the sorted input.
</p> 

<font size="+2"> 
<b>NoZero</b> 
</font> 
<A href="Javascript:openProblemRating(1107)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 134 (47.01%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      16 / 63 (25.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 606.15 points (6 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      359.45 (for 16 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
There are a few ways to do this one.  I'll describe two of them, and you can read about a third <a href="http://www.topcoder.com/rtables/viewThread.jsp?forum=64101&amp;thread=242948&amp;mc=2">here</a> in the round tables.  The first way is to convert each of the no-zero numbers into a regular number, subtract them, and then convert the answer back.  To do the conversion from no-zero to decimal, observe that every time we increment a no-zero number the right most digit increments, and if it gets to 10, it goes back to 1.  The next digit from the right would normally go up by one every 10 times we increment a number, but in this case it only goes up by 1 every 9 times.  The third digit from the right goes up once every 9 times we increment the second digit from the right, and hence once every 81 times we increment the rightmost digit.  Therefore, if we are given the no-zero number <tt>abcde</tt>, it has decimal value a*9<sup>4</sup> + b*9<sup>3</sup> + c*9<sup>2</sup> + d*9<sup>1</sup> + e*9<sup>0</sup>.  I'll leave the conversion in the other direction to the reader to figure out from the code below:
<pre>
    int convert(int n){
        int ret = 0;
           int d = 1;
        while(n&gt;0){
            ret += n%10*d;
            d*=9;
            n/=10;
        }
        return ret;
    }
    public int subtract(int big, int small){
        int b = convert(big) - convert(small);
        int ret = 0;
        int d = 1;
        while(b&gt;0){
            ret += b%9*d;
            if(b%9==0){ret += 9*d;b-=9;}
            d*=10;
            b/=9;
        }
        return ret;
    }
</pre>
The other solution is based on the method of borrowing that we use to do subtraction by hand and is courtesy of schveiguy.  Basically, you just subtract one digit at a time, starting at the right.  If you need to borrow, you do so from the digit to the left, and if it is a 1, you borrow from the digit to its left, and so on.  The one difference is that instead of borrowing 10, as we normally would, we borrow 9.  This is really quite similar to the solution outlined above, working from the same general principal.
<pre>
    void borrow(char[] arr1, int pos1)
    {
        if(pos1 == 0 || arr1[pos1 - 1] == '0')
        {
            // cannot borrow
            return;
        }
        if(arr1[pos1 - 1] == '1')
            borrow(arr1, pos1 - 1);
        arr1[pos1 - 1]--;
        arr1[pos1] += 9;
    }
    public int subtract(int big, int small)
    {
        char[] arr1 = Integer.toString(big).toCharArray();
        char[] arr2 = Integer.toString(small).toCharArray();
        for(int i = 0; i &lt; arr2.length; i++)
        {
            int pos1 = arr1.length - 1 - i;
            int pos2 = arr2.length - 1 - i;
            int f = Integer.parseInt(new String(arr1, 0, pos1 + 1));
            int s = Integer.parseInt(new String(arr2, 0, pos2 + 1));
            if(f &lt; s)
                throw new RuntimeException("BAD");
                else if(f != s &amp;&amp; arr1[pos1] &lt;= arr2[pos2])
                borrow(arr1, pos1);
            arr1[pos1] -= arr2[pos2] - '0';
            System.out.println(new String(arr1));
        }
        return Integer.parseInt(new String(arr1));
    }

</pre>
</p> 

                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
