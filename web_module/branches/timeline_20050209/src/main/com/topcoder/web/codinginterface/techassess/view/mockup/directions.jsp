<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
         <jsp:param name="tabLev1" value="login"/>
      </jsp:include>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="current"/>
      </jsp:include>

      <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT>&#160;</td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- CONTENT --%>
            <td class=bodyContent>
            <p class=pL>
            <span class=bodyBigTitle>Welcome to the Testing Application.</span>
            <br /><br />
            This is the main room containing a number of problem sets as can be seen in the table below. Each problem set contains a number of problems for you to solve. For each problem set, you are given a certain amount of time, as can be seen in the Time Available column below.  
            <br /><br />
            <span class=bodySmallTitle>Example Test</span><br />
            The first problem is presented as an example. The purpose of this problem is to acquaint you with the Testing Application. It is suggested that you start with this problem. The results of the example problem will not count toward your overall results.  
            <br /><br />
            <span class=bodySmallTitle>Test Set A</span><br />
            (if presented) You have a total of 75 minutes to complete this set of 3 problems. Since your solution submissions will be timed, accuracy and speed are your main objectives.  
            <br /><br />
            <span class=bodySmallTitle>Test Set B</span><br />
            (if presented) The total time allotted for this problem set can be seen in the Time Available column below. Although your solution submissions will be timed, accuracy and style are your main objectives.  
            <br /><br />
            Click on an Enter button to open a problem set. 
            <br /><br />
            </p>
            <table width="100%" cellspacing=0 cellpadding=0 class=tableFrame>
               <tr>
                  <td class=tableHeader>&#160;</td>
                  <td class=tableHeader>Tests</td>
                  <td class=tableHeader align=center>Complete/Quantity</td>
                  <td class=tableHeader>Description</td>
                  <td class=tableHeader>Test Status</td>
                  <td class=tableHeader align=right>Time Available</td>
               </tr>
               <tr>
                  <td class=tableTextOdd><a href="/mockup/exampleDirections.jsp"><img src="/i/corp/screening/buttonEnter.gif" alt="" /></a></td>
                  <td class=tableTextOdd>Example Test</td>
                  <td class=tableTextOdd align=center>0/1</td>
                  <td class=tableTextOdd>Example Coding Problem Set</td>
                  <td class=tableTextOdd>Un-Opened</td>
                  <td class=tableTextOdd align=right>N/A</td>
               </tr>      
               <tr>
                  <td class=tableTextEven><a href="/mockup/exampleDirections.jsp"><img src="/i/corp/screening/buttonEnter.gif" alt="" /></a></td>
                  <td class=tableTextEven>Example Test</td>
                  <td class=tableTextEven align=center>0/1</td>
                  <td class=tableTextEven>Example Coding Problem Set</td>
                  <td class=tableTextEven>Un-Opened</td>
                  <td class=tableTextEven align=right>N/A</td>
               </tr>      
               <tr>
                  <td class=tableTextOdd><a href="/mockup/exampleDirections.jsp"><img src="/i/corp/screening/buttonEnter.gif" alt="" /></a></td>
                  <td class=tableTextOdd>Example Test</td>
                  <td class=tableTextOdd align=center>0/1</td>
                  <td class=tableTextOdd>Example Coding Problem Set</td>
                  <td class=tableTextOdd>Un-Opened</td>
                  <td class=tableTextOdd align=right>N/A</td>
               </tr>
            </table>                     
            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>