<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="514506" message="Discuss this article" />
</div>

<span class="bigTitle">Test Drive: Code Coverage Tools</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/zmij_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22630158" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p><i>"TopCoder is interested in incorporating a code coverage tool in the component development process. The reason is to measure how well the unit test cases are covering all of the code. The ultimate goal is to improve the quality of our components."</i></p>
<p>That's how the idea started in the <a href="http://forums.topcoder.com/?module=Thread&threadID=515101&start=0&mc=21#575619">forums</a> and, as usual, it stirred up a chorus of opinions. TopCoder members offered tool proposals, interesting views and concerns, along with the usual, often unspoken questions: is this a good idea? Is it a bad idea? Will it really help us? Well, code coverage isn't necessarily good or bad, but it is a necessary element of a modern test-driven software development paradigm.</p>
<p>Based on the users' proposals from the forum, TopCoder started to look for the right code coverage tools - ideally ones that were small and versatile, with a reasonable learning curve. After identifying a few likely candidates for both Java and .NET, TopCoder gathered a few coders to test drive the tools. This article will provide a summary of those results.</p>

<p><span class="bodySubtitle">1. Code Coverage</span><br>
What is code coverage after all? Let's try defining an outline for the process:
<ul>
    <li>run a code coverage tool (analyzer) to find out the areas of your code not covered by a set of test cases</li>
    <li>determine a quantitative measure, which is an indirect measure of quality</li>
    <li>create additional tests to increase coverage and reach a certain threshold, at which you can consider your code "well tested"</li>
    <li>identify redundant test cases</li>
</ul>
</p>
<p><i>Code coverage analysis</i> a.k.a. <i>test coverage analysis</i> is all about how thoroughly your tests exercise your code base and, as mentioned above, can be considered an indirect measure of quality - indirect because it gauges the degree to which the tests cover the code, rather than directly measuring the quality of the code itself. Code coverage can be viewed as white-box or structural testing, because the "assertions" are made against the internals of classes, not against the system's interfaces or contracts. It helps to identify paths in your program that are not being tested, and is most useful and powerful when testing logic-intensive applications.</p>
<p>Here is a summary of the most common "measures" used in code coverage analysis - for more on the subject, review this nice <a href="/tc?module=Static&d1=features&d2=021307">introduction</a>.

<ul>
<li>Basic measures
    <ul>
        <li>statement coverage (line coverage)</li>
        <li>basic block coverage</li>
        <li>decision coverage (branch coverage)</li>
        <li>multiple condition coverage</li>
        <li>path coverage</li>
    </ul>
</li>
<li>Other measures
    <ul>
        <li>function coverage (method coverage)</li>
        <li>call coverage</li>
        <li>data flow coverage</li>
        <li>loop coverage</li>
        <li>race coverage</li>
        <li>relational operator coverage</li>
        <li>table coverage</li>
    </ul>
</li>
</ul>
</p>
<p><span class="bodySubtitle">2. The tools</span><br>
Four tools were chosen to be reviewed, <a href="<tc-webtag:linkTracking link="http://emma.sourceforge.net/"/>" target="_blank" refer="feature 030107"/>EMMA</a> and <a href="<tc-webtag:linkTracking link="http://cobertura.sourceforge.net/"/>" target="_blank" refer="feature 030107"/>Cobertura</a> for Java and <a href="<tc-webtag:linkTracking link="http://ncover.org/SITE/files/default.aspx"/>" target="_blank" refer="feature 030107"/>NCover</a> and TeamCoverage for .NET C#. These tools were reviewed over a set of TopCoder expectations and run against a set of representative components to see how they performed.</p>

<p><span class="bodySubtitle">3. EMMA vs. Cobertura</span><br>
For TopCoder Java component development we  reviewed Vlad Roubtsov's EMMA and Mark Doliner's Cobertura (which is Spanish for coverage). First, let's  look at a side-by-side comparison, then we'll point out some particular things about each tool with excerpts from the reviewers' comments.</p>

<p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr>
        <td class="header">TopCoder Expectations</td>
        <td class="header">EMMA</td>
        <td class="header">Cobertura</td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td class="value">JDK 1.4 support</td>
        <td class="value">Yes</td>
        <td class="value">Yes</td>
    </tr>
    <tr class="dark">
        <td class="value">JDK 1.5 support</td>
        <td class="value">Yes</td>
        <td class="value">Yes</td>
    </tr>
    <tr class="light">
        <td class="value">Partial line coverage (i.e. corner case if entire method code will be put on single-line, <br>will it still show valuable coverage details)</td>
        <td class="value">Yes</td>
        <td class="value">Yes(to some extent)</td>
    </tr>
    <tr class="dark">
        <td class="value">Support for Ant (i.e. how hard will it be to integrate into Ant: exec vs. custom task )</td>
        <td class="value">Yes(custom ant task)</td>
        <td class="value">Yes(custom ant task)</td>
    </tr>
    <tr class="light">
        <td class="value">Support for JUnit integration (i.e. will it be able to execute JUnit tests and give some details <br>about test-cases hitting method vs. % or lines of code covered by each test case)</td>
        <td class="value">Yes(framework agnostic)</td>
        <td class="value">Yes(framework agnostic)</td>
    </tr>
    <tr class="dark">
        <td class="value">Support for programming access to coverage reports (i.e. XML or some other API to read coverage files <br>in order to create combined report across several submissions)</td>
        <td class="value">Yes(XML)</td>
        <td class="value">Yes(XML)</td>
    </tr>
    <tr class="light">
        <td class="value">TXT reports (nice to have as current scorecards do not allow HTML and copying-pasting<br> from HTML reports can mess up formatting)</td>
        <td class="value">Yes</td>
        <td class="value">No</td>
    </tr>
    <tr class="dark">
        <td class="value">Licensing and pricing</td>
        <td class="value">Free (Common Public License)</td>
        <td class="value">Free (GPL; most of it)</td>
    </tr>
    <tr class="light">
        <td class="value">Command Line Launch</td>
        <td class="value">Yes</td>
        <td class="value">Yes</td>
    </tr>
    <tr class="dark">
        <td class="value">Ease of use</td>
        <td class="value">Quite easy</td>
        <td class="value">Quite easy</td>
    </tr>
