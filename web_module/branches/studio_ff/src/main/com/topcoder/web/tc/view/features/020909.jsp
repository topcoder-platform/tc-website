<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles: How to Compete Well in Conceptualization and Specification Contests</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=features&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <tc-webtag:forumLink forumID="525774" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">How to Compete Well in Conceptualization and Specification Contests</span>
<br />
<br />
<br clear="all">

<div>
<h3>Introduction</h3>
<p>The TopCoder software development methodology is mostly based on the usage of open community members. Many low level steps of software building have been opened to the development community. Anybody can participate in designing and coding software components, making the software GUI, assembling and testing final applications. But now, a new exciting possibility is available &ndash; making application Concepts and Specifications of business requirements. It means, the community members are able to work with TopCoder customers from the very beginning of the project. The output is a high level picture of the project &ndash; so your ideas and concepts will be the initial requirements for architects, designers, coders, assemblers and testers!</p>
<p>A short picture of the Conceptualization and Specification competitions is shown below (from TC process). </p>
<img src="/i/education/Conceptualization.jpg" alt="Conceptualization" />

<p>The Conceptualization contest produces the Conceptualization Document with high level use cases and requirements. And the Specification contest produces a specification document with detailed activities (exact description of the business requirements, data definition and verification, etc...) .</p>
<p>The entire TopCoder process is also available here: <a href="http://www.topcoder.com/wiki/display/tc/The+TopCoder+Platform+-+Software+Application+Development+Methodology">http://www.topcoder.com/wiki/display/tc/The+TopCoder+Platform+-+Software+Application+Development+Methodology</a></p>
<p>Conceptualization and Specification contests produce the business <strong>REQUIREMENTS</strong> for the application. Those contests are not Architecture and not Design, because we are not implementing the system there, but we are defining the customer needs of that system.<br>
The common order of software competitions for application development is as follows:</p>
<ol>
  <li>Studio Storyboard (optional)</li>
  <li><strong>Conceptualization</strong> (high level application description)<strong></strong></li>
  <li>Studio Wireframes or Prototype</li>
  <li><strong>Specification</strong> (detailed description how the system      should meet business requirements)<strong></strong></li>
  <li>Architecture</li>
  <li>and so on...</li>
</ol>
<h3>Processed Documents</h3>
<p>The documents, involved in the Conceptualization contests, are shown on the next table.</p>
<table cellspacing="0" cellpadding="5" style="border: solid 1px #999999; width: 85%">
  <tr>
    <th colspan="4" style="background-color:#CCCCCC">Conceptualization Competition Documents Reference Card</th>
  </tr>
  <tr> 
  	<td rowspan="7" style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-left: none"><p align="center"><strong>Input</strong></p></td> <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none;"><p align="center"><strong>Document</strong></p></td> <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none;"><p align="center"><strong>Required?</strong></p></td> <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none;"><p align="center"><strong>Format</strong></p></td>
  </tr>
  <tr>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Customer Questionnaire</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none;"><p>MS Word, PDF</p></td>
  </tr>
  <tr>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Company Standards</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center">&nbsp; </p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>MS Word</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Wireframes/Storyboards</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center">&nbsp; </p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>PDF, HTML, etc</p></td>
  </tr>
  <tr>
  <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Application Best Practices</p></td> 
  <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center">&nbsp; </p></td> 
  <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>MS Word</p></td>
  </tr>
  <tr> <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Customer GUI sketches, previous application screenshots</p></td> 
  <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center">&nbsp; </p></td> 
  <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>JPG, MS Word, MS   Excel</p></td>
  </tr>
  <tr> <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none; border-top:none"><p>Generalized Feedback</p></td> 
  <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
  <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>(in forums, after   Round 1)</p></td>
  </tr>
  <tr>
    <td rowspan="5"><p align="center"><strong>Output&nbsp; &nbsp;</strong></p></td>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Conceptualization Document</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>MS Word</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none;"><p>Context diagrams (in Conceptualization Document)</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>MS Visio</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Process Map/Workflow   diagrams (in Concept Doc)</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>MS Visio</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Use Case diagram</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>TC UML Tool</p></td>
  </tr>
  <tr> 
      <td style="border-left: solid 1px #999999; border-right: solid 1px #999999;"><p>Any additional diagrams, screenshots, artwork</p></td> 
      <td style="border-right: solid 1px #999999;"><p align="center">&nbsp; </p></td> 
      <td><p>MS Visio, JPG, etc.</p></td>
  </tr>
