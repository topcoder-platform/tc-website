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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>It's Sink or Swim During the Challenge Phase</B></FONT><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/><BR/> -->
Monday, December 9, 2002<BR/>
By&#160;KaiEl,<I>TopCoder Member</I><BR/>
</P>

<P>
The Challenge Phase throws off a lot of newcomers to the TopCoder competition arena. While 
the Coding and System Testing phases replicate real world situations that most coders are 
familiar with, debugging someone else's code in the Challenge Phase is a task that may be unfamiliar to many new coders. 
</P>

<P>
By making you look at other people's code and evaluate the best way to break it, the 
Challenge Phase forces you to flex your brain in new and different ways from normal coding. 
Some coders just don't have a knack for challenges, and they rely on quick, accurate coding 
to get them through the contest. Others, however, are masters of finding those little bugs in 
a person's code that invalidate their entire solution and make their 75 minutes of hard work meaningless. 
</P>

<P>
These coders make up TopCoder's list of the <A HREF="/stat?c=best_challengers" CLASS="bodyText">25 best challengers</A>. 
I talked with two coders on this list -- and one who is almost on it -- about what the 
Challenge Phase means to them, their memories of challenges past, and how they got to be so good at breaking people's code.
</P>

<P>
<B>Pablo Gilberto</B>
</P>

<P>
With 77 challenges and an 85.77% challenge success rate, <B>Pablo Gilberto</B> is the king of the 
Challenge Phase. When asked about it, though, he humbly admits that he's "pretty lucky" 
when it comes to making challenges that are "pretty accurate for the most part." 
</P>

