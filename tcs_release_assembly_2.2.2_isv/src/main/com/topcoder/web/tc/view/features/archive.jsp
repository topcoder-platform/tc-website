<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
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
        <td width="100%" align="center">
        
        <div class="tutorBody">
        
        <jsp:include page="../page_title.jsp" >
           <jsp:param name="image" value="features"/>
           <jsp:param name="title" value="Archive"/>
        </jsp:include>

         <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr valign="top">
               <td class="bodyText"><strong>Author</strong></td>
               <td class="bodyText"><strong>Title</strong></td>
               <td class="bodyText"><strong>Date</strong></td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="287614" context="algorithm" /> and <tc-webtag:handle coderId="252022" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=021109">Spotlight Sessions: Component Chat Transcript</a></td>
              <td class="bodyText" nowrap=nowrap>Feb 11, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="20437508" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=020909">How to Compete Well in Conceptualization and Specification Contests</a></td>
              <td class="bodyText" nowrap=nowrap>Feb 9, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="151743" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=020509">Spotlight Sessions: Architecture Chat Transcript</a></td>
              <td class="bodyText" nowrap=nowrap>Feb 5, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText"><tc-webtag:handle coderId="7442703" context="algorithm" /></td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=012909">Spotlight Sessions: Specification Chat Transcript</a></td>
              <td class="bodyText" nowrap=nowrap>Jan 29, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText">&nbsp;</td>
              <td class="bodyText" nowrap=nowrap><a href="tc?module=Static&d1=features&d2=011309">Meet the December 2008 Coders of the Month</a></td>
              <td class="bodyText" nowrap=nowrap>Jan 9, 2009</td>
            </tr>
            <tr valign="top">
              <td class="bodyText">&nbsp;</td>
              <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&d1=features&d2=120908">Meet the November 2008 Coders of the Month</a></td>
              <td class="bodyText" nowrap=nowrap>Dec 9, 2008</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=111808"><strong>Meet the October 2008 Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 18, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" context="algorithm" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071708"><strong>Generating random numbers with C++ TR1</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 17, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071008"><strong>Meet the June 2008 Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 10, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="22419265" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=062708"><strong>Know your hero: yuhch123</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 27, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=062508"><strong>Meet the May 2008 Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 25, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=042508"><strong>Meet the March 2008 Coders of the Month: Wendell &amp; PE</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 25, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=041808"><strong>Meet the March 2008 Coders of the Month: PaulJefferys &amp; oton</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 18, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=032008"><strong>Meet the February 2008 Coders of the Month: oninkxronda</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 20, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=031308"><strong>Computerworld's "Rock star coders" profile: Petr</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 13, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=022708"><strong>Meet the January 2008 Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 27, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=022108"><strong>Computerworld's "Rock star coders" profile: Pops</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 21, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=020708"><strong>Computerworld's "Rock star coders" profile: SnapDragon</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 7, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=012508"><strong>Meet the December 2007 Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 25, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=010408"><strong>Linear recurrences</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 4, 2008</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="22685759" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=120507"><strong>Know your hero: myprasanna</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 5, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="22666646" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=111207"><strong>TCCC07: So this guy goes to Orlando, and ...</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 12, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=110707"><strong>Meet the October 2007 Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 7, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="20641048" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=102607"><strong>TCCC07 Preview: The Studio competition</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 26, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=102307"><strong>Meet the September Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 23, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="7390467" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=101507"><strong>TCCC07 Preview: The Marathon Match competition</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 15, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=100907"><strong>TopCoder @ Work: The Hacker vs. The Architect</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 9, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=100207"><strong>TCCC07: By the numbers</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 2, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="8472826" context="algorithm"/></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=092707"><strong>Know your hero: marek.cygan</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 27, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=092407"><strong>Introducing TopCoder's &quot;Iron Man&quot;</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 24, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21926605" context="design"/></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=091307"><strong>An interview with fabrizyo</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 13, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21777558" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=091007"><strong>Spotlight: The Arab Academy for Science &amp; Technology</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 10, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=090707"><strong>Introducing August's Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 7, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21931776" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=090607"><strong>College admissions and the "TopCoder edge"</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 6, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=083107"><strong>Our favorite professors: TopCoder staff look back</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 31, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="160049" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=083007"><strong>Introducing the Configuration API<br />&amp; Configuration Persistence components</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 30, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="8365955" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=082007"><strong>Meet the July Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 20, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="151743" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=081307"><strong>Going pro: Turning TopCoder into my full-time job</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 13, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21620711" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=080607"><strong>An Interview with kalinov</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 6, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="8365955" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=073107"><strong>Meet the June Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 31, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="14999860" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=073007"><strong>Visas: Think Positive and Be Prepared</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 30, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="22630158" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=072607"><strong>Test Drive: TenFold SOA</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 26, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=072307"><strong>What happened in Vegas: TCO07 winners tell all</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 23, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21201116" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071907"><strong>Know your hero: bmerry</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 19, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071607"><strong>An Introduction to Version Control</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 16, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21684580" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071207"><strong>An Interview with ahyangyi</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 12, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="7390467" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=070207"><strong>An Interview with Team V. Gimnazija</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 2, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="8365955" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=062807"><strong>Meet the May Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 28, 2007</td> 
            </tr>
           <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="15498334" /> &amp; <tc-webtag:handle coderId="10574855" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=062507"><strong>TCO Preview: Meet the Bloggers</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 25, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=062107"><strong>TCO Preview: By the Numbers</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 21, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10574855" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=061807"><strong>TCO Preview: Meet Team Russia</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 18, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="15635590" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=061107"><strong>TCO Preview: The Studio Design Competition</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 11, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="15635590" /> &amp; <tc-webtag:handle coderId="284038" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=060707"><strong>TCO Preview: Meet Team Ukraine</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 7, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="8436401" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=060407"><strong>An Interview with Burunduk2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 4, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&#160;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=052907"><strong>Meet the April Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 29, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">Yodlee Staff</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=052407"><strong>Introducing Yodlee</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 24, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="275640" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=051707"><strong>TCO Preview: Component Design and Development Competition</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 17, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21684580" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=051407"><strong>A Crash Course in SQL, Part 2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 14, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=051007"><strong>TCO Preview: The Marathon Match Competition</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 10, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="8365955" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=050807"><strong>Belarus All College Programming Event</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 8, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10627428" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=042607"><strong>Test Drive: SandCastle</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 26, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21684580" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=041907"><strong>A Crash Course in SQL</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 19, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">AOL's Boxely Team</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolBoxely"><strong>Introducing Boxely</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 17, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&#160;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=041207"><strong>Meet the March Coders of the Month</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 12, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="15635590" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=040507"><strong>Programming in the Real World</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 5, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="15891862" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=040207"><strong>Using Mock Objects with Components</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 2, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21684580" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=032907"><strong>A Crash Course in Relational Databases, Part 2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 29, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21684580" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=032607"><strong>A Crash Course in Relational Databases, Part 1</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 26, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=032207"><strong>The Last 20 Feet: The final frontier of home networking</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 22, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="16067996" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=030807"><strong>Test Drive: OpenLaszlo</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 8, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="22630158" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=030107"><strong>Test Drive: Code Coverage Tools</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 1, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="20641048" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=022207"><strong>Beginning TopCoder Competition with C#.Net</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 22, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=021907"><strong>Five things you didn't know about C++, Part 3</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 19, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10211498" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=021307"><strong>An Introduction to Code Coverage</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 14, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=020807"><strong>Beginning TopCoder Competition with C++</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 8, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21464956" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=020607"><strong>Marathon Man: An interview with battyone</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 6, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=020207"><strong>TopCoder @ Work: Not Another Vista Article</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 2, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=013107"><strong>Five Things You Didn't Know About C++, Part 2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 31, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=012607"><strong>Five Things You Didn't Know About C++</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 26, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="15498334" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=010407"><strong>Beginning Algorithm Competitions with VB.NET</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 4, 2007</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=121406"><strong>TopCoder Celebrates 100,000 Members</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 14, 2006</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=121106"><strong>TopCoder @ Work: Professional Ethics, Part 2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 11, 2006</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=120106"><strong>TopCoder @ Work: Professional Ethics</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 1, 2006</td> 
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="287614" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=112806"><strong>Digital Run Stage 2: Going for the win</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 28, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="15635590" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=112106"><strong>A Number or a String: <br>Parsing Your Input and Formatting Your Output in C++</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 21, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="344462" /> &amp; <tc-webtag:handle coderId="21181561" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=111306"><strong>TCCC Preview: Meet the bloggers</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 13, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=110806"><strong>TopCoder @ Work: Your Career and the TCCC</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 8, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21196141" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=110206"><strong>TCCC Preview: China Steps Up</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 2, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="252022" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=103006"><strong>TCCC Preview: Component Competitions</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 30, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">&nbsp;</td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=102606"><strong>TopCoder visits Dalian Software Park</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 26, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21196141" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=101906"><strong>TCCC Preview: By the Numbers</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 19, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21196141" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=101606"><strong>TCCC Preview: Past Winners Tell All</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 16, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="275640" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=101206"><strong>C++ tools #2 - GNU Make</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 12, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21195715" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=100906"><strong>Design Patterns in C++, Part 2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 9, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=100506"><strong>TopCoder @ Work: Incorporating new technologies</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 5, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21195715" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=100206"><strong>Design Patterns in C++</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 3, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10584406" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=092806"><strong>Writing code that writes code&#8230;</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 28, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="22628020" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=092506"><strong>Understanding the Mind Game</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 25, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="299911" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=092106"><strong>Creating an Intelligent Design</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 21, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=091806"><strong>Computational geometry with complex numbers</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 18, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21464956" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=091406"><strong>Introduction to OpenMP, Part 2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 14, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="21464956" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=091106"><strong>Introduction to OpenMP, Part 1</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 11, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=090506"><strong>TopCoder @ Work: Introduction to upselling, Part 2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 5, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=082906"><strong>TopCoder @ Work: Introduction to upselling</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 29, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="252022" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=082106"><strong>The Digital Run: Highlights from Stage 1</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 21, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="275640" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=081406"><strong>The art of testing C++ code: An introduction to cppUnit</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 14, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="9927526" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=080706"><strong>The Intricate Art of Testing</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 7, 2006</td>
            </tr>

            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /> & <tc-webtag:handle coderId="22627518" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=072406"><strong>How long will this take, anyway?</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 24, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="14995087" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071706"><strong>An Introduction to AJAX</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 17, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10353806" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071006"><strong>Breaking software for fun and profit</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 10, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=070506"><strong>Understanding your algorithm rating - and why it changes</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 5, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=062606"><strong>So I see you're a member of TopCoder&#8230;</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 26, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="16096823" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=061906"><strong>How to prepare for an Assembly Competition</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 19, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="151743" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=061206"><strong>Creating Use Case and Sequence Diagrams</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 12, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251074" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=022006"><strong>GCC Hacks: Abusing C++ Extensions for Fun and Profit</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 20, 2006</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251317" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=091405"><strong>Competing tomek-style</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 14, 2005</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="7371063" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=070805"><strong>The Story of Petr Mitrichev - Target in Six Steps</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 8, 2005</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="269886" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=030205"><strong>Performance and Optimization in the "Real World"</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 2, 2005</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=120704"><strong>More on Encryption and Security</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 7, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10407399" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=110204"><strong>Encryption Algorithms</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 2, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="10135324" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=100404"><strong>Peer 2 Fear: Solutions for developers for designing secure P2P applications</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 4, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="282560" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=090104"><strong>On Sentinels</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 1, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="156859" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=080304"><strong>Reviewing Software for Fun and Profit</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 3, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="276230" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=070704"><strong>Healthy Computing</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 7, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251184" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=060204"><strong>Java for C++ coders, and vice versa</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 2, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251184" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=042904"><strong>All I really need to know about Software Development I learned from TopCoder</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 29, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="299177" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=040104"><strong>Dynamic Programming</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 1, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="290395" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=030104"><strong>The Educational Component of TopCoding</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 1, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="119676" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=021004"><strong>The 5 Most Common Design Mistakes</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 10, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="251184" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=011404"><strong>An Enterprise Java Overview</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 14, 2004</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="273434" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=122203"><strong>Not Round, Not a Table</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 22, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="299709" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=102403"><strong>Challenging 101</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 24, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="271144" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=091703"><strong>A Crash Course in the Java Collections Framework</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 17, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="269554" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=082803"><strong>A Crash Course in the C++ STL</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 28, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="119676" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=072903"><strong>The TopCoder Design Contest #2</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 29, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="299177" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=071003"><strong>Immutable Objects</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 10, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="271917" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=062603"><strong>Simple Performance Improvement</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 26, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="273217" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=052703"><strong>Threads and Atomicity</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 27, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="303718" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=040803"><strong>TopCoder Competitions vs. The Real World</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 8, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="296145" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=031703"><strong>Component-Based Development: TopCoder Style</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Mar 17, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">David Tanacea</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=022003"><strong>Component-Based Development: Why Hasn't the Vision Met Reality?</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Feb 20, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="292607" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=012203"><strong>Who needs another UI framework?</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 22, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="277659" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=010803"><strong>Functional Programming</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jan 8, 2003</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=122002"><strong>The Big Rerun</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 20, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=120902"><strong>It's Sink or Swim During the Challenge Phase</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Dec 9, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="282560" /></td>
               <td class="bodyText" nowrap=nowrap><a href="/tc?module=Static&amp;d1=features&amp;d2=112002"><strong>The eight seconds of death: Tips on preventing timeout</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 20, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="295939" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=111302"><strong>King of the Silicon Hill: Today's High-End Microprocessors</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Nov 13, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="150527" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=100902"><strong>Graphics Programming for Motion Capture</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 9, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="274323" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=100202"><strong>Finding a Job is a Job</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Oct 2, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=091102"><strong>...A Problem is Born</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Sep 11, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="153650" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=082102"><strong>Wireless Woes and Winners</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 21, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=080702"><strong>Match Strategy</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Aug 7, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="153650" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=072402"><strong>Attack of the Moans: Building Applications for Users</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 24, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">bitbucket43</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=071002"><strong>From the Field - Avoid Overloading!</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jul 10, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="277956" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=062602"><strong>From the Field</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 26, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="153650" /></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=061202"><strong>To in-house or to out-source, that is the question</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 12, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=060502"><strong>Where Has The Time Gone?</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Jun 5, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=052902"><strong>The Outsiders</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 29, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText"><tc-webtag:handle coderId="264761"/></td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=052202"><strong>Obfu-What?</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 22, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=051502"><strong>First Time Phenomenal</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 15, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=050802"><strong>Working Their Way Up</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 8, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=050102"><strong>The Women of TopCoder</strong></a></td>
               <td class="bodyText" nowrap=nowrap>May 1, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText">TopCoder Staff</td>
               <td class="bodyText"><a href="/tc?module=Static&amp;d1=features&amp;d2=042402"><strong>A Matter of Time</strong></a></td>
               <td class="bodyText" nowrap=nowrap>Apr 24, 2002</td>
            </tr>
            <tr valign="top">
               <td class="bodyText" colspan="3"><br><a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write feature articles for TopCoder.com</a></td>
            </tr>
         </table>
         </div>
        <p><br></p>
      </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>