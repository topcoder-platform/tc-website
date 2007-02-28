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

<span class="bigTitle">Test Drive: Code coverage tools</span>
<br /><br />

<%--<div class="authorPhoto">
    <img src="/i/m/ali_raza_shaikh_big2.jpg" alt="Author" />
</div>--%>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22630158" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p><i>"TopCoder is interested in incorporating a code coverage tool in the component development process. The reason is to measure how well the unit test cases are covering all of the code. The ultimate goal is to improve the quality of our components."</i></p>
<p>That's how the idea started in the <a href="http://forums.topcoder.com/?module=Thread&threadID=515101&start=0&mc=21#575619">forums</a> and, as usual, it stirred up a chorus of opinions. TopCoder members offered tool proposals, interesting views and concerns, along with the usual, often unspoken questions: is this a good idea? Is it a bad idea? Will it really help us? Well, code coverage isn't necessarily good or bad, but it is a necessary element of a modern test-driven software development paradigm.</p>
<p>Based on the users' proposals from the forum, TopCoder started to look for the right code coverage tools - ideally ones that were small and versatile, with a reasonable learning curve. After identifying a few likely candidates for both Java and .NET, TopCoder gathered a few coders to test drive the tools. This article will provide a summary of those results.</p>
<p><span class="bodySubtitle">1. Code coverage</span><br>
What is code coverage after all? Let's try defining an outline for the process:
<ul>
	<li>run a code coverage tool (analyzer) to find out the areas of your code not covered by a set of test cases</li>
	<li>determine a quantitative measure, which is an indirect measure of quality</li>
	<li>create additional tests to increase coverage and reach a certain threshold, at which you can consider your code "well tested"</li>
	<li>identify redundant test cases</li>
</ul>
</p>
<p>Code coverage analysis a.k.a. test coverage analysis is all about how thoroughly your tests exercise your code base and, as mentioned above, can be considered an indirect measure of quality - indirect because it gauges the degree to which the tests cover the code, rather than directly measuring the quality of the code itself. Code coverage can be viewed as white-box or structural testing, because the "assertions" are made against the internals of classes, not against the system's interfaces or contracts. It helps to identify paths in your program that are not being tested, and is most useful and powerful when testing logic-intensive applications.</p>
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
Four tools were chosen to be reviewed, EMMA and Cobertura for Java and NCover and TeamCoverage for .NET C#. These tools were reviewed over a set of TopCoder expectations and run against a set of representative components to see how they performed.</p>

<p><span class="bodySubtitle">3. EMMA vs. Cobertura</span><br>
For TopCoder Java component development we  reviewed Vlad Roubtsov's EMMA and Mark Doliner's Cobertura (which is Spanish for coverage). First, let's  look at a side-by-side comparison, then we'll point out some particular things about each tool with excerpts from the reviewers' comments.</p>
<p>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
    <tr class="sidebarTitle" nowrap="nowrap">
		<td>TopCoder Expectations</td> <td>EMMA</td> <td>Cobertura</td>
	</tr>
	<tr class="GAtableText">
		<td>JDK 1.4 support</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>JDK 1.5 support</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>Partial line coverage (i.e. corner case if entire method code will be put on single-line, will it still show valuable coverage details)</td> <td>Yes</td> <td>Yes(to some extent)</td>
	</tr>
	<tr class="GAtableText">
		<td>Support for Ant (i.e. how hard will it be to integrate into Ant: exec vs. custom task )</td> <td>Yes(custom ant task)</td> <td>Yes(custom ant task)</td>
	</tr>
	<tr class="GAtableText">
		<td>Support for JUnit integration (i.e. will it be able to execute JUnit tests and give some details about test-cases hitting method vs. % or lines of code covered by each test case)</td> <td>Yes(framework agnostic)</td> <td>Yes(framework agnostic)</td>
	</tr>
	<tr class="GAtableText">
		<td>Support for programming access to coverage reports (i.e. XML or some other API to read coverage files in order to create combined report across several submissions)</td> <td>Yes(XML)</td> <td>Yes(XML)</td>
	</tr>
	<tr class="GAtableText">
		<td>TXT reports (nice to have as current scorecards do not allow HTML and copying-pasting from HTML reports can mess up formatting)</td> <td>Yes</td> <td>No</td>
	</tr>
	<tr class="GAtableText">
		<td>Licensing and pricing </td> <td>Free (Common Public License)</td> <td>Free (GPL; most of it)</td>
	</tr>
	<tr class="GAtableText">
		<td>Command Line Launch</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>Ease of use</td> <td>Quite easy</td> <td>Quite easy</td>
	</tr>
