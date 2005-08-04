<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Summary</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="summary"/>
   <jsp:param name="tabLev3" value="finals"/>
</jsp:include>

            <img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
            <div class="leadPhoto">
            <span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos">See more photos!</a></p></span>
            <img src="/i/tournament/tccc04/onsite_photos/alg_finals.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">tomek raises his second championship check<br/><br/></span>
            </div>
            
            <h2>Two for tomek, the champ returns</h2>

            <a href="/tc?module=MemberProfile&cr=299177"><img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
            <p>by <a href="/tc?module=MemberProfile&cr=299177">vorthys</a>, <br/>
            <em>TopCoder Member</em><br />
            Friday, April 16, 2004<br/>
            introduction by lbackstrom
            <br/><br/></p>

<p>
The final round started out looking like an upset was in the making.  With a 250, a 500, and a 1200 point problem, competitors were particularly tempted to skip the medium, and try to strike the mother load.  But, the biggest story early on was reid, who submitted his easy problem in 9 minutes, 14 faster than second submitter ZorbaTHut, and before tomek had even compiled.  Finally, after 23 minutes, ZorbaTHut submitted his easy, and 2 minutes later, tomek got his in.  John Dethridge had given up by that point, and moved on to an imposing 1200 point problem.  As the seconds ticked by, reid, tomek and ZorbaTHut all worked hard on the medium problem, while John methodically moved forward on the hard, incrementally testing as he coded.  reid was the first to submit a second problem, getting 263 on the medium.  Over the next ten minutes, tomek's score slowly ticked down, and after about 50 minutes, his potential score on the first two problems was too low to beat reid.  But, he was able to submit fast enough to stay within a single challenge.  At this point, everyone assumed that neither reid nor tomek would have time to finish a 1200 point problem, and only John had a chance to take it away from reid.  With about 10 minutes to spare, John finally finished coding and passed all of the examples.  In the tense minutes that followed, John's score crept ever closer to  reid's, and everyone in the crowd wondered if we would be in time.  With only a couple minutes to spare, John submitted, taking the lead be a narrow margin.<br/><br/>
On to the challenge phase.  With three coders within 50 points, the challenge phase was sure to provide some action.  tomek, in third place at the time, was the most ambitious and worked hard on test cases throughout the intermission.  About ten minutes in to the challenge phase, he went after Zorba's 250, but was unsuccessful.  Though he was clearly debating another challenge, he didn't really have anything to gain from one, so he ended the challenge phase in third, with reid in second, and John in first.  As the system tests rolled out, we first learned that reid's 250 failed, putting him all but out of the running.  As the 500 results came out, reid's went down again, assuring either tomek or John a second win.  John, showing great confidence, yelled out "No way" in the moments before his 1200 point submission was tested, and a big red X appeared where his submission had once stood.  Tomek promptly started jumping up and down, and posed for the cameras.<br/><br/>
Congratulations to John Dethridge, reid, ZorbaTHut and tomek.  All of them did an amazing job to get this far, and they made the final round as exciting as any has ever been.
</p>

<h3>PointClustering</h3>

<p>
This problem was pretty straightforward, but there were definately some ways to solve it that were better than others.  In my opinion, the best solution represents clusters as 64 bit bitmasks.  Associated with each bitmask is the string representation of each cluster.  We initialize a bitmask and string for each point in the input, and then start merging clusters.  There are a lot of tricks you can use at this point to make the distance calculations fast.  However, with only 50 points, most of these aren't neccessary, as most of the time, you'll be comparing relatively small clusters.  One obvious optimization though, which improves your speed a lot, is to compute the pairwise distances between points.  Then, once you find the closest clusters, you need to decide which one to put first.  Using a bitmask representation, this amounts to finding the cluster with a 1 in the least significant place.  A trick you can use to make all this a bit easier is to reverse the input, and then take the largest bitmask.
<br/><br/>
A lot of people worried about timeout on this problem.  But, there are at most 50 merges, and during each merge, none of the 50*50 distances are ever part of more than one potential merge.  Thus, the totaly running time is O(n^3).
</p>

<h3>RecoverWords</h3>

<p>
If you've ever written a recursive-descent parser, then this problem
was probably pretty easy.  You can write one helper function per
word type (noun, verb, etc.), and one more per phrase type
(sentence, noun phrase, predicate).  Each function takes a single word or
a sequence of words and returns a string containing the word or words with
any question marks filled in.  The functions can also return a special
value signifying "no match", and another signifying "multiple matches".
Both of these cases will return "" at the end of the day, but it is
important to distinguish between the two situations at intermediate stages.
</p>

<p>
The function for, say, verbs takes a single word and compares it with
all the words of the right length in the verb list.  If any of them
match all the non-question-mark characters, then we record that word as a possible
match.  If there are no matches, we return the "no match" value, and
if any two possible matches disagree in one or more letters, we return the
"multiple match" value.  Otherwise, we return the unique posible match.
The functions for the other word types work in the same way.  Instead
of using functions, we could also precompute all the single-word matches
ahead of time.  
</p>

