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
    <tc-webtag:forumLink forumID="515048" message="Discuss this article" />
</div>

<span class="bigTitle">Programming in the Real World<br />
or, How To Be a Good Team Player</span>
<br />
<br />

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15635590" context="algorithm"/>  <br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>Let's say you&rsquo;re a part-time employed student or a graduate programmer. You&rsquo;re new to the workplace, but you've done your best to get into gear and get things done as quickly and cleanly as you can. But after a time, you find out that your colleagues are not as happy with your work as they should be. Your part of the software project malfunctions when another user works on it, your colleagues find your code impossible to read and refuse to help you to improve it, and you often find it hard to recall details of your project just a few weeks after they are done. </p>

<p>The problem is that, in real life, successful programming sometimes requires more than quickly writing correct code &ndash; it takes learning how to work as part of a team. </p>

<p>This article describes several types of difficulties you could face when you join your first work or project team. While some of them might seem self-evident and easy to avoid, I've either stumbled over them myself or, worse, had to devote my time to helping a colleague overcome them. </p>

<p><span class="bodySubtitle">Algorithm competition and school versus &quot;the real world&quot; </span><br />
A typical SRM problem is usually under 200 lines of code, is written in less than an hour, and needs to survive the challenge phase and pass system test. After this its purpose is fulfilled, and you&rsquo;ll never need to: </p>
<ul>
  <li>find typo errors or algorithm errors in your code, unless you want to practice, and it&rsquo;s often much easier to write a new solution then to fix an old one. </li>
  <li>make the code comprehensible: anyone who tries to review and understand the code does so at their own risk, and if they don&rsquo;t understand the solution idea they can switch to someone else's. (This doesn’t cover codes which violate the code obfuscation rule, but there are many ways to unintentionally make code less readable.)</li>
  <li>cooperate with anyone else. </li>
  <li>make changes in input or output data format, or in the processing algorithm itself, a month after the match is over because your customer has changed his mind. </li>
</ul>

<p>While educational projects are larger, and writing one can take much longer, some of the same points apply. Generally speaking, you won't need to: </p>
<ul>
  <li>make changes a year after the project is completed. </li>
  <li>answer questions like &ldquo;I did something and it buzzed&rdquo; -- because you are the only user of your program, and you know how to use it correctly. </li>
  <li>make your project compatible with another project someone else is building. </li>
</ul>

<p>A well-written SRM solution and a successful educational project are worthy accomplishments, and require exceptional coding skills. The fact remains, though, that real life projects are fundamentally different: </p>
<ul>
  <li>They are usually large-scale and developed not by individual programmers but by a team. </li>
  <li>They have a very long lifetime (in my company up to 10 years) and must be tracked throughout it. </li>
  <li>They are expanded and updated over a significant period of time (sometimes during their entire lifetime) according to customers&rsquo; requests. </li>
  <li>They are often used in subsequent projects, either as prototypes or as parts. </li>
</ul>

<p>Because of these features, real life projects must be treated differently. I&rsquo;m not going to consider team development, or the engineering processes and techniques invented to improve it -- there are plenty of good books on the topic. Instead, I want to stress several basic, recurring problems that the new professional coder is likely to encounter. </p>

<p><span class="bodySubtitle">Unreadable Code</span><br />
Some programmers say that if they write their code quickly and correctly, nobody should care what their code looks like. This is fine, to a point &ndash; but as soon as you need to do something else with this code down the line, readability comes into play. </p>

<p>Even correct code can be so dirty that the author may find it unreadable, let alone someone else. Such trifles as code formatting or variables names and usage style can make code absolutely incomprehensible (any Challenge Phase should convince you of this). </p>

<p>Once I needed to find and fix a mistake in a reporting module. The author had quit several months ago, so I couldn&rsquo;t get him to help me. There was not a single line of sensible comments in the whole project (except for the file headers, and they were out-of-date). There was no variable named more than five characters long, and their names seemed to be selected in order to make me as confused as possible. Understanding the module was so difficult, in fact, that it took me days to determine that the module was actually working correctly, and the whole fiasco was the result of user error. </p>