</table>
</p>

<p>Cobertura uses line and block coverage measures and bytecode instrumenting to generate its coverage reports, including a twist with the McCabe cyclomatic complexity. Below is a sample report:</p>

IMAGE 1

<p>EMMA takes a more complex approach and supports the class, method, line, and basic block coverage measures. It can instrument classes for coverage either offline (before they are loaded) or on the fly (using an instrumenting application classloader) and also handles entire .jar files without needing to expand them.</p>

IMAGE 2

<p>From the usage point of view both tools are easy to use and set up. "I found Emma to be easy to use," wrote madking, in his review of EMMA. "All I had to do was insert a couple of lines (which were provided in the documentation) into ant's build.xml file and I got coverage results.  I didn't run into any problems during testing.  I guess the only 'edge' case is when a single line is only partially covered, which, because Emma instruments byte code rather than source code, sometimes happens unexpectedly.  It handles this fine, though, and shows the relevant line as partially covered."</p>

<p>I reviewed Cobertura, and found that I  could make the most of it after spending just one or two hours hours studying the documentation and the examples (though, of course, my familiarity with Ant probably helped).</p>

<p>Reports can be generated in HTML and also XML by both tools, though only EMMA provides plain text results. Both tools can be run from the command line, provide custom ant tasks, and are test framework agnostic, thus not favoring any of the frameworks with special integration. Both are free and have a strong community behind them, which is comforting if you run into problems while using them. Another thing to be noted is that the code must be compiled with the debug info for Cobertura to generate reports, while "EMMA does not require access to the source code and degrades gracefully with decreasing amount of debug information available in the input classes."</p>

<p>Next let's look at some real usage examples, based on TopCoder components.
<br><br>
Emma:</p>

