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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Working Their Way Up</B></FONT><BR/>
<I>A LooK at Division-II Veterans and Their Dedication to Coding</I><BR/><BR/>
Wednesday, May 8, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/></P>

<P>
Everyone remembers the 1980's don't they?  The big hair, the Members Only jackets, 
the leg warmers, carrying "Boom-boxes" on your shoulder, Molly Ringwald in every movie, and 
those stupid Rubik's Cubes.  The challenge was to try and return the six-sided cube to its original 
form by having all of the like-colored squares on the same side.  These little cubes had the whole 
world, from infants to grandparents, captivated.  While solving the Rubik's Cube provided one with 
a God-like mystique, some who consistently failed grew frustrated and quit, while others just keep 
trying for the fun of it.
</P>

<P><IMG SRC="/i/f/feat_050802_tn1.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
That same pattern seems to happen in TopCoder's Single Round Matches.  Coders like 
<A HREF="/tc?module=MemberProfile&amp;cr=152073" CLASS="bodyGeneric">NDBronson</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A> and 
<A HREF="/tc?module=MemberProfile&amp;cr=114443" CLASS="bodyGeneric">jonmac</A>
 have achieved legendary status per their enormous success.  The three have 
combined to win their respective rooms over 80 times, each has made an appearance in the finals 
of one of TopCoder's three major tournaments, with <B>jonmac</B> and 
<B>dmwright</B> winning one apiece, and there combined winnings are approaching $400,000.  Sure, the most obvious answer to why they do 
so well is that they are very talented and brilliant coders.  However, they also put in their 
time by practicing and perfecting their skills in the twice-weekly Single Round Matches.
</P>

<P>
What about the majority of the coders, though?  The ones who put in just as much time 
practicing and competing, but can't seem to win their rooms consistently to build their 
ratings, and have been mired in Division-II for a considerable time.  Why do they continue
 to compete?  Or simply:
</P>

<P>
<B>What's their motivation?</B>
</P>

<P>
The commonalities to that query were the challenge, the pressure, and a love of coding. 
 "I keep competing because I see myself getting better and learning how to use the more
  advanced features, and on occasion show the skills I was taught and know I have,"
   said <A HREF="/tc?module=MemberProfile&amp;cr=261283" CLASS="bodyGeneric">Fuzzyb18</A>,
    who has competed in 26 matches and has a rating of 668.  "Anything 
   that you can do to improve yourself should keep you motivated until you can do it right."
</P>

<P>
"I just enjoy the stress of writing good code in short time," mentioned 
<A HREF="/tc?module=MemberProfile&amp;cr=156742" CLASS="bodyGeneric">ahmedf</A>, who has a rating of 933 through 36 matches.
</P>

<P>
"It's not really for the rating, but rather its more for the experience," 
added <A HREF="/tc?module=MemberProfile&amp;cr=265216" CLASS="bodyGeneric">darkphantom</A>
 (870 rating in 20 matches).  "I mean I know it would be 
nice to win some money every match, because every college kid needs money, 
and bothering your parents is a hassle.  I'd rather tell them I won $46 last night."
</P>

<P>
So, having a low rating and scarce TopCoder bank account must be frustrating, right?
</P>

<P>
"Yeah, it is frustrating, but from the standpoint that I know I am better; 
yet everyone else around me is just as good if not better, so you take your
 wins with your losses and keep pushing on," continued <B>Fuzzyb18</B>, while <B>ahmedf</B>
  added, "It is!  But then, it's lonely at the top, isn't it?  And then, there's
   always this drive to go up in the rankings if you are low.  Hopefully I will make it some day!"
</P>

<P>
<B>Glastonbury...We Have A Problem</B>
</P>

<P>
The low-rated coders seem to be into TopCoder for all the right reasons, so what's the problem?
</P>

<P><IMG SRC="/i/f/feat_050802_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/>
Well, first off, some of TopCoder's members are distance runners, where 
TopCoder competitions are more conducive to sprinters.
</P>

<P>
"Twenty percent of the time I simply could not do the problem in time," said 
<A HREF="/tc?module=MemberProfile&amp;cr=260502" CLASS="bodyGeneric">vigenere</A>, who has a 771 rating in 21 matches.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=151719" CLASS="bodyGeneric">bitbucket43</A>,
 a veteran of 48 matches with a 951 rating, and edragon 
(23 matches, 714 rating) are more like painters than sketch artists.  
"My TopCoder rating doesn't reflect my knowledge and experience," 
stated <B>bitbucket43</B>.  "Trying to solve three problems in 75 minutes 
doesn't correlate to what I do on a regular basis.  I'm more concerned 
with end-conditions and ensuring the correctness of the solution.  
That approach tends to work against me in competition."
</P>

<P>
"I don't work as well in a quick paced environment," declared <A HREF="/tc?module=MemberProfile&amp;cr=156420" CLASS="bodyGeneric">edragon</A>.  
"I would like to have the entire problem statement analyzed, documented
 and completely understood before I go for it."
</P>

<P>
More often, its just making those stupid little mistakes that you don't 
realize until you've just submitted.  <B>Fuzzyb18</B> summed it up by admitting 
what many mentioned, "A lot of my errors are caused by simple typos, or 
forgetting to put lines of code inside brackets."
</P>

<P>
<B>"Quitters Never Win, And Winners Never Quit"</B>
</P>

<P>
Quit?  Anybody can do that.  Takes no talent.  Takes no guts.  
It's exactly what your opponents hope you will do.
</P>

