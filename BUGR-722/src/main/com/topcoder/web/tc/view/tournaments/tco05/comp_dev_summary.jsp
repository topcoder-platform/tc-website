<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>

<style type="text/css">
.textIndent  {  margin: 0px,0px,0px,40px; }
</style>

</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Component Development Finals Summary</span>
<br><br>
<div class="leadPhoto">
<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=photos">See more photos!</a></p></span>
<img src="/i/tournament/tco05/onsite_photos/shot_development.jpg" alt="" class="photoFrameBig" /><br/>
</div>
<img src="/i/m/MPhk_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<p>by <tc-webtag:handle coderId="289824" context="algorithm"/><br/>
<em>TopCoder Member</em><br />
<br><br><br>

The 2005 TopCoder Open Component Development Finals gathered seven world-class developers in battle for a $20,000 prize. The competition was expectedly fierce, in the tradition of TopCoder Open Tournaments. The developers worked hard on enhancements for their existing submissions for nearly seven hours. In the end, a perfect implementation of the requirements and attention to every detail allowed <b>visualage</b> to win the competition, followed closely by <b>sindu</b>, <b>oldbig</b> and <b>cnettel</b>, who placed 2nd, 3rd and 4th respectively. <b>matmis</b>, <b>colau</b>, and <b>arylio</b> each put in fine efforts, but they eventually fell behind occupying the 5th, 6th and7th places. 
<br><br>

<span class="bodySubtitle">Road to the Finals</span>
<br><br>
The component chosen this year for the development finals was File Statistics. The File Statistics component provides a framework to collect statistical information from a subset of the file system (one or more files and directories) and to render the results in configurable reporting style. Usually these statistics are associated with the file content (number of lines, number of occurrences of a string) or with the file or directory itself (file size, last modified time). The component can be used as a command-line tool, or can be used programmatically through its public API.
<br><br>
The developers needed to implement the component in the online round of the finals as in a regular component competition. The review board reviewed their submissions and each competitor was then allowed to fix their submission. After a final review on the fixed deliverables, each competitor had his own implementation of the initial design for File Statistics component.
<br><br>
<span class="bodySubtitle">Finals</span>
<br><br>
In the onsite round of the development finals the competitors were presented with a set of three enhancements to the File Statistics component. The three enhancement options were the following:

<ul>
<li><b>Support for non-numeric statistics:</b> allow the component to collect and report non-numeric data like most commonly occurring word or token, letter frequencies, number of occurrences for each unique word and so on. This enhancement required refactoring the public API of the component, adding support for custom statistics data and renderer, changes in the configuration of the component along with an implementation for a new analyzer for extracting the common token from a set of files.</li>
<li><b>Command-line support for plug-Ins:</b> extend the command line configuration of the component for the plug-ins, which in the first version could be only configured through the Configuration Manager. This enhancement required adding support for the plug-ins to register and validate their configuration parameters. Also, the default analyzers for counting lines in a text or C-style file needed minor modifications.</li>
<li><b>Support for ZIP file expansion:</b> enable the component to gather statistical data from the contents of zipped archives. This enhancement required adding functionality for extracting and browsing ZIP files and adding or changing functionality for the configuration and reporting part of the component.</li>
</ul>

The finalists were required to chose one of the three enhancements and tweak their final-fixed submission to comply with the modified design. Existing source code needed modifications, new source code was necessary, unit test cases were indispensable for the added functionality and documentation changes and additions were required. 
<br><br>
This was a considerable amount of work for the short period of time the competitors had, and every decision they made was critical to their final score. Each one of them tried to choose the enhancement they had found to be the easiest to implement, and consequently they all ignored the support for non-numeric statistics, which was likely the most difficult enhancement. <b>oldbig</b> and <b>colau</b> chose to implement the support for ZIP file expansion, while <b>visualage</b>, <b>sindu</b>, <b>cnettel</b>, <b>matmis</b> and <b>arylio</b> went with the command-line support for plug-ins.
<br><br>
<i>The ZIP file expansion support</i> was a slightly more difficult requirement compared to the command-line support for plug-ins. The developers attacking this enhancement had some problems understanding and implementing it properly, basically because they made some wrong assumptions. In a normal competition, these questions may have arisen in the forums and would have been clarified by the designer, but now each competitor acted on his own and took the best decision for himself. 
<br><br>
Adding <i>the command-line support for plug-ins</i> was straightforward, and there were fewer problems regarding the implementation of the requirements. Nevertheless, this enhancement also had a tricky part - the modification of the state machine previously developed to count lines in a C-Style file to support the @-literal. Identifying the states and transitions would have been easier in a normal competition, where the public forum is used to discuss implementation details with the designer able to see what other competitors are thinking about, but in a finals competition finalists are not permitted to discuss their ideas.
<br><br>