</tbody>    
</table>
</p>

<p>Cobertura uses <i>line</i> and <i>block</i> coverage measures and bytecode instrumenting to generate its coverage reports, including a twist with the <a href="<tc-webtag:linkTracking link="http://www.sei.cmu.edu/str/descriptions/cyclomatic_body.html"/>" target="_blank" refer="feature 030107"/>McCabe cyclomatic complexity</a>. Below is a sample report:</p>

<div align="center"><A href="/i/education/030107_1_lrg.png" target="blank"><img src="/i/education/030107_1.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>

<p>EMMA takes a more complex approach and supports the class, method, line, and basic block coverage measures. It can instrument classes for coverage either <i>offline</i> (before they are loaded) or <i>on the fly</i> (using an instrumenting application classloader) and also handles entire .jar files without needing to expand them.</p>

<div align="center"><A href="/i/education/030107_2_lrg.png" target="blank"><img src="/i/education/030107_2.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>

<p>From the usage point of view both tools are easy to use and set up. "I found Emma to be easy to use," wrote <tc-webtag:handle coderId="297823" />, in his review of EMMA. "All I had to do was insert a couple of lines (which were provided in the documentation) into ant's build.xml file and I got coverage results.  I didn't run into any problems during testing.  I guess the only 'edge' case is when a single line is only partially covered, which, because Emma instruments byte code rather than source code, sometimes happens unexpectedly.  It handles this fine, though, and shows the relevant line as partially covered."</p>

<p>I reviewed Cobertura, and found that I could make the most of it after spending just one or two hours hours studying the documentation and the examples (though, of course, my familiarity with Ant probably helped).</p>

<p>Reports can be generated in HTML and also XML by both tools, though only EMMA provides plain text results. Both tools can be run from the command line, provide custom ant tasks, and are test framework agnostic, thus not favoring any of the frameworks with special integration. Both are free and have a strong community behind them, which is comforting if you run into problems while using them. Another thing to be noted is that the code must be compiled with the debug info for Cobertura to generate reports, while "EMMA does not require access to the source code and degrades gracefully with decreasing amount of debug information available in the input classes."</p>

<p>Next let's look at some real usage examples, based on TopCoder components.
<br><br>
<b>Emma:</b></p>


<p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
    <thead>
        <tr nowrap="nowrap">
        <td class="header">&#160;</td> <td class="header">&#160;</td> <td colspan="2" class="headerC">Class</td> <td colspan="2" class="headerC">Method</td> <td colspan="2" class="headerC">Block</td> <td colspan="2" class="headerC">Line</td>
    </tr>
    <tr nowrap="nowrap">
        <td class="header">Component</td>
        <td class="headerC">Version</td>
        <td class="headerC">Tested</td>
        <td class="headerC">Total</td>
        <td class="headerC">Tested</td>
        <td class="headerC">Total</td>
        <td class="headerC">Tested</td>
        <td class="headerC">Total</td>
        <td class="headerC">Tested</td> 
        <td class="headerC">Total</td>
    </tr>
    </thead>
