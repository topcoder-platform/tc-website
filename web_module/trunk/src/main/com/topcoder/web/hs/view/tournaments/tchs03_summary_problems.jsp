<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript">
  function changeImage(image, newImage) {
   document[image].src=newImage;
   return;
  }
</script>
    
</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Top ends -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">
   <tr valign="top">

<!-- Left Column begins -->
      <td width="170" bgcolor="#001934">
        <jsp:include page="../includes/left_nav.jsp" />
        <jsp:include page="../includes/left_calendar.jsp" />
      </td>
<!-- Left Column begins -->
      
<!-- Center Column begins -->
      <td valign="top" width="99%">
        <table cellspacing="0" cellpadding="20" border="0" width="100%">
           <tr valign="top">
              <td height="100%" class="statTextBig">

                <div align="center">
                
                <jsp:include page="../includes/tchs03_head_tourney.jsp" />

                <jsp:include page="../includes/tchs03_tabs.jsp" >
                   <jsp:param name="isSummaryPage" value="true"/>
                </jsp:include>

                <jsp:include page="../includes/tchs03_summary_subnav.jsp" >
                   <jsp:param name="isProblemsPage" value="true"/>
                </jsp:include>

                </div>

                <h2>Problem Set Analysis &amp; Opinion</h2>

                <p>by lars2520, <em>TopCoder Member</em><br />
                Tuesday, May 20, 2003</p>

                <h3>IntRange</h3>

                <blockquote>
                <table cellspacing="2" cellpadding="3">
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Value</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">250</td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Submission Rate</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">22 / 24  (91.67%) </td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Success Rate</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">22 / 22  (100.00%)</td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>High Score</b></td>
                <td style="background: #1B2E5D;" class="statTextBig"><b>PolaristarII</b> for 249.08 points</td>
                </tr>
                </table>
                </blockquote>
                
                <p>In this problem, you were basically given a formula, and told to implement it.  There are a 
                number of ways to do this, depending on how well you knew your languages syntax and libraries.  
                One way to do it is to write your own power function with a for loop to find 2<sup>n</sup>.  
                Something like:</p>
                
<pre>
  int pow(int n){
    int ret = 1;
    for(int i = 0; i &lt; n; i++){
      ret = ret * 2;
    }
    return ret;
  }
</pre>

                <p>However, if you are familiar with the libraries provided by your language of choice, all 3 
                languages have a power function.  But, the shortest solution involves a rather different approach.  
                There is an operator, <tt>&lt;&lt;</tt>, which shifts the binary representation of a number to 
                the left.  So, for example, <tt>3 &lt;&lt; 2</tt>, would shift the binary representation of 3, 
                which is 11, two places to the left.  This would give you 1100, in binary, which you will 
                immediately recognize to be 12, or 3 * 2<sup>2</sup>, if you are familiar with binary.  In 
                other words, each time you shift a number one digit to the left, you are doubling it.  So, to 
                compute 2<sup>n</sup>, we can simply use the expression <tt>1 &lt;&lt; n</tt>.  This makes 
                the whole solution very short:</p>
                
<pre>
  if(type is signed)
    return (1&lt;&lt;(n-1))-1;
  else
    return (1&lt;&lt;n)-1;
</pre>

                <p>Since n was limited to 30, you didn't have to worry about integer overflow or anything like 
                that, and pretty much every solution that passed the examples passed the system tests.</p>
                
                <h3>TextLayout</h3>

                <blockquote>
                <table cellspacing="2" cellpadding="3">
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Value</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">500</td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Submission Rate</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">14 / 24  (58.33%) </td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Success Rate</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">13 / 14  (92.86%)</td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>High Score</b></td>
                <td style="background: #1B2E5D;" class="statTextBig"><b>PolaristarII</b> for 449.05 points</td>
                </tr>
                </table>
                </blockquote>
                
                <p>This problem looked pretty simple, but implementing it turns out to be a little tricky.  
                There are a few shortcuts that you can take if you know your language's libraries well, but 
                the solution I will describe will forego those shortcuts and cover how to solve the problem 
                without any libraries.  First, you should start be instantiating a String[] 
                (or vector&lt;string&gt; or string[], depending on language) that is plenty large to hold 
                the return value.  Then, you should keep a pointer to the working element in the String[], 
                and start it at 0.  Next, set the first element to be the first word (try it without doing this 
                to see why it is necessary).  Then, we loop through all of the words, starting at the second 
                word, and check to see if we can add the right number of spaces and the current word on to 
                the end of the working element of our String[].  If we can, we do so, and move on to the next 
                word.  If we can't because doing so would make the working element too long, we increment 
                our pointer to the next element, and set that element to be the current word.  We then move 
                on to the next word. </p>
                
                <p>The last step is to copy everything into a smaller array, since we don't want a bunch of 
                extra null elements in the array we return.  Here is the implementation in Java:</p>
                