<p>Here are some of the main ways you can make your code readable. </p>

<p><strong>Naming variables</strong><br />
Give your variables nice sensible names, that actually represent something. </p>
<ul>
  <li> Names like &lsquo;q&rsquo;, &lsquo;qq&rsquo;, &lsquo;qqq&rsquo; are fast to type, but you won't remember their meaning a week after you create them. Even if you need a temporary variable for receiving something like the flag &ldquo;Fetch succeeded,&rdquo; you&rsquo;d better off calling it not &lsquo;qqq&rsquo; but &lsquo;FetchRes&rsquo; &ndash; then you won&rsquo;t confuse it with &lsquo;qqq1,&rsquo; which contains the results of the fetch. </li>
  <li> Take into account that people need to be able to read your variables. Lengthy variable names which differ in one letter, or in the order of letters, will be indistinguishable when scanned quickly by the average reader. Variable names more than 8 characters long (but not too long) are the easiest to perceive. </li>
  <li> Decide how you will name your variables, constants and other entities and stick to these rules throughout. If you decide to name your loop counters &lsquo;i&rsquo;, &lsquo;j&rsquo; and &lsquo;k&rsquo;, don&rsquo;t use these variables for other purposes, even temporarily. Of course, such naming conventions depend on the programming language you use, but ideally you should have one for each language you use. </li>
</ul>

<p><strong>Formatting code</strong><br />
Formatting code is purely aesthetic, but nevertheless quite important. Good formatting should represent the code&rsquo;s logic and make it more readable and easy-to-understand. Some source code editors (e.g. Centura Builder) provide indents as an integral part of the code&rsquo;s structure, but in most cases it lies on the programmer&rsquo;s conscience. </p>

<ul>
  <li>Positioning blocks is the main means of formatting. Different formatting conventions propose different ways of indenting the terminators. The common idea is that indents should be placed so that blocks of different nesting levels should be separated neatly. </li>
  <li>Don&rsquo;t place several operators in one line even if your editor will allow you to do this: such placing makes reading the code and searching for errors more complicated. </li>
  <li>Break up long operators into several lines if your editor allows, but indent lines after the first the same way as if they formed a new block. </li>
  <li>Don&rsquo;t be tight-fisted with spaces and brackets in complicated logical and mathematical expressions; nobody enjoys precedence parsing if it&rsquo;s possible to avoid it. </li>
</ul>

<p><strong>Writing comments</strong><br />
Some coders disregard the very idea of comments. They claim that comments lengthen the code, waste the coder&rsquo;s time and are unnecessary as long as the code itself tells you everything the author meant to say. Such an approach is wrong; you should write comments if there is the faintest chance you'll have to modify the code or use it again. Personally I find it useful to write comments in SRM problems &ndash; it helps me follow my own train of thought. Of course, it&rsquo;s possible to reconstruct the idea from uncommented code, but it takes more time and effort. Here are a few guidelines for commenting: </p>

<ul>
  <li>Comments shouldn&rsquo;t repeat each line of code in natural language, because such comments are really a waste of time. A line of code that needs an extra line of explanations could probably be rewritten in more understandable way. </li>
  <li>Comments should explain the author&rsquo;s intentions or contain some information that is not included in the code itself but is necessary for understanding it. The minimal necessary effort is commenting the purpose of each code block and each function (procedure, object method etc. &ndash; whatever you use) along with its parameters and return value. </li>
  <li>For searching errors, comments should act as a table of contents: through them, you can find the piece of code you need without having to dig through thousands of lines. </li>
  <li>In general, writing nice balanced comments is a kind of art: they should be not too long and not too short, and they should represent the code&rsquo;s idea sufficiently. Comments should be updated with each code editing so that they represent the current code state. </li>
</ul>

<p><span class="bodySubtitle">Working in a Team</span><br />
Working as part of a team has become as almost as prevalent in programming as coding itself. The size of team, and the degree to which members are specialized, depend on the company, the project, and the engineering process, but the main principles of working in a team are pretty standard. </p>

<p>Teams usually observe certain programming conventions, including: </p>

