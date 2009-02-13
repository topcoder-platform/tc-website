<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Episode I: The Phantom Menace</span><br>
05.02.06
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
<em>
"A long time ago, in a galaxy far, far away..."
<br><br>
Some of us were waiting for this event for over twenty years.  For some of us, though, it was 
"just another movie."  Some of the names were familiar (Obi-Wan, Skywalker) and some of them are new
(Qui-Gon, Darth Maul).  We somehow knew where things are going to wind up - somebody would win (and
we all have our favorites) and somebody would lose, and there would be a tragedy and a triumph.
<br><br>
It was but the first story in a multi-part "epic saga" which began in orbit over a planet
called Naboo.
</em>
<hr/>
"May 2, 2006. The TopCoder Open 2006, in Las Vegas, Nevada."
<br><br>
Some of us<a href="#1"><sup>[1]</sup></a> have been waiting for this event for almost 5 years.
For some of us, though, it's "just another TCO".  Some of the names are familiar (<tc-webtag:handle coderId="119676" darkBG="true" />, 
<tc-webtag:handle coderId="144400" darkBG="true" />), and some of them are new.  We know where things are going to wind up - somebody will win 
(and we all have our favorites) some will lose, and there's always a tragedy and a triumph.  
<br><br>
This is but the first entry in a multi-part "epic saga" describing the TCO, which began this morning in a city called New York.
<br><br>
Before I go any further, I would like to thank TopCoder for sending me here. It's really the "chance of a lifetime" to have the privilege
to participate in the TCO, even if I have to "earn my keep" by engaging you, gentle reader, in an ongoing, possibly corny,
usually emotional, and never unexciting, series of blog entries that will bring you my views of the TCO, with an
eye towards the Component Design and Development competitions this year.
<hr/>
Waiting in the airport this morning, I was looking at every person who went by, hoping they were going to the TCO.  I (of course) was wearing my
TCO (03) shirt, but had a sweatshirt on over it, because I always get cold in planes.  I didn't see anyone I "knew" but still had
hopes up.  The flight itself was uneventful, but LOOOong.  It's been a while since I've last flown, and I was glad to have the aisle seat, so I could
stretch my legs when I needed to.  It was hard to see exactly where we were, but flying over the Rocky Mountains is always a thrilling
sight.  We started passing over Utah and Nevada, and we were able to see parts of the Painted Desert, and Lake Mead (which 
I recognized also from a recent National Geographic which described how the lake had dropped about 100 feet, exposing salt deposits
along its shores.)
<br><br>
After landing, I made my way out to the shuttle bus (which didn't have my name on the list, but they believed me, and when I said I was with
TopCoder, they gave me the chits.)  When I was waiting on the bus, I saw three guys with TopCoder iteraries in their hands --
<i>Omigosh</i> the first "real" TopCoders I'd meet in person!  They got on, but none noticed my TCO shirt.  One of them sat next to me.  I didn't get his
name (my apologies) but we made some smalltalk along the way.  He was from China and he had been to Las Vegas in 2002.  
They were staying here at the Aladdin, but I'm at Bally's, just down the road.
<br><br>
It's been over ten years since I've been here in Las Vegas, and boy have things changed.  The Strip is about twice as long now (before,
it ended at the Luxor, and many of the hotels inbetween there and Caesar's Palace are new as well.)  It's very exciting to be back, and 
I was like a kid in a candy store, just soaking up all the bright lights and glitter.
<br><br>
On the interminable bus ride, we dropped off some tourists at various hotels.  I noticed a <b>lot</b> of water flowing down to Las Vegas Boulevard,
which seemed like a waste to me, especially since we're in the middle of the desert!  When the bus got closer to the Monte Carlo there were a bunch
of engineer-types standing around, looking at a backhoe which had just pierced a water pipe, thus explaining the leak.  Seems like someone didn't
do their homework before digging!
<br><br>
I checked in, had a snack, and wandered over to the Aladdin, where I ran into two TopCoder staff members who recognized me before I recognized them! 
They brought me "backstage" to the "war room" and quickly introduced me to the myriad of staff already there.  Forgive me but I am still working
on who is who.
<br><br>
The staff was really nice, and "accepted me as one of their own."  They let me hang out around the competition arena itself, which, as it turned out, 
was strictly off-limits to the competitors.  <tc-webtag:handle coderId="144400" darkBG="true" /> knocked on the door with one of the TopCoder staff, and I got to chat with them a bit 
(mostly about what to eat, and where, for dinner).  I spent a while talking with <tc-webtag:handle coderId="305384" darkBG="true" />, <tc-webtag:handle coderId="7267401" darkBG="true" /> and <tc-webtag:handle coderId="156859" darkBG="true" />, 
each of whom have a distinctly different view of the event that is the TCO.  I learned a little bit about how the onsite and "public" arena 
networks are 'intertwingled' (that's a word sometimes heard at 2 Penn, hi guys).  I also met <tc-webtag:handle coderId="154754" darkBG="true" />, also an <a href="/?t=sponsor&c=link&link=http://web.mit.edu">MIT</a>
alum, who was present as a representative for UBS, a TCO sponsor. He said it was his first time onsite as NOT a competitor.  Mine too, in a way. ;-)
<br><br>
And then.... my biggest thrill so far. Little-known fact: TC staff test the algorithms arena before the competitors see it.  They allowed me to "compete" too,
which was awesome.  Here I was, <i>in the actual physical onsite arena</i>, working on SRM problems!  I even made it onto the 
<a href="/i/tournament/tco06/blogs/dplass_1.jpg">onsite leader board.</a>  That's me there in first place, ahead of <tc-webtag:handle coderId="156859" darkBG="true" />.  It was
eerie, doing SRM problems with other people around!  Also, there were no plug-ins, so I had to actually type the name of the
class, and the method signature.  It's been over 2 years since I've had to do that, and it takes some getting used to. 
(Full disclosure: It was a div 2 problem set from <a href="/stat?c=round_overview&er=5&rd=9813">SRM 292</a>
-- and the 500 was the same as the div 1 250 that I actually submitted in that SRM,
so it was a bit of a gimme.  But still -- it's probably the only time my name will ever be up there.)
<hr/>
It's almost two hours until the Welcome Reception starts, and I have yet to meet any other competitors.  (<tc-webtag:handle coderId="282718" darkBG="true" />
is here too -- "I am NOT a lass" was the first thing I said to him -- I just know I'm never going to live that moniker down!)
I am almost getting used to "who is who" on the staff -- and in a little while, a whole new set of handles and names is going to be thrown at me, 
I am sure it will be thrilling, and overwhelming!  You'll hear more about the reception a little later on.
<br><br>
P.S. While waiting for the welcome reception, what do y'all think I'm doing?  I'm surfing the <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Main">forums</a>,
of course!
<br><br>
<a name="1"></A>
<font size="-2"><sup>[1]</sup>Coders like me, who never thought I'd make it
to an onsite (at least not based on my algorithm coding skills).  As you might recall from my
<a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_dplass">"Pick Me" submission</a>, I semi-qualified for TCO 2004 in the CDDC and was therefore hopeful to qualify
again for TCO 2005, but I did not.</font>
</a>
<br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="/foot.jsp" />

</body>

</html>