<pre>
import java.util.*;
public class TextLayout{
  public String[] layout(String[] words, int space, int width){
<font color="#999999">//For convenience, we have a variable sp, with the appropriate 
number of spaces</font>
    String sp = "";
    for(int i = 0; i&lt;space; i++)sp+=" ";
<font color="#999999">//Start our ptr at 0</font>
    int ptr = 0;
    String[] s = new String[50];
    s[0] = words[0];
    for(int i = 1; i&lt;words.length; i++){
      if(s[ptr].length()+words[i].length()+sp.length() &lt;= width){
<font color="#999999">//Adding the spaces and the word won't make the working element too long, 
so just do it.</font>
        s[ptr]+=sp+words[i];
      }else{
<font color="#999999">//Adding the spaces and the work will make the working element too long, 
so move on to the next one.  
//We don't add any spaces before this word since it is the first in the 
list for this element</font>
        ptr++;
        s[ptr] = words[i];
      }
    }
<font color="#999999">//Last, copy everything into a smaller array</font>
    String ret[] = new String[ptr+1];
    for(int i = 0; i&lt;=ptr; i++)ret[i] = s[i];
    return ret;
  }
}
</pre>
                <h3>AmbiguousDates</h3>

                <blockquote>
                <table cellspacing="2" cellpadding="3">
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Value</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">1000</td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Submission Rate</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">4 / 24  (16.67%) </td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>Success Rate</b></td>
                <td style="background: #1B2E5D;" class="statTextBig">1 / 4  (25.00%)</td>
                </tr>
                <tr>
                <td style="background: #1B2E5D;" class="statTextBig"><b>High Score</b></td>
                <td style="background: #1B2E5D;" class="statTextBig"><b>MasterMargie</b> for 670.00 points</td>
                </tr>
                </table>
                </blockquote>
                
                <p>If you wanted to, you could probably have written some complicated logic to figure out what 
                the order had to be.  For example, if any number is greater than 31, it has to be the year, and 
                so on.  However, solving the problem this way is harder and much more error prone.  It is 
                very easy to miss a case somewhere.  So, the easiest way to do this is to generate all possible 
                permutations (there are only 6), and check each one to see if it is valid, and if it is, to see if 
                it is earlier than all of the other dates found thus far.  So, first off, we should have some way 
                to hold the earliest date found so far.  An int[] (vector &lt;int&gt; in C++) seems natural, 
                since if we do this, we can just return the lowest found at the end, without any additional work.  
                We can initialize the int[] to all 0's, to signify that so far no valid dates have been found.  Then, 
                we start by generating all 6 permutations.  The simplest way to do this is to use 3 nested for 
                loops, though recursion would also work:</p>

<pre>
for(int month = 0; month&lt;3; month++){
  for(int day = 0; day&lt;3; day++){
    for(int year = 0; year&lt;3; year++){
      if(month!=day &amp;&amp; day!=year &amp;&amp; month!=year){
<font color="#999999">        //month, day and year all represent distinct indexes into date
        //check first to see if a date is valid, and if it is, check
        //that it is less than all previously found valid dates.</font>
      }
    }
  }
}
</pre>

                <p>Once we have figured out how to generate all 6 permutations, we have to first check if the 
                permutation we've generated is valid.  To do this, we have to check 2 things:</p>

<ol>
   <li><tt>date[month]</tt> is between 1 and 12, inclusive.</li>
   <li><tt>date[day]</tt> is a valid day in the month specified by <tt>date[month]</tt> and <tt>date[year]</tt></li>
