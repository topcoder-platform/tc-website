<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

                        <p><font size="4"><strong>Not Round, Not a Table</strong></font><br />
                        Monday, December 22, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=273434"><strong>Eeyore</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
I admit it: I'm an addict. The first thing I do upon staggering out
of bed, mere seconds after rebooting my consciousness and even before
switching on the kettle for tea, is to jack into the web for my morning
fix of information. I scan the international headlines, read up on
Canadian university football if it's in season, and then I hit the Round
Tables. The what? Huh? That was my reaction when someone brought them
to my attention over a year ago. We were chatting over lunch, toying
with a problem that looked like dynamic programming but really wasn't,
when my friend mentioned that a pertinent discussion had taken place in a
Round Table. So it's on the TopCoder website? How nice, I thought. Maybe
I should find out when Round Tables are scheduled. See if I'm allowed
to sign up for one of these affairs.

</p><p>

When I looked into it, I quickly learned that a Round Table isn't an
event held at a specific time for the benefit of a select few. The Round
Tables are open day and night. They're liable to be busy at all hours,
and if they happen not to be busy, you can easily make them so. You don't
have to sign up. Anyone can read the content, and all TopCoder members
are invited to start a new thread or to augment an existing one whenever
they please. If you have something to say about a new programming textbook
or video card, if you think someone might be able to explain just how a
heap is useful in Dijkstra's algorithm, or if you need tips on cleaning
grape soda out of your keyboard, the Round Tables are a good bet. If you
don't know exactly what you're looking for, but you're fond of coding
and enjoy making good conversation with intelligent coders, the Round
Tables are exactly where you want to go. Once you've spent a few hours
browsing the topics, you may, like me, find yourself irremediably hooked.

</p><p>

If "threads" and "browsing" put you in mind of the interactive web
thingamajigs that are generically known as bulletin boards or discussion
forums, it's because that's what the Round Tables are. "Round Tables"
is TopCoder's name for its web-based bulletin board. The content is
publicly accessible and unobtrusively advertised on TopCoder's main page:
look for a modest grey link at far left, in the Competition navigation
menu, sandwiched between Events and Support/FAQs. The Round Table pages
are visually appealing and the threads are more or less logically laid
out. The user interface works pretty much the way you expect it to. The
features that set the Round Tables apart, establishing them as a higher
class of bulletin board, are the singularly talented TopCoder member
base and the endless variety of programming-related subject matter they
are willing to discuss.

</p><p>

Like Greta Garbo, the Round Tables are an attractive institution with a
peculiar name. The historical-mythological echoes are unavoidable but
misleading. In the fifth century AD, at the dawn of the middle ages,
the Romans withdrew their garrisons and abandoned their attempt to
colonize what they called Britannia. This was a land of Celts, today
known as England, that had yet to be settled by the Germanic tribes
of Angles, Jutes, and Saxons. Legend has it that the last great Celtic
king was Arthur Pendragon, who held court at Camelot. In King Arthur's
retinue were many great knights such as Sir Tristram and Sir Launcelot,
who, though noble and invincible, liked to quarrel with one another. In
order to maintain unity in the kingdom, Arthur decreed that his knights
convene periodically in Camelot and sit around a certain table, the one
and only Round Table, to reason out their differences.

</p><p>

The name of the TopCoder bulletin boards, then, rings false in some
respects. These Round Tables are not held at preordained intervals, and
no pedigree is required to join the deliberations. Swordplay is kept to
a minimum. Not a stick of furniture is required. If you like, you can
take part without a stitch of clothing on your back, and no one will
be the wiser. But what wisdom you stand to gain! Clustered around the
Round Tables are some of the swiftest coders and sharpest minds in the
world. From Hangzhou to Waterloo, TopCoder's top coders use this venue
to trade information and opinions, to reach accord or to express colorful
disagreement. Discussion is by no means reserved to the elite. The masses
of middling and aspiring coders are highly valued participants, posing
fruitful questions and making trenchant observations in their own right.

</p><p>

Members often use the Round Tables in ways that supplement TopCoder's
core mission. After the frenzy of a Single Round Match, once the Arena
has gone quiet and everyone has slept on the problems for a night or
two, players gravitate toward the Round Tables to hash over difficulties
encountered during or after the match. "Would someone like to take a stab
at explaining <b>John Dethridge</b>'s Div 1, Level 3 submission?" asked
<b>mckavity</b> in reference to a recent match, and the forbiddingly dense
code was duly dissected by <b>schveiguy</b>. On another occasion, the
latter guy began a thread about Monty's Dilemma by saying, "This issue is
really confusing me." After methodical reasoning from <b>vorthys</b> and
others, he attained a state of enlightened bliss. A thread by <b>Hurd</b>
about a different probability puzzle proved wildly popular, eliciting
exegeses from <b>ChristopherH</b> that made my head spin. Meanwhile,
<b>(Lx.xx)(Lx.xx)</b> pointed out a significant off-by-one error in the
match editorial.

