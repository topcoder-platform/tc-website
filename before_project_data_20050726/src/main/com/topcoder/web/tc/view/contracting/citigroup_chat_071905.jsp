<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employment Opportunities</title>
<STYLE TYPE="text/css">
.light
{
   background-color: #FFFFFF;	
	color: #333333;
	font-size: 12px;
	font-weight: normal;
	text-decoration: none;
	vertical-align:top;
	padding: 3px 5px 3px 5px;
}

.dark
{
   background-color: #EEEEEE;	
	color: #333333;
	font-size: 12px;
	font-weight: normal;
	text-decoration: none;
	vertical-align:top;
	padding: 3px 5px 3px 5px;
}
</STYLE>
<jsp:include page="../script.jsp" />

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
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="openings"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="employmentOpps"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

		<div align="center">
      <A href="/tc?module=Static&d1=contracting&d2=citigroup"><img src="/i/contracting/citigroup_logo.gif" border=0/></A>
		</div>

<br><br>
Take a look at <A href="/tc?module=Static&d1=contracting&d2=citigroup">Citigroup's job openings</A>.
<br><br>
<table class="bodyText" cellpadding="0" cellspacing="0" width="100%">
<tr><td class="header">Handle</td><td class="header" width="100%">Comment</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">Hello ? we are glad everyone came to the chat room to hear about opportunities at citigroup.  We spoke last month about the opportunities in the equity derivative department for top developers.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed"> This time we have also included Gareth Gaston from our statistical arbitrage group</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">Both groups push computing power to its limits.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Hi folks -- Gareth Here.</span></td></tr>
<tr><td class="light"><b>BEHiker57W</b></td><td class="light">Where does Citigroup employ developers in the groups we are discussing?</td></tr>
<tr><td class="dark"><b>gt494</b></td><td class="dark">let's see who has the difficult questions for citi 1- 3, and amirshim</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">Both offer some of the most quantitatively challenging development experiences around.  We have around 5 positions that can be filled.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Where physically?  Mostly in New York, but also in Warren NJ.</span></td></tr>
<tr><td class="light"><b>subodhl82</b></td><td class="light">Hi All!</td></tr>
<tr><td class="dark"><b>RalphFurmaniak</b></td><td class="dark">I am studying pure math and computer science.  I am interested in working at citigroup when I graduate and/or as an internship.  I was wondering what would be suggested</td></tr>
<tr><td class="light"><b>RalphFurmaniak</b></td><td class="light"> for courses and how important this would be.  I will definitely be taking a couple finance math courses, but was also considering doing the finance option, though that would be hard to fit in.  What would actually be useful?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">we employ developers in London, hong kong, australia,</span></td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">amir here...  both a topcoder member and citigroup employee.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">hey, I'm Jordan. I've been at Citi for 2.5 years now</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Finance courses are useful but not necessary.  At least in Stat. Arb.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">the models are often only 10% of the solution --</span></td></tr>
<tr><td class="light"><b>BEHiker57W</b></td><td class="light">How about Dublin, Eire; San Francisco, or Salt Lake City?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">most of the rest is a very hard computer engineering problem</span></td></tr>
<tr><td class="light"><b>gt494</b></td><td class="light">citigroup2: and the other 90%?</td></tr>
<tr><td class="dark"><b>nhzp339</b></td><td class="dark">citigroup1: I am very interested in the positions in HongKong, could you tell me more?</td></tr>
<tr><td class="light"><b>mariozivic</b></td><td class="light">How about Zagreb? :)</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">we have internship opportunities.  I would suggest checking out the 'hybrid' quant and trading program</span></td></tr>
<tr><td class="light"><b>RalphFurmaniak</b></td><td class="light">So having a solid cs foundation is more useful than trying to fit in finance math?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">info is avaliable on our web site</span></td></tr>
<tr><td class="light"><b>v_ralev</b></td><td class="light">citigroup, you know it would be very interesting to show us some sample problems you've been working on, i mean post it somewhere, not explaining now...</td></tr>
<tr><td class="dark"><b>meshach</b></td><td class="dark">What are the chances of gettin into an internship if we already graduated ?</td></tr>
<tr><td class="light"><b>incessant</b></td><td class="light">citigroup1: Does your department have a presence in India ? or other departments ?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">The core positions lie in trading system and algorithm development.  We have 2 core development efforts.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">1 effort is our market making systems where we quote vanilla derivatives.</span></td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">where are you located?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">In this group ? the products are relatively straightforward to value but the data capacity is enormous.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">.  In the other group ?  ?EQTG? (equity quantitative trading group) ? we have far more complex exotic derivatives to value.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">These securities can be very complex to value and very complex to calculate in a real time trading environment.</span></td></tr>
<tr><td class="dark"><b>harvey6ft</b></td><td class="dark">What's the work environment like at Citigroup?</td></tr>
<tr><td class="light"><b>m_pico</b></td><td class="light">What programming languages do you primarly use?</td></tr>
<tr><td class="dark"><b>revtekniques</b></td><td class="dark">Java? C++?</td></tr>
<tr><td class="light"><b>vlad_D</b></td><td class="light">bc</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">All of the above (Java , C++ ) plus C# and perl</span></td></tr>
<tr><td class="light"><b>v_ralev</b></td><td class="light">vb? :P</td></tr>
<tr><td class="dark"><b>b0b0b0b</b></td><td class="dark">do you have in mind a number of positions you are seeking to fill?</td></tr>
<tr><td class="light"><b>lironk</b></td><td class="light">is the EQTG is for options using the Black-Scholes or other models/securities?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">The work environment is fast paced, but friendly; we all sit out on the trading floor</span></td></tr>
<tr><td class="light"><b>subodhl82</b></td><td class="light">How often do you take in ppl for full time positions who havent had any internship experience in citi?</td></tr>
<tr><td class="dark"><b>Krzysan</b></td><td class="dark">when is the best time to contact you about internships?</td></tr>
<tr><td class="light"><b>Aegypter</b></td><td class="light">Hallo Citigrou</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">It's a pretty cool enviornment here...we're not in cubes...it's a  gigantic trading floor.  Things can get pretty exciting when the market starts to move.</span></td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">We hire people all the time regardless of them having interships.</span></td></tr>
<tr><td class="dark"><b>rguiu</b></td><td class="dark">citi2: on the trading floor? with the brokers? Can they go and talk with your team?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Not really brokers but institutional traders, salespeople etc.</span></td></tr>
<tr><td class="dark"><b>m_pico</b></td><td class="dark">How much does a junior developer make at citgroup?</td></tr>
<tr><td class="light"><b>revtekniques</b></td><td class="light">if anyone here is interested in these positions, please contact me at jquach@topcoder.com</td></tr>
<tr><td class="dark"><b>HomemPalindromo</b></td><td class="dark">Hi. Does C</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">And yes the "geeks" and the business folks interact a good bit.</span></td></tr>
<tr><td class="dark"><b>HomemPalindromo</b></td><td class="dark">Hi. Does Citigroup do outsourcing ?</td></tr>
<tr><td class="light"><b>lironk</b></td><td class="light">john is very nice, from personal experience</td></tr>
<tr><td class="dark"><b>theMadhouse</b></td><td class="dark">What does it take to work at citigroup?</td></tr>
<tr><td class="light"><b>tolkienfan</b></td><td class="light">The description of the work your looking for seems more aimed towards understanding concurrency and reducing latency with high bandwidth and so on than algorythm design.  With that in mind, how would you describe you requirements?</td></tr>
<tr><td class="dark"><b>revtekniques</b></td><td class="dark">lironk: thanks liron</td></tr>
<tr><td class="light"><b>subodhl82</b></td><td class="light">your online application section is pretty huge</td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">what would be the best time to contact you for ft positions starting next may?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Don't you think those sorts of problems require good algorithms?</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">we work on the institutional trading floor.  there are 1000 people on the floor.  there are no brokers as it is traders and salespeople for top money managers</span></td></tr>
<tr><td class="light"><b>gt494</b></td><td class="light">subodhl82:  go here to apply http://www.topcoder.com/tc?module=Static&d1=contracting&d2=citigroup</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">we do outsource - but these are for top positions.  other groups are the most frequent users of outsourcing2005-07-19 20:14:15.238	Krzysan	do you do internships?</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">We are not looking for candidates with any set level of experience.  We are looking for candidates that are the best at what they do.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">We are looking for people that understand development at a core level ? have a solid math background and work very hard.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">This means that are hiring is more selective than almost any other positions around.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">Because of our selectivity ? we pay well in excess of most any traditional development position in or outside of wall street.</span></td></tr>
<tr><td class="light"><b>subodhl82</b></td><td class="light">gt494: ty</td></tr>
<tr><td class="dark"><b>gt494</b></td><td class="dark">subodhl82: np</td></tr>
<tr><td class="light"><b>b0b0b0b</b></td><td class="light">citigroup1: that means well over 100k+ ?</td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">I'm of the opinion, particularly with concurrency, that you need some real intuition and experience, especially when the volumes increase</td></tr>
<tr><td class="light"><b>gt494</b></td><td class="light">citigroup1: can you define core level for the group, meaning try to elaborate a little further</td></tr>
<tr><td class="dark"><b>Aegypter</b></td><td class="dark">citigroup1: Do you apply parallel computing in your applications ?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">we wont lose a person we really like.  yes - this means any top developer earns well above $100k.  There is differing levels of experience - so it does depend</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">the career growth is very visible</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">In stat. arb we do a lot of "grid" computing using a cluster of Linux boxes</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">yes, in terms of parallel comp, many of our problems scale well. we're increasing our use of cluster / grid</span></td></tr>
<tr><td class="light"><b>theMadhouse</b></td><td class="light">Do you think Citigroup is a good company to make a career?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">I've been here 10+ years, so yes.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">it may seem like a big company on the outside but every group is small.  We opperate like a small group dedicated to getting things done</span></td></tr>
<tr><td class="dark"><b>incessant</b></td><td class="dark">citigroup1: Do you have open positions in India ?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">I've had a great experience @ Citi  & have met so many people, who do such a variety of jobs.  I think there are fewer places where you can learn more</span></td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">Have you considered IBM's new cell processors?  The shear bandwidth must be tempting, although I'm not familiar with the target problems to guess whether they are suited to vector processing?</td></tr>
<tr><td class="light"><b>gt494</b></td><td class="light">citigroup1:  what is the best selling factor to work for citi?</td></tr>
<tr><td class="dark"><b>Aegypter</b></td><td class="dark">citigroup1: this is interisting, and which programming paradigms are you using ? for ex. MPI, OpenMP ?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Our groups do not have openings in India at the moment.  Other parts of Citi might.</span></td></tr>
<tr><td class="dark"><b>b0b0b0b</b></td><td class="dark">this opportunity sounds awesome, I look forward to submitting my application</td></tr>
<tr><td class="light"><b>theMadhouse</b></td><td class="light">and Gareth, how easy is for someone to increase his responsabilities?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">best selling factor is that our problem is the most interesting out there.  we only hire the best so it the people are very smart and we have a lot of fun.  work can not be a chore</span></td></tr>
<tr><td class="light"><b>revtekniques</b></td><td class="light">b0b0b0b: I will be sending you an email shortly</td></tr>
<tr><td class="dark"><b>b0b0b0b</b></td><td class="dark">revtekniques: cool, thanks</td></tr>
<tr><td class="light"><b>unChabonSerio</b></td><td class="light">HI</td></tr>
<tr><td class="dark"><span class="bigRed">amirshim</span></td><td class="dark"><span class="bigRed">Aegypter: We usualy code multithreaded code directly... we found that we can usually do better than OpenMP and MPI.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">i run the group developing relative value trading algorithms.  i am 28.  it is a big meritocracy</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">There is not a lot of heirarchy -- so you can move up fast if you have what it takes.</span></td></tr>
<tr><td class="light"><b>Aegypter</b></td><td class="light">citigroup1: So you are using your own library</td></tr>
<tr><td class="dark"><b>theMadhouse</b></td><td class="dark">nice :-)</td></tr>
<tr><td class="light"><b>b0b0b0b</b></td><td class="light">also, thx for sponsoring some srm's</td></tr>
<tr><td class="dark"><b>unChabonSerio</b></td><td class="dark">thnks</td></tr>
<tr><td class="light"><b>Aegypter</b></td><td class="light">citigroup1: Does your applications usually scale with parallelizaation ?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">we've been playing around with Intel's vector libraries and have I think there are some big breakthrough that can made in using vector techniques for derivatvies pricing</span></td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">Aegypter: we are... and we can tailor it to exactly what we want.  I find the OpenMP is not that usefull for our problems.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">most of our applications are relatively large grained and scale quite easly.</span></td></tr>
<tr><td class="light"><b>Aegypter</b></td><td class="light">citigroup1: I guess openmp is limited and doesn't scale up with a lot of processors</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">our problem is inherently parallized.  ie we have a predictive model for a given stock or option.  we need to value a complex derivative.  this means that poor man's parallezation works quite well.  you dont need to do much to get grid computing to work</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">As I said before, we find the grid paradigm very useful for trying out new ideas very quickly.</span></td></tr>
<tr><td class="dark"><b>parker</b></td><td class="dark">Is any financial/accounting/economic knowledge required for positions?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">no.  we will teach that.</span></td></tr>
<tr><td class="dark"><b>meshach</b></td><td class="dark">What is required?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">But apptiturde (i.e. some math) and interest are.</span></td></tr>
<tr><td class="dark"><b>theMadhouse</b></td><td class="dark">How easy is for someone to propose new ideas to his/her boss? and to make the come true?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">math is.  we can't teach math and technical knowledge.  finance is easy if you know math</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Intelligence and programming skills are required.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">no finanace background required...though you have to be interested in learning</span></td></tr>
<tr><td class="dark"><b>unChabonSerio</b></td><td class="dark">VARISHKY NOTTA!!!!</td></tr>
<tr><td class="light"><b>subodhl82</b></td><td class="light">how long is the training program for fresh grads?</td></tr>
<tr><td class="dark"><b>meshach</b></td><td class="dark">that's great, how do we apply?</td></tr>
<tr><td class="light"><b>Aegypter</b></td><td class="light">citigroup1: and how many processors are you using in your grid ?</td></tr>
<tr><td class="dark"><b>salmanmanekia</b></td><td class="dark">what's a prospect for a telecom engr. having good programing skills</td></tr>
<tr><td class="light"><b>meshach</b></td><td class="light">will there be an tech exam for candidates?</td></tr>
<tr><td class="dark"><b>gt494</b></td><td class="dark">meshach:  http://www.topcoder.com/tc?module=Static&d1=contracting&d2=citigroup</td></tr>
<tr><td class="light"><b>v_ralev</b></td><td class="light">citigroup1: do you consider your applications critical? i mean if something fails could it result in a massive loss of money, bankrupts , etc. ?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">official traing depends on experience.  if a new grad - it is 2 months.  the real training is on the job. it is key who you sit next to</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">it's very easy to proposs new ideas and have them heard by senior people....The trading floor is very conducive to this. I sit literally 2 feet away from boss.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Yes the systems are critcal.  Systems errors can cost the firm a lot of money.</span></td></tr>
<tr><td class="light"><b>lironk</b></td><td class="light">is it possible to move later from thet echnical to the business?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">200 procs on our grid</span></td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">theMadhouse: it is easy to suggest ideas to your boss.. and usually they are fully accepted when they have merit.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">and growing..</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Let me ask you guys a question: How many of you (before today) were considering working in finance?</span></td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">me me me me</td></tr>
<tr><td class="light"><b>ByronC</b></td><td class="light">*raises hand*</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">we had a well publized 'bug' that caused us to accidently buy $1bil of stock in 1 second.  it didnt cost us too much money but it is a big problem.  the problem was a result of human error in combination with</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed"> a saftey check we should have had in retrospect.  it is difficult to make fault proof systems</span></td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">as a tech analyst in finance, yeah</td></tr>
<tr><td class="light"><b>lironk</b></td><td class="light">before going to software i always wanted to be a hedge fund manager</td></tr>
<tr><td class="dark"><b>harvey6ft</b></td><td class="dark">citigroup1:  what's the most challenging thing about your job?</td></tr>
<tr><td class="light"><b>BEHiker57W</b></td><td class="light">I would have liked to work in fanance, but can't persuade the family to move to Manhattan.</td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">It's practically impossible to guess what your users might do - I know that from experience!</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">We have a very nice new office (former Lucent campus) in Warren NJ if anyone is interested in working there.</span></td></tr>
<tr><td class="dark"><b>b0b0b0b</b></td><td class="dark">I know a guy who's doing programming on Wall St.  I've always found that class of problems interesting.</td></tr>
<tr><td class="light"><b>Aegypter</b></td><td class="light">citigroup2: could you give me an idea about that challenging problems which are waiting to be solved ?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Some of the alogithmic trading systems are developed there as well.</span></td></tr>
<tr><td class="light"><b>Aegypter</b></td><td class="light">citigroup2: Well I don't have any idea about finance</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">harvey6ft: most challending is that i have no idea what i will do each day.  how we will solve a problem or what tool we will need to use.  we are engineers solving hard problems via software</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">In Stat. Arb. we don't even have any models -- no one knows what the right price of a stock is.</span></td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">How are you using AI?  And what kinds?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">one things that's cool about this job, is that the users are often sitting 20 feet away. You get instant feedback</span></td></tr>
<tr><td class="dark"><b>v_ralev</b></td><td class="dark">citigroup2: ?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Don't use a lot of AI -- just normal I for the most part.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">ai is a dangerous word.  we build very intelligent algorithms to make decisitons.</span></td></tr>
<tr><td class="light"><b>tolkienfan</b></td><td class="light">haha - The description specifically mention AI</td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">I wrote an automatic option trading program but never had the guts to send it to 'production'</td></tr>
<tr><td class="light"><b>v_ralev</b></td><td class="light">citigroup2: no one knows the price? then how can you say this algo is good, this one is bad?</td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">Does it make more or less money than the last?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">you know how much money it makes each day.  that is the ultimate scorecard.  pretty fun!</span></td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">do u work on web services?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">With options you have Black Scholes; with stat. arb. all you have is induction and some behavorial finance stories to tell.</span></td></tr>
<tr><td class="dark"><span class="bigRed">amirshim</span></td><td class="dark"><span class="bigRed">subodhl82: we do web services... mostly to monitor our systems.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Yeah you find out pretty quickly if your models are working or not.</span></td></tr>
<tr><td class="dark"><b>Aegypter</b></td><td class="dark">could you give me an idea about the most challenging algorithmic problems you currently face</td></tr>
<tr><td class="light"><b>subodhl82</b></td><td class="light">oh great</td></tr>
<tr><td class="dark"><b>rguiu</b></td><td class="dark">so could I use your statistical arbitrage applications in a "betting fair" online?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">price 500,000 options simultaneously and react in less than 50ms.  buy options that are 'cheap' and sell options that are 'rich'.  looking at all that data is very hard</span></td></tr>
<tr><td class="dark"><span class="bigRed">amirshim</span></td><td class="dark"><span class="bigRed">subodhl82: but also to make quick adjustment to "security master" data... such as yield curves, etc...</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">I don't know about most challenging, but one hard one is how to represent the Level II "book" historically in a way that is fast enough to do research on and does not use all your disk space.</span></td></tr>
<tr><td class="dark"><b>Ragnarok</b></td><td class="dark">hi all</td></tr>
<tr><td class="light"><b>revtekniques</b></td><td class="light">Ragnarok: hello</td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">amirshim: are ur groups distributed all over or based in ny ?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Take a looks a "island.com" for an example of what I am talking about.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">we use KDB as a  time series database.  normal databases are too slow to look at over a terribyte of data</span></td></tr>
<tr><td class="light"><b>ByronC</b></td><td class="light">I would suppose that working steadily on the trading floor with instant feedback from those around you would be a high-pressure situation. Do you find it as stressful as it sounds?</td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">Sounds like an "encoding" problem</td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">subodhl82: Our group is based in NYC, but we do have other groups all over the world.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">The floor can be stressful at times, but I find the "white noise" easier to tune out then someone talking on the phone in the next cube.</span></td></tr>
<tr><td class="light"><b>HomemPalindromo</b></td><td class="light">/whisper alberto</td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">non techie question now: how do mergers affect groups like yours?</td></tr>
<tr><td class="light"><b>ByronC</b></td><td class="light">That makes sense to me.</td></tr>
<tr><td class="dark"><b>aaronsc</b></td><td class="dark">I have to ask what happened to the employee responsible for the well published 1Billion dollar stock bug</td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">Some jobs are more high-pressure than others, but I don't think any are really that stressful.</span></td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">how much back "historically" do you go on the Level II? How far from the "center" do you go?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">I've live through a lot of mergers and after every one the mantra is more automation and more computers....</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Can't give away all of our secrets :-)</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">nothing.  there is never 1 person.  it is a team.  we have lots of of 'bugs' at all times.  it is an optimization of which gets fixed or upgraded first.</span></td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">it wasn't for the secret...it was to estimate the amount of data...</td></tr>
<tr><td class="light"><b>BEHiker57W</b></td><td class="light">What hours do developers work in your division?  Not officially, but really.  Do people all work 9-6?  Are there Noon-10p types?  50 hours?  60 hours?  Weekends?  Does anybody ever go on vacation?</td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">60+ at least right?</td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">subodhl82: I'm actully a product of a merger.  I used to work for Knight Securities, but our subsidiary got bought by Citigroup... all it did was open up lots of opportunities.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">It depends on for what problem -- some we have many years of data.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">60 hours is my guess.  we are pretty flexible on start time.  some groups very involved in the real time systems are in early.  others come in later.  9am start is about the latest though</span></td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">amir did you work for knight all the way or arbitrade before that?</td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">arbitrade</span></td></tr>
<tr><td class="dark"><b>ByronC</b></td><td class="dark">What level of programming proficiency is expected of potential candidates? I've got a reasonable meta/pseudocode approach, but I can't seem to perfect the little things that make programs compile and run smoothly.</td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">or LCT</span></td></tr>
<tr><td class="dark"><b>rguiu</b></td><td class="dark">do you use any kind of software enginering methodology, writing good documentation, code reviews? Or basically is fix this now and write docs afterwards if you have time.?</td></tr>
<tr><td class="light"><b>yiuyuho</b></td><td class="light">he</td></tr>
<tr><td class="dark"><b>yiuyuho</b></td><td class="dark">dump question</td></tr>
<tr><td class="light"><b>yiuyuho</b></td><td class="light">how u get rig of the system tells</td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">amirshim: are u more centered using java or .net?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">we are c++ and c#.  very little java</span></td></tr>
<tr><td class="dark"><span class="bigRed">amirshim</span></td><td class="dark"><span class="bigRed">subodhl82: Our group does more .net development than Java.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">Whereas my group uses c++ and java and no C#</span></td></tr>
<tr><td class="dark"><b>GoodBoyFrancis</b></td><td class="dark">very little java? no web apps using java?</td></tr>
<tr><td class="light"><b>m_pico</b></td><td class="light">i find it hard to believe that c# can do anything in 50ms</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">c++ for high speed.  c# for more and more.  even the algorithms are mostly being developed in c# now</span></td></tr>
<tr><td class="light"><b>TAG</b></td><td class="light">citigroup1: Have you found  candidates for your positions since last SRM/chat ??</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">m_pico: that part is c++..  C# is remarkably quick though</span></td></tr>
<tr><td class="light"><b>butler</b></td><td class="light">How do you think C# compares to java?  Is there any reason one group uses java rather than C#?</td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">server side java i would have guessed</td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">m_pico: .net is a very powerful platform, JIT can has great performance... as long as you use it carefully.</span></td></tr>
<tr><td class="dark"><b>jay_holla</b></td><td class="dark">citigroup1: are you guys currently recruiting fresh grads?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">we generally build our people right out of school.  we try to avoid the people that perpetually flip jobs.  everyone on this chat more or less has been at citi since their career began</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">There is a lot of server side Java -- C# is just newer so there is less of a base.</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">yes, we are looking for reecnt college grads. we don't care about experience. We want smart people.</span></td></tr>
<tr><td class="dark"><b>doctor_dark</b></td><td class="dark">I would assume that J2EE would offer a lot of server side functionality that would be hard to cover with .NET</td></tr>
<tr><td class="light"><b>butler</b></td><td class="light">How do you determine who is a "smart person?"  Do you have tests administered during the interview process?</td></tr>
<tr><td class="dark"><b>mehfish</b></td><td class="dark">citigroup1: so do you not value finance/options/trading experience?</td></tr>
<tr><td class="light"><b>subodhl82</b></td><td class="light">amirshim: hi i had asked this before, i will be graduating in may 2k6, then what would be the best time to contact you for ft positions?</td></tr>
<tr><td class="dark"><b>kngenius</b></td><td class="dark">g</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">doctor_dark: code base is less important as much is very specific algorithms vs. code base needed for 'standard' tasks.  littly of our development is standard</span></td></tr>
<tr><td class="dark"><b>TAG</b></td><td class="dark">subodhl82: in 3k0 ;-)</td></tr>
<tr><td class="light"><b>jdcarr</b></td><td class="light">I keep hearing from employers that it's a concern if your resume reports that you've been at the same job for more than say, five years.  Would you agree?</td></tr>
<tr><td class="dark"><b>m_pico</b></td><td class="dark">what about more expressive languages like lisp or ml ?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">we start fulltime recruiting for college grads in the fall</span></td></tr>
<tr><td class="dark"><b>karthik</b></td><td class="dark">citigroup1: is the recruitment process for a tech job at citigroup global - because as far as I saw in Singapore most of the vacancies were related to investment banking</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">I would say the opposite: I am suspicious of people who move around too often.</span></td></tr>
<tr><td class="dark"><b>Ragnarok</b></td><td class="dark">citigroup3: so, you are looking for smart people. I'm smart ;). What shall I do or can I do to contact with you and to get a job?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">karthik: we do little to no development in singapore.  hong kong yes..</span></td></tr>
<tr><td class="dark"><b>gt494</b></td><td class="dark">Ragnarok:  apply here: http://www.topcoder.com/tc?module=Static&d1=contracting&d2=citigroup</td></tr>
<tr><td class="light"><b>revtekniques</b></td><td class="light">subodhl82: you can send me an email a couple months prior to your graduation date... jquach@topcoder.com</td></tr>
<tr><td class="dark"><b>jdcarr</b></td><td class="dark">what would you consider "too often"?</td></tr>
<tr><td class="light"><b>coshx</b></td><td class="light">how much of the time would you say you're doing research, and how much of the time are you just coding?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">Ragnarok: talk to the topcoder people to get in touch with me</span></td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">In my mind you're never "just" coding.   Most of my research is coding.</span></td></tr>
<tr><td class="dark"><b>revtekniques</b></td><td class="dark">Ragnarok: sent you an email... :)</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">But it really depends on what you're doing.  Everyone in our group spends most of their day writing software.</span></td></tr>
<tr><td class="dark"><b>Ragnarok</b></td><td class="dark">citigroup3: ok, thank you.</td></tr>
<tr><td class="light"><b>czar</b></td><td class="light">citigroup1: have you hired any topcoder members since the last chat session?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">A lot of which does research.</span></td></tr>
<tr><td class="light"><b>karthik</b></td><td class="light">citigroup1: so are the tech positions completely country specific - i.e can i apply for one from a different nation?</td></tr>
<tr><td class="dark"><b>Ragnarok</b></td><td class="dark">revtekniques: and thank you.</td></tr>
<tr><td class="light"><b>jdcarr</b></td><td class="light">practical question: what would be the average salary for a new developer fresh out of college?</td></tr>
<tr><td class="dark"><span class="bigRed">amirshim</span></td><td class="dark"><span class="bigRed">coshx: It depends on what you consider research... If you consider design to be research then 90/10 (r/code)</span></td></tr>
<tr><td class="light"><b>coshx</b></td><td class="light">citigroup2: well, the way i look at programming is that we research the algorithms and the design, and then the code's pretty straightforward, but we still need to hack it out. i was just wondering how much you spend considering algorithms/design.</td></tr>
<tr><td class="dark"><b>TAG</b></td><td class="dark">citigroup2: Have you hired / contacted some TopCoder's since  last chat/SRM ??</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">czar: no.  we have hired since.  but not topcoder yet.   we have a high reject ratio.  we are very demanding.  We have interviewed quite a few and a number are still in the process</span></td></tr>
<tr><td class="dark"><b>revtekniques</b></td><td class="dark">TAG: they are in the process of interviewing TC members</td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">research and coding are part of the same beast...the job is not about sitting in room with a whiteboard and coming up with super-fantatastic models.  If I spend a day building a framework backtest trading strategies, is that research or coding?</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">It will involve looking at lots of data but interspresed with programming refinments</span></td></tr>
<tr><td class="light"><b>tolkienfan</b></td><td class="light">It's research</td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">And fun</td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">It's lots of fun.</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Ditto</span></td></tr>
<tr><td class="light"><b>smartgirl</b></td><td class="light">Thanks. So basically you want research people.</td></tr>
<tr><td class="dark"><b>czar</b></td><td class="dark">citigroup1: I am just curious what color were the topcoder members whom you have rejected?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">That said, not everting we need is reasearch.  Other fun projects involve making transactions faster, or processing more market data, etc.</span></td></tr>
<tr><td class="dark"><b>coshx</b></td><td class="dark">czar: i think they are an equal opportunity employer :)</td></tr>
<tr><td class="light"><b>smartgirl</b></td><td class="light">I am curious about that too. in your mind, topcoder of what color will be considered? thanks</td></tr>
<tr><td class="dark"><span class="bigRed">amirshim</span></td><td class="dark"><span class="bigRed">smartgirl: smart and motivated.</span></td></tr>
<tr><td class="light"><b>czar</b></td><td class="light">citigroup1: oh sorry I meant color = rating</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup3</span></td><td class="dark"><span class="bigRed">Or even building better visualization tools...how do you aggregate 500,000 prices and lets people quickly drill down in reall time to see what's going on in the market?</span></td></tr>
<tr><td class="light"><b>czar</b></td><td class="light">citigroup1: in the context of rating</td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">You can't judge a coder by their color!</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">we have positions that are more research like.  we also have more pure development.  dont be scared if you are more on the development side than a hybrid quant / developer</span></td></tr>
<tr><td class="dark"><b>gt494</b></td><td class="dark">great chat session btw!</td></tr>
<tr><td class="light"><b>tolkienfan</b></td><td class="light">What do you mean by "quant"?</td></tr>
<tr><td class="dark"><b>Xero</b></td><td class="dark">zylum: ready to get pwned?</td></tr>
<tr><td class="light"><b>Ragnarok</b></td><td class="light">What do you mean, pure development?</td></tr>
<tr><td class="dark"><b>smartgirl</b></td><td class="dark">by color I meant "rating"</td></tr>
<tr><td class="light"><b>ByronC</b></td><td class="light">I feel like I've really learned a lot about the company and positions, although I'm still a little curious about the corporate culture, as it were.</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">quant is the wall street term for 'math' propeller heads building the math models that run trading businesses.</span></td></tr>
<tr><td class="light"><b>kray42</b></td><td class="light">Are you interested in "experienced" coders.</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">Quant means more mathematical research as appsoed to programming.</span></td></tr>
<tr><td class="light"><b>theMadhouse</b></td><td class="light">When would you consider that someone is too old to get one of the open positions?</td></tr>
<tr><td class="dark"><b>doctor_dark</b></td><td class="dark">citigroup1: what would be the average startup salary you pay to a new College Graduate hire ?</td></tr>
<tr><td class="light"><b>jdcarr</b></td><td class="light">echo doctor_dark</td></tr>
<tr><td class="dark"><b>czar</b></td><td class="dark">tolkienfan: yes but I can probably estimate the likelyhood that I would land a job with citi based on the ratings of the coders they have rejected</td></tr>
<tr><td class="light"><span class="bigRed">citigroup1</span></td><td class="light"><span class="bigRed">we care very little about experience, age, or anything other than ability and desire to build really cool things</span></td></tr>
<tr><td class="dark"><b>RedSpectra</b></td><td class="dark">Hmm, guess I'm outa luck =)</td></tr>
<tr><td class="light"><b>RedSpectra</b></td><td class="light">okay, I'm not outta luck then!</td></tr>
<tr><td class="dark"><b>entaroadun</b></td><td class="dark">what about academic background?</td></tr>
<tr><td class="light"><span class="bigRed">citigroup3</span></td><td class="light"><span class="bigRed">we're not going to talk about specific salary figures. But we have never had anyone reject us for money. We are very competitive and then some</span></td></tr>
<tr><td class="dark"><b>ByronC</b></td><td class="dark">I can do anything I put my focus to; it's just a matter of getting my foot in the door.</td></tr>
<tr><td class="light"><b>doctor_dark</b></td><td class="light">citigroup3: thanks</td></tr>
<tr><td class="dark"><b>tolkienfan</b></td><td class="dark">Yeah, thanks guys!</td></tr>
<tr><td class="light"><b>ByronC</b></td><td class="light">And not having it squashed by the impact.;-)</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup2</span></td><td class="dark"><span class="bigRed">One of my best developers did not finish college; that said a degree from a good school means is often an indicator that a person is smart.</span></td></tr>
<tr><td class="light"><b>jdcarr</b></td><td class="light">citigroup3: alright...not discussing your salaries then...but just in general, what should I ask for, salary wise?</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">you would not necessarily guess what we look for... desire and drive is key.  there are also positions in groups like QA, support and other groups that can be a great way to get in the door.</span></td></tr>
<tr><td class="light"><b>revtekniques</b></td><td class="light">very informative chat session!</td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">apply and be open about what you are looking for.</span></td></tr>
<tr><td class="light"><b>ZiaRahman</b></td><td class="light">citigroup3: i disagree with you. I work for Citigroup. It's not the same in every part of Citi.</td></tr>
<tr><td class="dark"><b>Aricle</b></td><td class="dark">jdcarr: There's really no way to answer a question like that.</td></tr>
<tr><td class="light"><span class="bigRed">amirshim</span></td><td class="light"><span class="bigRed">ByronC: Since the teams are so small, you really aren't affected by the company being so big... You really only interact with a relatively small amount of people...</span></td></tr>
<tr><td class="dark"><b>RedSpectra</b></td><td class="dark">Good luck all...</td></tr>
<tr><td class="light"><b>smartgirl</b></td><td class="light">Thanks to all citigroups. nice chat</td></tr>
<tr><td class="dark"><b>parker</b></td><td class="dark">Good luck.</td></tr>
<tr><td class="light"><b>ByronC</b></td><td class="light">amirshim: Ahh. Thanks for the answer!</td></tr>
<tr><td class="dark"><b>subodhl82</b></td><td class="dark">ty citi</td></tr>
<tr><td class="light"><b>karthik</b></td><td class="light">thanks citigroups. very useful session</td></tr>
<tr><td class="dark"><b>ByronC</b></td><td class="dark">Good chat; now, time for the coding!</td></tr>
<tr><td class="light"><b>doctor_dark</b></td><td class="light">citigroup3: good luck, may your colors rise</td></tr>
<tr><td class="dark"><b>mariobros</b></td><td class="dark">Yeah... GL everyone!</td></tr>
<tr><td class="light"><span class="bigRed">citigroup2</span></td><td class="light"><span class="bigRed">yeah, good luck everyone....</span></td></tr>
<tr><td class="dark"><span class="bigRed">citigroup1</span></td><td class="dark"><span class="bigRed">the group is key.  we are a small group.  many groups are bad.  you have to know the group.  in a company our side - there are great groups and bad groups.  there is no way to have every group be great in such a big company</span></td></tr>
<tr><td class="light"><b>ZiaRahman</b></td><td class="light">citigroup3: ty</td></tr>
</table>

        <p><br></p>
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
