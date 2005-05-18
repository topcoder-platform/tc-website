<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>Challenging 101</strong></font><br />
                        Friday, October 24, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=299709"><strong>Modulator</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
What do you do during the challenge phase? Do you sit idle, aimlessly opening and closing problems, 
willing on the system tests, and watching with envy as coders of the ilk of Yarin, radeye and bstanescu 
average almost 4 successful challenges in every 5 competitions?</p>

<p>Hopefully this article will rejuvenate your 15 minutes of depression. Challenge phase can be an 
exciting and, ah, challenging, part of the competition, and hopefully there are a few tips here for 
everybody to take home.</p>

<p><b>Understanding the problem</b><br/>
A primary requirement for both solving a problem and challenging other solutions is to understand it. 
I mean really understand it. Before coding you should analyse it for special cases and boundary conditions, 
and account for these in your own submission. With your rock-solid comprehension of the problem's 
darker corners you should now have an arsenal of cases to challenge other people with.</p>

<p>These can come under the category of:
<ul>
<li>Unexpected inputs. Look for obscure cases, and perhaps nonsensical inputs, that are still legal.</li>
<li>Extreme inputs. These can be in the form of:</li>
<ul>
<li>Large numbers, which may cause overflow or timeouts</li>
<li>Small numbers, which may cause precision errors</li>
<li>Zero is always a special case, as are empty strings and arrays</li>
</ul>
</ul>
</p>

<p>However, many of these special cases are thoughtfully covered in examples. The real bonus comes if 
you can spot a program requirement (edge case, or just an innocuous rule) that is not covered by the 
examples. Bonanza! These conditions give rise to the loathed and loved 'shotgun' challenge phases where 
problems line up against a firing squad and go down screaming. You should always be looking for this 
occurring anyway in order to protect your solution, but remember to consider them as potential challenges 
too.</p>

<p><b>Simple challenge points</b><br/>
So what if the problems appear so simple, or so well demonstrated in examples, that the challenge phase 
looks like a good time to catch up on some sleep? There is still hope, but now you will have to get your 
hands dirty and analyse code in detail. I realize how painful this may sound, particularly as some code is 
so disgusting it produces strong feelings of nausea in the more 'professional' TopCoders.</p>

<p>However, there are some key areas which require slightly less detailed understanding, and you may even 
be able to look for them without feeling the need to shower afterwards:
<ul>
<li>Loop conditions. If a loop is implemented incorrectly it still may succeed most of the time, and so pass the examples</li>
<ul>
<li>Is the loop variable correctly initiated, and incremented?</li>
<li>Is the terminating condition correct? Should that be a &lt; or a &lt;=?</li>
</ul>
</ul>
</p>

<pre>
for(char i = 'a'; i &lt; 'z'; ++i) { ... }
should most likely be i &lt;= 'z'


for(int j = 0; j &lt; v.size(); ++j)
    for(int i = 0; i &lt; v[0].size(); ++i) { ... }
should most likely be i &lt; v[j].size();
</pre>

<ul>
<li>Copy and paste errors. This is an extremely popular method for introducing obscure bugs. 
I personally have found it very effective in this regard. The cloned code may have changed 
correctly in all necessary points but one, so look carefully.</li>
<li>Integer division truncation is not always intentional</li>
<li>Manually entered data is a classic area for discovering bugs. It is easy to make mistakes when 
typing in data, and these may only be picked up in rare test cases.</li>
<ul>
<li>Is one of the strings spelt incorrectly?</li>
<li>Is the alphabet missing a letter?</li>
<li>Check lookup tables.</li>
</ul>
</ul>

<pre>
const string MONTHS[] = { "January", "Febuary", "March", ... }

const int DX[] = { -1, 0, 1, 1, 1, 0, -1, 1 };
const int DY[] = { 1, 1, 1, 0, -1, -1, -1, 0 };
</pre>

<p>Yes, even if you are daunted at poking around in other people's code, with specific points to look for 
you can browse their solutions quickly and effectively.</p>

<p><b>Other common challenge points</b><br/>
Of course, many errors will not fall into these categories - they will just be logic errors that you can only 
catch by reading the solution line by line. At the deeper level there still are a few common underlying themes 
in challenges:
<ul>
<li>Double imprecision. Always beware of people using doubles when not necessary. In particular look 
for any use of the equality of doubles (for instance 0.1 + 0.2 != 0.3). Also check that an appropriate 
epsilon value is used in the conversion of a double to an integer.</li>
<li>Greedy solutions. Solutions that appear to avoid considering all possibilities by making 
some assumptions may not always work. Try and come up with an example where the assumption fails.</li>
<li>Timeouts. Solutions that appear to use brute force analysis or very high recursion may take more 
than the maximum 8 seconds. Tests run in the arena indicate that 2<sup>29</sup> additions, or 2<sup>28</sup> multiplications 
(including loop overhead and variable fetching) will run in just under 8 seconds. These times are for C++, 
and other languages will be slower. So, if a solution ever looks like making more than, say, 2<sup>27</sup> repeated 
calls or iterations then it is likely to timeout. The limits may actually be a lot lower than this depending on 
inner loop efficiency.</li>
</ul>
</p>

<p>Also realize that just because an example case may appear large, it may not necessarily be the worst case for inducing a timeout.</p>

<p>These three areas are all a lot more dangerous to challenge, and it will generally pay to first test your challenge case locally, 
perhaps on your solution or a modification of it. Since most of us don't have play time during the coding phase, the 5 minutes of 
intermission is an opportune time to do this testing in anticipation of the potential challenges.</p>

<p><b>The risks</b><br/>
So you think you've found a challenge. You can now sit smugly quiet until the phase finishes and then write something in the chat like:</p>

<p>"JowBlow: I think your 500 fails MWAHAHAHA"</p>

<p>Or, you can put your points where you mouth is and challenge it. A word of caution is appropriate though; 
eventually you will be unsuccessful in a challenge, and so you must decide whether you can afford to lose the 
points. In some situations you may have much to gain and little to lose, and in other cases a successful challenge 
won't really benefit you at all.</p>

<p><b>Crafting the challenge</b><br/>
You've discovered a flaw, or maybe a canyon, but how do you expose it?  Try and pick a test case with the smallest, 
simplest inputs possible. Then, try and run through the operation of the victim's code in your head. Choose inputs that 
will get you to your flaw as soon as possible, and which run through as few program flow constructs as possible. Reduce 
the case to its base essentials.  Congratulations! You've finally developed the courage to challenge, to lay it all on the line, 
and as you tremulously enter the challenge inputs in, the screen flickers, and you realize, yet again, that somebody has 
beaten you to the challenge. Don't let this scare you into thinking that you need to rush your challenges. It is better to take 
your time and be confident of your challenge, perhaps losing some opportunities, than to rush it (and get it wrong).</p>

<p><b>Practice</b><br/>
Finally, practice is very useful. Every time somebody in your room fails a system test, chastise yourself for not finding 
it in the challenge phase. Then, before looking at the system test case that broke the problem, see if you can determine by 
yourself what was wrong.</p>

<p>Practice this and you will improve at reading other people's coding styles. Patterns do start to emerge and you will 
be able to comprehend them quicker over time.</p>

<p>Can't wait to get challenging? Challenge phase isn't just that 15 minutes we have to wait before we can start talking 
about the problems, it's also 15 minutes of unrestrained vindictiveness - and you might even get some extra points from it.</p>

                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