<p>
The functions for phrases are a little more complicated.  The function
for, say, predicates, takes a sequence of words, calls the verb
function on the first word and the adverb function on the remaining
words.  If one or more words have no matches, then the whole phrase has
no matches.  Otherwise, if one or more words have multiple matches, then
the whole phrase has multiple matches.  If all the matches are unique,
then we return the sequence of unique matches.
</p>

<p>
The only tricky function is the one for sentences, which tries
all possible partitionings into a noun phrase, a predicate,
an optional preposition, and another noun phrase.  We can easily
generate all possible partitionings with a few nested loops.
</p>

<p>
We could use dynamic programming to avoid calling the noun-phrase
function multiple times on the same sequences of words, but
the sentences were small enough that such optimizations were not
necessary.
</p>

<h3>DataFilter</h3>

<p>
Ok, this problem was hard.  I know tournament problems are supposed to
be harder than regular SRM problems, but...ouch!  This one boils
down to <i>bipartite matching</i>, with some important
tweaks.
</p>

<p>
First, go through the records and combine all the records that have the
same id.  For example, "0252 SRAL" and "0252 99" could be combined into
the single record "0252 SRAL 99".  If two records with the same id have 
different names or different ages, then the data are inconsistent.  
</p>

<p>
Next, delete all records that are subsumed by other records.  For
example, if you have the records "BRETT 014 79", "BRETT 79", "BRETT",
and "79", all but the first can be deleted.  

<p>
Partition the remaining records into seven groups: INA, IN, IA, NA, I, N, 
and A, where the letters in the group names indicate which fields are present 
(id, name, and/or age).  Next, we want to merge the records into the smallest number
of records possible.  For example, we might merge an IN record with an A
record to get an INA record.  In the end, we will return the number
of remaining records as the number of workers.
</p>

<p>
Records in the INA group cannot be merged with any other records, because
if they could, the other records would already have been eliminated.
Therefore, we can simply record the size of the INA group and delete the 
records.  Similarly, for the I, N, and A groups, we only need the sizes of
the groups and not the actual records.
</p>

<p>
Now we come to the bipartite matching.  We can construct a bipartite
graph with all the IN and IA records on one side, and the NA records
on the other side.  There is an edge between an IN record and an NA
record if they share the same name, and between an IA record and
an NA record if they share the same age.  Once we've constructed
the graph, we can apply any of the standard bipartite matching algorithms
to find a maximal matching.  (I won't try to describe those algorithms
here.  Look up "augmenting path" in any handy algorithms reference.)
</p>

<p>
The maximal matching tells us which IN/IA records we want to merge with 
which NA records to minimize the number of records.  Well, it almost
does, anyway.  We may have to tweak the matching slightly, and this
tweaking is the trickiest part of the algorithm.  But let me finish
describing what happens in the rest of the algorithm, and then come
back to the tweaking bit.
</p>

<p>
Next, we're going to merge any remaining records in the following
order:
<ol>
<li> merge N records with unmatched IA records, and A records with unmatched IN records
<li> merge triples of remaining N, A, and I records
<li> merge unmatched NA records with remaining I records
<li> merge remaining N and A records
</ol>
The order here is important.  We want to merge as many records as possible
in each step before proceeding to the next step (except for steps
3 and 4, which can be done in any order).  As a slight simplification,
we don't need to work with the actual records.  It is enough to keep
the size of each category and simply work with those sizes because, for
example, any N record can be merged with any IA record, and similarly
for mergings between the other categories in this list.
</p>

<p>
Now, steps 2 and 4 work with <i>pairs</i> of N and A records.  Therefore,
it is advantageous to exit step 1 with the number of remaining N
and A records as balanced as possible.  This is where the tweaking of
the maximal matching comes in.  Let #N be the number of N records minus
the number of IA records, and let #A be the number of A records minus the
number of IN records.  If #N is more than one bigger than #A, then it
would be worth our while to decrease #N and increase #A.
Similarly, if #A is more than one bigger than #N, then it would be
worth our while to decrease #A and increase #N.
</p>

<p>
To do this, we look for triples of IN, IA, and NA records
such that the names of the IN and NA records match and the ages
of the IA and NA records match.  If the maximal matching currently
assigns the NA record to the IA record, and leaves the IN record
unmatched, then we can decrement #N and increment #A by reassigning
the NA record to the IN record.  In the other direction, 
if the maximal matching
currently assigns the NA record to the IN record, and leaves the IA
record unmatched, then we can decrement #A and increment #N by
reassigning the NA record to the IA record.
</p>

<p>
Remember that this tweaking is happening before step 1 above.  After step
4, we merely count the remaining records and return that as the minimum
number of employees.
</p>

<p>
Whew!  <b>ZorbaTHut</b> quoted Yoda in the Wildcard Round, saying "Do or
do not.  There is no try."  I freely admit that I would have "done not" on
this problem in a competition setting, even if I opened it first and
had the whole 75 minutes!
</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
