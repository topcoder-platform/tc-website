<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
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
<td width="180" id="onLeft">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="algo_match_editorials"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
</div>
<span class="bodySubtitle">2006 TopCoder Open <br> Qualification Round Problem Sets </span><br>February 28 - March 1, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<h3>
PScores
</h3>
<p>
Being probably the most straightforward among the qualifiers, this problem required a very accurate implementation.
So, to find the answer we must iterate through all possible p-values and accurately simulate the process for each of them.
If the score for some value is equal to the input score, increment the answer counter:
</p>
<pre>
public int howMany(int[] nexts, int score){
   int ret = 0;
   for(int i = 0; i < nexts.length; i++){
      int ii = i;
      boolean[] visit = new boolean[nexts.length];
      visit[ii] = true;
      while (!visit[nexts[ii]]) {
         ii = nexts[ii];
         visit[ii] = true;
      }
      if (ii == score) ret++;
   }
   return ret;
}
</pre>
<h3>
SlowKeyboard
</h3>
<p>
The main part of this problem is to estimate how long it will take to type some number. 
If one needs to type "MMSS" number, the total time will be 4 + 2 secs for each pair of non-equal consecutive digits:
<pre>
int needTime(int m, int s){
   int ret = 4;
   if (m % 10 != m / 10) ret +=2;
   if (s / 10 != m % 10) ret +=2;
   if (s % 10 != s / 10) ret +=2;
   return ret;
}
</pre>
</p>
<p>
Having that computed, the easiest way to solve the whole problem is the following. Use a loop increasing the time by 1 second per iteration.
At each iteration, check whether we were able to finish typing in time:
<pre>
int m = Integer.parseInt(time.substring(0, 2));
int s = Integer.parseInt(time.substring(3));
int tm = 0;
while(true){
   if (t(m, s) <= tm) return tm;
   tm++;
   s++;
   m += s / 60;
   s %= 60;
   m %= 60;
   }
</pre>
</p>
<p>
Another way is to bruteforce over all 3600 combinations of minutes and seconds, choosing the best one.
</p>
<h3>
Runway
</h3>
<p>
Since patches have integer endpoints, we can represent each patch as a set of integer intervals of length 1
(for example, patch [1, 4] can be represented as [1, 2] + [2, 3] + [3, 4]). 
A patch needs to be inspected if there exists at least one sub-interval with integer coordinates, 
which is not covered by later patches.
To solve the problem, just iterate over all patches, split each of them into subintervals of length 1 and check each of those subintervals:
<pre>
int inspect(int[] x0, int[] x1) {
   int ans = 0;
   for (int i = 0; i < x0.length; i++) {
      boolean inspect = false;
      for (int j = x0[i]; j < x1[i] && !inspect; j++) {
         boolean ok = true;
         for (int k = i + 1; k < x0.length && ok; k++)
            ok &= (x0[k] <= j && x1[k] > j);
         inspect |= ok;         
      }
      if (inspect) ans ++;
   }
   return ans;
} 
</pre>
</p>
<h3>
BankingArray
</h3>
<p>
To solve this problem you just need to strictly follow instructions given in the statement:

<il>
<li>1. Add as much units as you can to the array. Here you take the minimal value of two - units left and free slots in array.</li>
<li>2. If all items fit into array, return the total cost you already spent.</li>
<li>3. If not, double the size of the array and copy old values. If array has the size of S, this operation will result in additional T dollars and end with T free slots in array.
Continue with point 1.</li>
</il>
</p>
<p>
Java implemenation of the algorithm follows:
<pre>
    public int addCost(int T, int N) {
        int size = 0;
        int ans = 0;
        while (true) {
            int v = Math.min(N, T - size);
            ans += v;
            N -= v;
            if (N == 0) return ans;
            size = T;
            ans += T;
            T *= 2;
        }
    }
</pre>
</p>