</ol>

<p>So, first lets check the month:</p>

<pre>
  if(date[month] == 0 || date[month] > 12){
    valid = false;
</pre>

                <p>Now, we want to figure out how many days there are in the month defined by this 
                permutation, and then check that <tt>date[day]</tt> is in this range:</p>

<pre>
   int[] daysInMonth = {-1,31,28,31,30,31,30,31,31,30,31,30,31};
   int days;
   if(date[year] % 4 == 0 &amp;&amp; date[month] == 2){
   <font color="#999999">  //it is a leap year, and is February</font>
      days = 29;
   }else{
      days = daysInMonth[date[month]];
   }
<font color="#999999">//once we know how many days there are in the month, we check to see if 
the number of days from our permutation is valid.</font>
  if(date[day] == 0 || date[day] > days){
    valid = false;
  }
</pre>

                <p>Now, if both the month and the day are valid, then we have found a valid date, and must 
                compare it to the best date found so far.  So, if we have an int[], best, that holds the date in 
                the format that it should be returned in, we can do something like this to check if the date 
                we just found is before the earliest date found thus far. (Note that a valid date will not have 
                best[0] == 0, so we should always set best in that case, since it means no valid dates have 
                been found yet):</p>

<pre>
  if(valid){
    if(best[0] == 0 || <font color="#999999">//No valid date has been found so far.</font>
      date[year] &lt; best[2] || 
      date[year] == best[2] &amp;&amp; date[month] &lt; best[0] || 
      date[year] == best[2] &amp;&amp; date[month] == best[0] &amp;&amp; date[day] &lt; best[1]){
      best[0] = date[month];
      best[1] = date[day];
      best[2] = date[year];
    }
  }
</pre>

                <p>If that huge boolean expression makes your head spin, there is a shorter way to do it.  
                Rather than comparing them one element at a time, why not just define a simple function 
                that increases with increasing date, and then compare the value of that function.  For example, 
                compare the number of days that have passed since 1/1/0.  Evaluating this would be hard, 
                but we can easily approximated it, and still maintain the property that later dates give 
                higher numbers.</p>

                <p><tt>f(date) = 400 * year + 31 * month + day</tt><br/></p>

                <p>This simplifies our expression greatly:</p>

<pre>
  if(valid){
    if(best == null || date[year] * 400 + date[month] * 31 + date[day] &lt; 
      best[2] * 400 + best[0] * 31 + best[1]){
      best[0] = date[month];
      best[1] = date[day];
      best[2] = date[year];
    }
  }
</pre>

                <p>Now, putting all of this together, we get:</p>

<pre>
public class AmbiguousDates{
  public int[] earliestDate(int[] date){
    int[] best = new int[3];
    int days = 0;
    int[] daysInMonth = {-1,31,28,31,30,31,30,31,31,30,31,30,31};
    for(int month = 0; month&lt;3; month++){
      for(int day = 0; day&lt;3; day++){
        for(int year = 0; year&lt;3; year++){
          if(month!=day &amp;&amp; day!=year &amp;&amp; month!=year){
            boolean valid = true;
            if(date[month] == 0 || date[month] > 12){
              valid = false;
            }
            if(valid &amp;&amp; date[year] % 4 == 0 &amp;&amp; date[month] == 2){
              days = 29;
            }else if(valid){
              days = daysInMonth[date[month]];
            }
            if(date[day] == 0 || date[day] > days){
              valid = false;
            }
            if(valid){
              if(best[0] == 0 || date[year] * 400 + date[month] * 31 + date[day] &lt; 
                best[2] * 400 + best[0] * 31 + best[1]){
                best[0] = date[month];
                best[1] = date[day];
                best[2] = date[year];
              }
            }
          }
        }
      }
    }
    return best;
  }
}
</pre>

                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                   <tr><td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td></tr>
                </table>

              </td>
           </tr>
        </table>

        <p><br/></p>
      
      </td>
      
      <td width="" bgcolor="#001934">
        <jsp:include page="../includes/right_resources.jsp" />
      </td>
   </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>