<tbody>
    <tr class="light">
        <td class="value">Auditor</td> <td class="valueC">1.0.0</td> <td class="valueC">8</td> <td class="valueC">8</td> <td class="valueC">24</td> <td class="valueC">41</td> <td class="valueC">272</td> <td class="valueC">974</td> <td class="valueC">76.9</td> <td class="valueC">239</td>
    </tr>
    <tr class="dark">
        <td class="value">Bloom Filter</td> <td class="valueC">1.1.0</td> <td class="valueC">9</td> <td class="valueC">10</td> <td class="valueC">68</td> <td class="valueC">78</td> <td class="valueC">1,624</td> <td class="valueC">1,912</td> <td class="valueC">356.0</td> <td class="valueC">417</td>
    </tr>
    <tr class="light">
        <td class="value">Configuration Manager</td> <td class="valueC">2.1.5</td> <td class="valueC">15</td> <td class="valueC">15</td> <td class="valueC">144</td> <td class="valueC">145</td> <td class="valueC">4,654</td> <td class="valueC">5,328</td> <td class="valueC">1,080.2</td> <td class="valueC">1,226</td>
    </tr>
    <tr class="dark">
        <td class="value">Data Validation</td> <td class="valueC">1.0.0</td> <td class="valueC">41</td> <td class="valueC">43</td> <td class="valueC">207</td> <td class="valueC">220</td> <td class="valueC">2,606</td> <td class="valueC">2,941</td> <td class="valueC"></td> <td class="valueC"></td>
    </tr>
    <tr class="light">
        <td class="value">Event eMail Processor</td> <td class="valueC">1.0.0</td> <td class="valueC">14</td> <td class="valueC">15</td> <td class="valueC">77</td> <td class="valueC">93</td> <td class="valueC">1246</td> <td class="valueC">2110</td> <td class="valueC">287.8</td> <td class="valueC">497</td>
    </tr>
    <tr class="dark">
        <td class="value">POP3 Client</td> <td class="valueC">1.0.0</td> <td class="valueC">27</td> <td class="valueC">27</td> <td class="valueC">125</td> <td class="valueC">132</td> <td class="valueC">2,537</td> <td class="valueC">3,078</td> <td class="valueC">664.9</td> <td class="valueC">779</td>
    </tr>
    <tr class="light">
        <td class="value">SAML Schema</td> <td class="valueC">1.1.0</td> <td class="valueC">48</td> <td class="valueC">50</td> <td class="valueC">351</td> <td class="valueC">448</td> <td class="valueC">9,437</td> <td class="valueC">14,976</td> <td class="valueC">2,099.1</td> <td class="valueC">3,189</td>
    </tr>
    <tr class="dark">
        <td class="value">Simple Cache</td> <td class="valueC">2.0.0</td> <td class="valueC">17</td> <td class="valueC">17</td> <td class="valueC">86</td> <td class="valueC">96</td> <td class="valueC">2,482</td> <td class="valueC">3,025</td> <td class="valueC">648.2</td> <td class="valueC">790</td>
    </tr>
    <tr class="light">
        <td class="value">Unit Test Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">11</td> <td class="valueC">11</td> <td class="valueC">49</td> <td class="valueC">65</td> <td class="valueC">1,620</td> <td class="valueC">2,457</td> <td class="valueC"></td> <td class="valueC"></td>
    </tr>
    <tr class="dark">
        <td class="value">XML 2 SQL</td> <td class="valueC">2.0.0</td> <td class="valueC">11</td> <td class="valueC">11</td> <td class="valueC">47</td> <td class="valueC">77</td> <td class="valueC">853</td> <td class="valueC">2,641</td> <td class="valueC">226.3</td> <td class="valueC">612</td>
    </tr>
    <tr class="light">
        <td class="value">XSL Engine</td> <td class="valueC">1.0.1</td> <td class="valueC">10</td> <td class="valueC">10</td> <td class="valueC">63</td> <td class="valueC">63</td> <td class="valueC">1,486</td> <td class="valueC">1,594</td> <td class="valueC">354.0</td> <td class="valueC">383</td>
    </tr>
</tbody>
</table>
</p>
<p><b>Cobertura:</b></p>
<p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>    
    <tr nowrap="nowrap">
        <td class="header">&#160;</td> <td class="header">&#160;</td> <td class="headerC" colspan="2">Class</td> <td class="headerC" colspan="2">Line</td> <td class="headerC" colspan="2">Branch</td> <td class="headerC">Complexity</td>
    </tr>
    <tr nowrap="nowrap">
        <td class="header">Component</td> <td class="headerC">Version</td> <td class="headerC">Tested</td> <td class="headerC">Total</td> <td class="headerC">Tested</td> <td class="headerC">Total</td> <td class="headerC">Tested</td> <td class="headerC">Total</td> <td class="headerC"></td>
    </tr>
</thead>
<tbody>    
    <tr class="light">
        <td class="value">Auditor</td> <td class="valueC">1.0.0</td> <td class="valueC">8</td> <td class="valueC">11</td> <td class="valueC">163</td> <td class="valueC">240</td> <td class="valueC">36</td> <td class="valueC">38</td> <td class="valueC">2.950</td>
    </tr>
    <tr class="dark">
        <td class="value">Bloom Filter</td> <td class="valueC">1.1.0</td> <td class="valueC">10</td> <td class="valueC">13</td> <td class="valueC">358</td> <td class="valueC">419</td> <td class="valueC">68</td> <td class="valueC">76</td> <td class="valueC">2.854</td>
    </tr>
    <tr class="light">
        <td class="value">Configuration Manager</td> <td class="valueC">2.1.5</td> <td class="valueC">15</td> <td class="valueC">17</td> <td class="valueC">1,121</td> <td class="valueC">1,270</td> <td class="valueC">315</td> <td class="valueC">323</td> <td class="valueC">4.000</td>
    </tr>
    <tr class="dark">
        <td class="value">Data Validation</td> <td class="valueC">1.0.0</td> <td class="valueC">17(43)</td> <td class="valueC">18(44)</td> <td class="valueC">598</td> <td class="valueC">659</td> <td class="valueC">174</td> <td class="valueC">194</td> <td class="valueC">2.248</td>
    </tr>
    <tr class="light">
        <td class="value">Event eMail Processor</td> <td class="valueC">1.0.0</td> <td class="valueC">13(15)</td> <td class="valueC">17(19)</td> <td class="valueC">308</td> <td class="valueC">505</td> <td class="valueC">42</td> <td class="valueC">60</td> <td class="valueC">2.212</td>
    </tr>
    <tr class="dark">
        <td class="value">POP3 Client</td> <td class="valueC">1.0.0</td> <td class="valueC">27</td> <td class="valueC">33</td> <td class="valueC">684</td> <td class="valueC">788</td> <td class="valueC">142</td> <td class="valueC">146</td> <td class="valueC">2.755</td>
    </tr>
    <tr class="light">
        <td class="value">SAML Schema</td> <td class="valueC">1.1.0</td> <td class="valueC">49</td> <td class="valueC">51</td> <td class="valueC">2,752</td> <td class="valueC">3,264</td> <td class="valueC">605</td> <td class="valueC">663</td> <td class="valueC">3.462</td>
    </tr>
    <tr class="dark">
        <td class="value">Simple Cache</td> <td class="valueC">2.0.0</td> <td class="valueC">14(17)</td> <td class="valueC">19(22)</td> <td class="valueC">695</td> <td class="valueC">807</td> <td class="valueC">136</td> <td class="valueC">143</td> <td class="valueC">3.200</td>
    </tr>
    <tr class="light">
        <td class="value">Unit Test Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">7(11)</td> <td class="valueC">8(12)</td> <td class="valueC">309</td> <td class="valueC">463</td> <td class="valueC">55</td> <td class="valueC">84</td> <td class="valueC">3.509</td>
    </tr>
    <tr class="dark">
        <td class="value">XML 2 SQL</td> <td class="valueC">2.0.0</td> <td class="valueC">11</td> <td class="valueC">14</td> <td class="valueC">246</td> <td class="valueC">620</td> <td class="valueC">40</td> <td class="valueC">101</td> <td class="valueC">3.471</td>
    </tr>
    <tr class="light">
        <td class="value">XSL Engine</td> <td class="valueC">1.0.1</td> <td class="valueC">10</td> <td class="valueC">11</td> <td class="valueC">358</td> <td class="valueC">388</td> <td class="valueC">78</td> <td class="valueC">78</td> <td class="valueC">3.734</td>
    </tr>
