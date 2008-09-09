<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
</style>
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
        <td width="180" id="onLeft"><jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_tutorials"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->
        <!-- Center Column Begins -->
        <td width="100%" align="center"><div class="tutorBodyFull">
            <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value="&#160;"/>
            </jsp:include>
            <div class="linkBox"> <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br>
                <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br>
                </span> <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br>
                </span>
                <tc-webtag:forumLink forumID="514543" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>
            <span class="bigTitle">Prime Numbers, Factorization and Euler Function</span> <br />
            <br />
            <div class="authorPhoto"> <img src="/i/m/medv_big.jpg" alt="Author" /> </div>
            <div class="authorText"> By&#160;
                <tc-webtag:handle coderId="269207" context="algorithm"/>
                <br />
                <em>TopCoder Member</em> </div>
            <br clear="all">
            <p><i>In addition to being a TopCoder member,
                <tc-webtag:handle coderId="269207" context="algorithm"/>
                is a lecturer in Kiev National University's cybernetics faculty.</i></p>
            <p>Prime numbers and their properties were extensively studied by the ancient Greek mathematicians. Thousands of years later, we commonly use the different properties of integers that they discovered to solve problems. In this article we&rsquo;ll review some definitions, well-known theorems, and number properties, and look at some problems associated with them.</p>
            <p><strong>A prime number</strong> is a positive integer, which is divisible on 1 and itself. The other integers, greater than 1, are <strong>composite</strong>. <strong>Coprime</strong> integers are a set of integers that have no common divisor other than 1 or -1. </p>
            <p><strong> The fundamental theorem of arithmetic:</strong><br />
                Any positive integer can be divided in primes in essentially only one way. The phrase 'essentially one way' means that we do not consider the order of the factors important. </p>
            <p>One is neither a prime nor composite number. One is not composite because it doesn&rsquo;t have two distinct divisors. If one is prime, then number 6, for example, has two different representations as a product of prime numbers: 6 = 2 * 3 and 6 = 1 * 2 * 3. This would contradict the fundamental theorem of arithmetic. </p>
            <p><strong>Euclid&rsquo;s theorem:</strong><br />
                There is no largest prime number. </p>
            <p><strong> </strong>To prove this, let's consider only <em>n</em> prime numbers: <em>p</em><sub>1</sub>, <em>p</em><sub>2</sub>, &hellip;, <em>p<sub>n</sub></em>. But no prime <em>p<sub>i</sub></em> divides the number </p>
            <p>N = <em>p</em><sub>1</sub> * <em>p</em><sub>2</sub> * &hellip; * <em>p<sub>n</sub></em> + 1, </p>
            <p>so N cannot be composite. This contradicts the fact that the set of primes is finite. </p>
            <p><strong>Exercise 1.</strong> Sequence <em>a<sub>n</sub></em> is defined recursively: </p>
            <p><img src="i/education/prime-eq1.jpg" alt="" /></p>
            <p>Prove that <em>a</em><sub><em>i</em></sub> and <em>a</em><sub><em>j</em></sub>, <em>i</em> <FONT FACE="Symbol">&#185;</FONT> <em>j</em> are relatively prime. </p>
            <p><strong> </strong>Hint: Prove that <em>a</em><sub><em>n</em>+1</sub> = <em>a</em><sub>1</sub><em>a</em><sub>2</sub>&hellip;<em>a</em><sub><em>n</em></sub> + 1 and use Euclid&rsquo;s theorem. </p>
            <p><strong>Exercise 2.</strong> Ferma numbers F<sub><em>n</em></sub> (<em>n</em> &ge; 0) are positive integers of the form </p>
            <p><img src="i/education/prime-eq2.jpg" alt="" /></p>
            <p>Prove that F<em><sub>i</sub></em> and F<em><sub>j</sub></em>, <em>i</em> &ne; <em>j</em> are relatively prime. </p>
            <p> Hint: Prove that F<sub><em>n</em> +1</sub> = F<sub>0</sub>F<sub>1</sub>F<sub>2</sub>&hellip;F<sub><em>n</em></sub> + 2 and use Euclid&rsquo;s theorem.</p>
            <p><strong>Dirichlet&rsquo;s theorem about arithmetic progressions:</strong><br />
                For any two positive coprime integers <em>a</em> and <em>b</em> there are infinitely many primes of the form <em>a</em> + <em>n*b</em>, where <em>n</em> &gt; 0. </p>
            <p><strong> Trial division: <br />
                </strong> Trial division is the simplest of all factorization techniques. It represents a brute-force method, in which we are trying to divide <em>n</em> by every number <em>i</em> not greater than the square root of<em> n</em>. (Why don't we need to test values larger than the square root of <em>n</em>?) The procedure <em>factor</em> prints the factorization of number <em>n</em>. The factors will be printed in a line, separated with one space. The number <em>n</em> can contain no more than one factor, greater than <em>n</em>. </p>
            <pre>     void factor(int n) 
     { 
       int i; 
       for(i=2;i&lt;=(int)sqrt(n);i++) 
       { 
         while(n % i == 0) 
         { 
           printf(&quot;%d &quot;,i); 
           n /= i; 
         } 
       } 
       if (n &gt; 1) printf(&quot;%d&quot;,n); 
       printf(&quot;\n&quot;); 
     } 
</pre>
            <p> Consider a problem that asks you to find the factorization of integer <em>g</em>(-2<sup>31</sup> &lt; <em>g</em> &lt;2<sup>31</sup>) in the form </p>
            <p><em>g</em> = <em>f</em><sub>1</sub> x <em>f</em><sub>2</sub> x &hellip; x <em>f</em><sub><em>n</em></sub> or <em>g</em> = -1 x <em>f</em><sub>1</sub> x <em>f</em><sub>2</sub> x &hellip; x <em>f</em><sub></em>n</em></sub></p>
            <p> where <em>f</em><sub><em>i</em></sub> is a prime greater than 1 and <em>f</em><sub><em>i</em></sub> &le; <em>f</em><sub><em>j</em></sub> for <em>i</em> &lt; <em>j</em>. </p>
            <p> For example, for g = -192 the answer is -192 = -1 x 2 x 2 x 2 x 2 x 2 x 2 x 3. </p>
            <p> To solve the problem, it is enough to use trial division as shown in function <em>factor</em>. </p>
            <p><strong>Sieve of Eratosthenes:</strong><br />
                The most efficient way to find all small primes was proposed by the Greek mathematician Eratosthenes. His idea was to make a list of positive integers not greater than <em>n</em> and sequentially strike out the multiples of primes less than or equal to the square root of <em>n</em>. After this procedure only primes are left in the list. </p>
            <p>The procedure of finding prime numbers <em>gen_primes </em>will use an array primes[MAX] as a list of integers. The elements of this array will be filled so that </p>
            <p><img src="i/education/prime-eq3.jpg" alt="" /></p>
            <p>At the beginning we mark all numbers as prime. Then for each prime number <em>i</em> (<em>i</em> &ge; 2), not greater than &radic;MAX, we mark all numbers <em>i</em>*<em>i</em>, <em>i</em>*(<em>i</em> + 1), &hellip; as composite. </p>
            <pre>
     void gen_primes() 
     { 
       int i,j; 
       for(i=0;i&lt;MAX;i++) primes[i] = 1; 
       for(i=2;i&lt;=(int)sqrt(MAX);i++) 
         if (primes[i]) 
           for(j=i;j*i&lt;MAX;j++) primes[i*j] = 0; 
     } 
</pre>
            <p> For example, if MAX = 16, then after calling <em>gen_primes</em>, the array &lsquo;primes&rsquo; will contain next values: </p>
            <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
                <tr nowrap="nowrap">
                    <td class="valueC"><em>i</em></td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 2 </td>
                    <td class="valueC"> 3 </td>
                    <td class="valueC"> 4 </td>
                    <td class="valueC"> 5 </td>
                    <td class="valueC"> 6 </td>
                    <td class="valueC"> 7 </td>
                    <td class="valueC"> 8 </td>
                    <td class="valueC"> 9 </td>
                    <td class="valueC"> 10 </td>
                    <td class="valueC"> 11 </td>
                    <td class="valueC"> 12 </td>
                    <td class="valueC"> 13 </td>
                    <td class="valueC"> 14 </td>
                    <td class="valueC"> 15 </td>
                </tr>
                <tr>
                    <td class="valueC"> primes[<em>i</em>] </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 1 </td>
                    <td class="valueC"> 0 </td>
                    <td class="valueC"> 0 </td>
                </tr>
            </table>
            <p><strong>Goldbach's Conjecture:</strong><br />
                For any integer <em>n</em> (<em>n</em> &ge; 4) there exist two prime numbers <em>p</em><sub>1</sub> and <em>p</em><sub>2</sub> such that <em>p</em><sub>1</sub> + <em>p</em><sub>2</sub> = <em>n</em>. In a problem we might need to find the number of essentially different pairs (<em>p</em><sub>1</sub>, <em>p</em><sub>2</sub>), satisfying the condition in the conjecture for a given even number<em> n</em> (4 &le; <em>n</em> &le; 2 15). (The word &lsquo;essentially&rsquo; means that for each pair (<em>p</em><sub>1</sub>, <em>p</em><sub>2</sub>) we have <em>p</em><sub>1 </sub>&le;<em> </em><em>p</em><sub>2</sub>.) </p>
            <p>For example, for <em>n</em> = 10 we have two such pairs: 10 = 5 + 5 and 10 = 3 + 7. </p>
            <p><strong><em> </em></strong>To solve this,<strong></strong>as <em>n</em> &le; 2<sup>15</sup> = 32768, we&rsquo;ll fill an array primes[32768] using function <em>gen_primes</em>. We are interested in primes, not greater than 32768. </p>
            <p>The function <em>FindSol</em>(<em>n</em>) finds the number of different pairs (<em>p</em><sub>1</sub>, <em>p</em><sub>2</sub>), for which <em>n</em> = <em>p</em><sub>1</sub> + <em>p</em><sub>2</sub>. As <em>p</em><sub>1</sub> &le; <em>p</em><sub>2</sub>, we have <em>p</em><sub>1</sub> &le; <em>n</em>/2. So to solve the problem we need to find the number of pairs (<em>i</em>, <em>n</em> &ndash; <em>i</em>), such that <em>i</em> and <em>n</em> &ndash; <em>i</em> are prime numbers and 2 &le; <em>i</em> &le; <em>n</em>/2. </p>
            <pre>
     int FindSol(int n) 
     { 
       int i,res=0; 
       for(i=2;i&lt;=n/2;i++) 
         if (primes[i] &amp;&amp; primes[n-i]) res++; 
       return res; 
     } 
</pre>
            <p><strong> Euler&rsquo;s totient function<br />
                </strong> The number of positive integers, not greater than <em>n</em>, and relatively prime with <em>n</em>, equals to Euler&rsquo;s totient function &phi; (<em>n</em>). In symbols we can state that </p>
            <p> &phi; (<em>n</em>) ={<em>a</em> <FONT FACE="Symbol">&#206;</FONT> N: 1 &le; <em>a</em> &le; <em>n</em>, gcd(<em>a</em>, <em>n</em>) = 1} </p>
            <p>This function has the following properties: </p>
            <ol>
                <li> If <em>p</em> is prime, then &phi; (<em>p</em>) = <em>p</em> &ndash; 1 and &phi; (<i>p<sup>a</sup></i>) = <em>p</em><em> a</em> * (1 &ndash; 1/<em>p</em>) for any <em>a</em>. </li>
                <li> If <em>m</em> and <em>n</em> are coprime, then &phi; (<em>m</em> * <em>n</em>) = &phi; (<em>m</em>) * &phi; (<em>n</em>). </li>
                <li> If <em>n</em> = <img src="i/education/prime-eq4.jpg" alt="" />, then Euler function can be found using formula: </li>
            </ol>
            <p>&phi; (<em>n</em>) = <em>n</em> * (1 &ndash; 1/<em>p</em> 1) * (1 &ndash; 1/<em>p</em> 2) * ... * (1 &ndash; 1/<em>p k</em>) </p>
            <p>The function fi(<em>n</em>) finds the value of &phi;(<em>n</em>): </p>
            <pre>
     int fi(int n) 
     { 
       int result = n; 
       for(int i=2;i*i &lt;= n;i++) 
       { 
         if (n % i == 0) result -= result / i; 
         while (n % i == 0) n /= i; 
       } 
       if (n &gt; 1) result -= result / n; 
       return result; 
     } 
</pre>
            <p>For example, to find &phi;(616) we need to factorize the argument: 616 = 2<sup>3</sup> * 7 * 11. Then, using the formula, we&rsquo;ll get: </p>
            <p>&phi;(616) = 616 * (1 &ndash; 1/2) * (1 &ndash; 1/7) * (1 &ndash; 1/11) = 616 * 1/2 * 6/7 * 10/11 = 240. </p>
            <p>Say you've got a problem that, for a given integer <em>n</em> (0 &lt; <em>n</em> &le; 10<sup>9</sup>), asks you to find the number of positive integers less than <em>n</em> and relatively prime to <em>n</em>. For example, for <em>n</em> = 12 we have 4 such numbers: 1, 5, 7 and 11. </p>
            <p>The solution: The number of positive integers less than <em>n</em> and relatively prime to <em>n</em> equals to &phi;(<em>n</em>). In this problem, then, we need do nothing more than to evaluate Euler&rsquo;s totient function. </p>
            <p>Or consider a scenario where you are asked to calculate a function Answer(<em>x</em>, <em>y</em>), with <em>x</em> and <em>y</em> both integers in the range [1, <em>n</em>], 1 &le;<em> n</em> &le; 50000. If you know Answer(<em>x</em>, <em>y</em>), then you can easily derive Answer(<em>k</em>*<em>x</em>, <em>k</em>*<em>y</em>) for any integer <em>k</em>. In this situation you want to know how many values of Answer(<em>x</em>, <em>y</em>) you need to precalculate. The function Answer is not symmetric.<strong></strong></p>
            <p>For example, if <em>n</em> = 4, you need to precalculate 11 values: Answer(1, 1), Answer(1, 2), Answer(2, 1), Answer(1, 3), Answer(2, 3), Answer(3, 2), Answer(3, 1), Answer(1, 4), Answer(3, 4), Answer(4, 3) and Answer(4, 1). </p>
            <p>The solution here is to let res(<em>i</em>) be the minimum number of Answer(<em>x</em>, <em>y</em>) to precalculate, where <em>x</em>, <em>y</em><FONT FACE="Symbol"> &#206;</FONT>{1, &hellip;, <em>i</em>}. It is obvious that res(1) = 1, because if <em>n</em> = 1, it is enough to know Answer(1, 1). Let we know res(<em>i</em>). So for <em>n</em> = <em>i</em> + 1 we need to find Answer(1, <em>i</em> + 1), Answer(2, <em>i</em> + 1), &hellip; , Answer(<em>i</em> + 1, <em>i</em> + 1), Answer(<em>i</em> + 1, 1), Answer(<em>i</em> + 1, 2), &hellip; , Answer(<em>i</em> + 1, <em>i</em>). </p>
            <p>The values Answer(<em>j</em>, <em>i</em> + 1) and Answer(<em>i</em> + 1, <em>j</em>), <em>j</em> <FONT FACE="Symbol">&#206;</FONT>{1, &hellip;, <em>i</em> + 1}, can be found from known values if GCD(<em>j</em>, <em>i</em> + 1) &gt; 1, i.e. if the numbers <em>j</em> and <em>i</em> + 1 are not common primes. So we must know all the values Answer(<em>j</em>, <em>i</em> + 1) and Answer(<em>i</em> + 1, <em>j</em>) for which <em>j</em> and <em>i</em> + 1 are coprime. The number of such values equals to 2 * &phi; (<em>i</em> + 1), where &phi; is an Euler&rsquo;s totient function. So we have a recursion to solve a problem: </p>
            <blockquote>res(1) = 1,<br />
                res(<em>i</em> + 1) = res(<em>i</em>) + 2 * j (<em>i</em> + 1), <em>i</em> &gt; 1 </blockquote>
            <p><strong>Euler&rsquo;s totient theorem:</strong><br />
                If <em>n</em> is a positive integer and <em>a</em> is coprime to <em>n</em>, then <em>a</em> <sup>&phi; (<em>n</em>)</sup> <FONT FACE="Symbol">&#186;</FONT> 1 (mod <em>n</em>). </p>
            <p><strong> Fermat&rsquo;s little theorem:</strong><br />
                If <em>p</em> is a prime number, then for any integer <em>a</em> that is coprime to <em>n</em>, we have </p>
            <p><em> a <sup>p</sup></em> &equiv; <em>a</em> (mod <em>p</em>) </p>
            <p> This theorem can also be stated as: If <em>p</em> is a prime number and <em>a</em> is coprime to <em>p</em>, then </p>
            <p><em>a</em> <sup><i>p</i> -1</sup> &equiv; 1 (mod <em>p</em>) </p>
            <p>Fermat&rsquo;s little theorem is a special case of Euler&rsquo;s totient theorem when <em>n</em> is prime. </p>
            <p><strong>The number of divisors:<br />
                </strong> If <em>n</em> = <img src="i/education/prime-eq4.jpg" alt="" />, then the number of its positive divisors equals to </p>
            <p>(<em>a</em><sub>1</sub> + 1) * (<em>a</em><sub>2</sub> + 1) * &hellip; * (<em>a</em><sub><em>k</em></sub> + 1) </p>
            <p> For a proof, let A<em> i</em> be the set of divisors <img src="i/education/prime-eq5.jpg" alt="" />. Any divisor of number <em>n</em> can be represented as a product <em>x</em><sub>1</sub> * <em>x</em><sub>2</sub> * &hellip; * <em>x</em> <sub><em>k</em></sub> , where <em>x</em><sub><em>i</em></sub> <FONT FACE="Symbol">&#206;</FONT> A<sub><em>i</em></sub>. As |A<sub><em>i</em></sub>| = <em>a</em><sub><em>i</em></sub> + 1, we have </p>
            <p>(<em>a</em><sub>1</sub> + 1) * (<em>a</em><sub>2</sub> + 1) * &hellip; * (<em>a</em><sub><em>k</em></sub> + 1) </p>
            <p>possibilities to get different products <em>x</em><sub>1</sub> * <em>x</em><sub>2</sub> * &hellip; * <em>x</em><sub><em>k</em></sub>.</p>
            <p>For example, to find the number of divisors for 36, we need to factorize it first: 36 = 2&sup2; * 3&sup2;. Using the formula above, we&rsquo;ll get the divisors amount for 36. It equals to (2 + 1) * (2 + 1) = 3 * 3 = 9. There are 9 divisors for 36: 1, 2, 3, 4, 6, 9, 12, 18 and 36. </p>
            <p>Here's another problem to think about: For a given positive integer <em>n</em> (0 &lt; <em>n</em> &lt; 2<sup>31</sup>) we need to find the number of such <em>m</em> that 1 &le; <em>m</em> &le; <em>n</em>, GCD(<em>m</em>, <em>n</em>) &ne; 1 and GCD(<em>m</em>, <em>n</em>) &ne;<em> m</em>. For example, for <em>n</em> = 6 we have only one such number <em>m</em> = 4. </p>
            <p>The solution is to subtract from <em>n</em> the amount of numbers, coprime with it (its amount equals to &phi;(<em>n</em>)) and the amount of its divisors. But the number 1 simultaneously is coprime with <em>n</em> and is a divisor of <em>n</em>. So to obtain the difference we must add 1. If <em>n</em> = <img src="i/education/prime-eq4.jpg" alt="" /> is a factorization of <em>n</em>, the number <em>n</em> has (<em>a</em><sub>1</sub> + 1) * (<em>a</em><sub>2</sub> + 1) * &hellip; * (<em>a</em><sub><em>k</em></sub> + 1) divisors. So the answer to the problem for a given <em>n</em> equals to </p>
            <p><em>n</em> &ndash; &phi;(<em>n</em>) &ndash; (<em>a</em><sub>1</sub> + 1) * (<em>a</em><sub>2</sub> + 1) * &hellip; * (<em>a</em><sub><em>k</em></sub> + 1) + 1 </p>
            <p><strong> Practice Room:</strong><br />
                Want to put some of these theories into practice? Try out these problems, from the <a href="http://www.topcoder.com/tc?module=ProblemArchive">TopCoder Archive</a>:</p>
            <ul>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=2986&rd=5862"> Refactoring</a> (SRM 216) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=3458&rd=5869"> PrimeAnagrams</a> (SRM 223) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=4481&rd=6538"> DivisibilityCriteria</a> (SRM 239) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=4475&rd=8012"> PrimePolynom</a> (SRM 259) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=6186&rd=9823"> DivisorInc</a> (SRM 302) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=6063&rd=9824"> PrimePalindromic</a> (SRM 303) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=6195&rd=9825"> RugSizes</a> (SRM 304) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=6408&rd=9826"> PowerCollector</a> (SRM 305) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=6083&rd=9987"> PreprimeNumbers</a> (SRM 307) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=2017"> EngineersPrimes</a> (SRM 181) </li>
                <li><a href="http://www.topcoder.com/stat?c=problem_statement&pm=2342"> SquareFree</a> (SRM 190) </li>
            </ul>
            <p>&nbsp; </p>
            <br>
            <br>
        </td>
        <!-- Center Column Ends -->
        <!-- Right Column Begins -->
        <td width="170" id="onRight"><jsp:include page="../public_right.jsp">
            <jsp:param name="level1" value="defaults"/>
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
