<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<style type="text/css">
.code
{
  width: 500;
  padding: 10px;
  margin: 20px;
  color: #333;
  font-size: 11px;
  font-weight: normal;
  line-height: 14px;
  background-color: #EEEEEE;
  border: 1px solid #999;
}

</style>

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
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="features"/>
   <jsp:param name="title" value="Archive"/>
</jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>               
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="statTable">
          <tr><td colspan="3" class="tableTitle">2005 Features</td></tr>
      
          <tr>
              <td width="20%" class="tableHeader">Date</td>
              <td width="20%" class="tableHeader">Author</td>
              <td width="60%" class="tableHeader">Feature</td>
          </tr>
          <tr>
              <td class="statDk">September 14</td>
              <td class="statDk"><tc-webtag:handle coderId="251317"/></td>
              <td class="statDk"><A href="/tc?module=Static&amp;d1=features&amp;d2=091405">Competing tomek-style</A></td>
          </tr>
          <tr>
              <td class="statDk">July 8</td>
              <td class="statDk"><tc-webtag:handle coderId="7371063"/></td>
              <td class="statDk"><A href="/tc?module=Static&amp;d1=features&amp;d2=070805">The Story of Petr Mitrichev - Target in Six Steps</A></td>
          </tr>
          <tr>
              <td class="statDk">March 2</td>
              <td class="statDk"><tc-webtag:handle coderId="269886"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_030205">Performance and Optimization in the "Real World"</A></td>
          </tr>
      </table>
      
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="statTable">
          <tr><td colspan="3" class="tableTitle">2004 Features</td></tr>
          <tr>
              <td width="20%" class="tableHeader">Date</td>
              <td width="20%" class="tableHeader">Author</td>
              <td width="60%" class="tableHeader">Feature</td>
          </tr>
          <tr>
              <td class="statDk">December 7</td>
              <td class="statDk"><tc-webtag:handle coderId="10407399"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_120704">More on Encryption and Security</A></td>
          </tr>
          <tr>
              <td class="statDk">November 2</td>
              <td class="statDk"><tc-webtag:handle coderId="10407399"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_110204">Encryption Algorithms</A></td>
          </tr>
          <tr>
              <td class="statDk">October 4</td>
              <td class="statDk"><tc-webtag:handle coderId="10135324"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_100404">Peer 2 Fear: Solutions for developers for designing secure P2P applications</A></td>
          </tr>
          <tr>
              <td class="statDk">September 1</td>
              <td class="statDk"><tc-webtag:handle coderId="282560"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_090104">On Sentinels</A></td>
          </tr>
          <tr>
              <td class="statDk">August 3</td>
              <td class="statDk"><tc-webtag:handle coderId="156859"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_080304">Reviewing Software for Fun and Profit</A></td>
          </tr>
          <tr>
              <td class="statDk">July 7</td>
              <td class="statDk"><tc-webtag:handle coderId="276230"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_070704">Healthy Computing</A></td>
          </tr>
          <tr>
              <td class="statDk">June 2</td>
              <td class="statDk"><tc-webtag:handle coderId="251184"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_060204">Java for C++ coders, and vice versa</A></td>
          </tr>
          <tr>
              <td class="statDk">April 29</td>
              <td class="statDk"><tc-webtag:handle coderId="251184"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_042904">All I really need to know about Software Development I learned from TopCoder</A></td>
          </tr>
          <tr>
              <td class="statDk">April 1</td>
              <td class="statDk"><tc-webtag:handle coderId="299177"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_040104">Dynamic Programming</A></td>
          </tr>
          <tr>
              <td class="statDk">March 1</td>
              <td class="statDk"><tc-webtag:handle coderId="290395"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_030104">The Educational Component of TopCoding</A></td>
          </tr>
          <tr>
              <td class="statDk">February 10</td>
              <td class="statDk"><tc-webtag:handle coderId="119676"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_021004">The 5 Most Common Design Mistakes</A></td>
          </tr>
          <tr>
              <td class="statDk">January 14</td>
              <td class="statDk"><tc-webtag:handle coderId="251184"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_011404">An Enterprise Java Overview</A></td>
          </tr>
          
      </table>
      
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="statTable">
          <tr><td colspan="3" class="tableTitle">2003 Features</td></tr>
      
          <tr>
              <td width="20%" class="tableHeader">Date</td>
              <td width="20%" class="tableHeader">Author</td>
              <td width="60%" class="tableHeader">Feature</td>
          </tr>
          <tr>
              <td class="statDk">December 22</td>
              <td class="statDk"><tc-webtag:handle coderId="273434"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_122203">Not Round, Not a Table</A></td>
          </tr>
          <tr>
              <td class="statDk">October 24</td>
              <td class="statDk"><tc-webtag:handle coderId="299709"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_102403">Challenging 101</A></td>
          </tr>
          <tr>
              <td class="statDk">September 17</td>
              <td class="statDk"><tc-webtag:handle coderId="271144"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_091703">A Crash Course in the Java Collections Framework</A></td>
          </tr>
          <tr>
              <td class="statDk">August 28</td>
              <td class="statDk"><tc-webtag:handle coderId="269554"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_082803">A Crash Course in the C++ STL</A></td>
          </tr>
          <tr>
              <td class="statDk">July 29</td>
              <td class="statDk"><tc-webtag:handle coderId="119676"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_072903">The TopCoder Design Contest #2</A></td>
          </tr>
          <tr>
              <td class="statDk">July 10</td>
              <td class="statDk"><tc-webtag:handle coderId="299177"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_071003">Immutable Objects</A></td>
          </tr>
          <tr>
              <td class="statDk">June 26</td>
              <td class="statDk"><tc-webtag:handle coderId="271917"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_062603">Simple Performance Improvement</A></td>
          </tr>
          <tr>
              <td class="statDk">May 27</td>
              <td class="statDk"><tc-webtag:handle coderId="273217"/></td>
              <td class="statDk"><A href="/index?t=features&amp;c=feat_052703">Threads and Atomicity</A></td>
          </tr>
          <tr>
              <td class="statDk">April 8</td>
              <td class="statDk"><tc-webtag:handle coderId="303718"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_040803">TopCoder Competitions vs. The Real World</a></td>
          </tr>
          <tr>
              <td class="statDk">March 17</td>
              <td class="statDk"><tc-webtag:handle coderId="296145"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_031703">Component-Based Development: TopCoder Style</a></td>
          </tr>
          <tr>
              <td class="statDk">February 20</td>
              <td class="statDk">David Tanacea</td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_022003">Component-Based Development: Why Hasn't the Vision Met Reality?</a></td>
          </tr>
          <tr>
              <td class="statDk">January 22</td>
              <td class="statDk"><tc-webtag:handle coderId="292607"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_012203">Who needs another UI framework?</a></td>
          </tr>
          <tr>
              <td class="statDk">January 8</td>
              <td class="statDk"><tc-webtag:handle coderId="277659"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_010803">Functional Programming</a></td>
          </tr>
      
      </table>
      
      <!-- 2002 Features -->
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="statTable">
          <tr><td colspan="3" class="tableTitle">2002 Features</td></tr>
      
          <tr>
              <td width="20%" class="tableHeader">Date</td>
              <td width="20%" class="tableHeader">Author</td>
              <td width="60%" class="tableHeader">Feature</td>
          </tr>
          
          <tr>
              <td class="statDk">December 20</td>
              <td class="statDk"><tc-webtag:handle coderId="264761"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_122002">The Big Rerun</a></td>
          </tr>
          
          <tr>
              <td class="statDk">December 9</td>
              <td class="statDk"><tc-webtag:handle coderId="264761"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_120902">It's Sink or Swim During the Challenge Phase</a></td>
          </tr>
      
          <tr>
              <td class="statDk">November 20</td>
              <td class="statDk"><tc-webtag:handle coderId="282560"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_112002">The eight seconds of death: Tips on preventing timeout</a></td>
          </tr>
          
          <tr>
              <td class="statDk">November 13</td>
              <td class="statDk"><tc-webtag:handle coderId="295939"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_111302">King of the Silicon Hill: Today's High-End Microprocessors</a></td>
          </tr>
      
          <tr>
              <td class="statDk">October 9</td>
              <td class="statDk"><tc-webtag:handle coderId="150527"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_100902">Graphics Programming for Motion Capture</a></td>
          </tr>
          
          <tr>
              <td class="statDk">October 2</td>
              <td class="statDk"><tc-webtag:handle coderId="274323"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_100202">Finding a Job is a Job</a></td>
          </tr>
      
          <tr>
              <td class="statDk">September 11</td>
              <td class="statDk"><tc-webtag:handle coderId="264761"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_091102">...A Problem is Born</a></td>
          </tr>
      
          <tr>
              <td class="statDk">August 21</td>
              <td class="statDk"><tc-webtag:handle coderId="153650"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_082102">Wireless Woes and Winners</a></td>
          </tr>
          
          <tr>
              <td class="statDk">August 7</td>
              <td class="statDk"><tc-webtag:handle coderId="264761"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_080702">Match Strategy</a></td>
          </tr>
      
          <tr>
              <td class="statDk">July 24</td>
              <td class="statDk"><tc-webtag:handle coderId="153650"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_072402">Attack of the Moans: Building Applications for Users</a></td>
          </tr>
          
          <tr>
              <td class="statDk">July 10</td>
              <td class="statDk">bitbucket43</td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_071002">From the Field - Avoid Overloading!</a></td>
          </tr>
      
          <tr>
              <td class="statDk">June 26</td>
              <td class="statDk"><tc-webtag:handle coderId="277956"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_062602">From the Field</a></td>
          </tr>        
          
          <tr>
              <td class="statDk">June 12</td>
              <td class="statDk"><tc-webtag:handle coderId="153650"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_061202">To in-house or to out-source, that is the question</a></td>
          </tr>
          
          <tr>
              <td class="statDk">June 5</td>
              <td class="statDk">TopCoder Staff</td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_060502">Where Has The Time Gone?</a></td></tr>
      
          <tr>
              <td class="statDk">May 29</td>
              <td class="statDk">TopCoder Staff</td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_052902">The Outsiders</a></td>
          </tr>        
          
          <tr>
              <td class="statDk">May 22</td>
              <td class="statDk"><tc-webtag:handle coderId="264761"/></td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_052202">Obfu-What?</a></td>
          </tr>        
          
          <tr>
              <td class="statDk">May 15</td>
              <td class="statDk">TopCoder Staff</td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_051502">First Time Phenomenal</a></td>
          </tr>
          
          <tr>
              <td class="statDk">May 8</td>
              <td class="statDk">TopCoder Staff</td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_050802">Working Their Way Up</a></td>
          </tr>
          
          <tr>
              <td class="statDk">May 1</td>
              <td class="statDk">TopCoder Staff</td>
              <td class="statDk"><a href="/index?t=features&amp;c=feat_050102">The Women of TopCoder</a></td>
          </tr>
      
          <tr>
              <td class="statDk">April 24</td>
              <td class="statDk">TopCoder Staff</td>
              <td class="statDk"><a href="/index?t=statistics&amp;c=2002tccc_feature">A Matter of Time</a></td>
          </tr>
          
      </table>
      </td>
   </tr>
</table>
<p><a href="/index?t=features&amp;c=feat_topics">Write feature articles for TopCoder.com</a></p>
        <p><br/></p>
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