</tbody>
</table>
</p>
<p>As you can see here we cannot talk about a full side-by-side comparison, since the measures are different. Some small observation, though, about Cobertura can be made. It reports interfaces as classes with N/A test coverage (EMMA just ignores them), which can be a little bit confusing, especially at first. It can stumble on classes with only static methods and reports complex one-liners as fully covered even if they aren't.</p>

<p>EMMA is pretty fast, and the memory overhead is just a few hundred bytes. Cobertura isn't quite as speedy, and it occasionally incurred serious delays on the test runs (I noticed some tests that took a few seconds without Cobertura instrumenting the classes could take up to a few minutes with the instrumented classes).</p>

<p><span class="bodySubtitle">4. NCover vs. TeamCoverage</span><br>
For .NET C# component development TopCoder reviewed Peter Waldschmidt's NCover and Microsoft's TeamCoverage.</p>

<p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr>
        <td class="header">TopCoder Expectations</td> <td class="headerC">NCover</td> <td class="headerC">TeamCoverage</td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td class="value">.NET 2.0 support</td>
        <td class="valueC">Yes</td>
        <td class="valueC">Yes</td>
    </tr>
    <tr class="dark">
        <td class="value">.NET 1.1. support</td>
        <td class="valueC">Yes</td>
        <td class="valueC">Yes</td>
    </tr>
    <tr class="light">
        <td class="value">C# support</td>
        <td class="valueC">Yes</td>
        <td class="valueC">Yes</td>
    </tr>
    <tr class="dark">
        <td class="value">Partial line coverage</td> <td class="valueC">Yes</td> <td class="valueC">Yes</td>
    </tr>
    <tr class="light">
        <td class="value">Support for nant</td> <td class="valueC">Yes</td> <td class="valueC">No</td>
    </tr>
    <tr class="dark">
        <td class="value">Support for programming access to coverage reports.</td> <td class="valueC">Yes</td> <td class="valueC">Yes</td>
    </tr>
    <tr class="light">
        <td class="value">Text reports.</td> <td class="valueC">No</td> <td class="valueC">No</td>
    </tr>
    <tr class="dark">
        <td class="value">Licensing and pricing issues.</td> <td class="valueC">GPL</td> <td class="valueC">Yes</td>
    </tr>
    <tr class="light">
        <td class="value">Support for command line launch.</td> <td class="valueC">Yes</td> <td class="valueC">Yes</td>
    </tr>
    <tr class="dark">
        <td class="value">Ease of use</td> <td class="valueC">Yes</td> <td class="valueC">No</td>
    </tr>
</tbody>    
</table>
</p>

<p>NCover uses <i>method</i>, <i>block</i> and <i>line</i> coverage measures to instrument the code, while TeamCoverage uses only <i>branch</i> and <i>line</i> measures.</p>

<p>Both tools have .NET 1.1, .NET 2.0 and C# support (though the latest NCover build is not working on 1.1 due to a bug, according to the NCover site).</p>

<p>NCover has support for Nant as an exec task. <tc-webtag:handle coderId="15891862" />, who reviewed TeamCoverage, noted that "even used through <exec> task [it] has some problems."</p>

<p>Unfortunately this isn't the end of that the issues with TeamCoverage. "The reports can only be viewed in VS or accessed programmatically," wrote <tc-webtag:handle coderId="15891862" />. The tool "is only available as a part of MS VS Team Suite, which has a high price." In terms of ease of use, the tool is "not really intuitive, very limited. The results cannot be converted into human readable format without special effort (writing a tool). It is easy to use only when working in VS and using VS built-in functionalities for everything, it doesn't seems to be possible to combine VS GUI possibilities considering coverage with Nunit."</p>

