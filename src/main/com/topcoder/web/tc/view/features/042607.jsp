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
    <tc-webtag:forumLink forumID="515472" message="Discuss this article" />
</div>

<span class="bigTitle">Test Drive: SandCastle</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/dcp_big2.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10627428" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>TopCoder is currently using NDoc as the de facto tool to generate documentation for .NET projects, using XML tags written in the component's source code. But NDoc, a freely available tool, has been without support for some time, and lacks support for the new features in .Net Framework version 2.0, including generics and new XML documentation tags.</p>

<p>Microsoft is offering a free download (free for now, at least) of SandCastle, a tool that generates documentation in much the same way that NDoc does. Unlike NDoc, though, this tool is very well supported -- SandCastle is used internally by Microsoft's people to generate documentation for their projects, so we can expect that this tool will be constantly supported and that it will gracefully handle new features from future releases of the framework. How does SandCastle stand up?</p>

<p><span class="bodySubtitle">Installation</span><br />
SandCastle is really quite easy to install. To begin, download it from Microsoft's site -- the most recent available version at this time is "<a target="_blank" href="<tc-webtag:linkTracking link='http://www.microsoft.com/downloads/details.aspx?FamilyId=E82EA71D-DA89-42EE-A715-696E3A4873B2&displaylang=en' refer='feature_042607' />">Sandcastle - March 2007 Community Technology Preview (CTP)</a>."</p>

<p>Simply execute the downloaded installer to have SandCastle ready to be used. You must remove previous versions of SandCastle before starting the installation of this version. In addition, note that SandCastle requires the <strong>hhc.exe</strong> file from HTML Help Workshop. If you're using NDoc now, you probably  already have <strong>hhc.exe</strong> installed in your system. If not, you must download and install the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.microsoft.com/downloads/details.aspx?familyid=00535334-c8a6-452f-9aa0-d597d16580cc&displaylang=en' refer='feature_042607' />">HTML Help Workshop</a> before you can run SandCastle.</p>

<p><span class="bodySubtitle">Usability</span><br />
In terms of usability, SandCastle still has a long way to go before it is as easy to use as NDoc. There are more than 10 steps that must be executed, in a synchronized sequence, to construct the documentation for an assembly.</p>

<p>Most of these steps are utilizing pieces from SandCastle installation; other steps are using pieces from actual path, and other from fixed locations. To run SandCastle as currently provided by Microsoft, you must copy the sample's batch file that came with SandCastle to your component's folder, edit it by hand, and cross your fingers, while preparing to debug your effort based on the tool's cryptic error messages.</p>

<p>The good news is that once you have your .bat debugged SandCastle is actually stable.  Once you've got it up and working, you can run it with confidence and the knowledge that the output will be consistent with what you should expect.</p>

<p>To simplify the utilization of SandCastle, I've developed a tool (scastle_console.exe) that links all the steps needed to construct the documentation for an assembly. All you should need to provide is the full path to the assembly you want to document and, optionally, the folder where you want to write the output and the framework's version to target. For more information, see the "Installing and Using Tools" section below.</p>

<p><span class="bodySubtitle">Integration with Nant</span><br />
SandCastle's usability issues continue when you try to integrate it with Nant. You must prepare, for each component, a batch to generate the documentation and the Nant's build file can call this batch.</p>

<p>To simplify integration with Nant, I've developed a Custom Nant Task that automates all needed operations. With this task, using SandCastle from Nant is easier than invoking NDoc. You only need to point to where the task is, but this is a one-time job if you're using a TopCoder_Global.build file. See "Installing and Using Tools" below for more.</p>

<p><span class="bodySubtitle">SandCastle's Output vs NDoc's Output</span><br />
The output of SandCastle is slighty different from NDoc's output. All the same elements are there, but they are expressed in a few different ways:</p>
<ul>
<li>Fonts and other styles are different.</li>
<li>SandCastle's output is more dynamic and is ready to swap styles based in the language that you will utilize to <strong>consume</strong> the documented component (not the language in which the component was written)</li>
<li>NDoc outputs hierarchies as trees, while SandCastle outputs them as single statements written in the language that is currently selected.</li>
</ul>

<p>All in all, these are relatively minor differences, but they make SandCastle's output seem more polished than NDoc's.</p>

<p><span class="bodySubtitle">New Features</span><br />
The most interesting feature of SandCastle is its complete support for documenting .NET 2.0 features, like generics. In cases like this, new XML Tags (like "typeparam") are completely supported and they have their own place in the tool's output.</p>

<p>When analyzing the compiler's output, SandCastle can interpret both the output of 1.1 compilers and the output of 2.0, so both frameworks are supported.</p>

<p><span class="bodySubtitle">Installing and Using Tools</span><br />
Considering how difficult it can be to handle SandCastle, I've developed <a href="/i/education/downloads/sandcastle_demo.zip">two tools</a> that you can use as you want, without any restriction. </p>
<ul>
<li><strong>Compatibility</strong>: Tools were compiled with nant.core.dll shipped with Nant version 0.85 RC4.</li>
<li><strong>Installing</strong>: Copy the 3 files (sandcastle_task.dll, scastle_console.exe and nant.core.dll) to the ProductionFolder of SandCastle's installation. If you're using other version of Nant you should copy your own nant.core.dll where indicated.</li>
<li><strong>Using From Nant</strong>: Attached with this review is a version of Config Manager Version 2.0. I've already modified its build file with a new target: "<strong>sandcastle</strong>". You can examine it to see how easy is to construct documentation using SandCastle and this tool. The target needs a property ("<strong>SCastle</strong>") declared earlier in same file that can be overridden in the TopCoder_Global.build file.</li>
<li><strong>Using From Windows Prompt</strong>: The other tool (<strong>scastle_console.exe</strong>) is designed to be executed directly from the Windows command prompt. It expects the path to the assembly to document and, optionally, some other arguments. You can type "<strong>scastle_console</strong>" to see other available options.</li>
</ul>

<p><span class="bodySubtitle">Conclusion</span><br />
In considering SandCastle, it's worth remembering that it is in pre-production stages. It can change (and really, it <strong>has</strong> changed from earlier versions) and we must take this fact into account. Microsoft is promising to release SandCastle into production with some additional tools (which are as yet unknown) to make it more usable, and it has promised to include some kind of integration with Visual Studio. </p>

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
