<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Q&ampA Session with TopCoder Chairman Jack Hughes</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->    		
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Moderated Chat Q&amp;As</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<P>
Thursday, June 13, 2002<BR/>
Speaker:&#160;Jack Hughes,<I>TopCoder CEO</I><BR/>
</P>

<P><B>Jack Hughes:</B> Hello all, I hope everyone is well.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=273474" CLASS="bodyGeneric">router</A>: <B>What are your long terms plans for TopCoder, and continued growth of its membership? What benefits (besides the contests) does TopCoder have for me, as a member?</B></P>

<P><B>Jack Hughes:</B> Long term plans is kind of a long question.  Suffice it to say we will be doing a lot in the area of software...</P>

<P><B>Jack Hughes:</B> benefits besides contests are interaction within the group software and employment opps.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=115147" CLASS="bodyGeneric">kyotov</A>: <B>How is TopCoder doing financially? Do you have success with reselling components? Is there enough interest in the sponsor society? When will be the next big event?</B></P>

<P><B>Jack Hughes:</B> Financially, OK.  Haven't really started selling components just yet.  Sponsors are questionable - not as much activity as I would like.  Next big event in the fall (Invitational).</P>

<P><A HREF="/stat?c=member_profile&amp;cr=276118" CLASS="bodyGeneric">Zeke_The_Destro</A>: <B>I also want to know if TopCoder stock will ever be offered?</B></P>

<P><B>Jack Hughes:</B> Not just yet, still too risky...  maybe someday.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=273428" CLASS="bodyGeneric">rbnn</A>: <B>What can we do to help TopCoder?</B></P>
 
<P><B>Jack Hughes:</B> Good queston ( think I'm getting softballs ;)).  Keep doing what you're doing - particpate in contests and devolpment projects.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=264986" CLASS="bodyGeneric">pozdol</A>: <B>How many more sponsors do you think you will need to sustain Topcoder indefinitely and what are the prospects of getting those sponsers?</B></P>

<P><B>Jack Hughes:</B> Actually don't need that many (10 - 15).  think prospects are low - tech in a nasty decline.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=288584" CLASS="bodyGeneric">LunaticFringe</A>: <B>Do you have any plans in the future to implement support for new programming languages?</B></P>
 
<P><B>Jack Hughes:</B> mike says no.  Not in the near term.  I obviously have no input ;)</P>

<P><A HREF="/stat?c=member_profile&amp;cr=260961" CLASS="bodyGeneric">CodeWizard</A>: <B>When is TopCoder planning to extend the contests like collegiate to other countries in the communities? 
I guess if it takes 2 more years to do that, I may well have been graduated by then. :-)</B></P>

<P><B>Jack Hughes:</B> Really depends on how TC is doing financially within the states.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=288722" CLASS="bodyGeneric">tux</A>: <B>How big do you think TC will grow in the next 2 years?</B></P>
 
