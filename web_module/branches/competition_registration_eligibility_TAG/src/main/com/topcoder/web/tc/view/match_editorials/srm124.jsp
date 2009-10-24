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
<tc-webtag:forumLink forumID="505551" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 124</span><br>Thursday, December 12, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<FONT SIZE="+2"><B>MakeTeam</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505551" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">177 / 206 (85.92%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">112 / 177 (63.28%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Johnfd</B> for 236.31 points
        </TD>
      </TR>          
    </TABLE>
  </BLOCKQUOTE>
<P>
This problem was pretty simple. Mostly just a matter of following instructions. First, you should check if a 
team can be formed. If not, return "NO TEAM", otherwise, find the person with the shortest name,
 remove him, and find the person with the longest name (in java): 
</P>
<PRE>
if(n&gt;names.length)return "NO TEAM";
        if(n==names.length)return names[names.length-1];
        String shortest = names[0];
        for(int i = 0; i&lt;n; i++)
                if(names[i].length()&lt;=shortest.length())
                        shortest = names[i];
        String longest = shortest;
        for(int i = n; i&lt;names.length; i++)
                if(names[i].length()&gt;longest.length())
                        longest = names[i];
        if(longest.length()&gt;shortest.length())return longest;
        return shortest;
</PRE>
<BR/>

<FONT SIZE="+2"> <B>Patterns</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505551" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 2:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">500 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">127 / 206 (62.65%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">51 / 127 (40.16%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Johnfd</B> for 464.48 points
                </TD>
      </TR>      
    </TABLE>
  </BLOCKQUOTE>
<P>
There were a number of ways to do this. Obviously, the simplest thing to do is to check each 
substring with the same length as the pattern. When testing two strings of the same length, 
we want to check that for each character, whenever that character appears, it appears in the 
same place in both strings. The simplest way to do this is 
</P>
<PRE>
   //s and t have the same length
        public boolean match(String s, String t){
                for(int i = 0; i&lt;s.length(); i++){
                        if(s.indexOf(s.charAt(i))!=t.indexOf(t.charAt(i)))return false;
                }
                return true;
        }
</PRE>

<BR/>


<FONT SIZE="+2"><B>AlphaWord</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505551" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

   Used as: Division-II, Level 3:
   <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">1000 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">60 / 206 (29.13%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">41 / 60 (68.33%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;"><B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;"><B>simcoen</B> for 823.03 points</TD>
      </TR>       
    </TABLE>
  </BLOCKQUOTE>

    Used as: Division-I, Level 1:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">93 / 106 (87.74%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">88 / 93 (94.62%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>SnapDragon</B> for 242.77 points
                </TD>
      </TR>       
    </TABLE>
  </BLOCKQUOTE>

<P>
There are potentially a huge number of possible orderings which satisfy the constraints, and 
it is pretty clear that we shouldn't try to look at them all. Instead, we should add letters 
1 at a time, starting with a, and put them as close to the end of the string as possible, since 
the letter that we add is bigger than all previously added letters. 
</P>

<PRE>

public String firstAlpha(String decree){
        String ret = "a";
        for(int i = 0; i&lt;decree.length(); i++){
                if(decree.charAt(i)=='B'){
                        ret += (char)('a'+i+1);
                }else{
                        ret = ret.substring(0,ret.indexOf((char)(i+'a'))) + (char)('a'+i+1) 
                        + ret.substring(ret.indexOf((char)(i+'a')));
                }
        }
        return ret;
}
</PRE>

<BR/>

<FONT SIZE="+2"><B>StringCmp</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505551" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 2:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">600 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">84 / 106 (79.25%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">39 / 84 (46.43%)</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>venco</B> for 561.46 points
                </TD>
      </TR>      
    </TABLE>
  </BLOCKQUOTE>

<P>
Most people solve this in two stages. First you parse the inputs to remove all the sequences of 0 characters, and end up with a sequence of positive numbers, matched to a sequence of characters, for each of the input strings. Once this is done, its not too hard to find where they differ. You keep two pointers, one to the current index in each expanded string. Then you have three cases. When the two pointers are the same, you increment them both by whatever number is associated with the next character (provided the characters are the same. If they are not, return the current pointer value). If the two pointers are different, check that the next character for the sequence with the smaller pointer matches the current character for the other sequence. If not, return the smaller pointer, otherwise, advance the smaller pointer. You repeat this process until you find a difference, or you hit the end of both sequences, and return -1. An alternative to this is, after you parse the strings, to join adjacent characters that are the same. After that, the two strings match only if the numbers and characters are identical, and it is simple to find the index of the difference. Here is some java code which makes use of the second method mentioned above: 
</P>

<PRE>

String letters = "abcdefghijklmnopqrstuvwxyz";
public int firstDif(String code1, String code2) {
        char[] let1 = new char[60], let2 = new char[60];
        int[] num1 = new int[60], num2 = new int[60];
        for (int i = 0; i &lt; 2; i++) {
                StringTokenizer st = new StringTokenizer((i==0?code1:code2),letters,true);
                int size = 0, state = 1;
                char[] let = (i == 0?let1:let2);
                int[] num = (i == 0?num1:num2);
                while (st.hasMoreTokens()) {
                        String curr = st.nextToken();
                        boolean hmm = false;
                        if (Character.isLetter(curr.charAt(0))) {
                                if (size!=0 &amp;&amp; let[size-1]==curr.charAt(0)) hmm = true;
                                if (state != 0)
                                        if (hmm) num[size-1]+=state;
                                        else {
                                                num[size] = state;
                                                let[size] = curr.charAt(0);                            
                                                size++;
                                        }
                                state = 1;
                        } else state=Integer.parseInt(curr);
                }
        }      
        for (int i = 0, ret = 0; i &lt; 50; i++) {
                if (let1[i]!=let2[i]) return ret;
                if (num1[i]!=num2[i]) return ret+Math.min(num1[i],num2[i]);
                ret+=num1[i];          
        }
        return -1;
}
    </PRE>


<FONT SIZE="+2"><B>Solar</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505551" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 3:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">950 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">8 / 106 (7.55%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">1 / 8 (12.50%) </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>radeye</B> for 424.92 points
                </TD>
      </TR>       
    </TABLE>
  </BLOCKQUOTE>
<P>
This problem turned out to be much harder than anticipated. However, there are two ways to solve them, neither of which is too overly complicated. 
</P>

<P>
There are two basic approaches to solving this problem. The first one uses some sort of iterative technique to test a whole bunch of points on the collector, and then determines the fraction of such points that can be seen. This approach can be seen in radeye's solution, where he tests 720 different points on the collector. To find out if a point can be seen, you can try a couple of different things. The first is to try a whole bunch more points on the window, and see if there is a line from some point on the window that does not hit one of the supports, and hits some point on the collector. If your step size is sufficiently small (i.e. you try enough points on the window), this method will work. However, a more precise test is to try a line which goes from each point on the collector, and just barely touches each corner of the box, and each corner of the supports. This is the basic idea behind radeye's solution. It turns out that java provides a very simple way to implement the strategy where we just test a whole bunch of points on the window:
</P>

<PRE>


public String dark(int x1, int y1, int x2, int y2) {
        Rectangle r1 = new Rectangle(x1*120,(5-y1)*120,120,120), r2 = new Rectangle(x2*120,(5-y2)*120,120,120);
        int ret = 0;
        outer:  for (double top = .5; top &lt;= 719.5; top++){
                for (double bottom = 0; bottom &lt;= 720; bottom+=0.1) {
                        if (!r1.intersectsLine(top,0,bottom,720) &amp;&amp; !r2.intersectsLine(top,0,bottom,720)) {
                                ret++;
                                continue outer;
                        }
                }
                System.out.println(top);
        }
        int g = gcd(720-ret,720);
        return ((720-ret)/g)+"/"+(720/g);
}
    </PRE>
    
<P>
Another, more precise method involves similar triangles. We can define three different areas of the collector: the region that can be hit by light going to the left of both beams, the light going to the right of both beams, and the light going between both beams. The two outer regions can be found quite simply using similar triangles. However this way is probably more difficult than is needed. Here is the writer's solution, which checks all relevant spots on the collector to see if they ever get hit by light. 
</P>

    <PRE>
public class Solar{ int F=2*3*4*5; int MX=6; int x1,y1,x2,y2;
    public String dark(int zx1, int zy1, int zx2, int zy2){
        x1=F*zx1; y1=F*zy1; x2=F*zx2; y2=F*zy2;
        int tot=0;
        for(int test = 1; test&lt;F*MX; test+=2){
            if(inShade(test)) tot+= 2;
        }
        int g = gcd(tot,MX*F);
        return ""+tot/g+"/"+(MX*F/g);
    }
    boolean inShade(int xt){ //do shadows of xt cover the window?
        int a1 = left(xt, x1,y1); int b1 = right(xt,x1,y1);
        int a2 = left(xt, x2,y2); int b2 = right(xt,x2,y2);
        return a1&lt;=0 &amp;&amp; ( b1>=F*MX || b1>=a2 &amp;&amp; b2>=F*MX ) ||        
               a2&lt;=0 &amp;&amp; ( b2>=F*MX || b2>=a1 &amp;&amp; b1>=F*MX );
    }    
    int left(int xt, int x, int y){ //block with support (at x,y)
        if(xt&gt;=x) y = y+F;
        if(y==F*MX) return 0;
        return xt+ (x-xt)*MX/(MX-y/F);
    }
    int right(int xt, int x, int y){
        x=x+F;
        if(xt&lt;=x) y = y+F;
        if(y==F*MX) return F*MX;
        return xt + (x-xt)*MX/(MX-y/F);
    }        
    int gcd(int a, int b){ if(b==0)return a; else return gcd(b, a%b);}
}

    </PRE>    
 
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
