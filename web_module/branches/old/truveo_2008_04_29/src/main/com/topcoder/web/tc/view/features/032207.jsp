<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="514812" message="Discuss this article" />
</div>

<span class="bigTitle">The Last 20 Feet</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10407399" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>"It is no longer about solving the problem of the last mile&#8230; now it is just the last twenty feet."</p>

<p>For a few years now, there has been plenty of buzz about the "last mile problem" -- the final leg of communications connectivity between service provider backbones and the end customer.  The extent to which this is a problem depends largely on geography, although for much of the United States there are multiple solutions available. Whether or not "last mile" connectivity is an issue, we all have to deal with what happens once the signal reaches our walls. And while the first 99.7% or so of that last mile is generally someone else's problem, it's up to us to figure out the best possible path for the most important of it -- the last twenty feet.</p>

<p><span class="bodySubtitle">A Surprising Experience</span><br />
In the past month, I moved. Formerly, I was living in a city of more than 100,000 people. Now, I live a town of about 1,500, which has a whopping 18 miles of road in total. Not surprisingly, some things changed: I have more snow to shovel in the winter, and interesting ethnic food is harder to find. My Internet access has also changed but, contrary to my expectations, it's actually gotten faster.  What gives?</p>

<p>My decision to move was the sum total of many factors, but all the while, concern about the availability of broadband Internet access was a concern in the back of my mind.  Important for business and well as pleasure, it was a welcome surprise to learn that cable Internet access was an option.  Once the installation was completed, I IMed my wife from work and asked her to run a bandwidth speed test (if you've never run a speed test, you can try a free one <a target="_blank" href="<tc-webtag:linkTracking link='http://www.speedtest.net' refer='feature_032207' />">here</a>).  That is when I got the surprise that our connection speed had doubled.  This in mind, I have concluded that the availability of broadband in this country is overall very good.  But yet, there was one common problem I faced at either residence&#8230;</p>

<p>Both DSL and cable are, obviously, wired technologies.  Between televisions, computers, and telephones, a fair portion of our interior design considerations were dictated by nothing more than the locations of existing cables and power outlets.  Now, of course there is the option of running new cables, but there are reasons why this may not be ideal.  When renting, in particular, you may not want to pay for the cost (and trouble) of installing cable.  Also, the construction of the house may affect the overall difficulty in running the cable at all.  In my own experience, both my current and previous residences are older constructions (built in the early 1900s), and neither is terribly conducive to pulling cable. How do I make the most out of our new broadband connection?</p>

<p><span class="bodySubtitle">Introducing Home Networking</span><br />
A few years ago, when broadband access first become widely available in this country, a wide range of companies introduced a variety of products for the home consumer market that purported to make setting up a home network a snap.  Their advertisements depicted kids and parents online at the same time (no more fighting over the family computer!), or everyone in the house sharing the same printer.</p>

<p>Wireless technology (read as: 802.11b, then later 802.11g) were still fledgling technologies, and a bit more costly than they are today.  With hardwired (CAT-5) ethernet still reserved mostly for professionals and hardcore geeks, there were several interesting offerings that promised to network your house through your existing electrical infrastructure, telephone jacks, or other surprising means.</p>

<p>Not surprisingly, though, when you try to use an element in your home's existing infrastructure for something other than its primary purpose you're going to encounter shortcomings.  Results vary, depending upon factors like length of the wire runs and interference from other electromagnetic sources.  That said, power line networking comes in various flavors, with transfer rates in the 3-15 Mbps range.  Whether this meets your needs is your call, but even at the low end this is still faster than most typical household broadband connections.  If internal communications are a critical need, though, you might find this level of performance insufficient for transferring large files from your desktop to your laptop, for instance.</p>

<p>As wireless technology has become more popular and less expensive -- wireless routers can easily be found for $50 or less -- these home networking solutions seem to be disappearing, although some can still be found on store shelves.</p>

<p><span class="bodySubtitle">Wireless Saves the Day?</span><br />
Wireless networks, particularly within the home, have become increasingly commonplace, and for good reason.  They are inexpensive, easy to install (no wires!), and most basic consumer models are very easy to configure.  Some broadband providers have even started to offer wireless home networking as a special add-on service, often with a small monthly fee.  Needless to say, it is generally not worth spending an extra $15 a month to rent a piece of equipment that can be purchased for $50, but I guess I can't fault cable companies for trying -- it must be profitable.</p>

<p>But back to the original problem of setting up a home network.  Is wireless always the best option?  Well, depending on your level of precaution (or paranoia) towards security, there is certainly room for concern.  There is always some inherent risk in any system that can be accessed without having to physically connect.  Of course, a proper setup should employ any of the several wireless security standards, such as WEP or WPA, but those systems are not foolproof (and too often, are not enabled correctly).</p>

<p>Wireless comes is a few different flavors, namely 802.11b, 802.11g, and the newly emerging 802.11n.  The main distinctions are the speed and distance the signals can travel, although there is a good degree of backward compatibility as well.  802.11b achieves speeds of up to 11Mbps, whereas 802.11g can pump out up to 54Mbps.  802.11n, still somewhat in progress, matches 802.11g's speed but improves on its range.  Of course, achieving day-to-day performance that matches with the theoretical maximum is rarely the case.</p>

<p>Even putting aside potential security issues for a moment, wireless is still far from the end-all solution to home networking.  Some types of building construction (again, particularly older structures like the one I live) may not lend themselves as well to getting a good wireless signal easily.</p>

<p>Also, it is worth pointing out that while laptops often include a wireless adapter nowadays, most desktop machines do not.  Of course, PCI wireless networking cards are readily available, and easy enough to install.  But while wireless networking makes a lot of sense in the case of laptops, it seems unnecessary for a system that will never move.</p>

<p><span class="bodySubtitle">My approach</span><br />
There is no single best option that will solve every problem.  Personally, my primary needs are a functional and reliable connection for my desktops and a more flexible solution for laptops, so I have opted for a combination of wired ethernet and 802.11 wireless -- desktops are hardwired, and laptops are wireless. While my wiring skills do not compare to a professional who routinely wires buildings for a living, I am pretty happy with the results.</p>

<p>I located my desktop in a little basement office area, near where the cable enters the building. Since I set up this area from scratch, I was able to minimize the distance my cabling covers (I cut my "last 20 feet" down to less than 10, a few short ethernet patches and a coax cable coming down from the ceiling). All the while, I have been conscious to avoid having cables running too close to electrical wiring or coming near other electromagnetic sources that could conceivably mess with it.  (Granted, the likelihood of such trouble is minimal, but why not take the extra effort to do it right?)  Speed has not really changed since that initial bandwidth test, but I do check regularly just to make sure something unexpected hasn't occurred.</p>

<p>Is it a perfect solution?  Of course not.  But so far, my desktop in the basement hasn't lost its connection in the middle of an SRM, and I've been able to use my laptop upstairs without running an ethernet cable across the bedroom floor -- which makes my wife happy, and that is a good thing.</p>

<p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