<p>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
	<tr class="sidebarTitle" nowrap="nowrap">
		<td></td> <td></td> <td>Class</td> <td>Method</td> <td>Block</td> <th>Line</td>
	</tr>
	<tr class="GAtableText">
		<td>Component</td> <td>Version</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td>
	</tr>
	<tr class="GAtableText">
		<td>Auditor</td> <td>1.0.0</td> <td>8</td> <td>8</td> <td>24</td> <td>41</td> <td>272</td> <td>974</td> <td>76.9</td> <td>239</td>
	</tr>
	<tr class="GAtableText">
		<td>Bloom Filter</td> <td>1.1.0</td> <td>9</td> <td>10</td> <td>68</td> <td>78</td> <td>1,624</td> <td>1,912</td> <td>356.0</td> <td>417</td>
	</tr>
	<tr class="GAtableText">
		<td>Configuration Manager</td> <td>2.1.5</td> <td>15</td> <td>15</td> <td>144</td> <td>145</td> <td>4,654</td> <td>5,328</td> <td>1,080.2</td> <td>1,226</td>
	</tr>
	<tr class="GAtableText">
		<td>Data Validation</td> <td>1.0.0</td> <td>41</td> <td>43</td> <td>207</td> <td>220</td> <td>2,606</td> <td>2,941</td> <td></td> <td></td>
	</tr>
	<tr class="GAtableText">
		<td>Event eMail Processor</td> <td>1.0.0</td> <td>14</td> <td>15</td> <td>77</td> <td>93</td> <td>1246</td> <td>2110</td> <td>287.8</td> <td>497</td>
	</tr>
	<tr class="GAtableText">
		<td>POP3 Client</td> <td>1.0.0</td> <td>27</td> <td>27</td> <td>125</td> <td>132</td> <td>2,537</td> <td>3,078</td> <td>664.9</td> <td>779</td>
	</tr>
	<tr class="GAtableText">
		<td>SAML Schema</td> <td>1.1.0</td> <td>48</td> <td>50</td> <td>351</td> <td>448</td> <td>9,437</td> <td>14,976</td> <td>2,099.1</td> <td>3,189</td>
	</tr>
	<tr class="GAtableText">
		<td>Simple Cache</td> <td>2.0.0</td> <td>17</td> <td>17</td> <td>86</td> <td>96</td> <td>2,482</td> <td>3,025</td> <td>648.2</td> <td>790</td>
	</tr>
	<tr class="GAtableText">
		<td>Unit Test Generator</td> <td>1.0.0</td> <td>11</td> <td>11</td> <td>49</td> <td>65</td> <td>1,620</td> <td>2,457</td> <td></td> <td></td>
	</tr>
	<tr class="GAtableText">
		<td>XML 2 SQL</td> <td>2.0.0</td> <td>11</td> <td>11</td> <td>47</td> <td>77</td> <td>853</td> <td>2,641</td> <td>226.3</td> <td>612</td>
	</tr>
	<tr class="GAtableText">
		<td>XSL Engine</td> <td>1.0.1</td> <td>10</td> <td>10</td> <td>63</td> <td>63</td> <td>1,486</td> <td>1,594</td> <td>354.0</td> <td>383</td>
	</tr>
</table>
</p>
<p>Cobertura:</p>
<p>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
	<tr class="sidebarTitle" nowrap="nowrap">
		<td></td> <td></td> <th>Class</td> <td>Line</td> <td>Branch</td> <td>Complexity</td>
	</tr>
	<tr class="GAtableText">
		<td>Component</td> <td>Version</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td> <td></td>
	</tr>
	<tr class="GAtableText">
		<td>Auditor</td> <td>1.0.0</td> <td>8</td> <td>11</td> <td>163</td> <td>240</td> <td>36</td> <td>38</td> <td>2.950</td>
	</tr>
	<tr class="GAtableText">
		<td>Bloom Filter</td> <td>1.1.0</td> <td>10</td> <td>13</td> <td>358</td> <td>419</td> <td>68</td> <td>76</td> <td>2.854</td>
	</tr>
	<tr class="GAtableText">
		<td>Configuration Manager</td> <td>2.1.5</td> <td>15</td> <td>17</td> <td>1,121</td> <td>1,270</td> <td>315</td> <td>323</td> <td>4.000</td>
	</tr>
	<tr class="GAtableText">
		<td>Data Validation</td> <td>1.0.0</td> <td>17(43)</td> <td>18(44)</td> <td>598</td> <td>659</td> <td>174</td> <td>194</td> <td>2.248</td>
	</tr>
	<tr class="GAtableText">
		<td>Event eMail Processor</td> <td>1.0.0</td> <td>13(15)</td> <td>17(19)</td> <td>308</td> <td>505</td> <td>42</td> <td>60</td> <td>2.212</td>
	</tr>
	<tr class="GAtableText">
		<td>POP3 Client</td> <td>1.0.0</td> <td>27</td> <td>33</td> <td>684</td> <td>788</td> <td>142</td> <td>146</td> <td>2.755</td>
	</tr>
	<tr class="GAtableText">
		<td>SAML Schema</td> <td>1.1.0</td> <td>49</td> <td>51</td> <td>2,752</td> <td>3,264</td> <td>605</td> <td>663</td> <td>3.462</td>
	</tr>
	<tr class="GAtableText">
		<td>Simple Cache</td> <td>2.0.0</td> <td>14(17)</td> <td>19(22)</td> <td>695</td> <td>807</td> <td>136</td> <td>143</td> <td>3.200</td>
	</tr>
	<tr class="GAtableText">
		<td>Unit Test Generator</td> <td>1.0.0</td> <td>7(11)</td> <td>8(12)</td> <td>309</td> <td>463</td> <td>55</td> <td>84</td> <td>3.509</td>
	</tr>
	<tr class="GAtableText">
		<td>XML 2 SQL</td> <td>2.0.0</td> <td>11</td> <td>14</td> <td>246</td> <td>620</td> <td>40</td> <td>101</td> <td>3.471</td>
	</tr>
	<tr class="GAtableText">
		<td>XSL Engine</td> <td>1.0.1</td> <td>10</td> <td>11</td> <td>358</td> <td>388</td> <td>78</td> <td>78</td> <td>3.734</td>
	</tr>