<P>
"For people like me who usually can't solve the crazy 1000-point problems, it's pretty 
important," the 2361-rated coder said of the value of the Challenge Phase. "I'd probably 
be ranked much worse without challenges.  In the same way that Slash [from Guns n' Roses] 
makes up for his relative lack of technical ability with his great sense of melody, I make 
up for my lack of coding ability with my challenges."
</P>

<P>
Indeed, <B>Pablo Gilberto</B>'s knack for challenges has been rather costly for some other coders. 
In the Finals of the 2001 TopCoder Invitational, <B>Pablo Gilberto</B> made a challenge 
that ended up changing the entire outcome of the contest (<A HREF="/stat?c=coder_room_stats&amp;cr=112438&amp;rd=57&amp;rm=57" CLASS="bodyText">see room stats</A>). 
</P>

<P>
"I challenged <B>dmwright</B>'s 250 pointer on an error that the system tests wouldn't have caught," 
he remembers. "Then <B>jonmac</B> challenged <B>NDBronson</B>'s 1000-pointer, giving him the lead over 
<B>dmwright</B> (and $100,000)." Even though <B>Pablo Gilberto</B>'s challenge didn't change his fourth 
place finish in the match, it still ended up costing <B>dmwright</B> $50,000 and giving <B>jonmac</B> 
the prestige of the championship.
</P>

<P>
<B><B>dmwright</B></B>
</P>

<P>
Not surprisingly, <B>dmwright</B>'s biggest Challenge Phase memory also has to do with the 2001 
TopCoder Invitational Finals. "It turns out that, if [<B>Pablo Gilberto</B>] had not seen the bug 
in my code, I would have won the $100,000, and if <B>jonmac</B> had not figured that <B>NDBronson</B>'s 
code would time out... and not challenged him, then <B>NDBronson</B> would have won. So any of three 
of us could have won, with the winner determined by the Challenge Phase."
</P>

<P>
As the second-best challenger on TopCoder's quick stats page, <B>dmwright</B>'s 85.23% challenge 
success ratio gives <B>Pablo Gilberto</B>'s a run for its money. But the 2742-rated coder doesn't 
place quite as much importance on challenging as <B>Pablo Gilberto</B> does. "I think it's fairly 
important - both to be able to challenge well, and to be aware that other people will be 
challenging your code," he said. "I personally would probably be ranked slightly worse without it."
</P>

<P>
<B>dmwright</B>, who tries to challenge a little less than once per match, says that his challenge 
rate largely depends on who is in the room with him. "For the later rounds of a tournament, 
where all competitors are very highly ranked, there are less bugs and I challenge less," 
he said. "For a Single Round Match with the current seeding, I challenge more."
</P>

<P>
<B><B>John Dethridge</B></B>
</P>

<P>
As the winner of the 2002 TopCoder Invitational, it's a little surprising that <B>John Dethridge</B> 
does not appear on TopCoder's 25 best challengers list. Chalk it up to a highly cautious 
challenge style. "I would be fourth in challenge success, but I've only done 17 challenges 
and you need 20 to be on the list," he explains.
</P>

<P>
Still, the 82.35% challenge success rate for this 3255-rated coder would put him fourth 
overall on the list, if he could just manage to get in his challenges more quickly. "I 
do have a pretty slow rate of challenging though," he said. "I rarely find them first, 
so it's fair to say I'm not one of the top challengers."
</P>

<P>
But John was not always such a master of the Challenge Phase. "In my first match I made 
a silly mistake, " he recalled. "I challenged someone's code, and it was wrong, but it 
happened to get the right answer on the test case I challenged it with, even though it got it in completely the wrong way."
</P>

<P>
Like <B>dmwright</B> the year before, <B>John Dethridge</B> was also uniquely affected by the challenge
 phase during his appearance at the 2002 TopCoder Invitational Finals 
 (<A HREF="/stat?c=coder_room_stats&amp;cr=270505&amp;rd=4375&amp;rm=117186" CLASS="bodyText">see room stats</A>). But 
 unlike <B>dmwright</B>, <B>John Dethridge</B> used the Challenge Phase to push himself into the winner's circle. 
 "There were two challenges that could be made, and me and SnapDragon got one each... but if he'd 
 gotten both of them, he would have won," he said. "I won by 50.6 points or something...  if 
 [SnapDragon] had got that challenge and not me, I would have lost by 49.4."
</P>

<P>
<B>Strategy</B>
</P>

<P>
So how do these masters of the Challenge Phase go about squeezing 50 points out of other 
coders' mistakes? The answers were remarkably consistent: Look for the common errors.
</P>

<P>
 "[The] main things I look for are bugs that I encountered in my own code when solving 
 the same problems," <B>Pablo Gilberto</B> said, adding that "out-of-bounds errors, typos, and 
 other simple mistakes," are some of the most common problems.
</P>

<P>
<B>John Dethridge</B> said that he also looks for easy-to-miss errors during the Challenge Phase, 
things "like boundary conditions, getting tables right, handling overflow, that sort of thing," he said.
</P>

<P>
What about the question of who to challenge first? <B>Pablo Gilberto</B> says he doesn't have any 
specific strategy to determine who to go after first in the Challenge Phase. "I think I just
 look at everybody's code in no particular order," he said.
</P>

<P>
<B>dmwright</B>, on the other hand, goes after "people who compile and submit without testing much.
 Otherwise it depends which problem I think is more prone to bugs. I'll often think of a
  possible bug in the coding phase, and then look for it in the Challenge Phase."
</P>

<P>
<B>Pablo Gilberto</B> also had some more general advice for how to succeed in the Challenge Phase. 
"I think the best thing to do is anticipate certain types of errors during the coding phase 
(or intermission)," he said. "That way, you have something concrete to look for during the 
Challenge Phase.  Otherwise, you might just be looking aimlessly for nothing in particular.  
And that's cool too.... that also works."
</P>

<P>
<B>Challenge 'em all!</B>
</P>

<P>
<B>John Dethridge</B> and <B>b0b0b0b</B> remembered an interesting strategy used by <B>ambrose</B> in SRM118 that 
netted him 300 points in eight challenges of the SpaceDrone problem 
(<A HREF="/stat?c=coder_room_stats&amp;cr=153505&amp;rd=4350&amp;rm=117084" CLASS="bodyText">see room stats</A>). According to 
<B>John Dethridge</B>, <B>ambrose</B> "challenged people when he thought their code looked like it was too long-winded
 to possibly be right," with an input that <B>b0b0b0b</B> described as "a really long kind of random input." 
</P>

<P>
"People who had large tables or something, instead of a more elegant solution... he assumed 
that they would have made a mistake somewhere," <B>John Dethridge</B> explained, "so he submitted a 
long challenge case that should cover everything." While these challenges didn't affect 
<B>ambrose</B>'s second place room finish in the match, the points from these challenges helped 
him turn a potential ratings point loss (due to a failed Level 3 problem) into a modest gain.
</P>

<P>
<B>Learning from others' mistakes</B>
</P>

<P>
In addition to the obvious competitive edge that the Challenge Phase gives them, 
the top challengers were also quick to point out the educational value of the Challenge Phase.
 "I think the Challenge Phase is important because then people really get a chance to look at 
 other people's code in a serious environment," said Yarin, another top-25 challenger. 
 "There are subtle tricks you learn, how you could have solved something a bit smarter."
</P>

<P>
<B>dmwright</B> agrees. "There is a certain set of "TopCoder tricks" that everyone seems to 
know and use now," he said. "One person figures out a neat way to code something, and 
soon everyone's doing it because they saw it done in the Challenge Phase. One example 
is to get a string representation of an int in Java, most people use (""+a), which is a 
very inefficient way to do it, but is quick code."
</P>

<P>
<B>Pablo Gilberto</B> finds a different sort of educational value in the Challenge Phase. 
"Reading cryptic, messy, non-descriptive code inspires you to write your own code more
 clearly in real life," he said. "You probably learn more from the code you can easily 
 challenge because even though the logic might be flawed, the intentions are clear, and that's always important."
</P>

<P>
<B>Shortcomings</B>
</P>

<P>
Despite their widespread Challenge Phase success, even the best challengers aren't 
perfect. "My biggest shortcoming is that I can't read most of the short cryptic code 
that some people tend to write," <B>Pablo Gilberto</B> admits. <B>dmwright</B> said that he's "too 
slow -- I spend too much time trying to understand every last detail of the code."
</P>

<P>
But these competitors obviously don't let these shortcomings stop them from utilizing 
the Challenge Phase to its fullest extent, a strategy that <B>Pablo Gilberto</B> recommends to
 all coders. "People are too conservative," he said. "There's a lot of code that goes 
 unchallenged.  To quote Viv Woman by Steve Vai, 'Just go for it!'"
</P>



<IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=264761" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="/tc?module=Static&d1=features&d2=topics" CLASS="bodyGeneric">Would you like to write a feature?</A></P>



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