</p><p>

In the aftermath of an older match, when an outcry arose in the Round
Tables over the unexpected results of certain floating-point calculations,
<b>jms137</b> stepped in to identify a bug in the Java compiler. TopCoder
administrators soon responded with a software update. Although pointed
complaints are best directed to management via email, the Round Tables
offer a theater for lamentations of a freewheeling kind. These sometimes
result in prompt, palpable change. When <b>dplass</b> pondered why member
handles weren't clickable in the Round Tables, <b>dok</b> added this
feature in a jiffy. Changes in the calculation of country rankings
were brought about after protracted Round Table discussion involving
members from every hue of the rating spectrum. Administrators have also
initiated threads to request commentary on proposed new features or to
make announcements of a nature not suited to official channels. How
else would we find out the identity of the staff member who appears,
in a photograph published on the website, reclining in a peaceful stupor
after his corn-chip binge in the depths of the TopCoder Open war room?

</p><p>

Some of the most playful and most cerebral Round Table content ensues
from musings on the theoretical ramifications of a match problem. A
master of this art is <b>ChristopherH</b>, who outlined a proof that
an unbounded-integer version of the Unefunge machine featured in SRM
152 is Turing-complete. The problem author, <b>leadhyena_inran</b>,
had earlier committed himself to eating his hat and shoes as the
result of a challenge, boldly issued by him, that <b>gepa</b> managed
to answer. In a different thread, <b>ChristopherH</b> and <b>radeye</b>
had it out over their favorite parsing techniques: which tastes better,
recursive descent or operator precedence? In connection with yet another
match, <b>dgarthur</b> made a splash when he wrote a formal proof using
polynomial expressions to model a circular chain of red and green magic
beetles.

</p><p>

There has lately been a vogue for solving match problems using as
few characters of code as possible. Some have participated avidly
in the one-upmanship, while others have decried it as an exercise in
futility. Whatever one's view of this recreation, there is no denying
that it exemplifies the energy of the TopCoder member base. While hip
journalists and future gurus talk about "smart mobs" as a revolution
in the making, the Round Tables prove that the smarts have already
arrived. Distributed human intelligence is here. Instant collaborative
problem-solving is a reality.

</p><p>

Then again, the Round Tables are just a fun way to share opinions and
information. You can increase the fun by taking part. Yes, you. If
you've never seen the Round Tables, try surfing through them today and
tomorrow. If you've been reading without writing, reluctant to post your
nagging questions for fear of mockery, I urge you to break free of your
inhibitions. Hit the keyboard right now. Make your message concise, try to
spell most of your words correctly, and post away. Many will read what you
have to say.  Some may respond. No one will laugh at you. I won't, anyway.

</p><p>

Even as I write about the attractions of the Round Tables, I am reminded
of interface details that bother me. Some of the thread categories are
difficult to tell apart: what exactly is the difference between Contest
Participation and Contest Discussion, or between Contest Discussion and
Algorithm Discussion? Furthermore, I have found the Search facility
nearly useless in looking up past threads. Yet I can recommend Round
Table participation with a clear conscience because I know that the
TopCoder experience has steadily improved through member feedback. Not
only is TopCoder built on the idea that competitive collaboration makes
for better software, but the organization itself welcomes criticism to
a degree unmatched by any other private enterprise. I have seen ample
evidence that members can directly improve TopCoder by speaking up or
pitching in.

</p><p>

The Round Tables are both a medium for constructive criticism and a
living example of it. Oddly named, sometimes awkward to work with,
they constitute a good idea that will only get better with continued
and increased participation. It may be true that our participation is
a good deal for the company because we voluntarily contribute most
of the content. On the other hand, it's an even better deal for the
members, because we're building an interactive knowledge base for each
other, a free resource without peer. No other site on the web offers a
greater concentration of programming talent. No other bulletin board
lets you talk to so many brilliant coders about so many things that
matter&#151;and many amusing ones that don't&#151;in the theory and
practice of programming. Whether you're a knight or a knave, there's a
seat reserved for you at the Round Tables.

</p>

                        <p><br/></p>

                        <p>Would you like to <a href="/tc?module=Static&d1=features&d2=topics" class="bodyGeneric">write a feature?</a></p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