</table>
</p>
<p>As you can see here we cannot talk about a full side-by-side comparison, since the measures are different. Some small observation, though, about Cobertura can be made. It reports interfaces as classes with N/A test coverage (EMMA just ignores them), which can be a little bit confusing, especially at first. It can stumble on classes with only static methods and reports complex one-liners as fully covered even if they aren't.</p>

<p>EMMA is pretty fast, and the memory overhead is just a few hundred bytes. Cobertura isn't quite as speedy, and it occasionally incurred serious delays on the test runs (I noticed some tests that took a few seconds without Cobertura instrumenting the classes could take up to a few minutes with the instrumented classes).</p>

<p><span class="bodySubtitle">4. NCover vs. TeamCoverage</span><br>
For.NET C# component development  TopCoder reviewed Peter Waldschmidt's NCover and Microsoft's TeamCoverage.</p>

<p>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
	<tr class="sidebarTitle" nowrap="nowrap">
		<td>TopCoder Expectations</td> <td>NCover</td> <td>TeamCoverage</td>
	</tr>
	<tr class="GAtableText">
		<td>.NET 2.0 support</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>.NET 1.1. support</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>C# support</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>Partial line coverage</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>Support for nant</td> <td>Yes</td> <td>No</td>
	</tr>
	<tr class="GAtableText">
		<td>Support for programming access to coverage reports.</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>Text reports.</td> <td>No</td> <td>No</td>
	</tr>
	<tr class="GAtableText">
		<td>Licensing and pricing issues.</td> <td>GPL</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>Support for command line launch.</td> <td>Yes</td> <td>Yes</td>
	</tr>
	<tr class="GAtableText">
		<td>Ease of use</td> <td>Yes</td> <td>No</td>
	</tr>
</table>
</p>

<p>NCover uses method, block and line coverage measures to instrument the code, while TeamCoverage uses only branch and line measures.</p>

<p>Both tools have .NET 1.1, .NET 2.0 and C# support (though the latest NCover build is not working on 1.1 due to a bug, according to the NCover site).</p>

<p>NCover has support for Nant as an exec task. <tc-webtag:handle coderId="15891862" />, who reviewed TeamCoverage, noted that "even used through <exec> task [it] has some problems."</p>

<p>Unfortunately this isn't the end of that the issues with TeamCoverage. "The reports can only be viewed in VS or accessed programmatically," wrote <tc-webtag:handle coderId="15891862" />. The tool "is only available as a part of MS VS Team Suite, which has a high price." In terms of ease of use, the tool is "not really intuitive, very limited. The results cannot be converted into human readable format without special effort (writing a tool). It is easy to use only when working in VS and using VS built-in functionalities for everything, it doesn't seems to be possible to combine VS GUI possibilities considering coverage with Nunit."</p>