<span class="bodySubtitle">Reviews</span>
<br><br>
After the competition ended, the submissions were sent to the development review board for judging. <b>TheCois</b> (stress), <b>cucu</b> (accuracy) and <b>MPhk</b> (failure) had approximately 36 hours to score the submissions and determine the winner.
<br><br>
In such a fierce competition every detail weighed a lot. Fulfilling the requirements of the enhancements was imperative, and most of the developers lost points in this section. 
<br><br>
<b>arylio</b> had some problems with the final fixes in the online round, and ended up with an incomplete set of deliverables in the onsite round of the finals. Repairing his submission instead of implementing the enhancement cost him valuable time, so he was not able to focus properly on developing and adequately testingthe required items. <b>colau</b> managed to implement the enhancement, but did not manage to develop any unit tests and test it properly. The lack of unit tests cost him some important points on the requirements side because of errors that were not identified by the developer, as well as  on the unit testing side. <b>matmis</b> did not properly enhance his state machine implementation, and had a part of the unit tests missing. An incomplete set of deliverables cost him a significant amount of points.
<br><br>
The other developers managed to fulfill the requirements of the enhancements at a higher level while also doing well in unit testing and documenting their final submissions. <b>cnettel</b> provided a complete and correct implementation of the requirements, but had problems in fully testing it . Also, his state machine enhancement could have been more clear and straightforward in several places. <b>oldbig</b> put in a good attempt in implementing the somehow more difficult enhancement (ZIP file expansion support), but he did not pay enough attention at recursive iteration of directories and lacked unit tests for minor functionality. <b>sindu</b> provided a correct implementation of the requirements and a good set of unit tests, covering all but one aspect of the component &ndash; some command line switches in the command line interface of the component. The submission suffered for lack of complete documentation for unit tests. <b>visualage</b> also fulfilled all requirements, properly enhancing  his previous submission with the required functionality. The unit tests coverage on the component was complete, and the documentation was also well done, addressing all required details. The only downside to his submission was that some parts of the implementation could have been written in a simpler manner, but nothing critical. 
<br><br>
All submissions had their good and bad parts. Reviewing them was a challenging task. Even the smallest detailed counted a lot, and the smallest mistake could send one of the competitors to the bottom of the hierarchy. At the end of the review phase, the scoreboard looked like the following:
<br><br>
<table class="sidebarBox" width="150" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">1.</td>
      <td align="center"><b>visualage</b></td>
      <td align="center">87.07</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">2.</td>
      <td align="center"><b>sindu</b></td>
      <td align="center">84.71</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">3.</td>
      <td align="center"><b>cnettel</b></td>
      <td align="center">83.10</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">4.</td>
      <td align="center"><b>oldbig</b></td>
      <td align="center">82.42</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">5.</td>
      <td align="center"><b>matmis</b></td>
      <td align="center">80.18</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">6.</td>
      <td align="center"><b>colau</b></td>
      <td align="center">75.69</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">7.</td>
      <td align="center"><b>arylio</b></td>
      <td align="center">72.45</td>
   </tr>
</table>
<br><br>
<span class="bodySubtitle">Appeals and Appeals Responses</span>
<br><br>
After presenting the developers with the reviewer scorecards, competitors had the chance to appeal any item that they felt was unfairly scored. The finalists had a limited 90 minute appeals phase to create and submit these appeals. 
<br><br>
When the appeals phase ended, the reviewers went over the scores one final time, reviewing and making any necessary changes. Most of the scores were raised, but the hierarchy of the finalists did not change much, only two developers switching places &ndash; <b>oldbig</b> and <b>cnettel</b>. The final score board looked like the following:
<br><br>
<table class="sidebarBox" width="150" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">1.</td>
      <td align="center"><b>visualage</b></td>
      <td align="center">89.62</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">2.</td>
      <td align="center"><b>sindu</b></td>
      <td align="center">87.73</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">3.</td>
      <td align="center"><b>oldbig</b></td>
      <td align="center">85.81</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">4.</td>
      <td align="center"><b>cnettel</b></td>
      <td align="center">84.93</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">5.</td>
      <td align="center"><b>matmis</b></td>
      <td align="center">81.84</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">6.</td>
      <td align="center"><b>colau</b></td>
      <td align="center">76.28</td>
   </tr>
   <tr class="sidebarText" nowrap="nowrap">
      <td align="center">7.</td>
      <td align="center"><b>arylio</b></td>
      <td align="center">73.47</td>
   </tr>
</table>
<br><br>
Congratulations to <tc-webtag:handle coderId="299979" context="development"/> for winning the 2005 TopCoder Open Component Development Competition! Congratulations to all developers that participated in this competition and good luck in the upcoming ones!

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
