<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Component Final Round</title>

<jsp:include page="../../../script.jsp" />

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
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

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="component"/>
   <jsp:param name="selectedTab" value="component_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

            <p class="terciary">
                Summary&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=comp_final_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=slide_show">&gt; Slide Show</a>
            </p>
            
            <div class="leadPhoto">
            <img src="/i/tournament/tco03/comp_final/summary_des.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">Pops, $10,000 richer and lovin' it<br/><br/></span>
            </div>
            
            <h2>Pops is tops!</h2>

            <p>by <A href="/stat?c=member_profile&amp;cr=296145">srowen</A>, <em>TopCoder Member</em><br />
            Friday, December 5, 2003</p> 

<p>TCO COMPONENT DESIGN FINALS</p>

<p>An elegant and competent design netted Pops victory today in TopCoder 
Software's first software design tournament. In a long competition that 
ended in an intense onsite finish, his design narrowly edged out a 
capable design from kyky in the eyes of three reviewers (Ken_Vogel, 
valeriy and myself, srowen), by a score of 92.24 to 86.65.</p>

<p>Pops (Tim Roberts) will return home to North Carolina tomorrow with 
first prize and a $10,000 check. Asked where the money would go, he 
just said "the kids." Pops praised the competition: "It's nice to be 
able to measure yourself against other people." kyky (Sergey 
Kalinichenko), of California, takes away a cool $5,000, though he 
expressed disappointment with the outcome, feeling that some of his 
submission's strengths had been overlooked. "It's not good how the 
review process looks for specific things," said kyky. But he says it's 
a good first event and is having fun.</p>


<p>THE ROAD TO THE FINALS</p>

<p>The road to this day was long. Pops and kyky navigated through three 
online tournament rounds, submitting seven designs between the two of 
them -- about 100 hours of software design work in total. Pops entered 
the final round as the #1 seed, and the favorite to win, with a score 
of 93.92 out of 100 in round 2; kyky followed as the #2 seed with a 
score of 81.42.</p>

<p>The reviewers -- myself, Ken_Vogel and valeriy -- received and reviewed 
submissions about two weeks before the onsite event. Aware of the 
amount of money riding on this competition, we considered and 
re-considered both designs' proposed approach, and scrutinized the 
supporting documentation. This was necessary, as both designs were 
well-considered and carefully documented, and it was difficult to find 
fault with either one.</p>


<p>THE BATTLEGROUND: ASPECT-ORIENTED PROGRAMMING FACTORY</p>

<p>Both competitors submitted a complete Java design for the Aspect-Oriented 
Programming Factory component, including class, use case and 
sequence diagrams in UML, and a written component specification. 
Aspect-oriented programming (AOP) is an intriguing programming paradigm 
that tries to cleanly encapsulate cross-cutting "aspects" a software 
program (e.g. logging, monitoring), which are typically difficult to 
encapsulate cleanly in object-oriented languages like Java. This 
component may be considered an "AOP lite" package for Java which 
provides basic AOP-like functionality.</p>

<p>In short, this component can decorate Java objects with aspects -- 
actions that are triggered whenever a method of that object is called. 
For example, one might add a logging aspect to an object that would log 
information about every method called on that object.</p>

<p>There are two basic approaches to this component, one basic on dynamicv 
proxy classes (see java.lang.reflect.Proxy), and another that 
constructs byte code at runtime.</p>

<p>One can use the Proxy class to create objects that intercept and act on 
method calls to another given object. This is simple and flexible, but 
by Proxy's nature, this approach can only act on calls to public 
methods that are defined in an interface which the underlying object 
implements.</p>

<p>The other approach is significantly more complex and possibly 
problematic -- at runtime, create and load the byte code for a new 
"decorator" class for a given class, one which invokes aspects and also 
calls the original object's method. This approach is somewhat more 
powerful, as it could act on any public instance method.</p>


<p>AN ANALYSIS OF THE SUBMISSIONS</p>

<p>The requirements for this component are, in brief:</p>