<p>"Looks like a good solution only for those who already own the MS VS Team Suite and use it to do all jobs related to testing, i.e. testing is done using MS testing framework. Command line possibilities are marginal; to use the tool efficiently one needs to write his own programs which will access coverage data programmatically using the MS API."</p>

<p>Here's a sample of how TeamCoverage presents its results:</p>

IMAGE 3

<p>Here's a look at real usage examples, based on TopCoder components:
<br><br>
TeamCoverage</p>

<p>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
	<tr class="sidebarTitle" nowrap="nowrap">
		<td></td> <td></td> <td>Block</td> <td>Line</td>
	</tr>
	<tr class="GAtableText">
		<td>Component</td> <td>Version</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td>
	</tr>
	<tr class="GAtableText">
		<td>BCP Output Sink</td> <td>1.0.0</td> <td>94.81%</td> <td>925</td> <td>93.31%</td> <td>883</td>
	</tr>
	<tr class="GAtableText">
		<td>Bloom Filter</td> <td>1.0.0</td> <td>97.81%</td> <td>457</td> <td>99.06%</td> <td>426</td>
	</tr>
	<tr class="GAtableText">
		<td>Configuration Manager</td> <td>2.0.0</td> <td>87.56%</td> <td>1,214</td> <td>83.44%</td> <td>1,055</td>
	</tr>
	<tr class="GAtableText">
		<td>Data Migration Manager</td> <td>1.0.0</td> <td>92.25%</td> <td>1,316</td> <td>92.40%</td> <td>1,288</td>
	</tr>
	<tr class="GAtableText">
		<td>Date Picker Control</td> <td>1.0.0</td> <td>80.81%</td> <td>271</td> <td>85.29%</td> <td>305</td>
	</tr>
	<tr class="GAtableText">
		<td>Date Utility</td> <td>2.1.0</td> <td>90.04%</td> <td>1,847</td> <td>87.25%</td> <td>1,717</td>
	</tr>
	<tr class="GAtableText">
		<td>Distributed Simple Cache</td> <td>1.0.0</td> <td>62.07%</td> <td>1,147</td> <td>63.58%</td> <td>974</td>
	</tr>
	<tr class="GAtableText">
		<td>Global Distance Calculator</td> <td>1.0.0</td> <td>99.34%</td> <td>303</td> <td>99.24%</td> <td>263</td>
	</tr>
	<tr class="GAtableText">
		<td>Graph Generator</td> <td>1.0.0</td> <td>95.50%</td> <td>333</td> <td>97.00%</td> <td>298</td>
	</tr>
	<tr class="GAtableText">
		<td>Hashing Utility</td> <td>1.0.0</td> <td>97.42%</td> <td>233</td> <td>96.67%</td> <td>239</td>
	</tr>
	<tr class="GAtableText">
		<td>Image Manipulation</td> <td>1.0.0</td> <td>90.73%</td> <td>755</td> <td>91.71%</td> <td>865</td>
	</tr>
	<tr class="GAtableText">
		<td>Instant Messaging Framework</td> <td>1.0.0</td> <td>92.00%</td> <td>888</td> <td>93.97%</td> <td>846</td>
	</tr>
	<tr class="GAtableText">
		<td>Line Graph</td> <td>1.1.0</td> <td>94.60%</td> <td>352</td> <td>94.10%</td> <td>372</td>
	</tr>
	<tr class="GAtableText">
		<td>Object Pool</td> <td>1.0.0</td> <td>90.39%</td> <td>333</td> <td>86.76%</td> <td>339</td>
	</tr>
	<tr class="GAtableText">
		<td>PDF Form Control</td> <td>1.0.0</td> <td>57.22%</td> <td>2,370</td> <td>59.43%</td> <td>2,149</td>
	</tr>
	<tr class="GAtableText">
		<td>Random String Generator</td> <td>1.0.0</td> <td>100.00%</td> <td>67</td> <td>100.00%</td> <td>87</td>
	</tr>
	<tr class="GAtableText">
		<td>Reference Collection</td> <td>1.0.0</td> <td>91.75%</td> <td>424</td> <td>91.28%</td> <td>446</td>
	</tr>
	<tr class="GAtableText">
		<td>Report Data</td> <td>1.0.0</td> <td>91.59%</td> <td>690</td> <td>91.72%</td> <td>478</td>
	</tr>
	<tr class="GAtableText">
		<td>Rounding Factory</td> <td>1.0.0</td> <td>98.04%</td> <td>663</td> <td>97.91%</td> <td>621</td>
	</tr>
	<tr class="GAtableText">
		<td>RSS Library</td> <td>1.0.0</td> <td>87.46%</td> <td>3,956</td> <td>86.92%</td> <td>3,628</td>
	</tr>
	<tr class="GAtableText">
		<td>Serial Number Generator</td> <td>1.0.0</td> <td>78.72%</td> <td>1,043</td> <td>78.79%</td> <td>1,075</td>
	</tr>
	<tr class="GAtableText">
		<td>Simple XSL Transformer</td> <td>1.0.0</td> <td>91.64%</td> <td>299</td> <td>85.59%</td> <td>339</td>
	</tr>
	<tr class="GAtableText">
		<td>Stream Filter</td> <td>1.0.0</td> <td>96.68%</td> <td>422</td> <td>97.62%</td> <td>376</td>
	</tr>