<P><B>Jack Hughes:</B> In terms of members, 30-50K, conservatively.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="bodyGeneric">Logan</A>: <B>Are there any plans to offer membership frills, such as topcoder.com email addresses, topcoder credit card 
(to draw off one's winnings and other earnings), or maybe even topcoder.com web space?</B></P>

<P><B>Jack Hughes:</B> If we think they are strategic or offer us the opp to make money.  Probably not credit cards, too many already.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=280198" CLASS="bodyGeneric">alanm</A>: <B>Open source software already attracts some of the best and the brightest.  How do you compete with free software?</B></P>

<P><B>Jack Hughes:</B> I don't believe in free software - almost always has a 'catch' where somebody makes money, just not developers.  Only true free software advocate (!hypocrite) is Stallman - and he's nuts.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=128228" CLASS="bodyGeneric">J-Muff</A>: <B>Is TopCoder acheiving its goal of being a profitable business? If not what are the plans for ensuring TopCoders future?</B></P>

<P><B>Jack Hughes:</B> Not even close, although still financially stable.  I believe the value of the members will make TC successful.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=152980" CLASS="bodyGeneric">bbyard</A>: <B>Please describe employment opportunities and how they work/happen?</B></P>

<P><B>Jack Hughes:</B> We are still forming the approach.  Currently negotiating with corporations to help them find highly qualified developers through ratings and experience/education.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=260961" CLASS="bodyGeneric">CodeWizard</A>: <B>Do you consider yourself a good "coder" or a good "businessman"? (a Bill Gates type question)</B></P>

<P><B>Jack Hughes:</B> Not any more.  Not Gates either.  I love software from both a technical and value perspective.  I believe software can change the world if done right, which it rarely is.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=264678" CLASS="bodyGeneric">emcee</A>: <B>Who are TC's primary investors?  Also, are there other sponsors/customers aside from Sun, Motorola, and Citrix?  
(I realize some of this information may be confidential)</B></P>

<P><B>Jack Hughes:</B> Not much confidential.  Me/family primary investors.  I think you got all of the sponsors, although we are always talking to interested others.</P>

<P><B>Logan: Is your database of member information (including performance) being mined and sold to anyone?</B></P>
 
<P><B>Jack Hughes:</B> No.  will not sell on a personal basis, only in aggregate.</P>

<P><B>J-Muff: On the topic of sponsors what has the feedback from Motorola and Citrix been?</B></P>
 
<P><B>Jack Hughes:</B> Citrix loves us, Motorola less impressed - think they need a much bigger audience.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=280328" CLASS="bodyGeneric">WhyDoubt</A>: <B>What can we do to let the sponsors know it is worthwhile to support TopCoder?</B></P>
 
<P><B>Jack Hughes:</B> Go to their sites and mention you heard about them from TC.  When in a position to do so, seriously evaluate their products.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=156485" CLASS="bodyGeneric">Smiley=)</A>: <B>Does the benefit of having a fairly large and talented member pool to work with 
(as contract developers and school representatives, for example) outweigh the costs of giving away lots of prize money every week?</B></P>

<P><B>Jack Hughes:</B> Don't know yet, the model hasn't proved out financially yet.  Think it will in one form or another.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=101459" CLASS="bodyGeneric">Steven</A>: <B>Topcoder seems to be expanding to other countries fairly quickly.  Although I am in favor of this, I 
am wondering what benefits you expect to gain from expanding so quickly?</B></P>

<P><B>Jack Hughes:</B> We would like to be as inclusive as possible.  We also want international exposure.</P>

<P><B>Logan: Are there plans in store for enticing the majority of idle members to actually compete?</B></P>
 
<P><B>Jack Hughes:</B> Hmm.. don't know why they don't, I think they are probably scared or came for some other reason - probably jobs.  I think paticipation will increase only a lttle - I'm OK with that.</P>

<P><B>bbyard: You describe software as rarely being "done right".  Please describe your notion(s) of what it means for software to be "done right."</B></P>

<P><B>Jack Hughes:</B> Less 'overruns' in time and money.  Higher quality / fewer bugs.  Less cancellations - New FAA system - DISASTER</P>

<P><B>J-Muff: Would TopCoder acting as a publisher for privately developed software prove profitable and/or feasible? 
(Assuming the products meet TopCoder standards, but fail to be developed under TopCoder direction)</B></P>

<P><B>Jack Hughes:</B> TC would like to be a publisher.  It will require tough quality standards.  We would look at independently developed software - not at first though.</P>

<P><B>emcee: what is TC's current burn rate?</B></P>

<P><B>Jack Hughes:</B> &#126; 2-4mm/yr</P>

<P><B>emcee: Has TC ever considered introducing a nominal (read &lt; $5) entry fee for competitions?</B></P>
 
<P><B>Jack Hughes:</B> Sure - send check to jhughes@tc.com</P>

<P><A HREF="/stat?c=member_profile&amp;cr=111202" CLASS="bodyGeneric">ColinMacLeod</A>: <B>What other countries are up next for eligiblity?</B></P>
 
<P><B>Jack Hughes:</B> Don't really know - lawyers... mike says Sweden &amp; Germany</P>

<P><B>Zeke_The_Destro: What can you tell us about the Invitational?</B></P>
 
<P><B>Jack Hughes:</B> I can't wait for it.  Beyond that, nothing - have to wait for official announcements.</P>

<P><B>Logan: A lot of TC initiatives are business focused.  Is there room for more pedagogical initiatives? (the match writeups are a good start)</B></P>

<P><B>Jack Hughes:</B> If you have ideas, we'd love to hear them.  We always looking for things to add and attract membership/readership.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=268951" CLASS="bodyGeneric">sosonel</A>: <B>How soon, if ever, do you expect the team competitions to launch on TopCoder?</B></P>
 
<P><B>Jack Hughes:</B> Teams are slated for late summer/early fall - really up to the members - they're writing the system.</P>

<P><B>Smiley=): TopCoder's model of having frequent, online competitions with significant prize money seems to be a novel concept.  
Do you see any reason this model couldn't be extended to other fields (TopEngineer, TopEtc.)?</B></P>