<P>
After performing at a sub-par level for so long, it must have crossed 
the minds of these coders.  "Quit, what's that?" asked <B>ahmedf</B>, while 
<B>Fuzzyb18</B> added, "Never, why quit, there is no shame in not being the best," 
and <B>vigenere</B> summed it up by declaring, "Quitters never win, and winners never quit."
</P>

<P>
Others have though about it, however. 
</P>

<P>
"Only once," answered <B>bitbucket43</B>.  "After a particularly exasperating 
competition with many challenges to the problem wording and test cases. 
 Since then I've kicked back and let things develop as they will.  Some 
 nights you get burned, other times it works for you."
</P>

<P>
When asked if he ever thought about quitting, 
<B>edragon</B>
 admitted, "A few 
times, but I generally see what I did wrong and I try the next time to do 
it better."  He then jokingly added, "Most nights on TopCoder I seem to 
feel like I should switch my career choice and go into farming."
</P>

<P>
<B>Getting Better</B>
</P>

<P>
There is an adjustment period with almost anything you do.  Some 
people can pick up an activity without explanation and excel, while 
many others just don't grasp concepts as quickly.  Just think about 
all of those athletes who spend a few years in the minor leagues to 
develop their skills for a few years before being called-up to the majors 
and starring, or your first few months of high school or a new job.
</P>

<P>
Who's to say that today's low-rated member might not be tomorrow's 
ultimate "top-coder"?
</P>

<P>
"I feel like competing in TopCoder has made me a better and more 
efficient coder, in that when I code solutions to some of my problems
 in class I'm more careful at catching mistakes before I send it to
  compile, and I have also noticed that my code compiles with fewer errors nowadays," said <B>darkphantom</B>.
</P>

<P>
"I see myself learning new tricks of the trade, new functions, and new 
ways to approach problems," added <B>Fuzzyb18</B>, while <B>edragon</B> mentioned, 
"Im a much faster coder I think and I've definitely learned a lot."
</P>

<P>
<B>Help From Above</B>
</P>

<P>
Coming to TopCoder, Inc. from a collegiate and professional sports 
background was quite a culture shock for me.  I had never heard of 
an algorithm, and to me, Java was coffee, not a programming language.  
What I needed was an education in what a computer programming company 
was all about, and I received that by conversing with my superiors and 
our development team.
</P>

<P>
The great thing about the hour and a half registration period before 
TopCoder Single Round Matches, is that it brings over 600 programmers 
together and gives them the ability to converse with each other, share 
ideas, make recommendations, and most importantly ask for help.
</P>

<P>
<B>darkphantom</B> took full advantage of this recently when he chatted 
with <B>NDBronson</B>, TopCoder's only member to ever go over 3000 rating points.
</P>

<P>
"I asked him how it is that he gets the solutions to all of 
the problems correctly, while it takes me at least 10 to 15 minutes just 
to figure out what the question in Division-I is asking.  He responded by
saying that everybody's brain is wired differently for different reasons. 
 He's right.  Everybody has his or her strengths and weaknesses.  I would
  much rather actually be able to get a solution to the problems then none at all.
</P>

<P>
"Almost every competition night I talk to other coders before or after the
 contest, often people wondering how to improve," said <B>NDBronson</B>.  "I enjoy 
 talking to them, but I'm don't have any magic techniques or silver bullets.  
 I welcome anybody but with the disclaimer that I am not very good at multitasking,
  so I find it difficult to carry on multiple chat conversations simultaneously."
</P>

<P>
"I think that regardless of rating the epiphany of understanding that comes 
with an elegant solution is still
addictive.  Sometimes you get it by yourself and sometimes you get it by looking
 at somebody else's code, but either way it is still a shiny intellectual toy."
</P>

<P>
2002 Sun Microsystems and TopCoder Collegiate Challenge champion <B>dmwright</B> 
admitted that members haven't come to him with questions in the past, but 
he is willing to help out and answer questions.  Just be kind in the near 
future, his thesis is due soon, and "it's getting scary."
</P>

<P>
"I always go through their code to find better ways of doing things," said 
<B>ahmedf</B>, about reviewing the code of Division-I members.  "Just a look at 
their code and you know why they are there!"
</P>

<P>
"I am learning problem processing, the ability to take a process and break 
it down into various smaller pieces," mentioned <B>Fuzzyb18</B>.  "Some of the syntax 
is confusing but the more that is observed, the better I will understand it."
</P>

<P>
<B>"Keep Chugging Along"</B>
</P>

<P>
Sure, maybe you don't want to listen to your parent's advice when it comes 
to dating and they want you to take out the son or daughter of the family 
friend, or clothing, when your mom tries to dress you like "Little Lord 
Fauntleroy", or music, when they think Lawrence Welk is just the coolest,
 but if you're a veteran coder with a low rating just like these members, 
 you might just want to heed their advice.
</P>

<P>
"I go to the Division-I practice rooms and try to work on those problems 
rather than the Division-II problems because I know that if I can get the Division-I problems,
 Division-II should be a breeze," mentioned <B>darkphantom</B>.
</P>

<P>
"Look how the other guy did it, study it, understand it, and add it to your style of coding,"
 recommends <B>vigenere</B>.  "Then it will become your style as well.  Integrate your mind."
</P>

<P>
"Keep chugging along and take pride," proclaims <B>Fuzzyb18</B>.  "Study your own code and find what 
went wrong."
</P>

<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Have an idea for the weekly feature?</A></P>



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
