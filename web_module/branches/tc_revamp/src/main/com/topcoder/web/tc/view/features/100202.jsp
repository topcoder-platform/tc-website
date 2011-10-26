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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>"Finding a Job is a Job" </B></FONT><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/><BR/> -->
Wednesday, October 2, 2002<BR/>
By&#160;pearl,<I>TopCoder Member</I><BR/>
</P>

<P>
Back in the ancient days, there were few avenues open to job-seekers:  we had newspaper ads, professional recruiters, college recruitment centers, and word of mouth.  That has all changed with the information age, of course.  Out of curiosity, I decided to look into the modern world of job-hunting.
</P>
<P>
Talking with recent job-hunters, the first thing I learned was that finding a job is a job.  They spent at least 40 hours a week following up leads, sending resumes, and searching for job openings.  In the current economy, most companies are being very cautions about expanding.  It doesn't help that there have been large layoffs as well, so in addition to the usual influx of college graduates, there are a lot of seasoned professionals out there looking too.  The competition can be fierce.  One company I know recently put an ad in the local paper for an opening for a data-base management position, and got over 4,000 applications over the course of three days for a position that was hard to fill just a few years ago.
</P>
<P>
The first step in your job search is writing your resume.  This article is too small to go into all the details of writing a resume-it will be well worth your while to buy a book on resume writing or to borrow one from your local library.  There are several tips on resume writing worth mentioning here, however I will only highlight a few:
<OL>
<LI>Keep it short.  No more than one or two pages.</LI>
<LI>List all your relevant experience.  This means that if you apply for jobs in different fields (say, one job as a games programmer, another as a database management professional), you will need more than one resume-one that emphasizes your programming skills, another your database skills.</LI>
<LI>List all your relevant skills.  Be sure to include any acronyms somewhere on the resume (such as JAVA, ASP, etc.)  Many companies will scan resumes electronically for these and other buzz-words.</LI>
<LI>List all your education.</LI>
<LI>Keep it honest.  That should go without saying...</LI>
</OL>
</P>
<P>
So you've written your resume, gotten your best suit dry-cleaned, and are ready to join the fray.  Where do you begin?
</P>
<P>
<B>Option 1: College Recruitment Centers</B>
</P>
<P>
Almost all colleges have a recruitment center to help the new college grad get that first job.  The best thing about the companies that come to interview at colleges is that they realize you will have no experience. All too often, in want ads or internet postings, they add on that phrase:  &quot;x years experience in xyz required&quot;.  What many job-seekers may not realize (or have simply forgotten), is that college recruitment centers also help grads who have been out in the real world for a while.  Often the company representative is from the company's personnel department, and they will be aware of the job openings for experienced professionals as well.
</P>
<P>
<B>Option 2:  Professional Recruiters</B>
</P>
<P>
You wouldn't hire the kid next door to cut your hair.  It makes sense to have professionals helping you search for jobs as well.  Professional recruiters know about many job openings that are not posted anywhere.  They also will usually get you a better salary than searching on your own.  A key point to remember:  they have been finding positions for professionals for years, and often have good relationships with key employers.  They can often see a hidden talent of yours and sell it to the employers for you.  They also will be a contact person between you and the interviewer-providing you with important feed back as to how the interview went.
</P>
<P>
<B>Option 3:  Newspaper Ads</B>
</P>
<P>
Ten years ago, when I looked at the &quot;Computer Professionals&quot; section of the Sunday Jobs Want-Ads, there were 20-30 pages of jobs.  This last Sunday, there was only &#189; of one page.   Why?  It is not the economy alone.  I believe that companies looking for technical people are turning to more modern methods-after all, would you be interested in hiring a programmer who didn't know how to access your site on the internet?  On the other hand, many smaller companies will use newspaper ads, since they don't have the resources to set up a web site (maybe that would be your first project at such a company!)  Don't overlook the fact that many of the major newspapers also have on-line want ads.
</P>
<P>
<B>Option 4:  Word of mouth (now known as "networking")</B>
</P>
<P>
Never underestimate the power of your friends and acquaintances.  Don't be embarrassed to tell everyone you know that you are looking for a job.  You never know when a friend of a friend will have the dream job you've always wanted-and will let you know about it before the personnel department advertises it.  Here is a scary statistic:  one article I read stated that 90% of managers preferred finding candidates through networking - either internally (within the company) or externally.  It can be very helpful to have a friend within the company you want to apply to-they may be able to get you past the 'gate keepers' in personnel and directly in contact with the supervisors who will be doing the hiring.
</P>
<P>
<B>Option 5:  Cold-calling companies</B>
</P>
<P>
Perhaps you have always dreamed of working on computer games.  Research the various gaming companies and find out where they are located, and send resumes.   Don't overlook the smaller companies, where you can gain experience while learning the ropes.  You may find you enjoy those smaller companies. Imagine reporting directly to the president of the company, rather than a middle manager who has never even seen the vice president that he reports to!  If you can find out the name of the director of personnel, or even better, the manager you would be reporting to, it doesn't hurt to send your cover letter/resume directly to them.  Also, check out individual company sites on the web.  Often they will have a 'positions open' section.
</P>
<P>
<B>Option 6:  On-line job sites</B>
</P>
<P>
These sites allow you to post your resume for everyone to see.  It is very important that your resume have the correct buzz-words/acronyms when posting to these sites, as the jobs are matched mechanically to the correct resumes.  Don't limit yourself to just one site-use three or four of them simultaneously.  Note:  If you are currently employed, and do not want your current manager to know you are looking, be careful using these sites!
</P>
<P>
<B>Option 7:  On-line sites such as TopCoder</B>
</P>
<P>
Then there is TopCoder, an online community like no other.  At this site, a potential employer can view actual samples of your work, and see that you really do have the skills your resume lists.  This is very important to potential employers, as all too often applicants who are great at interviewing and have all the correct buzzwords on their resume have absolutely no programming skill whatsoever.  TopCoder launched TCES (TopCoder Employment Services) in September. <A HREF="/corp/?module=Static&amp;d1=corp&amp;d2=tces_home"  CLASS="bodyGeneric">Click here</A> for details.
</P>
<P>
<B>Other Options</B>
</P>
<P>
There are probably many other ways to get a job (job fairs, internet job fairs, enlisting in the Army, marrying the boss's son/daughter, etc.).  This list was not meant to be all-inclusive, just a start!
</P>
<P>
<B>Get Ready to Search!</B>
</P>
<P>
So, you are probably asking yourself, which method should I use?  According to Richard N. Bolles, author of What Color Is Your Parachute?, you should only concentrate on four methods.  According to him, any more and you will wear yourself too thin, and not do a good job.  Of course, if you have chosen four and then read about a job fair that sounds like exactly what you are looking for, I would still go to the job fair.  Just concentrate most of your time and effort on your four main methods.
</P>
<P>
As mentioned near the beginning of this article, finding a job is a full-time job in and of itself.  Companies tend to use only one or two avenues to fill positions.  Company A may do all of its hiring through word-of-mouth and a professional recruiter, while Company B relies solely on newspaper ads, and its company web site.  That is why it is important to use more than one option when seeking a job.
</P>
<P>
Then there is the interview.  Like your resume, there is no way I can tell you everything you need to know about interviewing in one short article.  Dress nicely.  Sit up straight.  Sell yourself.  Laugh at dumb jokes.  And don't order anything with garlic for lunch!  Seriously, to get the best advice on resumes, interviews, and tracking down that perfect job, I recommend you borrow or buy Mr. Bolles book, or any of many similar books on the market.
</P>
<P>
<B>A Warning-watch out for Scammers</B>
</P>
<P>
One last word of advice-never, ever, pay someone to help you find a job.  There have been newspaper articles recently about two new types of scams that target job-seekers in this slow economy.  In one case, a person claiming to be a professional recruiter will ask for several thousand dollars up-front to put you in a plum position.  Don't fall for it.  Professional recruiters are paid by the employers - the companies looking for a worker.  A second scam has to do with web sites, where they will ask you to pay a fee in order to post your resume.  Again, honest sites are paid by the companies seeking workers.
</P>
<P>
<B>Finally-The Three Best Ways to Find a Job</B>
</P>
<P>
From What Color Is Your Parachute?,  here are the top three successful job search options from above:
<OL>
<LI>Use the yellow pages to find companies you'd like to work for, and then call them to ask if they are hiring (this method had a 69% success rate).</LI>
<LI>Knock on the door of any employer, factory, or office that interests you, whether they are known to have an opening or not (this method had a 47% success rate).</LI>
<LI>Networking.  Ask everyone you know if they know of any openings anywhere, but especially where they work (this method had a 33% success rate).</LI>
</OL>
</P>
<P>
Mr. Bolles mentions two other methods that are even more successful, but I leave it to you to read his book (they are variations of the job search techniques above).
</P>
<P>
<B>Happy hunting!</B>
</P>



<IMG SRC="/i/m/pearl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;pearl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=274323" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>

<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>



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