<P><B>Jack Hughes:</B> Expensive, If t doesn't work for TC, won't work for the others.  Other than that, I thnk the model could be used for a lot of things.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=271159" CLASS="bodyGeneric">Shiro</A>: <B>With the increasing number of active members, is there any plan to change the competition format or prize distribution?</B></P>

<P><B>Jack Hughes:</B> We're always looking at it, but for the immediate future, no.</P>

<P><B>emcee: Where do the survey questions for event registration come from?  Who consumes this information on a night with no sponsor?</B></P>

<P><B>Jack Hughes:</B> We use them as teasers to try and get sponsors interested.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=136367" CLASS="bodyGeneric">timurz</A>: <B>About "software done right". What do you think about Extreme Programming?</B></P>
 
<P><B>Jack Hughes:</B> Like it myself from a programmer's perspective - used to be a big RAD fan,  too fast though, maintenance is tough.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=105922" CLASS="bodyGeneric">qubits</A>: <B>Last July you announced the creation of a "Member Advisory Board".  Are plans still in the works, or has this idea been dropped?</B></P>

<P><B>Jack Hughes:</B> So I drop the ball, qubits (of course) brings it up and the moderators ( who are supposed to be looking out for met) let it through.  Sorry, I'll get it going again.</P>

<P><B>emcee: Has Microsoft been courted as a potential sponsor?</B></P>
 
<P><B>Jack Hughes:</B> emcee: &lt;--lots of questions.  Yes, still talking.  Likelyhood on scale of 1 - 10, 4.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=273416" CLASS="bodyGeneric">xxfobxx</A>: <B>What are the long term goals of team competitions? What was the incentive for incorporating them in the future?</B></P>

<P><B>Jack Hughes:</B> I think teams is a good predictor of how developers will do on real projects.  Also believe teams will attract members.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=272510" CLASS="bodyGeneric">C8H10N4O2</A>: <B>What about TC merchandise?  T-shirts!!!!</B></P>
 
<P><B>Jack Hughes:</B> We will.  We will.  You're going to have to pay for them, though.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=158412" CLASS="bodyGeneric">dlenharth</A>: <B>How about getting universities to offer scholarships?</B></P>
 
<P><B>Jack Hughes:</B> Maybe.  its on the list.  can't give you a good indcation of outcome yet.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=157160" CLASS="bodyGeneric">fisher2000</A>: <B>So far how many coders from TC have been employeed by other companies?</B></P>

<P><B>Jack Hughes:</B> A few that we know have been courted because of TC participation/noteriety.  Getting paid for it though is another matter.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=277021" CLASS="bodyGeneric">PurpleBob</A>: <B>What benefits do the sponsors get from sponsoring a match (besides having their name on everything and choosing the survey question)?</B></P>

<P><B>Jack Hughes:</B> Those are pretty much it.  Sun received quite a bit of major press for the cc, though.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=158447" CLASS="bodyGeneric">ValD</A>: <B>Has the economic down-turn affected TopCoder at all?  It seems like the company is growing instead of 
slowing down (ie. new projects, more sponsoring, and more members).</B></P>

<P><B>Jack Hughes:</B> Economy, yes, sponsors are hurting.  growing, yes, but is costing not making money.</P>

<P><B>Zeke_The_Destro: How did the idea of TopCoder come about? It's quite a novel idea and there must have been a lot of thought put into it.</B></P>

<P><B>Jack Hughes:</B> Thought of it at my old company (consulitng firm).  Was very difficult to find good developers, 
figured a contest was a good way.</P>

<P><B>Steven: Have any companies contacted topcoder about using events as a way to "screen" new applicants?</B></P>
 
<P><B>Jack Hughes:</B> Yes, although we haven't done anything with it yet.  Don't know f there would be enough demand.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=156822" CLASS="bodyGeneric">m_chen</A>: <B>It appears that TC is selling the sponsorships in packs of 5 SRMs.  Is there a reason for this?  
Why not let a company sponsor for one match?</B></P>