<h3>
FractionCounting
</h3>
<p>
We need to count all fractions of the form (p / q), where w <= p <= x and  y <= q <= z. 
Both x and z are not greater than 100, so we can brute force over all acceptable p and q. 
The difficult thing here is to assure we don't add the same fraction more than once (for example, 2/2 and 4/4 are the same).
Therefore we need to mark each fraction we counted. 
The natural way to do that is to deduce the fraction dividing both numerator and denominator by their greatest common dividor (GCD).
</p>
<p>
First, we need to write a function to compute the GCD of two numbers. 
Because of low constraints this can be brute forced, but the most common implementation is much faster:
<pre>
int GCD(int a, int b) {
    return (b == 0) ? a : GCD(b, a % b);
}
</pre>
</p>
<p>
As soon as we have this, we just maintain a 2-d array remembering the deduced form for each fraction we can construct (C++ code follows):
<pre>
int howMany(int w, int x, int y, int z) {
    vector&lt;vector&lt;bool> > visit(x + 1, vector&lt;bool>(z + 1, false));
    for (int i = w; i <= x; i++) 
       for (int j = y; j <= z; j++) 
          visit[i / GCD(i, j)][j / GCD(i, j)] = true;
    int cnt = 0;
    for (int i = 0; i <= x; i++) 
       cnt = accumulate(visit[i].begin(), visit[i].end(), cnt);
    return cnt;
} 
</pre>
</p>
<h3>
MaxKTrace
</h3>
<p>
If our <a href="/tc?module=Static&d1=tutorials&d2=dynProg">Dynamic Programming tutorial</a> had been written earlier, 
it definitely would have included this problem as an example. 
As the tutorial says, DP is used when <i>"a sub-solution of the problem is constructed from previously found ones."</i>. 
In our problem, you can build a submatrix of size K by choosing the first row and the first column of this submatrix and attaching them to a (K-1)-submatrix 
(and, similarly, build the optimal K-subtrace using optimal (K - 1)-subtrace).
</p>
<p>
The very first step when solving a DP-memo problem is to find how to define a <i>state</i> which represents a sub-problem.
Since we are going to solve our problem splitting the submatrix into first element of the trace and a smaller submatrix, 
the <i>state</i> must contain the size of the submatrix we are looking for.
Also, all rows and all columns of the smaller submatrix must be located below and to the right of the first element, respectively.
To ensure this, the state will contain the indeces of the first row and the first column which can be used building the submatrix.
</p>
The next step is to find a state for which an optimal solution is found. In our problem, we know that optimal 0-trace is always equal to 0.
The only thing left is to find how K-subtrace is dependent on (K-1)-subtraces. 
So, if we are looking for the optimal K-subtrace, r and c are the indeces of the first row and column we can use, respectively, 
then we have 3 choices:
<il>
<li>add element mat[r][c] to the trace. The answer in this case is mat[r][c] + maxTrace(K - 1, r + 1, c + 1).</li>
<li>we don't take any element from the r-th row. The answer is just maxTrace(K, r + 1, c).</li>
<li>we don't take any element from the c-th column. Similarly, the answer is maxTrace(K, r + 1, c).</li>
</il>
Taking the maximum among these three choices gives us the optimal answer for our problem.
</p>
<p>
We've explained a memoization algorithm, a similar DP implementation follows:
<pre>
public int getLargest(String[] mat, int K){
   int[][][] max = new int[mat.length][mat[0].length()][K+1];
   int ret = 0;
   for(int i = 0; i < max.length; i++)
      for(int j = 0; j < max[0].length; j++) {
         Arrays.fill(max[i][j], -1000000);
         max[i][j][0] = 0;
      }
   for(int i = 0; i < max.length; i++){
      for(int j = 0; j < max[0].length; j++){
         max[i][j][1] = mat[i].charAt(j) - '0';
         for(int k = 1; k < max[0][0].length; k++){
            if (i > 0) max[i][j][k] = Math.max(max[i-1][j][k], max[i][j][k]);
            if (j > 0) max[i][j][k] = Math.max(max[i][j-1][k], max[i][j][k]);
            if (i > 0 && j > 0) max[i][j][k] = Math.max(max[i][j][k], max[i-1][j-1][k-1] + (mat[i].charAt(j) - '0'));
         }
         ret = Math.max(ret, max[i][j][K]);
      }
   }
   return ret;
}
</pre>
</p>
<h3>
DigitFiller
</h3>
<p>
Here coders faced another almost-textbook DP problem. The problem asks us to check all the numbers which match the given mask and count those who are divided by <b>num</b>.
If number is X written as "A<sub>0</sub>A<sub>1</sub>...A<sub>k</sub>" in decimal, then the following is true:<br/>
X % <b>num</b> = (A<sub>0</sub>*10<sup>k - 1</sup> + A<sub>1</sub>*10<sup>k - 2</sup> + ... + A<sub>k</sub>*10<sup>0</sup>) % <b>num</b>
= (A<sub>0</sub>*10<sup>k - 1</sup>) % <b>num</b> + (A<sub>1</sub>*10<sup>k - 2</sup>) % <b>num</b> + ... + (A<sub>k</sub>*10<sup>0</sup>)  % <b>num</b>.
<br/>
If so, we can consider digits independently from left to right.
At each place, we will try to substitute an 'X' with each of 10 digits, store the remainder left after this digit, and continue to the next one.
These data - number of digits processed and the remainder left - is a 
<i>state</i> which we will use in our 
<a href="/tc?module=Static&d1=tutorials&d2=dynProg">DP solution</a>. 
Now we need to find other 2 requisites - the state when the answer can be determined directly and how to  move from one state to another.
</p>
<p>
The first can be found easily. If we've passed all digits already, then the answer is either 1 if the remainder is 0 (so the number we built can be divided by num)
or 0 otherwise. Moving between states isn't extremely hard too. 
If the input number has a digit at some place, we just multiply the digit by a corresponding power of 10, take modulo <b>num</b>,
add the result to the remainder we had and continue to the next position.
If the input number has a 'X', we perform the same procedure for all possible digits between 0 and 9. 
The core function of a memo solution follows:
</p>
<pre>
long numCases(int where, int left) {
   if (where == N) return (left == 0) ? 1 : 0;
   if (memo[where][left] != -1) return memo[where][left];
   int mm = dd[N - 1 - where];
   if (data.charAt(where) != 'X') 
      return memo[where][left] = numCases(where + 1, (left + (int)(data.charAt(where) - '0') * mm) % num);
   long res = 0;
   for (int i = 0; i < 10; i++) 
      res += numCases(where + 1, (left + mm * i) % num);
   return memo[where][left] = res;
}
</pre>
<h3>
NumJordanForms
</h3>
<p>
To return the total number of Jordan forms one needs to find the number of partitions for each element of <b>charPoly</b>,
and then multiply all these numbers. 
Since numbers can grow really huge, we perform all operations modulo 179424673 (which is the 10M-th prime number).
Now we'll concentrate on finding the total number of partitions for <b>charPoly[i]</b>.
</p>
<p>
We need to find the number of ways to split the number A into several positive numbers (components), 
such that the sum of the components is equal to A, all components are not greater than number B and at least one component is equal to B.
Lets solve a simpler problem first - forget about the last constraint and allow all components be strictly smaller than B.
This is a classical DP / memoization problem, which can be solved in A*B space and time:
<pre>
int[][] memo;
int numWays(int A, int B) {
       if (A < 0) return 0;
       if (A == 0) return 1;
       if (B <= 0) return 0;
       if (memo[A][B] != -1) return memo[A][B];
       int ans = GV(A - B, B) + GV(A, B - 1);
       return memo[A][B] = (int)(ans % 179424673);
}
</pre>
Here, we take components in non-increasing order. So, to split the number A, we can either have one component to
be equal to B and solve the problem for (A - B, B), 
or don't take any component equal to B and continue to the smaller components - (A, B - 1). 
To get the answer, sum these 2 values and take modulo 179424673.
</p>
<p>
Now we need to incorporate the last constraint into the statement. 
This is rather easy - to ensure that at least one component of the partition will be equal to <b>minPoly</b>[i], 
we will subtract <b>minPoly</b>[i] at the very beginning (making it the first component) and continue with numWays method:
<pre>
public int howMany(int[] charPoly, int[] minPoly) {
   long ans = 1;
   for (int i = 0; i < charPoly.length; i++) {
   ans *= GV(charPoly[i] - minPoly[i], minPoly[i]);
   ans %= M;
   }
return (int)ans;
}
</pre>
</p>
<h3>
BigFibonacci
</h3>
<p>
The i-th Fibonacci number can be easily found in linear time: 
just keep adding F<sub>i - 1</sub> and F<sub>i</sub> to get F<sub>i + 1</sub> until you are done.
But for the possible inputs for this problem, the linear algorithm is too slow - we don't have enough time to perform 10<sup>15</sup> iterations.
Lets look at Fibonacci sequence from another point of view. 
Since each Fibonacci number depends only on 2 previous numbers, its natural to keep only these 2 last numbers.
Switching from pair (F<sub>i - 1</sub>, F<sub>i</sub>) to pair (F<sub>i</sub>, F<sub>i + 1</sub>) can be described as a transformation matrix A:
</p>
<div align="center">
<img src="/i/srm/tco06_qual_1.gif" alt="0" />
</div>
<p>
In other words, (F<sub>i + 1</sub>, F<sub>i</sub>) = A * (F<sub>i</sub>, F<sub>i - 1</sub>).
As you can easily prove, if B = A<sup>k</sup>, then B[0][0] = F<sub>k + 1</sub>, B[0][1] = B[1][0] = F<sub>k</sub> and B[1][1] = F<sub>k - 1</sub>.
Having that found, you just need to power the matrix in logarithmical time. This powering can be simplified even more by using the dependencies between elements of the matrix.
</p>
<p>
<a href="http://forums.topcoder.com/?module=Thread&threadID=509544">This thread</a> proposes some other methods to solve the problem.
</p>
<h3>
Synchro
</h3>
<p>
The scores on this problem were the lowest among all the qualifiers, though the code itself isn't too long. 
First, lets change the "coordinate system" a bit.
Instead of computing everything related to the immovable clock, lets make the slowest hand immovable and transform hands to compute their position relative to it.
With that transform applied, the slowest hand will always point at 12 hours and speeds of all other hands will be equal to the difference between their original speeds and the speed of the slowest hand
(so, if <b>watch</b> = {2, 3, 17}, then new speeds will be {0, 1, 15}).
Here, all hands can agree only when they point at 12 hours mark (because the slowest hand now always point there).
If new hands speeds are s<sub>0</sub>, ..., s<sub>k - 1</sub>, then hands will need 60 / s<sub>0</sub>, ... , 60 / s<sub>k - 1</sub> minutes respectively to pass an hour.
In other words, the second hand will be at 12 hours every 60 / s<sub>0</sub> minutes and the (k - 1)<sup>th</sup> hand will be at 12 hours every 60 / s<sub>k - 1</sub> minutes.
Therefore, they will be at 12 hours every 60 / s<sub>0</sub>, 60 / s<sub>1</sub>, .., 60 / s<sub>k - 1</sub> hours,
and all of them will again point at 12 hours in 60 / GCD(s<sub>0</sub>, s<sub>1</sub>, .., s<sub>k - 1</sub>) hours.
Having that computed, we use the speed of the slowest hand to find the minute position. Java code follows (don't forget about a special case when all hands are of the same speed):
<pre>
public double resynch(int[] watch){
   int[] dif = new int[watch.length-1];
   int g=0;
    for(int i = 1; i < watch.length; i++){
      dif[i-1]=Math.abs(watch[i]-watch[i-1]);
                  if(dif[i-1]!=0) g=dif[i-1];
   }
   if (g == 0) return 0.0;
   for(int i = 0; i < dif.length; i++) g = gcd(g, dif[i]);
   double hr = 60.0 / g;
   double rev = hr * watch[0] / 60; 
   rev = rev - (int)rev;
   return 60.0*rev;
}
</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/Olexiy_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
