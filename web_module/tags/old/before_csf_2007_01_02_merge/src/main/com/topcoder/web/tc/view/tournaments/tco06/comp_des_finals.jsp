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
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="finals"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign="top" align="center" class="bodyText" style="padding-top: 10px; padding-bottom: 40px; padding-left: 15px; padding-right: 15px;">

<span class="bigTitle">Component Design Competition Finals</span>
<br><br>
            <table class="sidebarBox" border="0" cellpadding="3" cellspacing="0" width="500">
               <tr>
                  <td class="advHeader">Contest:</td>
                  <td class="advHeader" colspan="6" align="center" style="border-left: 1px solid #999999;">Relation<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21305812"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21305849"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" colspan="6" align="center" style="border-left: 1px solid #999999;">XSD2DDL<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21542476"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21542696"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
                  <td class="advHeader" colspan="6" align="center" style="border-left: 1px solid #999999;">Result Set Collection Decorator<br>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21663072"><img src="/i/interface/java.gif" alt="Java" border="0" /></A>
                     <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=21662984"><img src="/i/interface/dotnet.gif" alt=".NET" border="0" /></A>
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
                  <td class="advanceDk"><tc-webtag:handle coderId="119676" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">81.72</td>
                  <td class="advanceDk" align="center">87.42</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_Pops.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">93.56</td>
                  <td class="advanceDk" align="center">96.43</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center">20</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_Pops.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">88.85</td>
                  <td class="advanceDk" align="center">96.34</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">60</td>
                  <td class="advanceDk" align="center">60</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/DataView_Decorator_Pops.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>86</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="293874" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">90.82</td>
                  <td class="advanceDk" align="center">94.52</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center">42</td>
                  <td class="advanceDk" align="center">42</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_nicka81.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">89.93</td>
                  <td class="advanceDk" align="center">94.27</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center">42</td>
                  <td class="advanceDk" align="center">14</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_nicka81.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">83.73</td>
                  <td class="advanceDk" align="center">92.39</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center">16</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Result_Set_Collection_Decorator_nicka81.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>60</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="278342" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">86.94</td>
                  <td class="advanceDk" align="center">91.41</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center">50</td>
                  <td class="advanceDk" align="center">25</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_adic.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">93.02</td>
                  <td class="advanceDk" align="center">96.12</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center">15</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_adic.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">85.33</td>
                  <td class="advanceDk" align="center">94.06</td>
                  <td class="advanceDk" align="center">3</td>
                  <td class="advanceDk" align="center">35</td>
                  <td class="advanceDk" align="center">11</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_adic.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>43</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="152342" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">79.82</td>
                  <td class="advanceDk" align="center">85.58</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_kyky.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">64.52</td>
                  <td class="advanceDk" align="center">69.21</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center">10</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_kyky.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">86.24</td>
                  <td class="advanceDk" align="center">96.06</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center">60</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Result_Set_Collection_Decorator_kyky.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>38</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="11797255" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">78.71</td>
                  <td class="advanceDk" align="center">85.50</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center">36</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_aubergineanode.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">83.57</td>
                  <td class="advanceDk" align="center">85.43</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center">10</td>
                  <td class="advanceDk" align="center">2</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_aubergineanode.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">84.22</td>
                  <td class="advanceDk" align="center">91.75</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center">54</td>
                  <td class="advanceDk" align="center">10</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Result_Set_Collection_Decorator_aubergineanode.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>19</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="150498" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">76.79</td>
                  <td class="advanceDk" align="center">77.61</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center">24</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_ThinMan.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">83.79</td>
                  <td class="advanceDk" align="center">86.79</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center">24</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_ThinMan.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">78.26</td>
                  <td class="advanceDk" align="center">83.70</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center">52</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Result_Set_Collection_Decorator_ThinMan.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>18</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="15891862" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">71.32</td>
                  <td class="advanceDk" align="center">74.99</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center">35</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_real_vg.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">73.85</td>
                  <td class="advanceDk" align="center">77.53</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center">30</td>
                  <td class="advanceDk" align="center">4</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_real_vg.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">72.99</td>
                  <td class="advanceDk" align="center">79.98</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center">35</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Result_Set_Collection_Decorator_real_vg.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>14</strong></td>
               </tr>
               <tr>
                  <td class="advanceDk"><tc-webtag:handle coderId="252022" context="design"/></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">60.78</td>
                  <td class="advanceDk" align="center">64.02</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center">10</td>
                  <td class="advanceDk" align="center">1</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Relation_AleaActaEst.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">80.72</td>
                  <td class="advanceDk" align="center">82.10</td>
                  <td class="advanceDk" align="center">6</td>
                  <td class="advanceDk" align="center">45</td>
                  <td class="advanceDk" align="center">7</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/XSD2DDL_AleaActaEst.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;">62.72</td>
                  <td class="advanceDk" align="center">67.67</td>
                  <td class="advanceDk" align="center">8</td>
                  <td class="advanceDk" align="center">45</td>
                  <td class="advanceDk" align="center">5</td>
                  <td class="advanceDk" align="center"><A href="/i/tournament/tco06/comp_submissions/Result_Set_Collection_Decorator_AleaActaEst.zip"><img src="/i/interface/download.gif" alt="download" border="0" /></A></td>
                  <td class="advanceDk" align="center" style="border-left: 1px solid #999999;"><strong>13</strong></td>
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
