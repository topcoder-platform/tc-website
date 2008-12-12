<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="finals"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign="top" align="center" class="bodyText" style="padding-top: 10px; padding-bottom: 40px; padding-left: 15px; padding-right: 15px;">

<span class="bigTitle">Component Development Competition Finals</span>
<br><br>
            <table class="sidebarBox" border="0" cellpadding="3" cellspacing="0" width="500">
               <tr>
                  <td class="advHeader">Contest:</td>
                  <td class="advHeader" colspan="6" align="center" style="border-left: 1px solid #999999;">Document Indexer<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=20956900"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=20432196"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" colspan="6" align="center" style="border-left: 1px solid #999999;">Testing Framework<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=20007420"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=20610008"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" colspan="6" align="center" style="border-left: 1px solid #999999;">Bread Crumb Trail<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=10395217"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=9978683"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" style="border-left: 1px solid #999999;">&#160;</td>
               </tr>
               <tr>
                  <td class="advHeader">Handle</td>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Initial<br>Score</td>
                  <td class="advHeader" align="center">Final<br>Score</td>
                  <td class="advHeader">Place</td>
                  <td class="advHeader">Wager</td>
                  <td class="advHeader">Points</td>
                  <td class="advHeader" align="center">DL</td>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Initial<br>Score</td>
                  <td class="advHeader" align="center">Final<br>Score</td>
                  <td class="advHeader">Place</td>
                  <td class="advHeader">Wager</td>
                  <td class="advHeader">Points</td>
                  <td class="advHeader" align="center">DL</td>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Initial<br>Score</td>
                  <td class="advHeader" align="center">Final<br>Score</td>
                  <td class="advHeader">Place</td>
                  <td class="advHeader">Wager</td>
                  <td class="advHeader">Points</td>
                  <td class="advHeader" align="center">DL</td>
                  <td class="advHeader" align="center" style="border-left: 1px solid #999999;">Total<br>Points</td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="7548200" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">90.33</td>
                  <td class="advanceDk" align="center">92.89</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center">28</td>
                  <td class="advanceDk" align="center">14</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_DB_sindu.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">98.49</td>
                  <td class="advanceDk" align="center">98.49</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">36</td>
                  <td class="advanceDk" align="center">36</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_sindu.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">92.26</td>
                  <td class="advanceDk" align="center">95.81</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">36</td>
                  <td class="advanceDk" align="center">36</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Control_sindu.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>86</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="299979" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">87.52</td>
                  <td class="advanceDk" align="center">93.18</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">33</td>
                  <td class="advanceDk" align="center">33</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_Persistence_visualage.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">94.71</td>
                  <td class="advanceDk" align="center">97.76</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center">33</td>
                  <td class="advanceDk" align="center">11</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_visualage.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">89.50</td>
                  <td class="advanceDk" align="center">94.35</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center">34</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Control_visualage.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>50</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="10098406" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">91.16</td>
                  <td class="advanceDk" align="center">92.01</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_Persistence_colau.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">93.99</td>
                  <td class="advanceDk" align="center">96.30</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_colau.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">91.33</td>
                  <td class="advanceDk" align="center">95.46</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center">60</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Tag_colau.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>39</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="14926554" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">82.11</td>
                  <td class="advanceDk" align="center">84.50</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_Persistence_biotrail.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">97.52</td>
                  <td class="advanceDk" align="center">98.20</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center">40</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_biotrail.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">90.79</td>
                  <td class="advanceDk" align="center">95.29</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center">10</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Tag_biotrail.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>34</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="7210680" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">85.72</td>
                  <td class="advanceDk" align="center">89.40</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center">28</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_DB_cnettel.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">93.60</td>
                  <td class="advanceDk" align="center">97.57</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center">36</td>
                  <td class="advanceDk" align="center">9</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_cnettel.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">92.42</td>
                  <td class="advanceDk" align="center">94.92</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center">36</td>
                  <td class="advanceDk" align="center">9</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Control_cnettel.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>25</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="15664457" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">83.15</td>
                  <td class="advanceDk" align="center">86.37</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_Persistence_traugust.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">96.07</td>
                  <td class="advanceDk" align="center">96.38</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center">35</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_traugust.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">86.54</td>
                  <td class="advanceDk" align="center">90.65</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center">35</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Tag_traugust.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>18</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="15832159" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">85.64</td>
                  <td class="advanceDk" align="center">85.89</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center">40</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_Persistence_oodinary.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">85.48</td>
                  <td class="advanceDk" align="center">85.48</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_oodinary.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">81.64</td>
                  <td class="advanceDk" align="center">83.86</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center">40</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Tag_oodinary.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>13</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="10526732" context="development"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">57.68</td>
                  <td class="advanceDk" align="center">60.21</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Document_Indexer_Persistence_zjq.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">87.06</td>
                  <td class="advanceDk" align="center">87.58</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center">60</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Testing_Framework_zjq.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">54.54</td>
                  <td class="advanceDk" align="center">54.54</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center">10</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Bread_Crumb_Trail_Tag_zjq.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>12</strong></td>
               </tr>
            </table>
<br><br>
<div align="center"><img src="/i/interface/download.gif" alt="download" border="0" /> = download submission</div>



      </td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>

   </tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
