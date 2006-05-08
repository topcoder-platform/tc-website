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

<table width="100%" border=0 cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">AJAX, my boy, AJAX.</span><br>
05.05.06 7:00 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
When I first read the title to the Next Generation Development Round Table, I immediately thought of
<a target="_blank" href="/?t=sponsor&c=link&link=http://www.imdb.com/title/tt0092455/">one of my favorite TV shows.</a>  I thought it would refer
to such development processes as <a target="_blank" href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Extreme_Programming">XP</a>, 
<a target="_blank" href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Service-Oriented_Architecture">SOA</a> or some other heavily-hyped 
process.  After reading the executive summary, thought, I saw that it promised to describe the effect
of new user interface paradigms on development.  However, I still had no idea what the actual technology
or paradigms <i>were</i>.
<br/><br/>
User interfaces have evolved greatly since the old punch-card days.  We moved from punch-cards, being
handled by the high priesthood, to command line, to mouse-and-menu GUIs, and finally Web.  What? "Isn't web
just a model on top of the GUI?" I asked the presenter, Andy Lamora (a TopCoder Project Manager.)  The answer
was yes, it is a model on top of GUI, but it was actually a step backwards (indeed, even all the way back
to the punch-card days.)  You give a web application input, and you have to wait (sometimes multiple seconds)
for its output.  He showed a cute graphic with the analogy that we used to give punch cards to the mainframe
and get paper tape or other output in response some hours later.
<br/><br/>
Along the way, web application (middle-layer) architectures evolved, but the front end still suffered from the need for users to download a run-time separate from the browser (either applets, Flash, or Java Web Start).
<br/><br/>
So what can be done to improve this situation, to change the paradigm for web applications?  
Like the family friend in <a target="_blank" href="/?t=sponsor&c=link&link=http://www.imdb.com/title/tt0061722/">The Graduate</a> who said "Plastics, my boy, plastics", the
answer here was "AJAX, my boy, AJAX".  
<br/><br/>
I won't go into the details of <a target="_blank" href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Ajax_%28programming%29">AJAX</a> here, but 
I will outline some of the implications
that Andy talked about.  First of all, instead of loading a humongous application (equivalent to a
full-page refresh), you can load just small parts at a time (only the part of the page you need.)  Since this
is in the background, you can dynamically offer new options in controls, or dynamically change the behavior
or appearance of controls to help guide the user to do what they want to do.  (Andy advised that
what those controls should be screaming at their users is "Grab me here, touch me there."  Hey, what happens in 
Vegas, stays in Vegas, right?)
<br/><br/>
Secondly, there is now a <i>blurred boundary</i> between the front and back ends.  Who codes the JavaScript?
The designers? The middle-ware developers?  Is AJAX part of the UI?  Is it programming?  Is it Architecture?
The answer is that you have to apply the same good software design and development practices to an AJAX-based
application as you would to any other web- or non-web-based application.  As a result, "Programmers program,
designers design," as one of Andy's slides pointed out.  Model-view-controller designs should still reign supreme,
as they did for client-server and Plain-old-web-apps (POWAs -- hey, I coined a phrase!)
<br/><br/>
You should use <a target="_blank" href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Design_pattern_%28computer_science%29">Design Patterns</a>, 
most notably the Command Pattern, which becomes critically important
if you want to implement an entire application within the browser. A great example is the "Undo" command. Instead of
refreshing the whole page, you could implement the Command Pattern in JavaScript, only undoing the sections of the
page that need to be reverted.  Also, the Observer Pattern comes into play, because of the Asynchronous aspect of
AJAX.  You use callbacks, which implement the Observer Pattern, to make sure the right data goes to the right
controls at the right times.
<br/><br/>
Similar to the <a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=dplass_8">CBSE</a>
 approach, you should build libraries of JavaScript files instead of using an ad hoc
method of putting some in the &lt;head&gt; and some in .js files.
<br/><br/>
Andy then pointed out the benefits and drawbacks of XMLHttpRequest versus IFrames. Right now, XMLHTTPRequest does not have easy, standard universal support in all browsers.
Internet Explorer 7 will do away with the need to have ActiveX enabled; the default setting is that ActiveX is
disabled in IE 6, causing many users to not be able to take advantage of AJAX.  (The irony is that Microsoft
invented the XMLHttpRequest object, which is the basis for all AJAX communications.)  Security is an issue for all
AJAX applications, not on the browser side, but also on the server side.  You have either control all security
on the server (e.g., single sign on), or somehow open up multiple connections from the browser, which is clumsy.  This may
be ameliorated (take that, <tc-webtag:handle coderId="21471147" darkBG="true" />!) by a Service Oriented Architecture approach, whereby you
can more easily manage the security in the Service container.
<br/><br/>
Finally we closed up with describing the acceptance and future of AJAX.  Already, JSF can support AJAX, and Microsoft
has released its Atlas product.  Ruby on Rails supports it out of the box.  We have all seen Google Maps, one of the
first widely-used AJAX applications, GMail, and Flikr, not to mention Google Suggest (which has been around almost since the word AJAX
was coined.)  In the future, SOA will interact with AJAX applications as I mentioned above, and ASP (Application Service
Providers) may benefit after years of decline, because users will once again be able to run "full-fledged" applications
within their browser.
<br/><br/>
Among the questions posed by the mostly-non-TopCoder-member audience (save myself, <tc-webtag:handle coderId="119676" darkBG="true" /> and <tc-webtag:handle coderId="150498" darkBG="true" />), two stood out that may be of concern, especially if TopCoder is to get into the AJAX
component business:
<ol>
<li><tc-webtag:handle coderId="119676" darkBG="true" /> asked if the server side is still in a state of flux?  Andy felt that for new applications,
it is still straightforward to design AJAX on both the server and client side from the gound up, using well-established
software engineering processes. </li>
<li>Another question was regarding unit testing of AJAX components.  Unfortunately, since
there is no standard for the implementation of these components, there is no standard for the test of these. 
(Hmm, I smell a new component for the TopCoder Component Catalog!)
</li>
</ol>
<a target="_blank" href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Overlord_meme">I, for one, welcome our new AJAX overlords.</a>  I look forward to working with the assorted designers, HTML coders
and other talented folks, to implement AJAX-based applications the "right way", using TopCoder Components.
<br/><br/>
<hr/>
All this was going on at the same time as the Algorithm Finals in the other room.  When I got back, <tc-webtag:handle coderId="144400" darkBG="true" />
had already submitted his 250 point problem for over 245 points.  Wow!  Also, the CDDC Final Development
appeals phase was almost done; <tc-webtag:handle coderId="287614" darkBG="true" /> was done fixing his configuration so he could finally re-run
his Accuracy tests and resolve the last of the appeals.  I know we're all anxiously waiting the results (also so I can
blog them!)
<br/><br/>
AJAXly yours,<br/>
--DP
<br/><br/>
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