</table>
</p>

<p>NCover:</p>

<p>
<table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
	<tr class="sidebarTitle" nowrap="nowrap">
		<td></td> <td></td> <td>Class</td> <td>Method</td> <td>Block</td> <td>Line</td>
	</tr>
	<tr class="GAtableText">
		<td>Component</td> <td>Version</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td> <td>Tested</td> <td>Total</td>
	</tr>
	<tr class="GAtableText">
		<td>BCP Output Sink</td> <td>1.0.0</td> <td>11</td> <td>11</td> <td>237</td> <td>388</td> <td>1,084</td> <td>1,406</td> <td>1,245</td> <td>1,570</td>
	</tr>
	<tr class="GAtableText">
		<td>Bloom Filter</td> <td>1.0.0</td> <td>25</td> <td>25</td> <td>367</td> <td>371</td> <td>1,537</td> <td>1,731</td> <td>1,622</td> <td>1,622</td>
	</tr>
	<tr class="GAtableText">
		<td>Configuration Manager</td> <td>2.0.0</td> <td>60</td> <td>60</td> <td>446</td> <td>467</td> <td>2,232</td> <td>2,552</td> <td>2,302</td> <td>2,519</td>
	</tr>
	<tr class="GAtableText">
		<td>Currency Factory</td> <td>1.0.0</td> <td>30</td> <td>30</td> <td>101</td> <td>291</td> <td>330</td> <td>456</td> <td>374</td> <td>495</td>
	</tr>
	<tr class="GAtableText">
		<td>Data Migration Manager</td> <td>1.0.0</td> <td>47</td> <td>47</td> <td>574</td> <td>589</td> <td>2,409</td> <td>2,716</td> <td>2,593</td> <td>2,834</td>
	</tr>
	<tr class="GAtableText">
		<td>Date Picker Control</td> <td>1.0.0</td> <td>19</td> <td>19</td> <td>226</td> <td>231</td> <td>549</td> <td>658</td> <td>585</td> <td>688</td>
	</tr>
	<tr class="GAtableText">
		<td>Date Utility</td> <td>2.0.0</td> <td>59</td> <td>59</td> <td>577</td> <td>589</td> <td>1,960</td> <td>2,424</td> <td>2,227</td> <td>2,694</td>
	</tr>
	<tr class="GAtableText">
		<td>Distributed Simple Cache</td> <td>1.0.0</td> <td>36</td> <td>36</td> <td>114</td> <td>224</td> <td>278</td> <td>657</td> <td>282</td> <td>599</td>
	</tr>
	<tr class="GAtableText">
		<td>Global Distance Calculator</td> <td>1.0.0</td> <td>29</td> <td>29</td> <td>264</td> <td>269</td> <td>792</td> <td>885</td> <td>1,125</td> <td>1,170</td>
	</tr>
	<tr class="GAtableText">
		<td>Graph Generator</td> <td>1.0.0</td> <td>37</td> <td>37</td> <td>292</td> <td>305</td> <td>1,133</td> <td>1,247</td> <td>1,333</td> <td>1,346</td>
	</tr>
	<tr class="GAtableText">
		<td>Hashing Utility</td> <td>1.0.0</td> <td>30</td> <td>30</td> <td>296</td> <td>298</td> <td>1,239</td> <td>1,330</td> <td>1,384</td> <td>1,452</td>
	</tr>
	<tr class="GAtableText">
		<td>Image Manipulation</td> <td>1.0.0</td> <td>96</td> <td>96</td> <td>631</td> <td>640</td> <td>2,564</td> <td>2,759</td> <td>2,958</td> <td>3,047</td>
	</tr>
	<tr class="GAtableText">
		<td>Instant Messaging Framework</td> <td>1.0.0</td> <td>74</td> <td>74</td> <td>678</td> <td>686</td> <td>2,844</td> <td>3,086</td> <td>2,874</td> <td>3,062</td>
	</tr>
	<tr class="GAtableText">
		<td>Line Graph</td> <td>1.1.0</td> <td>41</td> <td>41</td> <td>461</td> <td>466</td> <td>1,935</td> <td>2,104</td> <td>2,126</td> <td>2,245</td>
	</tr>
	<tr class="GAtableText">
		<td>Magic Numbers</td> <td>1.0.1</td> <td>41</td> <td>41</td> <td>433</td> <td>435</td> <td>1,787</td> <td>2,009</td> <td>1,887</td> <td>2,043</td>
	</tr>
	<tr class="GAtableText">
		<td>Object Pool</td> <td>1.0.0</td> <td>18</td> <td>18</td> <td>98</td> <td>174</td> <td>481</td> <td>548</td> <td>498</td> <td>541</td>
	</tr>
	<tr class="GAtableText">
		<td>PDF Form Control</td> <td>1.0.0</td> <td>78</td> <td>78</td> <td>544</td> <td>558</td> <td>2,746</td> <td>3,125</td> <td>2,868</td> <td>3,128</td>
	</tr>
	<tr class="GAtableText">
		<td>Random String Generator</td> <td>1.0.0</td> <td>6</td> <td>6</td> <td>97</td> <td>97</td> <td>498</td> <td>530</td> <td>464</td> <td>498</td>
	</tr>
	<tr class="GAtableText">
		<td>Reference Collection</td> <td>1.0.0</td> <td>44</td> <td>44</td> <td>391</td> <td>400</td> <td>2,150</td> <td>2,252</td> <td>2,118</td> <td>2,301</td>
	</tr>
	<tr class="GAtableText">
		<td>Report Data</td> <td>1.0.0</td> <td>15</td> <td>15</td> <td>166</td> <td>169</td> <td>1,107</td> <td>1,175</td> <td>1,153</td> <td>1,175</td>
	</tr>
	<tr class="GAtableText">
		<td>Rounding Factory</td> <td>1.0.0</td> <td>45</td> <td>45</td> <td>469</td> <td>469</td> <td>1,711</td> <td>2,635</td> <td>1,738</td> <td>2,642</td>
	</tr>
	<tr class="GAtableText">
		<td>RSS Library</td> <td>1.0.0</td> <td>121</td> <td>121</td> <td>2,010</td> <td>2,075</td> <td>9,581</td> <td>10,964</td> <td>10,882</td> <td>11,840</td>
	</tr>
	<tr class="GAtableText">
		<td>Serial Number Generator</td> <td>1.0.0</td> <td>76</td> <td>76</td> <td>692</td> <td>713</td> <td>2,765</td> <td>2,966</td> <td>3,052</td> <td>3,112</td>
	</tr>
	<tr class="GAtableText">
		<td>Simple XSL Transformer</td> <td>1.0.0</td> <td>29</td> <td>29</td> <td>432</td> <td>435</td> <td>1,316</td> <td>1,663</td> <td>1,594</td> <td>1,946</td>
	</tr>
	<tr class="GAtableText">
		<td>Stream Filter</td> <td>1.0.0</td> <td>36</td> <td>36</td> <td>333</td> <td>335</td> <td>1,410</td> <td>1,527</td> <td>1,421</td> <td>1,467</td>
	</tr>
