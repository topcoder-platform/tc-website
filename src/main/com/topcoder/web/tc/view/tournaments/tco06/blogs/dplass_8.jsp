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
<span class="bigTitle">Secondhand Shopping: Efficient Component Reuse</span><br>
05.04.06 3:20 PM
<br><br>
<img src="/i/m/dplass_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251184" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Part of the TopCoder Software development process, and indeed, integral to its business model is to re-use components 
that are already in the <a href="http://software.topcoder.com/catalog/c_showroom.jsp">catalog</a>. This lowers costs for both obvious and non-obvious reasons.  The measurement of cost includes a variety of variables, including
the actual cost of building the component, the amount of time it takes to <em>find</em> the component to be able
to re-use it, the time it takes to <em>learn</em> how to use and integrate it, and the maintenance time.  
Non-reused components only encompass the actual development and maintenance time.
<br/><br/> 
Obviously, you lower costs by amortizing the design and development expenses (which include time, money and resources) over many projects.  A less obvious way of reducing costs is that by using well-defined components, you establish a component "vocabulary" that TopCoder architects, members and even clients themselves can use.  This vocabulary then promotes a higher efficiency when describing new projects using these components.  This is akin to the ubiquitous use of <a href="/?t=sponsor&c=link&link=http://en.wikipedia.org/wiki/Design_pattern_%28computer_science%29" target="_blank">Design Patterns</a> in software design.
<br/><br/>
The challenge, however, is for the architect or designer to be able to identify, classify, and therefore <em>find</em> 
such common components, especially when he or she is not familiar with the entirety of a catalog.  There
are hundreds of modules in the TopCoder catalog, which encompasses
a variety of useful components, ranging from front-end components (such as a calendar JSP tag) to database access mechanisms, as well as some domain-specific projects (such as a currency manipulation library.)  No one person could reasonably be expected to be intimately familiar with every component in the library.
<br/><br/>
In his <a href="/i/tournament/tco06/blogs/secondhand_shopping.ppt">presentation</a>, TopCoder project manager <tc-webtag:handle coderId="279551" darkBG="true" /> described a Component Based Software Engineering (CBSE) methodology and how a high "Reuse Maturity Level" can reduce costs. A component library needs to provide three services:
<ol>
<li><b>Publish</b> the components - this also includes the specifications and code itself, and notifying users
about the new or updated component. </li>
<li><b>Manage</b> the components - which includes organizing them, publishing results of QA tests, and maintaining the
versions of components.</li>
<li>Allow users to <b>consume</b> the components - this includes searching for (and finding!) components, and also
the component specifications. This is significant because there
may be a need to redevelop a component for a different operating system or implementation type. Users need to be able
to request a new component if needed as well.</li>
</ol>
As I mentioned before, being able to quickly find a component that you're looking in a library for is essential so 
you can take advantage of the components that are in there.  If you can reduce this time, and reduce the
<em>perceived</em> effort to re-use an existing component in comparison to the <em>perceived</em> cost of building it from scratch, you can increase the re-use of previously built, tested and documented components.  A point that I made during the talk was that this <em>perceived</em> effort actually may rely on ancillary documentation such as tutorials and "recipe books" that the user can rely on to decide whether or not they should use the component, and more importantly, <em>how</em> to use the component.  If the user can't figure out how to use it, they won't use the component, and waste time re-implementing something that's already available.
<br/><br/>
<tc-webtag:handle coderId="279551" darkBG="true" /> showed a slide with a very interesting graphic which showed 4 regions regarding a user's knowledge of a component library:
<ol>
<li>the set of components in the library that the users knows</li>
<li>the set of components that the user is familiar with from the library</li>
<li>the set of components that the user <i>believes</i> is in the library, but might actually not be in the library</li>
<li>the set of components actually in the library that the user has no knowledge about</li>
</ol>
The results that a search engine returns will include areas from each of the above regions.  As a user becomes more
familiar with the library, region 4 will shrink and regions 1 and 2 will grow.  Region 3 is an interesting section as well, because the components that are not actually in the library represent an opportunity to expand the set of components in the library.
<br/><br/>
A way to determine how well a search engine is doing is to measure its precision and its accuracy.  You strive to maximize both of them, without sacrificing either.  If a user can't find what he's looking for, he will give up. On the other hand, sometimes it's hard to specify exactly what they're looking for, so the search can use two approaches to find components in the library: 1 - within the actual components, such as source code, keywords, etc., and 2 - extra metadata added to each component.  This includes submitter-defined categories and user feedback to improve the quality of the search results.
<br/><br/>
I thought the talk was very interesting, but sadly there were only a handful of TopCoder members there, probably
because of a conflict with the Algorithms Semi-finals room 2. <tc-webtag:handle coderId="305384" darkBG="true" />
and some other folks from TopCoder participated (with me!) in peppering <tc-webtag:handle coderId="279551" darkBG="true" /> with questions, feedback
and other talking points.  I think that everyone involved with TopCoder Software component design and development competitions should really try to learn more about CBSE and the needs of Component Library search with regards
to facilitating re-use.  The CBSE model has 
other implications as well -- the "next next thing" will likely be Service Oriented Architecture (SOA) which takes 
components to the next level.  In an SOA, components are re-used not only at design time, but at run-time, by being
deployed in such a way that they are available on a network that provides access to
a multitude of "clients."  
<br/><br/>
Tomorrow there is another Developer Forum on SOA right after CDDC 2 -- I hope to see more of you all there.
<br/><br/>
Enjoy!<br/>
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
