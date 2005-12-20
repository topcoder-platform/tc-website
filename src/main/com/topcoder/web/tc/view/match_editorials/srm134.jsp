<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505560" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 134</span><br>Saturday, February 8, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                                     <p>
                                                    This problem set had two rather tough problems.  The Division-I Level 1 and Division-II Level 2 problems
                                                    were the same, and had very low success rates.  Division-I coders also had to deal with a very difficult
                                                    Level 3 problem, which only <b>Yarin</b> solved.  No one in Division-I was able to solve all three
                                                    problems except for <b>Yarin</b>, and no one in Division-II was able to solve all three problems
                                                    except for <b>Eeyore</b>.
                                                </p>
                             
<H1> The Problems </H1> 

                                        <font size="+2"><b>Defragment</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505560" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-II, Level 1:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                        <td style="background: #eee;" class="bodyText">250</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">197
                                            /
                                            215
                                            (91.63%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">152
                                            /
                                            197
                                            (77.16%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                        <td style="background: #eee;" class="bodyText">
                                        <b>stigant</b> for
                                                            240.80 points
                                                        </td>
                                        </tr>
                                        </table></blockquote>
                                        <h4>Implementation</h4>
                                        <p>
                                                        The solution to this problem consists of performing the steps of defragmentation as described.
                                                        First, we make sure we have the FAT stored in some sort of mutable array (in C++, <tt>string</tt>
                                                        is already mutable, but in Java you will want to convert the <tt>String</tt> to a <tt>char[]</tt>
                                                        using <tt>toCharArray</tt> or to a <tt>StringBuffer</tt>).
                                                    </p>
                                        <p>
                                                        We then walk the array from the end.  Whenever we encounter a <tt>'C'</tt>, we find the first occurrence
                                                        of the <tt>'.'</tt> character in the string.  If this occurrence is to the left of the <tt>'C'</tt> we just found,
                                                        we swap the two characters and continue.  Otherwise, the FAT is already fully defragmented and we can go ahead
                                                        and return.
                                                    </p>
                                        <p>&#160;</p>
                                        </a><font size="+2"><b>ObjectCounter</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505560" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                        Used as: Division-II, Level 2:
                                        <blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                        <td style="background: #eee;" class="bodyText">500</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">82
                                            /
                                            215
                                            (38.14%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">9
                                            /
                                            82
                                            (10.98%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                        <td style="background: #eee;" class="bodyText">
                                        <b>XooleX</b> for
                                                            406.29 points
                                                        </td>
                                        </tr>
                                        </table></blockquote>
                                        
                                            Used as: Division-I, Level 1:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                        <td style="background: #eee;" class="bodyText">250</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">129
                                            /
                                            148
                                            (87.16%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">43
                                            /
                                            129
                                            (33.33%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                        <td style="background: #eee;" class="bodyText">
                                        <b>Yarin</b> for
                                                            243.30 points
                                                        </td>
                                        </tr>
                                        </table></blockquote>
                                        <h4>Implementation</h4>
                                        <p>
                                                        The easiest way to solve this problem is probably to iterate through all the different combinations.
                                                        For instance, we can have a <tt>for</tt>-loop that tries each number of red cubes from 0 to 25.  Inside
                                                        this <tt>for</tt>-loop we'd have another one that does the same thing for red spheres.  We continue in the
                                                        same fashion for blue cubes and blue spheres.
                                                    </p>
                                        <p>
                                                        For each combination we generate in this manner, we see if it contradicts the information we already know.
                                                        For instance, the total number of shapes must exactly match the total if known.  The total numbers of spheres
                                                        and cubes each must match the given totals (if given).  And if the number of a particular type of object is given,
                                                        then of course it must match the number generated in our combination.
                                                        As soon as we find a valid combination, we can determine the value of the entry in the array that is requested
                                                        and return it.  This is because of the constraint that explicitly specifies that there will be exactly one possible
                                                        combination.
                                                    </p>
                                        <p>
                                                        This problem was used in both Divisions, and in both Divisions the success rate was dismal.  This probably was a
                                                        major factor causing the submission rate for the Division-I Level 3 problem to be so low.
                                                    </p>
                                        <p>&#160;</p>
                                        <font size="+2"><b>StoreDB</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505560" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-II, Level 3:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                        <td style="background: #eee;" class="bodyText">1000</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">57
                                            /
                                            215
                                            (26.51%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">5
                                            /
                                            57
                                            (8.77%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                        <td style="background: #eee;" class="bodyText">
                                        <b>frypan</b> for
                                                            551.22 points
                                                        </td>
                                        </tr>
                                        </table></blockquote>
                                        <h4>Implementation</h4>
                                        <p>
                                                        We need to determine the implicit ordering of brands made by the customer by examining the shopping history.
                                                        We know that in each entry of the history, exactly one brand is marked as bought, and that brand can be considered
                                                        the most preferred brand among all available brands in the history.
                                                    </p>
                                        <p>
                                                        A strict ordering can be represented by the transitive closure of a directed graph.
                                                        A path from one vertex to another indicates that the former vertex is greater than the latter.
                                                        So, as we process the history data, we build a directed graph.
                                                    </p>
                                        <p>
                                                        Initially this graph should be empty.  We iterate through the entries of the history array.
                                                        For each entry, we locate the <tt>'$'</tt> character.  We then iterate through the brands in that entry.
                                                        For each occurrence of the <tt>'.'</tt> character, we add an edge from the brand that was bought to the
                                                        brand that was available.
                                                    </p>
                                        <p>
                                                        Once this graph is built, we should generate the transitive closure of the graph.  The transitive closure is just the set
                                                        of all paths in the graph.  That is, for each pair of vertices in the graph there is a boolean value representing the
                                                        presence of a path from one to the other.  A very simple algorithm for generating this is Warshall's algorithm.
                                                    </p>
                                        <p>
                                                        Assume that the graph is available as an adjacency matrix named <tt>adj</tt> (e.g., if <tt>adj[i][j]</tt> is <tt>true</tt>,
                                                        then an edge directly connects vertex <tt>i</tt> to vertex <tt>j</tt>).  We will populate the transitive closure matrix
                                                        of the same dimensions and type, named <tt>paths</tt>.
                                                    </p>
                                        <pre>
                                        for(int i = 0; i &lt; n; i++) {
                                            for(int j = 0; j &lt; n; j++) {
                                                paths[i][j] = adj[i][j];
                                            }
                                        }
                                        for(int i = 0; i &lt; n; i++) {
                                            for(int j = 0; j &lt; n; j++) {
                                                if(path[i][j]) {
                                                    for(int k = 0; k &lt; n; k++) {
                                                        if(path[j][k]) {
                                                            path[i][k] = true;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                                    </pre>
                                        <p>
                                                        This algorithm is very similar to Floyd's algorithm for finding all of the shortest paths in a graph.
                                                        Now, once we have this data, we need to examine the current available brands to find the available brand that is more
                                                        preferred than any other available brand.  Just iterate through the available brand array.  For each occurrence of
                                                        <tt>'.'</tt>, we check to see if it's the maximum available brand.  We iterate through the available brand array again,
                                                        and for each <tt>'.'</tt> we check our transitive closure matrix to see if there is a path from the latter to the former.
                                                        If there is, we can simply repeat this process with the latter brand (or we could do it the slow and easy way and just
                                                        continue iterating through the brands in the same way).  Whenever we encounter a brand that is not known to be preferred
                                                        less than any other available brand, we add it to the return array.
                                                    </p>
                                        <p>&#160;</p>
                                        <font size="+2"><b>QuickCount</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505560" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-I, Level 2:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                        <td style="background: #eee;" class="bodyText">500</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">83
                                            /
                                            148
                                            (56.08%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">41
                                            /
                                            83
                                            (49.4%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                        <td style="background: #eee;" class="bodyText">
                                        <b>bmerry</b> for
                                                            483.83 points
                                                        </td>
                                        </tr>
                                        </table></blockquote>
                                        <h4>Implementation</h4>
                                        <p>
                                                        The first step is to modify the lower and upper bounds so that they are both divisible by
                                                        the base in which we are counting.  We do this by increment the lower bound by 1 repeatedly
                                                        until <tt>lower % base == 0</tt>.  Whenever <tt>lower % base != 0</tt>, we increment the number
                                                        of times we count <tt>lower % base</tt> by 1.  We do exactly the same with the upper bound,
                                                        except that we decrement the upper bound until <tt>upper % base == 0</tt>.
                                                    </p>
                                        <p>
                                                        Now we can find the rest of the answer inductively.  We simply chop off a trailing zero
                                                        from the upper and lower bounds.  The difference between these two new bounds will then
                                                        be the number of times that each digit should be counted.  We then go back to our first
                                                        step above using these new bounds.
                                                    </p>
                                        <p>
                                                        We repeat this process for as long as the lower bound is less than the upper bound.
                                                        Once we get to this point we have our answer.
                                                    </p>
                                        <p>&#160;</p>
                                        <a name="ExpertSystem"></a><font size="+2"><b>ExpertSystem</b></font><br/>
                                            Used as: Division-I, Level 3:
                                            <blockquote><table cellspacing="2">
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                        <td style="background: #eee;" class="bodyText">1000</td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">4
                                            /
                                            148
                                            (2.7%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                        <td style="background: #eee;" class="bodyText">1
                                            /
                                            4
                                            (25%)
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                        <td style="background: #eee;" class="bodyText">
                                        <b>Yarin</b> for
                                                            455.18 points
                                                        </td>
                                        </tr>
                                        </table></blockquote>
                                        <h4>Implementation</h4>
                                        <p>
                                                        This probably basically stumped most of Division-I.  The only person to successfully solve it
                                                        was <b>Yarin</b>, and so this explanation will be based on his particular implementation.
                                                    </p>
                                        <p>
                                                        For any pair of terms, there are certain states that the relation between the first and second can be in.
                                                        The relation could be less than, greater than, equal, or unequal.  For instance, for the statement &quot;a &lt;= b&quot;
                                                        the relation is either less than or equal.  We will have a table of relations between terms, in which we will
                                                        eliminate possible states that each relation can be in.  Initially we have no data, and every state is possible.
                                                        We will represent combinations of states as integers, where each of the first four bits represent the states listed
                                                        above.  Thus a value of 15 will represent the combination of all four states, and will mean &quot;UNKNOWN.&quot;
                                                    </p>
                                        <p>
                                                        After we declare and initialize an array that can hold the state of relations between all possible pairs of
                                                        terms (including space for any numeric literals we encounter), we begin processing the input.
                                                        For each input rule we parse all the terms and relations.  For each term encountered, we will gain knowledge
                                                        of the relation between it and each of the terms that follow it in that rule.  We will store that knowledge
                                                        by performing a bitwise <i>and</i> on the set of possible states of each relation with the set of states represented
                                                        by that relation.  For instance, &quot;&lt;=&quot; represents <tt>LESS_THAN | EQUAL</tt>, while &quot;!=&quot; represents
                                                        <tt>LESS_THAN | GREATER_THAN | UNEQUAL</tt>.  We will treat numeric values just the same as variables at this
                                                        point.
                                                    </p>
                                        <p>
                                                        Next we do some special processing of numeric terms.  We have <i>a priori</i> knowledge of the relation between
                                                        each pair of numeric terms.  So we iterate through our terms, finding all numeric ones, and then iterate through
                                                        all pairs of numeric terms.  For each pair, we will set the relation between the two to either
                                                        <tt>LESS_THAN | UNEQUAL</tt>, <tt>GREATER_THAN | UNEQUAL</tt>, or <tt>EQUAL</tt>, as appropriate.
                                                        We also must populate the matrix with <tt>EQUAL</tt> for the relation between identical terms
                                                        (e.g. <tt>rel[i][i] = EQUAL</tt> for all terms <tt>i</tt>).
                                                    </p>
                                        <p>
                                                        Next begins the process of making all the inferences we can possibly make.  We can do this in a loop,
                                                        iterating through all pairs and then all triples of terms.  For each pair, we can see if we can infer anything
                                                        reflexive.  E.g., if we know that <tt>x</tt> may be less than <tt>y</tt>, then we know that <tt>y</tt> may not be less than
                                                        <tt>x</tt>.  Also, for each pair, if one is greater than or equal to the other and less than or equal to the other,
                                                        then we know the relation between the two cannot be unequal.  If one is not greater than the other, then the other
                                                        cannot be less than the former.  For each triple, we can see if there's a relation we can infer between the first
                                                        and last term due to the existence of a relation between the first and second and a relation between the second
                                                        and third.  For instance, if x is less than y and y is less than z, then we know that x cannot be greater than z.
                                                        Note how each of these inferences only involves generating negatives.
                                                        There
                                                        are 13 inferences that <b>Yarin</b> attempts to make in his solution, which can be assumed to be exhaustive.
                                                    </p>
                                        <p>
                                                        We repeat this loop for as long as we are able to generate an inference.  When we can no longer generate inferences,
                                                        then the knowledge we currently have is as specific as it can get.  First we check to see if there are any contradictions
                                                        in our knowledge, which are indicated by there being no possible states for a relation between any pair of terms.
                                                        If there are no contradictions, we can then look at the possible states for the relation between the requested terms.
                                                        If all the states are possible, then the answer is <tt>&quot;UNKNOWN&quot;</tt>.  Otherwise the states should be one of the
                                                        following:
                                                    </p>
                                        <table>
                                                        <tr>
                                                            <th>State</th>
                                                            <th>Relation</th>
                                                        </tr>
                                                        <tr>
                                                            <td><tt>LESS_THAN | UNEQUAL</tt></td>
                                                            <td><tt>&lt;</tt></td>
                                                        </tr>
                                                        <tr>
                                                            <td><tt>GREATER_THAN | UNEQUAL</tt></td>
                                                            <td><tt>&gt;</tt></td>
                                                        </tr>
                                                        <tr>
                                                            <td><tt>EQUAL</tt></td>
                                                            <td><tt>=</tt></td>
                                                        </tr>
                                                        <tr>
                                                            <td><tt>LESS_THAN | GREATER_THAN | UNEQUAL</tt></td>
                                                            <td><tt>!=</tt></td>
                                                        </tr>
                                                        <tr>
                                                            <td><tt>LESS_THAN | EQUAL | UNEQUAL</tt></td>
                                                            <td><tt>&lt;=</tt></td>
                                                        </tr>
                                                        <tr>
                                                            <td><tt>GREATER_THAN | EQUAL | UNEQUAL</tt></td>
                                                            <td><tt>&gt;=</tt></td>
                                                        </tr>
                                                    </table>
                                        <p>
                                                        These are basically taken directly from <b>Yarin</b>'s solution.  If anything about this description
                                                        does not make sense, examine <b>Yarin</b>'s code and you should be able to figure it out.
                                                    </p>
<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