</table>
<p>The customers describe their project needs in the Questionnaire. That explanation is mostly brief, informal and just a starting point of application requirements. We have to ask the customer on the forum to get clarifications. Sometimes, the company standards for existing technologies and other technological best practices are provided by customer or TopCoder PM. We have to follow those rules.</p>
<p>The Conceptualization Document is the most important output of the Conceptualization competition. Briefly, it has 4 common sections:</p>
<ul>
  <li><strong>Introduction</strong><br>
    Describes the intro overview of the application, its main goal and objectives (the tasks to be completed for project success). We define high level assumptions and limitations of the project there, as well as open business risks.</li>
  <li><strong>Existing Application</strong><br>
    Explains the previous version of the application or the business flows of current actions in the customer company. That section mostly focuses on the current problems in the business model, opportunities and failures to be solved in the new application.</li>
  <li><strong>Proposed Application</strong><br>
    Shows a very high level structure of the new application, the business flows and what business documents are involved. That section mostly focuses on how the new system solves the existing problems.</li>
  <li><strong>Requirements</strong><br>
    Defines the formal requirements to the new application. This is a core space to keep the needed application functionality. All of what is defined here &ndash;will next be implemented in the actual application. We describe the application features from the customer and application user point of view. Some technical details arrive there, but, of course, only at quite a high level.</li>
</ul>
<p>The context diagrams and process maps (workflows) are parts of the Conceptualization Document and visually show how the application works. The Use Case diagram is a formal UML diagram, showing the application functionality from the client point of view. That diagram is well known for the Architecture and Design competitions. Any other diagrams and maybe screen shots of the proposed application are appreciated in the Conceptualization contests, but they are fully optional.</p>
<p>The documents for the Specification competition are as following:</p>
<table cellspacing="0" cellpadding="5" style="border: solid 1px #999999; width: 85%">
  <tr>
    <th colspan="4" style="background-color:#CCCCCC">Specification Competition Documents Reference Card</th>
  </tr>
  <tr> 
  	<td rowspan="5" style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-left: none"><p align="center"><strong>Input</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none;"><p align="center"><strong>Document</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none;"><p align="center"><strong>Required?</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none;"><p align="center"><strong>Format</strong></p></td>
  </tr>
  <tr>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Conceptualization Document</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none;"><p>MS Word</p></td>
  </tr>
  <tr>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Use Case Diagram</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>TC UML Tool</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Wireframes/Protoype</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong><br>(One is Required)</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>HTML, JPG, etc</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none; border-top:none"><p>Additional documents, diagrams, screenshots</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center">&nbsp;</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>JPG, MS Word, MS Excel, etc.</p></td>
  </tr>
  <tr>
    <td rowspan="3"><p align="center"><strong>Output&nbsp; &nbsp;</strong></p></td>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>Business Requirements Document (BRD)</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>MS Word</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none;"><p>Activity diagrams (in BRD)</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p align="center"><strong>Yes</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top:none"><p>TC UML Tool</p></td>
  </tr>
  <tr> 
      <td style="border-left: solid 1px #999999; border-right: solid 1px #999999;"><p>Use Case diagram</p></td> 
      <td style="border-right: solid 1px #999999;"><p align="center"><strong>Yes</strong></p></td> 
      <td><p>TC UML Tool</p></td>
  </tr>