</table>
</p>

<p>I'm sure you have noticed the discrepancies between the two reports (blocks and lines seem to be really different for the tools), so I'll appeal to <tc-webtag:handle coderId="15891862" /> again to figure this out:</p>

<p>"TopCoder components have one problem with Team Coverage. The issue is that the tests in TopCoder components are usually built into the same assembly with the main classes, instead of using the separate assembly for main classes. The problem is that it is impossible to skip instrumentation and further coverage data gathering of the tests, as they are built into the same assembly. It is possible to modify the build file, but many of the components will need further modification Ð assembly internal methods will need to be changed to public, or the tests won't compile."</p>

<p>As far as NCover goes, reviewer fvillaf found that invoking it is easy, and the code only needed to be compiled with debug information. NCover has full support for partial line coverage, command line capabilities -- making it scriptable -- but the only output available is in XML (though fvillaf notes that XSL is provided, which can transform the XML into a nice HTML page). One note of caution: NCover requires that the target .dll of the code under test "must be previously compiled for the corresponding framework" (.NET 1.1 or .NET 2.0).

<p>To help with the coverage output the community has developed <a href="<tc-webtag:linkTracking link="http://www.kiwidude.com/blog/2006/02/ncoverexplorer-v13.html"/>" target="_blank" refer="feature_030107"/>NCoverExplorer</a> which displays the reports in a Windows app. Here's a sample of what that looks like:

IMAGE 4

<p><span class="bodySubtitle">5. Conclusion</span><br>
I hope that by reviewing these tools we have shed more light onto code coverage and helped you see why TopCoder embarked on such a challenge. In the end, TopCoder selected Cobertura and nCover as its default tools for code coverage and, starting today, component submissions <tt>will be required to have the coverage tools results embedded. To pass screening, TopCoder has set the threshold at 85% coverage from the unit test cases.</tt>

<p>As I stated at the beginning of this article, I believe this is the right next step for TopCoder to take. As we all begin to grapple with the day-to-day realities of implementing code coverage, though, I encourage you to maintain your perspective:  code coverage tools provide valuable insight into unit testing, but remember that they can be misused. It's easy to mistake a high coverage rate for  code that is  flawless, but that isn't necessarily the case. 

<p>Code coverage, particularly in combination with automated testing, can be a powerful tool. One of the best pieces of advice that I've found on the matter came from Brian Marick, which serves as a reminder that no tool is as valuable as your own best judgment: "Code coverage analysis tools," Marick writes, "will only be helpful "if they're used to enhance thought, not replace it."

 

<p><span class="bodySubtitle">References:</span><br>
1) Introduction to code coverage by Lasse Koskela<br>
2) Code coverage analysis by Steve Cornett<br>
3) Measure test coverage with Cobertura by Elliotte Rusty Harold<br>
4) In pursuit of code quality: Don't be fooled by the coverage report by Andrew Glover<br>
5) How to misuse code coverage by Brian Marick<br>
6) www.ncover.org<br>
7) emma.sourceforge.net<br>
8) cobertura.sourceforge.net
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