<ul>
  <li>code readability matters -- like naming entities, formatting code and writing comments, as discussed above. </li>
  <li>methods of data extraction and processing -- if certain data is always extracted from a certain table or file, there might be a wrapper function for such an extraction. </li>
  <li>data presentation -- if a project requires loads of automatically generated reports, the team might use a reporting tool and establish rules for using it (like Centura&rsquo;s Report Builder) or at least adhere to some style conventions. </li>
  <li>graphics style for icons, buttons, etc. -- you either use a standard set of images, or have a designer create them for the project, but you don&rsquo;t draw an image each time you need a new button. </li>
  <li>error handling -- a convention should define all kinds of possible errors, how the software behaves after one is recorded, the way the errors are reported to the user and written to protocol (if any), and so forth. The team may also use a separate package for error handling. </li>
  <li>technical documents &ndash; the team may maintain a document template, with fields and sections to be filled in, or it may just use a set of text styles for each kind of documentation. </li>
</ul>

<p>Another set of conventions apply to maintenance issues. Ensuring that everyone on the team operates according to these conventions is much more critical to the overall success of the project. These can include: </p>

<p><strong>Keeping the modification history</strong><br />
If several programmers work on the same piece of code, each needs to be able to ensure that they are editing the latest version, and that nobody else is editing it at the same time. There are a variety of software tools that can be used for saving the last versions of a file, comparing versions, and so forth. Whether you use software like this or just write comments in the files attached to the project is beside the point &ndash; once you and your team have established a convention for modification history, you have to stick to it. </p>

<p>One best practice is to update each modification with a comment on what has been done since the last version. This will help your team trace the history of the file if a rollback is required. </p>

<p>Another good habit to establish is, once you're done with a file, to immediately unlock it for the others on your team. If not, you might find yourself in the office on your day off, unlocking a file that someone urgently needed. </p>

<p><strong>Version circulation control</strong><br />
In most projects several prototypes of differing functionality are created during the development process. All of them need to be stored, though only the last one should be given to the testers or the final user. If several prototypes are in work -- e.g. version .x is being tested, while version .(x+1) is being modified -- and a bug is found, it&rsquo;s essential to modify the latest version, not the one the bug was found in. It&rsquo;s even more important to control the version the final user has, especially when it is being used on several workstations. </p>

<p>Imagine a situation like this: a furious user reports an error to a programmer in person (though all such appeals should be documented). The programmer fixes the bug and sends the program back to the user, without telling anyone about it or leaving a copy for the version control. He might have intended to, but he has forgotten, or decided to do this later &ndash; whatever the case, it didn't happen, and now he's left the company. Several months later, the same user reports another bug in this program, to me this time, and I find out that our last version doesn&rsquo;t correspond to theirs. In this case, I was lucky that it was a fairly minor problem, but it could have been much worse. </p>

<p><strong>Documentation writing</strong><br />
This is the kind of activity that should be done even if it isn&rsquo;t required. If your software needs to be installed, write installation notes. If it requires specific settings, describe them. If the implementation includes anything that isn't obvious, mention it in the developer&rsquo;s notes. Even the most evident ideas become obscure a year after implementing them, so such notes will be extremely useful the next time you create a similar project or need to change the existing one. Besides, such notes become invaluable for your colleagues if you leave the company. </p>

<p>If your program interacts with users, write a user manual. Never think &ldquo;The interface is so simple, how could anyone ever make a mistake!&rdquo; Remember: if there is the remotest possible chance that your program could crash, there's a user out there who will find the way to make it happen. You should minimize the risks, by make your program as stable and easy to use as possible, but you should also outline the risks in the manual. You can't avoid all user error, but at least you will have the comfort of being able to say &ldquo;you should have read the manual!&rdquo; </p>

<p><strong>Related Reading</strong><br />
If you are interested in learning more on these topics, you can refer to <a target="_blank" href="http://www.topcoder.com/tc?module=LinkTracking&amp;link=http://www.cc2e.com/Default.aspx&amp;refer=feature_040507">Code Complete</a> by Steve McConnell, which discusses loads of ways to improve your developing and coding style. </p>
<p>&nbsp; </p>
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