</table>
<p>Please note, the most input documents are from the previously finished Conceptualization contest. And the most important output is BRD. This is a formal requirements specification (full with technical details) for starting the Architecture phase of application development. There are two main sections:</p>
<ul>
  <li><strong>Logical Requirements</strong><br>
    Every use case from the Conceptualization Document should be expanded by the activity diagram. The Activity UML diagram shows the high level application actions, which are needed for implementing the feature, defined by the use case item. Next, each action from the activity diagram is described with technical details. Every data field and data format is described and the validation rules are provided. The requirements from Conceptualization Document are clarified, expanded, and more technical details should be added. All the alternative flows (like error messages) are described.</li>
  <li><strong>Technical Requirements</strong><br>
    Defines the common GUI requirements, application look and feel, communication interfaces with external systems, used environment (OS, DB, web-servers, hardware, etc), performance and security needs.</li>
</ul>
<h3>Competition Process</h3>
<p>The input documents are not enough for those competitions. The reason is that the client will select the competitor by one simple rule &ndash; which competitor showed the best understanding of the customer business needs. Some of those needs are provided in Questionnaire (in very brief and informal way), some are in the customer&rsquo;s minds, others &ndash; maybe the client will remember them just during review. </h3>
<p>So, the most needed skills for Conceptualization and Specification competitions &ndash; are communication skills. Constantly ask the client questions every day of the competition, request additional diagrams, screenshots, maybe currently used business documents, and so on. Try to be at the customer&rsquo;s and at the user&rsquo;s place for the proposed application. Maybe, some client ideas could be modified and any creative suggestions for the application are much appreciated. But note, we have to satisfy and not confuse the customer. So, any new ideas should be first clarified and confirmed on the forum.</p>
<p>Actually, there are just two tasks to success in such competitions:</p>
<ol>
  <li>A good understanding of the client&rsquo;s needs.</li>
  <li>Carefully documenting the business needs of the application.</li>
