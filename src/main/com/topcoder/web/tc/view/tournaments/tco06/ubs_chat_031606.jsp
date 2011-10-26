<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<STYLE TYPE="text/css">
.light
{
background-color: #143F7C;
color: #FFFFFF;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}

.dark
{
background-color: #032F6B;
color: #FFFFFF;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}
</STYLE>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="ubs"/>
</jsp:include>


<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tco06/ubs_logo_final.gif" alt="UBS" border="0" /></div>
<br><br>

<br><br>
<%--
<table class="bodyText" cellpadding="0" cellspacing="0" width="100%">
<tr><td class="header">Handle</td><td class="header" width="100%">Comment</td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">Hello</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">hi</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">What are the qualities that you are looking for in people applying for positions in UBS?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">strong technical skills</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">likes a challenge</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">innovative thinker</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">to name a few qualities</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">what kinds of jobs interest you?</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">I just graduated college and I am interested in position as a Java developer.</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">we have several openings for java developers</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">Ken, how about describing some projects where we need java programmers?</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: what about .net programmers?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">Sure, many of our servers are written in Java.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Yes, we're also interested in .NET programmers.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: do you hire international students</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">We do many applications that have Java back ends and C# front ends.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">sure. wehave offices in many locations</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: any in Asia?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">London is a big site for us in Europe.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">So, of course, we have some utils for clean interoperability between those language environments, as well as C++.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: where is your HQ?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">In asia we have offices in Tokyo, Singapore, Hong Kong</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">Switzerland is the official headquarters</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">But very large offices in London and Stamford Ct.</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">I have experience with developing software for building automation with a Japanese company in Tokyo.</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: do u hire international students for Main HQ</td></tr>
<tr><td class="light"><b>velko</b></td><td class="light"> But I am quite new to Top Coder and I don't have a high rating yet. Does my current low rating automatically disqualify me or I have a chance based on my experience and many other,non-technical skills - like speaking four languages and being very flexib</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: yes we do. Where are u located?</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">We hire international students and professionals at all development centers.</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: Pakistan</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">velko: No, a low TC rating does not disqualify you.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">We are looking for great talent, regardless of rating.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">or location</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: :)</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: need any experience? from a student</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">we hire folks right out of school</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: gr8</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">we have job openings at all levels</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: Phone Interview -&gt; On-Site Interview-&gt; Hire</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: you got it. we review the resumes, if there looks like there is a fit we do phone screens</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: and you sponsor all the re-location/visas</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: if we hire someone we do hte relocations/sponsorships</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: gr8</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: is there any particular link for sending the resumes</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">ali_raza_shaikh: to make it easy send it to the topcoder folks</span></td></tr>
<tr><td class="dark"><b>velko</b></td><td class="dark">UBS_Ken: I have lived in five countries on four continents -&gt; I do like challenges. That's why I asked if only the rating matters or you are looking for other qualities also, which can hardly be measured in a competition... :)</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: fine</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: now to the main question</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">mike: who should they send resumes to?</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: what techinal expertise you want from a .Net Guy</td></tr>
<tr><td class="light"><b>mike</b></td><td class="light">UBS_Frank: let me check</td></tr>
<tr><td class="dark"><b>athenachu71</b></td><td class="dark">hi, I want to ask about internship in UBS this summer, who should I talk to?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">ali</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Robin</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: we're looking for strong .net C#, with Winforms experience a big plus</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">velko: That's great - UBS has a multinational company and your skills would be very valuable here</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">mike: I think we are pretty much complete with this year's interns</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">mike: but still sumbit to Topcoder</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">In general, for Java and C#, we're looking for people who are very focused on delivering high performance software.</span></td></tr>
<tr><td class="light"><b>mike</b></td><td class="light">UBS_Frank: yeah - makes sense</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">One of the things I like about the programming challenges here is that it is a good mix of architectural and algorithmic challenges</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">athenachu71: so please sumbit your resume</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: does your team visit certain countries for Job Hiring, or u call the candidate to the Main HQ</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">That is, we believe that both Java and C# can deliver solutions as performant as C++.</span></td></tr>
<tr><td class="dark"><b>mike</b></td><td class="dark">UBS_Frank: kkittle@topcoder.com would be a good place for any resumes</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">Of course, we also believe in a rich gene pool of technologies, so we do a lot of C++ here as well.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">if a candidate is going to be called in, it is to the office that is most interested the person</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">UBS_Ken: I am interested in a position in the US, preferably developing Java web-applications. I submitted a job application to UBS through TopCoder today. Should I do the same though your web-site also?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">mike: thanks</span></td></tr>
<tr><td class="light"><b>athenachu71</b></td><td class="light">UBS_Frank: you mean through TC system?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">velko: That's great - No need to submit separately, topcoder will forward the resume to us</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: should we send the resumes to kkittle@topcoder.com?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: send to kkittle@topcoder.com</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: thanx</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Robin</span></td><td class="dark"><span class="bigRed">as a ui developer for ubs, i enjoy both the distinct technical and business  challenges that i am presented with</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">UBS_Ken: If you find my skills suitable for UBS, within what time period would I be contacted for a possible interview?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: what else should i ask... let me think</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: what about the professional growth at UBS</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">velko: Pretty quickly - we are actively seeking candidates.</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">hi</td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">I am wondering what kind of compensation are you offerind for senior dev position?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">we are very focused on career development, training</span></td></tr>
<tr><td class="dark"><b>athenachu71</b></td><td class="dark">UBS_Ken: My dissertation is about neural network & stock price prediction, does it help if I want to work for UBS?</td></tr>
<tr><td class="light"><b>athenachu71</b></td><td class="light">UBS_Ken: I'm very fond of stock & relevant stuff</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">We offer extremely competitive compensation packages and benefits.  We're competing with other investment banks and hedge funds.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">athenachu71: Absolutely - knowledge of the financial markets is very valuable</span></td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">UBS_Chuck: that sounds good, but any details?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">it is great if you have an interest in learning the business</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: is there any GPA limitation?</td></tr>
<tr><td class="light"><b>athenachu71</b></td><td class="light">UBS_Ken: Frank said that internship for this year is nearly close</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">For those of you who don't know about compensation on Wall street, the bonus is a significant portion of your income.</span></td></tr>
<tr><td class="light"><b>athenachu71</b></td><td class="light">UBS_Ken: does it mean I should apply next year?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: nope. we focus on skills, potential, fit</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">UBS_Ken: that doesn't say much, though</td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">UBS_Ken: are you authorized to give any numbers for senior dev position here?</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: that gr8</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">The bonus has a performance-based component, so great performance is well-rewarded</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">athenachu71: doesn't hurt to try for this year.</span></td></tr>
<tr><td class="dark"><b>athenachu71</b></td><td class="dark">UBS_Ken: you mean through TC system? but I never receive any reply from that</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">This is not an appropriate forum for discussing actual compensation numbers.</span></td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">I see</td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">I was afraid so</td></tr>
<tr><td class="dark"><b>athenachu71</b></td><td class="dark">UBS_Ken: is there any other ways to submit my application more directly?</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: in what time duration we should look for Phone Interview after submitting the resume</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">Email kkittle@topcoder directly, she should be able to answer you</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">Each individual is compensated extremely competitively based on their contribution and competencies and the performance of their busisness stream and the company.</span></td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">so let me rephaze: I'm looking for +200k position, +300k would be great</td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">is this feasible?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">athenachu71: we try to get back to folks as quickly as possible</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">athenachu71: we have positions at all pay levels.</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: Do you have open positions at all the international centers</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">so - what are the languages that y'all will be coding in tonight?</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">athenachu71: we do have openings everywhere</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Robin: C++</td></tr>
<tr><td class="dark"><b>athenachu71</b></td><td class="dark">UBS_Frank: I'm 2nd year student in the uk now, is there any UBS branch in the uk?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">In parallel, let me write a bit about what we do here. As one of the largest stock trading firms in the world, we face some very interesting technical challenges</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">very large office in London</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">what makes you special?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: ??</td></tr>
<tr><td class="light"><b>athenachu71</b></td><td class="light">UBS_Frank: oh, it sounds great, is there any openning positions in that office?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">At the moment 1 in 9 equities trades globally passes through our software.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">ubs is quickly becoming the largest investment banks in the world</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">yep.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">in-house technology in a core focus of both the businiss and it</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">we are the leaders in many areas of the business in many parts of the world</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: Do you have open positions at all the international centers</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Yes, Ali</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">what are the working hours?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">All of them ;-)</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">how much do you usually spend in the office?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: :)</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">All joking aside, based on the technical and business challenges at hand, people generally put in whatever hours are required to get their jobs done.</span></td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">8h or 10-12?</td></tr>
<tr><td class="light"><b>athenachu71</b></td><td class="light">UBS_Frank: can you add the name of whom you want to reply, please</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Some times are busier than others.  So it varies.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">the hours also vary by region</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">send kkittle@topcoder.com your resumes</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">And they vary based on how much interaction with other regions are required.  Often, when I'm in Stamford and need to interact a lot with London, I'll have to come in much earlier to optimize work day overlap.</span></td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">I see</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: will you count the TopCoder Performance for hiring</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Robin</span></td><td class="dark"><span class="bigRed">no, we didn't for ken ;)</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">Why is it fun to work for UBS?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">we look at many things. it surely isn't going to hurt to have a high ranking</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">UBS also has some amazingly smart people. One of the primary reasons I recently joined UBS (and moved to Connecticut from Boston) was because they have some really smart people here.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Really smart people, fun unsolved problems, beer and snacks on Friday afternoons. ;-)</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">only on Friday? that sucks ;-)</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Anything is negotiable.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">Krzysan: the pace of our business, globally, provides for constant challenge</span></td></tr>
<tr><td class="dark"><b>athenachu71</b></td><td class="dark">UBS_Chuck: that sounds great to me</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">Tough crowd. It was a selling point in the last chat</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">Chuck forgot to mention our offices are over a bar</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: is there any student educational program</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: like the one's who want to do Masters + the Job</td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">UBS_Ken: Do you have any developer positions which involve traveling, or pretty much everything is just at one place in one office?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">we support all kinds of training, in house, mba's, masters etc</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">A high TopCoder score is not the only factor in generating interest in a candidate.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">velko: We do have positions that have travel.</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">what kind of skills are you looking for?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">velko: We've got significant development happening in US, Europe and Asia, and sometimes meeting face to face works best</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">UBS_Ken: What is an interview like? Does it include some topcoder-like exam/test?</td></tr>
<tr><td class="dark"><b>tywok</b></td><td class="dark">are you looking for languages?or english is just enough?</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: any type of certification counts?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: specially MCAD/MCSD</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">We're looking for performance minded coders of C++, Java, and C#/.NET.  We need infrastructural programmers, financial programmers, ...</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">We're looking for top quality technologists in many disciplines.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">English is enough. Knowing another language can be a plus in some locations</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">velko: We start with a phone screen. If that goes well, we do bring you on site. There's no formal testing, but we will dig deep into technical skills</span></td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">coding skills are an obvious requirement</td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">but what else?</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: any type of certification counts? specially MCAD/MCSD? for .net Jobs</td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">does finance background help?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">Depending upon where you work, strong analytical skills can be valuable. For example, our derivities groups are very math-heavy</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">ali_raza_shaikh: everything is taken into account</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: gr8</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">Financial skills are a plus, but UBS offers training and career development to fill in the gaps.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: now what about spoken English</td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">are you using some advanced data mining?</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: do u look for fluent english spoken</td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">recently I've beed doing some research in this field and I'm wondering are you using it in real world and how</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">communication skills are important</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Yes, data mining is an important discipline here for several projects. If you have skills in that area, be sure to highlight them on your resume.</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">UBS_Ken: About the deep digging part - what is it like? I mean - you say - "OK, this is the problem. How would you solve it?". Or it is more like asking specific details about specific language features for example?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">As you can imagine, we generate enormous amounts of data every data from our trading activity and from external market monitoring so there are many opportunities for mining data.2006-03-15 21:00:54.815	ali_raza_shaikh	UBS_Frank: thanx Frank for answering my questions</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">sure thing.</span></td></tr>
<tr><td class="dark"><b>rajeshaz09</b></td><td class="dark">hellow</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">Hellow</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">velko: Yes, I've certainly done "here is a problem, how would you solve it". I'm usually looking more for the thought process than just a "correct answer"</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">We are also interested in 'elegant' solutions that scale, can be reused, and can be refocused on related problems.</span></td></tr>
<tr><td class="dark"><b>velko</b></td><td class="dark">UBS_Ken: Does SCJP and SCWCD certifications matter to you?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">velko: I might dig into language features if someone says they are an expert.</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: is there any Developer from Pakistan working at UBS</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">We have employees from just about everywhere in the world.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">My last boss is from Pakistan</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Chuck: gr8</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: :)</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">velko: It doesn't hurt, but we aren't really into formal certifications</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">as Chuck mentioned this is a really diverse place</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: yeah</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">In fact, we have a diversity initiative at UBS to ensure that we honor and respect all races, cultures, nationality, and sex.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">Chuck and I are working an interesting high-performance, low garbage collection framework for Java, C# and C++</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Chuck: that is the main thing in any company progress</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">This includes high bandwidth networking components handling 100,000s of messages per second.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">if you are interested in more info about ubs check our web site</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">UBS_Ken: If I am called for an interview here in the US, would I meet you guys or I'd meet just some of the many recruiters in many UBS locations? :)</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: UBS must be dealing with lots of online Applications</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">if you think you are a good match for our openings send your resumes to kkittle@topcoder.com</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">velko: If the phone interview goes well, we would bring you on-site for an interview. It also depends on the group</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: ASP.net will be one of the skill required</td></tr>
<tr><td class="dark"><b>velko</b></td><td class="dark">UBS_Ken: OK</td></tr>
<tr><td class="light"><b>Krzysan</b></td><td class="light">what's the usual team size?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">With .NET we're focuse more on GUI development using forms, though there is some ASP.NET going on.  On the web side we tend to do a little more with Java servlet programming.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: ok</td></tr>
<tr><td class="dark"><b>velko</b></td><td class="dark">UBS_Ken: Your web-site is running on Solaris. Is this your primary OS for Java development?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">Krzysan: In my group, we like to have small focused teams, 2-5 people. Other groups do use larger teams</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Robin</span></td><td class="dark"><span class="bigRed">we use linix extensivly within the bank</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: does UBS focusing on up-comming technologies</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: Winfx, avalon, vista etc etc</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">we also use linux too :)</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">spelling isn't one of the big skills we look for</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">thank goodness</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Yes, UBS is constantly investigating and piloting new technologies.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Chuck: thats gr8</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: from where we can get the Team's Information, do they maintain a blog?</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">ubs is a very heavy user of both chat an wiki's for inter team communication</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">we don't really make that info public, u know privacy issues and all</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">That sometimes means that we reject technologies that are popular at other companies because we believe we can build something more compelling ourselves.  So we are trying to stay ahead of the curve with both externally and internally written software.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">but in general we have all types of folks with all types of backgrounds and experiences</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: any UBS blogs?</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">We are also using many facets of extreme programming (XP) on many of our newer efforts.  We also have a number of internal 'open source' projects to encourage collaboration between all of our international development centers.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: does UBS have any Research Center</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: ??</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">We do not have an isolated technology R&D effort.  However, we do a lot of focused R&D to solve real problems here at the bank.</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: ok</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">We are doing research into various aspects of high performance computing, real-time continuous query processing, high performance compact transactional database systems, faster than light comms, ...</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: :)</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Frank: do u partners with others Big Names like Microsoft</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">We hope to use FTL comms to transmit stock prices back in time :)</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">We have close ties to many important software vendors.</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: thats nice</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">Many of the big and small vendors will priorizite their development efforts to take our needs into account.</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Frank: are there any future plans for non-banking/financial solutions</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">we're currently participating with microsoft on a number of their patterns and practices</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Robin: gr8</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">we are really focused on technology solutions for our businesses</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">that's how we make our money, attract good people, etc</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">It's also a great environment to work. We're business casual.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Robin</span></td><td class="dark"><span class="bigRed">which leads us back to thr free beer on friday's :)</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">Oh, did we mention there's beer & cookies every Friday?</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Of course, many of the technology solutions are completely generic and would apply to many industries.  Real-time distributed computing with automation, fault-tolerance, high performance, ...  could be used by NASA.</span></td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">UBS_Robin: thanks Frank, Robin, Ken and Chuck</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">Except at NASA it would have to run on a 286 :)</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">Or in Ada.</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">UBS_Robin: i am certainly looking forward for UBS, so keeping my figure crossed</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">lots of good questions</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">before you go off and compete anymore things on your mind?</span></td></tr>
<tr><td class="light"><b>velko</b></td><td class="light">ali_raza_shaikh: Everything which you said sounds great! I mean, Java, web, Linux, travel, large international financial institution - all things fit in my definition of a dream-job. :) I hope to see you soon. Thank you very much for your time.</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Chuck</span></td><td class="dark"><span class="bigRed">Also, Linix.</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">hope we have given you a good feel for ubs, what we do, what we need from our hires</span></td></tr>
<tr><td class="dark"><b>velko</b></td><td class="dark">ups, the last message was for you guys from UBS</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Frank</span></td><td class="light"><span class="bigRed">and why it is a great place to work !</span></td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">velko: no problem</td></tr>
<tr><td class="light"><span class="bigRed">UBS_Chuck</span></td><td class="light"><span class="bigRed">Good luck, everyone.  I hope to see your resumes soon.</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Ken</span></td><td class="dark"><span class="bigRed">UBS_Chuck: Have had several private chats with him. He sent his resume in today</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Ken</span></td><td class="light"><span class="bigRed">Good luck everyone!</span></td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Frank</span></td><td class="dark"><span class="bigRed">good luck. thanks for spending the time with us</span></td></tr>
<tr><td class="light"><span class="bigRed">UBS_Robin</span></td><td class="light"><span class="bigRed">goodluck, and see y'all nexttime</span></td></tr>
<tr><td class="dark"><b>velko</b></td><td class="dark">Thank you. Bye</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">Bye</td></tr>
<tr><td class="dark"><span class="bigRed">UBS_Robin</span></td><td class="dark"><span class="bigRed">i'm off to rinse - night all</span></td></tr>
</table>
--%>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="ubs"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
