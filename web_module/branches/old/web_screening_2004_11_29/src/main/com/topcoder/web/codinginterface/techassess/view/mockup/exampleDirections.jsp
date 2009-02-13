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
         <jsp:param name="timer" value="remaining"/>
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
            <span class=bodyBigTitle>Example Directions</span>
            <br /><br />
            <span class=bodySmallTitle>Example Problem</span><br />
            In the table below there is an example problem. The example problem is designed to acclimate you with the system. Your solution to the example problem will not count toward your final results. You should open the problem statement and code, compile and test your solution. The purpose of this problem is to familiarize yourself with the Testing Application and its different options. Please be sure to submit your solution when it is complete.  
            <br /><br />
            Clicking the Open button will display a window containing the problem description and an editor.  
            <br /><br />
            Once you've opened a problem, if a specific language is not mandated, choose the language that you will use to code your solution. Once you choose the language, read through the problem statement and begin coding your solution.  
            <br /><br />
            When you are finished with this problem, either click the Main button at the top of this window to return to the Main room or click the Continue button at the bottom of the window to proceed to the next assigned Test Set. For more help, click the Help Manual button at the top of this window.                      
            <br /><br />

            <table width="100%" cellspacing=0 cellpadding=0 class=tableFrame>
               <tr>
                  <td class=tableHeader>&#160;</td>
                  <td class=tableHeader50>Problem</td>
                  <td class=tableHeader50>Coding Status</td>
                  <td class=tableHeader align=center>Coding Time</td>
               </tr>
               <tr>
                  <td class=tableTextOdd><a href="/mockup/codingRoom.jsp"><img src="/i/corp/screening/buttonOpen.gif" alt="" /></a></td>
                  <td class=tableTextOdd>Average</td>
                  <td class=tableTextOdd>Open</td>
                  <td class=tableTextOdd align=center><span class=bigRed>26:59</span></td>
               </tr>      
            </table>
            <br>

<%-- IF LAST PROBLEM SET, "CONTINUE" GOES TO MAIN, OTHERWISE IT GOES TO NEXT SET --%>
            <table width="100%" cellspacing=0 cellpadding=0>
               <tr>
                  <td class=bodyCell100 align=right>Click the continue button to start &lt;NEXT SET NAME&gt;&#160;&#160;</td>
                  <td align=right><img src="/i/corp/screening/buttonContinue.gif" alt=""/></td>
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