<P><B>Jack Hughes:</B> Reduces selling costs - although we don't have a lot of takers.  we also offer a discount for the volume.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=274323" CLASS="bodyGeneric">pearl</A>: <B>What constitutes a good developer, though?  Earlier you said that software must be 'done right', 
then sited manager-type stuff (overruns, etc.)  What, in your opinion, makes a 'good' programmer?</B></P>

<P><B>Jack Hughes:</B> I believe the crtical factor determining quality, cost and timeliness of software projects is developer talent.  I do not believe all other factors combined (management, tools, technologies ,etc) have as large an impact.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=260185" CLASS="bodyGeneric">NeoTuri</A>: <B>How many competing members is too many?</B></P>
 
<P><B>Jack Hughes:</B> We'll know when the system crashes, must be right around the corner.  Seriously, I think we have a long way to go.</P>

<P><B>xxfobxx: How bout incorporating a tutorial guide or something to encourage beginners to participate and help them become TopCoders?</B></P>

<P><B>Jack Hughes:</B> I would like to do 'clinics' where the top members help out the rest... one more question.</P>

<P><B>Jack Hughes:</B> Sorry, they tell me there are a lot more questions... we'll go a little longer.</P>

<P><B>emcee: You said you previously ran a consulting firm.  In addition to connecting your customers with potential employees, 
have you considered hiring coders from the member base and marketing TC as a general-purpose development house?</B></P>

<P><B>Jack Hughes:</B> Not at the moment ... we would rather do components/products.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=264986" CLASS="bodyGeneric">pozdol</A>: <B>You mentioned a while back that the prospects for getting more sponsers aren't too good.  
If you had to guess right now, do you think it's more likely that topcoder will be a big success or that all the walls will come crashing down?</B></P>

<P><B>Jack Hughes:</B> I don't think the walls will crash,  the model might change somewhat, though.</P>

<P><B>C8H10N4O2: What are the prospects of sponsors giving members demos and other things to look at?</B></P>

<P><B>Jack Hughes:</B> Some have talked about this as well as other things.  I Just think that sponsor budgets are very tight, I don't think they are doing a lot of anything.</P>

<P><B>CodeWizard: I have seen with most online contests, sooner or later, members develop 
their own websites where they post solutions or hints or related supporting material for the contest 
questions. How "cool" (or "doesn't affect me attitude") is TopCoder about these?</B></P>

<P><B>Jack Hughes:</B> Depends on what the member is doing... If it was really cool, we would probably want to incorporate it on TC's web site (i.e. Pops' stuff)</P>

<P><B>CodeWizard: When is TopCoder planning to extend the contests like collegiate to other countries 
in the communities? I guess if it takes 2 more years to do that, I may well have been graduated by then. :-)</B></P>

<P><B>Jack Hughes:</B> Teams will be big.  Other than that, the invitational and the CC (Collegiate Challenge) are about it for now in terms of tourneys.</P>

<P><A HREF="/stat?c=member_profile&amp;cr=268951" CLASS="bodyGeneric">sosonel</A>: <B>Since you want international exposure, have you considered international sponsors from the countries to which TopCoder extends?</B></P>

<P><B>Jack Hughes:</B> Haven't talked to many, you make a good point.  We probably should.  If anyone knows anyone, shoot us a line.</P>

<P><B>CodeWizard: In your personal opinion, which one weighs more in industry today? (a) a brilliant coder; 
who knows 1 language only (no chances of him learning any more), and (b) Not-a-prodigy coder, but has knack of adapting to technologies well.</B></P>

<P><B>Jack Hughes:</B> Don't agree with either.  Someone sharp can master any technology.  I think (a) could do (b).</P>

<P><A HREF="/stat?c=member_profile&amp;cr=136367" CLASS="bodyGeneric">timurz</A>: <B>What do you think the share of US programmers that have heard about TC is?</B></P>
 
<P><B>Jack Hughes:</B> If I had to guess, &lt; 10%</P>

<P><B>xxfobxx: Would you say this moderated chat session was a success?</B></P>
 
<P><B>Jack Hughes:</B> It didn't crash ! :) I'm enjoying it.  You guys really are the judge, though.... On that note that'll be the last question.  Thanks for coming.  Let us know how you liked it and if we should do more .  Have a great evening/morning/afternoon.</P>

						</TD></TR>                                                                 
					</TABLE>
		<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="pr_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
