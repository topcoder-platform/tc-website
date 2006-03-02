<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

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
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

<jsp:include page="links_summary.jsp" />

<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Feature Story</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_feat_photo.jpg" ALT="" WIDTH="200" HEIGHT="435" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>A Matter of Time</B></FONT><BR/>
<I>dmwright Began Journey To Title At Age Six</I><BR/><BR/>
Wednesday, April 24, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/> -->
<P>
A pump of his fists, a loud hand clap, and exclamation of "Yes!" was the reaction of <A HREF="/tc?module=MemberProfile&cr=153902" CLASS="bodyGeneric">evd</A> when it was 
announced that fellow Stanford University student <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> had won the 2002 Sun Microsystems and TopCoder 
Collegiate Challenge on Saturday April 20, at the University Park Hotel @ MIT in Cambridge, MA.
</P>

<P>
The reaction of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, however, was more of relief than of exuberance.  That's because after finishing 
in a tie for ninth at the 2001 Collegiate Challenge, and the runner-up position in the 2001 Invitational, 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> had finally climbed to the top of the TopCoder mountain.
</P>

<P>
"It's really nice to win after making the semifinals in last year's Collegiate Challenge and Invitational," 
said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  "My adrenaline was flowing, and I really got absorbed in the problems.  I was able to block 
out all of the spectator activity, and finally submit code without any bugs in it.  Bugs in my code have cost 
me in past major tournaments." 
</P>

<P>
<B>The Tournament</B>
</P>

<P>
At the welcome reception, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, the assumed favorite due to his tournament experience and overall 
TopCoder rating, was confident yet humbled by his 15 opponents.  "I'm sure everyone here has beaten me 
in a Single Round Match before, so I have to make sure that I don't make the same mistakes which have cost 
me in past tournaments.  I came very, very close to winning $100,000 in the previous Invitational contest...so 
maybe this time I'll be lucky"
</P>

<P>
The next morning at 11am, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, showing no signs of jet lag, let all of the competitors and attendees know 
that he meant business.  In the most impressive performance of the tournament, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> submitted code for all 
three problems, and easily won his room with 1114.91 final points.  That point total was the highest of the 
Collegiate Challenge.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> also had the largest margin of victory, 548.32, and was the only competitor 
in all of the rounds to successfully code all three problems in one match.
</P>

<P>
When asked about returning for his second consecutive appearance in a TopCoder major tournament final after 
the match, he stated, "I'm not nervous at all.  "I'll just treat it like a Single Round Match, and block 
everyone else around me out."
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> used a bit of strategy in the Finals, attempting to code the Level Two problem first, rather than 
following the path of his competitors who attempted the easier Level One problem.  When the other 
competitors had already submitted their codes for the Level One problem and moved onto the Level Two 
problem, and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> was still compiling and testing his initial problem, some spectators thought <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> 
had made a grave mistake.  "The Level Two problem was very technical.  I had to be careful because it was 
easy to make an error."  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> finally submitted the Level Two problem for 274.20 points, and then opened 
the Level Three problem.  When asked about his strategy for opening the Level Two problem first, and then 
going for the Level Three problem, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> responded, "Even if it took a little longer to code, the Level 
Two and Three problems are worth more points, so I figured I could outscore the coders who attempted to code 
the Level One and Two problems in succession." 
</P>

<P><IMG SRC="/i/2002tccc/tourney_feat_photo2.jpg" ALT="" WIDTH="300" HEIGHT="200" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/>
His strategy paid off, even though he had to leave the Level Three problem to go back to code the Level 
One problem, as all three of his opponents could only submit code for the Level One problem.  After some 
pretty tense moments in the Challenge Phase, when both of his submissions were thoroughly examined by 
malpt and derkuci, and a very quick system test, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> finally took his place among TopCoder royalty.
</P>

<P>
"I am very happy for <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>," said 2001 TopCoder Invitational champion and friend, <A HREF="/tc?module=MemberProfile&cr=114443" CLASS="bodyGeneric">jonmac</A>.  
"He is very dedicated to these competitions and has arguably put more time and effort into TopCoder 
than any other competitor during the last year.  This is an achievement that highlights Daniel's 
unparalleled analytical capacity, and his ravenous competitive skills.  I felt this victory was 
inevitable for Daniel; nonetheless, I am still overjoyed and ecstatic for Daniel, in a cathartic 
sense.  Now we can finally introduce ourselves as 'The TopCoders'.  Perhaps we can pool our money 
together to purchase a solid gold couch."
</P>

<P>
When informed that <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> had won the Collegiate Challenge, Hector Garcia-Molina, Chairman of 
Stanford's Department of Computer Science, replied, "I am delighted to hear that <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> won 
this year's TopCoder Award.  This makes it two in a row for Stanford's Computer Science department!  
I had Daniel in one of my classes this year.  He is brilliant, yet unassuming.  He is definitely 
someone to keep an eye on!"
</P>

<P>
<B>dmwright - The Early Years</B>
</P>