<p>"Looks like a good solution only for those who already own the MS VS Team Suite and use it to do all jobs related to testing, i.e. testing is done using MS testing framework. Command line possibilities are marginal; to use the tool efficiently one needs to write his own programs which will access coverage data programmatically using the MS API."</p>

<p>Here's a sample of how TeamCoverage presents its results:</p>

<div align="center"><A href="/i/education/030107_3_lrg.png" target="blank"><img src="/i/education/030107_3.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>

<p>Here's a look at real usage examples, based on TopCoder components:
<br><br>
<b>TeamCoverage</b></p>

<p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr>
        <td class="header">&#160;</td> <td class="header">&#160;</td> <td class="headerC" colspan="2">Block</td> <td class="headerC" colspan="2">Line</td>
    </tr>
    <tr>
        <td class="headerC">Component</td> <td class="headerC">Version</td> <td class="headerC">Tested</td> <td class="headerC">Total</td> <td class="headerC">Tested</td> <td class="headerC">Total</td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td class="value">BCP Output Sink</td> <td class="valueC">1.0.0</td> <td class="valueC">94.81%</td> <td class="valueC">925</td> <td class="valueC">93.31%</td> <td class="valueC">883</td>
    </tr>
    <tr class="dark">
        <td class="value">Bloom Filter</td> <td class="valueC">1.0.0</td> <td class="valueC">97.81%</td> <td class="valueC">457</td> <td class="valueC">99.06%</td> <td class="valueC">426</td>
    </tr>
    <tr class="light">
        <td class="value">Configuration Manager</td> <td class="valueC">2.0.0</td> <td class="valueC">87.56%</td> <td class="valueC">1,214</td> <td class="valueC">83.44%</td> <td class="valueC">1,055</td>
    </tr>
    <tr class="dark">
        <td class="value">Data Migration Manager</td> <td class="valueC">1.0.0</td> <td class="valueC">92.25%</td> <td class="valueC">1,316</td> <td class="valueC">92.40%</td> <td class="valueC">1,288</td>
    </tr>
    <tr class="light">
        <td class="value">Date Picker Control</td> <td class="valueC">1.0.0</td> <td class="valueC">80.81%</td> <td class="valueC">271</td> <td class="valueC">85.29%</td> <td class="valueC">305</td>
    </tr>
    <tr class="dark">
        <td class="value">Date Utility</td> <td class="valueC">2.1.0</td> <td class="valueC">90.04%</td> <td class="valueC">1,847</td> <td class="valueC">87.25%</td> <td class="valueC">1,717</td>
    </tr>
    <tr class="light">
        <td class="value">Distributed Simple Cache</td> <td class="valueC">1.0.0</td> <td class="valueC">62.07%</td> <td class="valueC">1,147</td> <td class="valueC">63.58%</td> <td class="valueC">974</td>
    </tr>
    <tr class="dark">
        <td class="value">Global Distance Calculator</td> <td class="valueC">1.0.0</td> <td class="valueC">99.34%</td> <td class="valueC">303</td> <td class="valueC">99.24%</td> <td class="valueC">263</td>
    </tr>
    <tr class="light">
        <td class="value">Graph Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">95.50%</td> <td class="valueC">333</td> <td class="valueC">97.00%</td> <td class="valueC">298</td>
    </tr>
    <tr class="dark">
        <td class="value">Hashing Utility</td> <td class="valueC">1.0.0</td> <td class="valueC">97.42%</td> <td class="valueC">233</td> <td class="valueC">96.67%</td> <td class="valueC">239</td>
    </tr>
    <tr class="light">
        <td class="value">Image Manipulation</td> <td class="valueC">1.0.0</td> <td class="valueC">90.73%</td> <td class="valueC">755</td> <td class="valueC">91.71%</td> <td class="valueC">865</td>
    </tr>
    <tr class="dark">
        <td class="value">Instant Messaging Framework</td> <td class="valueC">1.0.0</td> <td class="valueC">92.00%</td> <td class="valueC">888</td> <td class="valueC">93.97%</td> <td class="valueC">846</td>
    </tr>
    <tr class="light">
        <td class="value">Line Graph</td> <td class="valueC">1.1.0</td> <td class="valueC">94.60%</td> <td class="valueC">352</td> <td class="valueC">94.10%</td> <td class="valueC">372</td>
    </tr>
    <tr class="dark">
        <td class="value">Object Pool</td> <td class="valueC">1.0.0</td> <td class="valueC">90.39%</td> <td class="valueC">333</td> <td class="valueC">86.76%</td> <td class="valueC">339</td>
    </tr>
    <tr class="light">
        <td class="value">PDF Form Control</td> <td class="valueC">1.0.0</td> <td class="valueC">57.22%</td> <td class="valueC">2,370</td> <td class="valueC">59.43%</td> <td class="valueC">2,149</td>
    </tr>
    <tr class="dark">
        <td class="value">Random String Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">100.00%</td> <td class="valueC">67</td> <td class="valueC">100.00%</td> <td class="valueC">87</td>
    </tr>
    <tr class="light">
        <td class="value">Reference Collection</td> <td class="valueC">1.0.0</td> <td class="valueC">91.75%</td> <td class="valueC">424</td> <td class="valueC">91.28%</td> <td class="valueC">446</td>
    </tr>
    <tr class="dark">
        <td class="value">Report Data</td> <td class="valueC">1.0.0</td> <td class="valueC">91.59%</td> <td class="valueC">690</td> <td class="valueC">91.72%</td> <td class="valueC">478</td>
    </tr>
    <tr class="light">
        <td class="value">Rounding Factory</td> <td class="valueC">1.0.0</td> <td class="valueC">98.04%</td> <td class="valueC">663</td> <td class="valueC">97.91%</td> <td class="valueC">621</td>
    </tr>
    <tr class="dark">
        <td class="value">RSS Library</td> <td class="valueC">1.0.0</td> <td class="valueC">87.46%</td> <td class="valueC">3,956</td> <td class="valueC">86.92%</td> <td class="valueC">3,628</td>
    </tr>
    <tr class="light">
        <td class="value">Serial Number Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">78.72%</td> <td class="valueC">1,043</td> <td class="valueC">78.79%</td> <td class="valueC">1,075</td>
    </tr>
    <tr class="dark">
        <td class="value">Simple XSL Transformer</td> <td class="valueC">1.0.0</td> <td class="valueC">91.64%</td> <td class="valueC">299</td> <td class="valueC">85.59%</td> <td class="valueC">339</td>
    </tr>
    <tr class="light">
        <td class="value">Stream Filter</td> <td class="valueC">1.0.0</td> <td class="valueC">96.68%</td> <td class="valueC">422</td> <td class="valueC">97.62%</td> <td class="valueC">376</td>
    </tr>