</ol>
<p>Technically speaking, the competitors should just fill some output Word-based templates (with guidelines provided), draw use cases and activity UML diagrams, and some high level Visio-based structures of the application. The usage of MS Visio and MS Word/Excel shareware is not required, and some options of free software are available. But please note, MS Visio outperforms other tools very much and it is just faster to use Visio for making diagrams.</p>
<p>The judging process of the Conceptualization and Specification competitions is different (if compared to Architecture and Design). The reviewers are customers and TopCoder PMs. The Conceptualization competition has recently changed to the mini-tournament format: <a href="http://forums.topcoder.com/?module=Thread&threadID=630177&start=0">http://forums.topcoder.com/?module=Thread&amp;threadID=630177&amp;start=0</a></p>
<p>There are two rounds of each Conceptualization competition. In the first round, the customer will subjectively select three winners (with prizes like $100, $75, $50 and no DR points). And to win in round 1, we have to convince the customer that our submission better describes the customer&rsquo;s needs. The second round is used to improve quality of the initial submissions. The client accumulates all the new/fresh ideas from the submissions and will post them on the forum. The submissions are kept non-public, and all participants from the round 1 can post improved submissions in round 2. Then the submissions will be judged according to the formal scorecard, which evaluates quality aspects of each section of the submitted documents. A total score higher than 75% is needed to pass round 2 and winners will be selected by higher scores.</p>
<p>Judging of Specification competition is very similar &ndash; just round 1 is absent.</p>
<p>The TopCoder has plans to invite community members for reviewing Conceptualization and Specification contests. They will be able to check much more detail and may be even have an influence on customer.</p>
<h3>Tips &amp; Tricks</h3>
<p>The next guidelines were prepared after winning several conceptualization and specification competitions:</p>
<ol>
  <li>Print client documents and carefully read it several times in a comfortable place. Mark all confusing and non-clear places. Try to imagine the entire application picture in your mind.</li>
  <li>Ask questions on the forum about all non-clear issues in the client documentation.</li>
  <li>Write the high level overview and all the easy topics (like performance, security, etc.).</li>
  <li>Replay the application in your mind several times from different actor&rsquo;s point of view. You will find all the external subsystems and potential flows after that.</li>
  <li>Next, describe the current and proposed flow (for the Conceptualization competitions).</li>
  <li>The Context Diagram must have your application in the center, but users and external systems &ndash; around the central circle. This diagram should be informative and not bulky at the same time.</li>
  <li>Please think about buying MS Visio &ndash; that&rsquo;s a great tool for diagrams, very powerful, stable and fast.</li>
  <li>Several process map (workflow) diagrams should be provided (for Conceptualization competition), and they should be quite high level. But all inputs/outputs and main processing steps should be shown.</li>
  <li>When describing the process map, we have to provide slightly more details (not just process step&rsquo;s names).</li>
  <li>The Use Case diagram should be designed from the user&rsquo;s points of view and should be high level. Only business features should be shown and much room for the next Architecture and Design phases should be left. Please divide large use case diagrams to produce several smaller ones (for example, provide one use case diagram per each actor).</li>
  <li>Each use case will be expanded by requirements (for the Conceptualization competition). This is very important part of the Conceptualization document. Please provide all the high level requirements in the clear form and without any low level details (up-to next Specification competition).</li>
  <li>Each use case will be expanded by activity diagrams (for the Specification competition). Please be ready to produce dozens of such diagrams, which should not be large. Validation and error conditions are expected on the activity diagrams by most TC PMs. Please do NOT name decision/merge diamonds, but produce name guards on arrows and add a question bubble before decision diamonds. If activity diagram becomes large (not readable after zooming and placing to the Word document) &ndash; then please divide it by several smaller ones (there is a scorecard question penalizing for large activity diagrams).</li>
  <li>The Specification competitions need a lot of tables for all the data used in the proposed application. The tables will contain field names, formats, validation rules and description. Please use common sense for setting field sizes and validation rules.</li>
  <li>Spell-check text documents. Carefully submit all deliverables with double check (by downloading submitted file).</li>
</ol>
<h3>Summary</h3>
<p>In short, the Conceptualization and Specification competitions define the high level requirements for applications to be developed at TopCoder. The Conceptualization is mostly focuses on explanation of the business process and high level requirements. The Specification expands requirements, makes them traceable, and describes how to test the expected functionality of the application. Those competitions being posted here: <a href="http://www.topcoder.com/wiki/display/tc/Software+Specification+Active+Contests">http://www.topcoder.com/wiki/display/tc/Software+Specification+Active+Contests</a></p>
<p>The winner responsibilities are:</p>
<table cellspacing="0" cellpadding="3" style="border: solid 1px #999999; width: 85%">
  <tr>
    <th colspan="2" style="background-color:#CCCCCC"><strong>Winners Responsibilities</strong></th>
  </tr>
  <tr>
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-left: none;"><p align="center"><strong>Conceptualization</strong></p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none;"><p align="center"><strong>Specification</strong></p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top: none; border-left: none;"><p>Final fix of Conceptualization Document and Use Cases</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top: none;"><p>Final fix of BRD and Use Cases</p></td>
  </tr>
  <tr> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top: none; border-left: none;"><p>Optionally support one downstream contest, for example, Studio Wireframes or Prototype contest (can NOT be a competitor for that contest)</p></td> 
    <td style="border: solid 1px #999999; border-collapse:collapse; border-right: none; border-top: none;"><p>Optionally support one downstream contest, for example, &nbsp;Architecture contest (can NOT be a competitor for that contest)</p></td>
  </tr>
  <tr>
    <td colspan="2"><p>Can be a competitor of the contest next after supported one. The only restriction is for one contest, where the winner will answer on the forum questions</p></td>
  </tr>
</table>


<p>&nbsp;</p>
     </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