<P>
Ken Griffey, Jr. Barry Bonds.  Brett Hull. <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  Think the four of them don't have anything 
in common?  Well you'd be wrong if you did.  While Griffey, Bonds and Hull are all products of 
fathers who were professional athletes, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> is the son of two parents who were programmers.  
Although TopCoder is only a year old, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> started preparing himself for these type of 
competitions 15 years ago.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> began his coding at the age of six.  "My parents didn't push me, 
but rather assisted me and showed me how to do cool things," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>. "My first code was in BASIC 
and it went something like this,":<BR/>
10: print "Hello. What is your name?"<BR/>
20: input name$<BR/>
30: print "Hello";name$,".My name is also ";name$<BR/>
</P>

<P>
Years later, the parents of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> continue to see the fruits of their labor and love.  
"My parents often check the results of my competitions on the TopCoder website."
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> came to the United States from South Africa in 1999, following his graduation from 
high school.  And although his family settled in Colorado, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> decided to attend California's 
Stanford University.  "Stanford has a very respected Computer Science department.  "I loved the 
atmosphere and the weather.  Also, in case I decided to change my major, Stanford offers a number 
of other interesting courses of study."
</P>

<P>
To be a great college athlete, many hours of commitment are required.  Athletes must practice, lift 
weights, watch game films, and travel among many other time consuming activities.  While these tasks 
might improve a students stock on the field of battle, they many times severely affect the performance 
of that student inside the classroom.  To be a great coder, the same time of commitment is required.  
The results, however, are more than often seen where they are supposed to in college, on the report 
card.  While lifting weights, watching game films and traveling aren't a part of a coders common 
lifestyle, practice most certainly is, and according to <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, competing in TopCoder's twice-weekly 
Single Round Matches has aided in his school work.  "I am definitely a better and faster coder due to 
competing in TopCoder."
</P>

<P>
"I enjoy coding and I enjoy competition, perhaps in the same way that many people enjoy competitive 
sports.  Especially given that I am now familiar with most of the highly ranked TopCoder members, I 
enjoy matching my skills against theirs.  TopCoder's rating system places coders of similar skills 
against each other, so there is seldom an easy contest."
</P>

<P>
"I like the recognition that I believe this will bring when I look for jobs.  Of course, I also like 
the substantial prize money - that is perhaps the main factor that has kept me competing for so long."
</P>

<P>
<B>The TopCoder Experience</B>
</P>

<P>
"Competing for so long" and "substantial prize money" are both accurate statements to describe 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, being that he is one of the TopCoder originals, becoming a member on April 3, 2001.  
"A friend of mine, and now fellow competitor, saw a TopCoder flyer for last year's Collegiate 
Challenge and told me about it.  Since I'd competed in some different programming contests in high 
school, and done fairly well (he finished first at the International Olympiad in Informatics in 1998), 
I figured I had a reasonable chance of doing well.  So I entered the contest, and I've entered almost 
every TopCoder contest since then."  
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> has competed in 71 of the 80 Single Round Matches, winning a total of $16,314.  Coupled with 
the $5,750 he won at the 2001 Collegiate Challenge, the $25,000 from the 2001 Invitational, and his 
most recent $100,000 victory, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> has won a total of $147,064, the most of any TopCoder member.  
Besides winning the 2002 Collegiate Challenge, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> is TopCoder's most prolific Single Round 
Match winner, having won his room 46 times.  That's 20 more room wins than the nearest member!  
It has also produced a winning percentage of 64.8% (46 for 71), which is remarkable, considering 
there is only a 10% (10 coders per room in a Single Round Match) chance of winning each match.  
Fourteen of those wins have come during consecutive wins streaks.  His six match winning streak 
from Single Round Match 51-56 is tied for the third longest in Division-I, while his four match 
win streaks from Single Round Match 59-62 and 64-67 are tied for seventh.
</P>

<P>
The reasons <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> wins so much?  He rarely makes mistakes, as his Submission Accuracy 
percentage of 86.76% and his 84.21% Challenge Success, will attest too.
</P>

<P>
His advice for other coders who are thinking about participating in competitions?  "Try it.  
I know many people who thought they had no chance of doing well, so they didn't compete for a 
long time.  Then when they did start, they did very well."
</P>

<P>
<B>The Future</B>
</P>

<P>
As far as what the future holds for <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, it's a good bet that you'll find him if you log 
onto TopCoder during an upcoming Single Round Match.  "I'll keep competing so I don't get rusty."
</P>

<P>
If you do happen to see him in person, don't bother asking for a loan.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> has plans for 
his winnings.  "I'm going to try to be reasonable with it.  I'll put some of it toward my education - 
Stanford isn't exactly inexpensive.  Then, maybe I'll buy a car or something like that.  Mostly, 
I'll try to save it for the future."  Assuming that future means more competitions, the TopCoder 
accounting staff might want to keep their checkbook handy.
</P>

<P>
<A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Have an idea for the weekly feature?</A>
</P>

              </TD>
            </TR>                               
          </TABLE>







        </TD>
      </TR>                                           
    </TABLE>

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