</tbody>    
</table>
</p>

<p><b>NCover:</b></p>

<p>
<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr>
        <td class="header">&#160;</td> <td class="header">&#160;</td> <td class="headerC" colspan="2">Class</td> <td class="headerC" colspan="2">Method</td> <td class="headerC" colspan="2">Block</td> <td class="headerC" colspan="2">Line</td>
    </tr>
    <tr>
        <td class="header">Component</td> <td class="headerC">Version</td> <td class="headerC">Tested</td> <td class="headerC">Total</td> <td class="headerC">Tested</td> <td class="headerC">Total</td> <td class="headerC">Tested</td> <td class="headerC">Total</td> <td class="headerC">Tested</td> <td class="headerC">Total</td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td class="value">BCP Output Sink</td> <td class="valueC">1.0.0</td> <td class="valueC">11</td> <td class="valueC">11</td> <td class="valueC">237</td> <td class="valueC">388</td> <td class="valueC">1,084</td> <td class="valueC">1,406</td> <td class="valueC">1,245</td> <td class="valueC">1,570</td>
    </tr>
    <tr class="dark">
        <td class="value">Bloom Filter</td> <td class="valueC">1.0.0</td> <td class="valueC">25</td> <td class="valueC">25</td> <td class="valueC">367</td> <td class="valueC">371</td> <td class="valueC">1,537</td> <td class="valueC">1,731</td> <td class="valueC">1,622</td> <td class="valueC">1,622</td>
    </tr>
    <tr class="light">
        <td class="value">Configuration Manager</td> <td class="valueC">2.0.0</td> <td class="valueC">60</td> <td class="valueC">60</td> <td class="valueC">446</td> <td class="valueC">467</td> <td class="valueC">2,232</td> <td class="valueC">2,552</td> <td class="valueC">2,302</td> <td class="valueC">2,519</td>
    </tr>
    <tr class="dark">
        <td class="value">Currency Factory</td> <td class="valueC">1.0.0</td> <td class="valueC">30</td> <td class="valueC">30</td> <td class="valueC">101</td> <td class="valueC">291</td> <td class="valueC">330</td> <td class="valueC">456</td> <td class="valueC">374</td> <td class="valueC">495</td>
    </tr>
    <tr class="light">
        <td class="value">Data Migration Manager</td> <td class="valueC">1.0.0</td> <td class="valueC">47</td> <td class="valueC">47</td> <td class="valueC">574</td> <td class="valueC">589</td> <td class="valueC">2,409</td> <td class="valueC">2,716</td> <td class="valueC">2,593</td> <td class="valueC">2,834</td>
    </tr>
    <tr class="dark">
        <td class="value">Date Picker Control</td> <td class="valueC">1.0.0</td> <td class="valueC">19</td> <td class="valueC">19</td> <td class="valueC">226</td> <td class="valueC">231</td> <td class="valueC">549</td> <td class="valueC">658</td> <td class="valueC">585</td> <td class="valueC">688</td>
    </tr>
    <tr class="light">
        <td class="value">Date Utility</td> <td class="valueC">2.0.0</td> <td class="valueC">59</td> <td class="valueC">59</td> <td class="valueC">577</td> <td class="valueC">589</td> <td class="valueC">1,960</td> <td class="valueC">2,424</td> <td class="valueC">2,227</td> <td class="valueC">2,694</td>
    </tr>
    <tr class="dark">
        <td class="value">Distributed Simple Cache</td> <td class="valueC">1.0.0</td> <td class="valueC">36</td> <td class="valueC">36</td> <td class="valueC">114</td> <td class="valueC">224</td> <td class="valueC">278</td> <td class="valueC">657</td> <td class="valueC">282</td> <td class="valueC">599</td>
    </tr>
    <tr class="light">
        <td class="value">Global Distance Calculator</td> <td class="valueC">1.0.0</td> <td class="valueC">29</td> <td class="valueC">29</td> <td class="valueC">264</td> <td class="valueC">269</td> <td class="valueC">792</td> <td class="valueC">885</td> <td class="valueC">1,125</td> <td class="valueC">1,170</td>
    </tr>
    <tr class="dark">
        <td class="value">Graph Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">37</td> <td class="valueC">37</td> <td class="valueC">292</td> <td class="valueC">305</td> <td class="valueC">1,133</td> <td class="valueC">1,247</td> <td class="valueC">1,333</td> <td class="valueC">1,346</td>
    </tr>
    <tr class="light">
        <td class="value">Hashing Utility</td> <td class="valueC">1.0.0</td> <td class="valueC">30</td> <td class="valueC">30</td> <td class="valueC">296</td> <td class="valueC">298</td> <td class="valueC">1,239</td> <td class="valueC">1,330</td> <td class="valueC">1,384</td> <td class="valueC">1,452</td>
    </tr>
    <tr class="dark">
        <td class="value">Image Manipulation</td> <td class="valueC">1.0.0</td> <td class="valueC">96</td> <td class="valueC">96</td> <td class="valueC">631</td> <td class="valueC">640</td> <td class="valueC">2,564</td> <td class="valueC">2,759</td> <td class="valueC">2,958</td> <td class="valueC">3,047</td>
    </tr>
    <tr class="light">
        <td class="value">Instant Messaging Framework</td> <td class="valueC">1.0.0</td> <td class="valueC">74</td> <td class="valueC">74</td> <td class="valueC">678</td> <td class="valueC">686</td> <td class="valueC">2,844</td> <td class="valueC">3,086</td> <td class="valueC">2,874</td> <td class="valueC">3,062</td>
    </tr>
    <tr class="dark">
        <td class="value">Line Graph</td> <td class="valueC">1.1.0</td> <td class="valueC">41</td> <td class="valueC">41</td> <td class="valueC">461</td> <td class="valueC">466</td> <td class="valueC">1,935</td> <td class="valueC">2,104</td> <td class="valueC">2,126</td> <td class="valueC">2,245</td>
    </tr>
    <tr class="light">
        <td class="value">Magic Numbers</td> <td class="valueC">1.0.1</td> <td class="valueC">41</td> <td class="valueC">41</td> <td class="valueC">433</td> <td class="valueC">435</td> <td class="valueC">1,787</td> <td class="valueC">2,009</td> <td class="valueC">1,887</td> <td class="valueC">2,043</td>
    </tr>
    <tr class="dark">
        <td class="value">Object Pool</td> <td class="valueC">1.0.0</td> <td class="valueC">18</td> <td class="valueC">18</td> <td class="valueC">98</td> <td class="valueC">174</td> <td class="valueC">481</td> <td class="valueC">548</td> <td class="valueC">498</td> <td class="valueC">541</td>
    </tr>
    <tr class="light">
        <td class="value">PDF Form Control</td> <td class="valueC">1.0.0</td> <td class="valueC">78</td> <td class="valueC">78</td> <td class="valueC">544</td> <td class="valueC">558</td> <td class="valueC">2,746</td> <td class="valueC">3,125</td> <td class="valueC">2,868</td> <td class="valueC">3,128</td>
    </tr>
    <tr class="dark">
        <td class="value">Random String Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">6</td> <td class="valueC">6</td> <td class="valueC">97</td> <td class="valueC">97</td> <td class="valueC">498</td> <td class="valueC">530</td> <td class="valueC">464</td> <td class="valueC">498</td>
    </tr>
    <tr class="light">
        <td class="value">Reference Collection</td> <td class="valueC">1.0.0</td> <td class="valueC">44</td> <td class="valueC">44</td> <td class="valueC">391</td> <td class="valueC">400</td> <td class="valueC">2,150</td> <td class="valueC">2,252</td> <td class="valueC">2,118</td> <td class="valueC">2,301</td>
    </tr>
    <tr class="dark">
        <td class="value">Report Data</td> <td class="valueC">1.0.0</td> <td class="valueC">15</td> <td class="valueC">15</td> <td class="valueC">166</td> <td class="valueC">169</td> <td class="valueC">1,107</td> <td class="valueC">1,175</td> <td class="valueC">1,153</td> <td class="valueC">1,175</td>
    </tr>
    <tr class="light">
        <td class="value">Rounding Factory</td> <td class="valueC">1.0.0</td> <td class="valueC">45</td> <td class="valueC">45</td> <td class="valueC">469</td> <td class="valueC">469</td> <td class="valueC">1,711</td> <td class="valueC">2,635</td> <td class="valueC">1,738</td> <td class="valueC">2,642</td>
    </tr>
    <tr class="dark">
        <td class="value">RSS Library</td> <td class="valueC">1.0.0</td> <td class="valueC">121</td> <td class="valueC">121</td> <td class="valueC">2,010</td> <td class="valueC">2,075</td> <td class="valueC">9,581</td> <td class="valueC">10,964</td> <td class="valueC">10,882</td> <td class="valueC">11,840</td>
    </tr>
    <tr class="light">
        <td class="value">Serial Number Generator</td> <td class="valueC">1.0.0</td> <td class="valueC">76</td> <td class="valueC">76</td> <td class="valueC">692</td> <td class="valueC">713</td> <td class="valueC">2,765</td> <td class="valueC">2,966</td> <td class="valueC">3,052</td> <td class="valueC">3,112</td>
    </tr>
    <tr class="dark">
        <td class="value">Simple XSL Transformer</td> <td class="valueC">1.0.0</td> <td class="valueC">29</td> <td class="valueC">29</td> <td class="valueC">432</td> <td class="valueC">435</td> <td class="valueC">1,316</td> <td class="valueC">1,663</td> <td class="valueC">1,594</td> <td class="valueC">1,946</td>
    </tr>
    <tr class="light">
        <td class="value">Stream Filter</td> <td class="valueC">1.0.0</td> <td class="valueC">36</td> <td class="valueC">36</td> <td class="valueC">333</td> <td class="valueC">335</td> <td class="valueC">1,410</td> <td class="valueC">1,527</td> <td class="valueC">1,421</td> <td class="valueC">1,467</td>
    </tr>