<ul>
<li>Support adding aspects to objects</li>
<li>Support multiple aspects per object</li>
<li>Support user-defined aspects</li>
<li>Design a logging aspect (using TCS's Logging component)</li>
<li>Design a timer aspect (using TCS's Timer component)</li>
</ul>

<p>So, competitors were given enough freedom to pursue either approach. 
Both designs focused on the Proxy-based approach, however. It was clear 
from prior discussions in the component forums that both competitors 
had a good grasp of the component requirements and how to satisfy them. 
So, this competition was won on quality of execution.</p>

<p>In my view, Pops's design was satisfyingly straightforward. It 
consistently used object-oriented design principles sensibly. The 
documentation was superb. Ken_Vogel noted that the clean design served 
him well in the final round -- the required new functionality fit 
naturally into his work. kyky's design had a bit more functionality; 
for example, it supported adding aspects at the class level instead of 
instance level. The UML diagrams were easy to parse visually, and it 
also gave attention to performance optimizations.</p>

<p>Both were fine submissions, and the scores reflected this. valeriy did 
have a specific comment about the design choices: he did not like the 
decision to make aspect objects mutable, in both designs, but did like 
them overall. Ken_Vogel said that either of these submissions would win 
in a usual TopCoder component project; both are of the quality that he 
typically sees in winning designs.</p>


<p>ON-SITE: APPEALS, A NEW REQUIREMENT, FINAL REVIEW</p>

<p>The competition climaxed this morning in the on-site phase of this 
final round. 8:00 a.m. in the tournament room found both competitors 
settled into the competition booths, with access to reviews of their 
submissions for the first time. And, both had until 12:00 noon to 
appeal comments in the reviews in a live chat with all three reviewers, 
and also complete design changes to support a new design requirement.</p>

<p>kyky came into the final round with an initial score of 86.87 on his 
submission, behind Pops's score of 92.63 -- pretty close.</p>

<p>By 8:30 a.m. the chat room was busy. Both competitors defended their 
submissions against almost every review item. "Everyone was looking for 
points of course," said project manager Marc Grzeskowiak, commenting on 
the level of competitiveness. Competitors and reviewers resolved all 
issues promptly, though that didn't stop Pops and Ken_Vogel from 
arguing one point for the better part of an hour, after the portion 
relevant to the contest had been settled -- that's intensity!</p>

<p>By 10:30 a.m. the chat fell silent. Both competitors had apparently 
finished dealing with review items and had turned to the new 
requirement:</p>

<p>* Query the component for a list of all decorated objects, and query 
those objects' given aspects.</p>

<p>Both were under pressure to fit this new functionality cleanly into a 
carefully constructed design. Again, the new functionality was 
straightforward, and this was a matter of producing a good design and 
documentation under unusual time pressure. In this close contest, a 
slightly cleaner design, or slightly clearer documentation could be the 
difference between first and second place.</p>

<p>Just before 12:00 noon, both competitors submitted their final work and 
stepped away from the computers. Both submitted similar changes to 
their designs, and were admirable efforts. The reviewers spent the next 
three hours re-reviewing the two submissions and adjusting scores. kyky 
closed the score gap slightly with excellent work on the new 
requirement, but Pops's lead was too large to overcome in this final 
round and the reviewers unanimously named him the winner.</p>

<p>Congratulations are due to both worthy competitors!</p>
            
            <a name="dev"> </a>

            <div class="leadPhoto">
            <img src="/i/tournament/tco03/comp_final/summary_dev.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">rnielsen beat the odds.<br/><br/></span>
            </div>
            
            <h2>rnielsen crowned development champ</h2>

            <p>by <A href="/stat?c=member_profile&amp;cr=296145">srowen</A>, <em>TopCoder Member</em><br />
            Friday, December 5, 2003</p> 

<p>TCO COMPONENT DEVELOPMENT FINALS</p>

<p>Today, rnielsen came out on top in the first TopCoder Software software 
development tournament, in what proved to be a treacherous contest. His 
development solution scored 88.70 in the final onsite round, besting a 
competing submission from aksonov, which scored 66.06 due to a single, 
surprising issue.</p>

<p>rnielsen (Rob Nielsen) gets the thrill of victory and $10,000 to keep 
him company on the long trip back to Australia. "It's a good contest" 
he said. Regarding his performance on-site today, rnielsen said that 
his submission was in pretty good shape coming into the contest. "If I 
had had bigger problems, it would have been much harder." And aksonov 
(Pavlo Aksonov) will return to the Ukraine with a $5,000 check and 
congratulations on a job well done. "I am disappointed ... not sure 
what happened with my submission, but it was hanging," says aksonov, 
"but this is a great, exciting event."</p>


<p>THE ROAD TO THE FINALS</p>

<p>aksonov and rnielsen arrived here after persevering through months of 
competition in the preceding rounds -- each submitted five development 
submissions before today. Impressively, aksonov placed first in the 
second round of *both* the design and development tournaments. Per 
contest rules, he advanced to compete in the development finals, 
emerging as the slight favorite in the finals with a second round score 
of 95.68. rnielsen however was close behind after the second round with 
a score of 93.89.</p>

<p>BryanChen, lkw and mishagam reviewed the submissions and began 
preparing test cases almost two weeks in advance of today's final 
round. This was a challenging component to test, given its distributed 
nature and the complexity of the design, said mishagam.</p>


<p>THE BATTLEGROUND: DISTRIBUTED SIMPLE CACHE</p>

<p>Both competitors implemented the design for the Distributed Simple 
Cache component. This is an ambitious design that extends TopCoder's 
Simple Cache component across multiple servers, and keeps them 
synchronized. Its structure and protocol are undeniably complex, 
accounting for multiple servers, failures, and so on. aksonov and 
rnielsen submitted source code, unit tests, and supporting 
documentation for their development solution.</p>

<p>There was an additional challenge here: Distributed Simple Cache's 
designer was unavailable during the development of this component. I 
was asked to step in and moderate the design discussions in his place. 
As issues were identified we came to an agreement on how to tweak the 
design in a sensible way.</p>

<p>Ideally a design is so complete that it needs no clarification or 
change, but this never happens in practice. So, the situation lent this 
competition a distinctly real-world aspect: designs invariably change 
during development, and developers sometimes have limited access to the 
designer.</p>

<p>Both competitors demonstrated here that they can develop software 
effectively "in the trenches," and produced admirable work here.</p>


<p>AN ANALYSIS OF THE SUBMISSIONS</p>

<p>Requirements of Distributed Simple Cache are relatively easy to state:</p>

<ul>
<li>* Coordinate updates between several caches on different hosts</li>
<li>* Address issues of server failure, concurrent updates</li>
</ul>

<p>This is easier said than done, both to design and develop.</p>

<p>Reviewers found both submissions good in terms of code quality and 
meeting requirements. The key challenges in this development effort 
were managing interaction between threads, and also dealing with server 
failure cases. In fact, thread management became the defining aspect of 
the on-site competition, so without further ado let's move on today's 
events.</p>


<p>ON-SITE: APPEALS, A NEW REQUIREMENT, FINAL REVIEW</p>

<p>The initial scores for both submissions were extremely close as the 
final round started, at 8:00 a.m., with aksonov at 85.31 and rnielsen 
at 84.71 -- it was all but tied. In the next four hours, both would 
have a chance to read their reviews for the first time, appeal review 
items, polish their work, and implement support for a new requirement.</p>

<p>While both competitors started asking questions shortly after the 8:00 
a.m. start time, the live chat with reviewers was fairly light during 
the whole competition. There were some small questions, quickly 
resolved, some discussion about required changes to Thread management 
in one submission, and several clarifications about the new 
requirement:</p>

<p>* Use TopCoder Software's Timer component to time execution of the 
cache's get and put functionality</p>

<p>The challenge here was to quickly understand, configure and use a new 
component -- the actual code needed to meet this requirement is simple. 
Both competitors questioned whether they had understood the new 
requirement during the chat, as they seemed to find it no problem, so 
evidently neither had trouble with the Timer component. Both focused 
time instead on tweaking development solutions.</p>

<p>aksonov and rnielsen submitted before noon and took a much-needed break 
from the keyboard. Shortly thereafter, behind closed doors, reviewers 
took over and put both submissions to the test, where it quickly got 
interesting.</p>

<p>Reviewers ran into many test failures in aksonov's submission -- during 
several test cases, including some of those supplied with his 
submission, the component appeared to hang, while rnielsen's submission 
passed the same test cases.</p>

<p>Reviewers examined the unit test output log file submitted with the 
code, and found it empty -- possibly aksonov was also not able to get 
the tests to complete? Did aksonov fall victim to a last-minute, 
untested change? This is a very real risk in a timed development 
competition like this, just as it is in the coding competition.</p>

<p>Reviewers worked past the scheduled review completion time to examine 
this issue, and even recruited the design reviewers as a second set of 
eyes. Ken_Vogel and mishagam led the investigation, and Ken came close 
to pinpointing the issue -- subtle threading issues when the component 
is shut down. But, reviewers could not identify the issue conclusively 
in the time available today. All agreed that the unit tests had indeed 
found a problem.</p>

<p>Both competitors put forth a great effort, but rnielsen prevailed in 
this tough development round with a solid submission that survived the 
pitfalls of this development project. BryanChen praised his 
submission's code, saying that it was clean and flowed well. Good code 
helped rnielsen hold his submission together today and emerge the 
winner.</p>

<p>The competition was much closer than the final score would suggest, and 
both deserve congratulations for demonstrating broad development skill 
and ability to deal with changes and pressure in a software project!</p>

            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