</table>
</p>

<p>I'm sure you have noticed the discrepancies between the two reports (blocks and lines seem to be really different for the tools), so I'll appeal to <tc-webtag:handle coderId="15891862" /> again to figure this out:</p>

<p>"TopCoder components have one problem with Team Coverage. The issue is that the tests in TopCoder components are usually built into the same assembly with the main classes, instead of using the separate assembly for main classes. The problem is that it is impossible to skip instrumentation and further coverage data gathering of the tests, as they are built into the same assembly. It is possible to modify the build file, but many of the components will need further modification - assembly internal methods will need to be changed to public, or the tests won't compile."</p>

<p>As far as NCover goes, reviewer <tc-webtag:handle coderId="10627428" /> found that invoking it is easy, and the code only needed to be compiled with debug information. NCover has full support for partial line coverage, command line capabilities -- making it scriptable -- but the only output available is in XML (though <tc-webtag:handle coderId="10627428" /> notes that XSL is provided, which can transform the XML into a nice HTML page). One note of caution: NCover requires that the target .dll of the code under test "must be previously compiled for the corresponding framework" (.NET 1.1 or .NET 2.0).

<p>To help with the coverage output the community has developed <a href="<tc-webtag:linkTracking link="http://www.kiwidude.com/blog/2006/02/ncoverexplorer-v13.html"/>" target="_blank" refer="feature_030107"/>NCoverExplorer</a> which displays the reports in a Windows app. Here's a sample of what that looks like:

<div align="center"><A href="/i/education/030107_4_lrg.png" target="blank"><img src="/i/education/030107_4.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>

<p><span class="bodySubtitle">5. Conclusion</span><br>
I hope that by reviewing these tools we have shed more light onto code coverage and helped you see why TopCoder embarked on such a challenge. In the end, TopCoder selected Cobertura and nCover as its default tools for code coverage and, starting today, component submissions will be required to have the coverage tools results embedded. To pass screening, TopCoder has set the threshold at 85% coverage from the unit test cases.

<p>As I stated at the beginning of this article, I believe this is the right next step for TopCoder to take. As we all begin to grapple with the day-to-day realities of implementing code coverage, though, I encourage you to maintain your perspective:  code coverage tools provide valuable insight into unit testing, but remember that they can be misused. It's easy to mistake a high coverage rate for  code that is  flawless, but that isn't necessarily the case. 

<p>Code coverage, particularly in combination with automated testing, can be a powerful tool. One of the best pieces of advice that I've found on the matter, though, was a reminder that no tool is as valuable as your own best judgment. "Code coverage analysis tools," wrote <a href="<tc-webtag:linkTracking link="http://www.testing.com/writings/"/>" target="_blank" refer="feature 030107"/>Brian Marick</a>, "will only be helpful if they're used to enhance thought, not replace it."

<p><span class="bodySubtitle">References:</span><br />
1) <a href="<tc-webtag:linkTracking link="http://www.javaranch.com/newsletter/200401/IntroToCodeCoverage.html"/>" target="_blank" refer="feature 030107"/>Introduction to code coverage</a> by Lasse Koskela<br>
2) <a href="<tc-webtag:linkTracking link="http://www.bullseye.com/coverage.html"/>" target="_blank" refer="feature 030107"/>Code coverage analysis</a> by Steve Cornett<br>
3) <a href="<tc-webtag:linkTracking link="http://www-128.ibm.com/developerworks/java/library/j-cobertura/"/>" target="_blank" refer="feature 030107"/>Measure test coverage with Cobertura</a> by Elliotte Rusty Harold<br>
4) <a href="<tc-webtag:linkTracking link="http://www-128.ibm.com/developerworks/java/library/j-cq01316/"/>" target="_blank" refer="feature 030107"/>In pursuit of code quality: Don't be fooled by the coverage report</a> by Andrew Glover<br>
5) <a href="<tc-webtag:linkTracking link="http://www.testing.com/writings/coverage.pdf"/>" target="_blank" refer="feature 030107"/>How to misuse code coverage</a> [PDF] by Brian Marick<br>
6) <a href="<tc-webtag:linkTracking link="http://ncover.org/site/"/>" target="_blank" refer="feature 030107"/>www.ncover.org</a><br>
7) <a href="<tc-webtag:linkTracking link="http://emma.sourceforge.net"/>" target="_blank" refer="feature 030107"/>emma.sourceforge.net</a><br>
8) <a href="<tc-webtag:linkTracking link="http://cobertura.sourceforge.net"/>" target="_blank" refer="feature 030107"/>cobertura.sourceforge.net</a>
</p>

<p><br></p>
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
