<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
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
    <tc-webtag:forumLink forumID="506273" message="Discuss this article" />
</div>

<span class="bigTitle">TopCoder @ Work: Not Another Vista Article</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
    <img src="/i/m/rhudson_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br />
      <em>TopCoder Members</em>
</div>

<br clear="all">

Even a peaceful venture to my favorite bookstore can't shield me from stacks of dead trees festooned with the five-letter-word I've tried to escape: VISTA. Microsoft's new operating system already hogs my inbox, clogs my feed reader, and boggles my mind. I have migraines about migration. How do I prepare for the coming of this new operating system? When will grandma start calling with questions about her computer? How will I remain relatively productive as a developer -- presuming my old software functions at all? Why can't we just have XP Service Pack 3?
<br><br>
These queries demand results, and to provide them we'll approach the topic in two ways. Cautious developer Rob retreats to the comfort of his 286 and carefully prepares for inevitable doom while browsing forums in his text-only LYNX port. Wild and crazy Tim, however, recklessly tangles with Vista -- by actually installing it!
<br><br>
<span class="subtitle">Rob Reads and Writes</span><br>
It smells like Brimstone, looks like a Mac, feels like a hundred-pound dumbbell, tastes like -- Ramen? Well, I'm only imagining that last part, based on my concern that I'll only be able to afford to eat cheap packaged noodles after buying the new Vista operating system and the hardware to support it. And what is "it," exactly? PC Magazine cites "conveniences rather than essentials";  TechSoup, a major non-profit resource, mentions the firewall, "which now blocks outbound traffic,"  "malware protection" in the form of Windows Defender, and "Internet Explorer 7."  Some versions of Vista provide "Aero," a new interface widget that provides a "translucent effect," according to <A href="http://www.microsoft.com/windows/products/windowsvista/features/experiences/aero.mspx" target="_blank">Microsoft's description</A>; I have to read halfway down the page to understand the functions of the alt-tab replacement "Windows Flip"  and "Taskbar Thumbnails." 
<br><br>
I can decry these widgets and nebulous "security improvements," huddle in the corner with my cheap Windows XP PC and $50 anti-spyware package, and shout curses at Microsoft for another smoke and mirrors product (Aero Glass mirrors, that is) but I can feel Vista breathing down my neck. Clicking sounds behind me signal my manager ordering new User and Developer PC's with the fresh VISTA OS pre-installed. Car horns blare from across the parking lot at the Circuit City, where a smart-looking teenager in a clip-on tie is loading grandma's new Vista-loaded computer into her trunk. I set my phone to "silent," knowing that it will ring forever as soon as she gets home.
<br><br>
Later tonight I'll be in my apartment, hiding under the bed, in fear of a new operating system that terrifies me even though I've never installed or used it myself.
<br><br>
Blogline RSS feeds refresh on my screen, loading my browser with fresh Vista fear from forums for development software. I gulp and start clicking links, joining comrades like co-author Tim who have engaged in Vista's full sensory overload.
<br><br>
<span class="subtitle">I Am the Least Privileged</span><br>
A flurry of activity in the forum for AutoHotkey, my favorite Windows macro and automation software, suggests that Vista's security has dampened the ability to hook into windows without running as an Administrator. "Regular" users may not be able to run scripts; AutoHotkey author Chris Mallett points forum members to Microsoft's "<A href="http://msdn2.microsoft.com/en-us/library/aa480150.aspx" target="_blank">Developer Best Practices and Guidelines for Applications in a Least Privileged Environment</A>" for an explanation of Vista's particular prohibitions. Detailed information about these limits will no doubt be of interest to TopCoders everywhere. Windows developers in particular may be similarly enlightened by "<A href="http://msdn2.microsoft.com/en-us/library/aa480152.aspx#appcomp_topic14" target="_blank">The Windows Vista Developer Story: Application Compatibility Cookbook</A>." 
<br><br>
Prefer Java to .NET? You're in luck -- if you use the latest version of Sun's platform (6 Se). "Older versions of Java do have problems on Vista," blogs Java Client Group's Chet Haase. In an <A href="http://weblogs.java.net/blog/chet/archive/2006/10/java_on_vista_y.html" target="_blank">entry</A> from October, Chet describes these incompatibilities and potential workarounds, most notably with GUI components and deployment (privileges strike again). Aside from these problems, Vista seems to offer promise in user interface theory. Swing developer Joshua Marinacci blogs about Vista's "new focus on usability" and cites Microsoft's new <A href="http://msdn.microsoft.com/library/?url=/library/en-us/UxGuide/UXGuide/Home.asp" target="_blank">User Interface Guidelines</A> and <A href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/UxGuide/UXGuide/Resources/TopRules/TopRules.asp" target="_blank">Vista User Experience rules</A>.
<br><br>
Develop on the server, not the client? Apache web server programmers seem to have spotty results with Vista, primarily regarding installation security. "Start the command prompt as an administrator," suggests Alessandro Vermeulen, a user in the <A href="http://www.apachelounge.com" target="_blank">Apache Lounge forum</A>. SitePoint member HiVizDiver <A href="http://www.sitepoint.com/forums/showthread.php?t=409782" target="_blank">recommends the same</A> -- running the Apache install from a privileged account. Other suggestions include disabling "User Account Protection," one of Vista's key security features. Absent a true guide to Apache configuration on Vista -- and I couldn't find one  -- you're stuck with message board postings for advice, at least for now. 
<br><br>
In general, Vista is "mostly" compatible with development in windows. Particular utilities and development environments, however, will have to be verified, feature by feature, by vendors and volunteers. TopCoders who consume open-source software already understand the nature of searching forums for nuggets of information. Developers of utilities will no doubt be swamped by new Vista inductees who demand the return of their Windows hotkey mappings. No matter what your role, you'll be wiki-diving and forum-picking for the next few months. If nothing else, it's a good time to update your snippet database and write test scripts for your environment.
<br><br>
<span class="subtitle">Tim Confronts Myth with Mastery</span><br>
While Rob compulsively Googled, Atom'ed, and RSS'ed, I actually downloaded the Vista images and, like any good hacker TopCoder, said a little prayer and double-clicked the setup file. The installation began as my reality emerged from the fog of FUD -- Fear, Uncertainty, and Doubt -- that had plagued me since  the Vista hype machine went into high gear a few months ago. Did I really need a Pentium 15, Seven-Core, Fifty Gigabye RAM powerhouse? Would my ten dollar inkjet printer continue to splash expensive ink onto cheap office paper in the Vista world? More importantly, would my favorite legacy version of VIM still chug along, formatting my humble source and saving into nice, compilable chunks of code?
<br><br>
By far the most common “complaint” I have read is that the hardware requirements for Vista are too high for many systems. Interestingly, the specs recommended by these commentators usually suggest 2GB of RAM, a 256MB video card, and a dual core processor. My primary experience with Vista has been on a system meeting precisely half of those requirements, and all aspects, including the fancy Aero Glass interface, 3-D window flipping, etc, all work flawlessly. Similarly, I have seen it reported that systems even only half as powerful as that still perform reasonably. 
<br><br>
Probably next in the list of complaints is driver compatibility. On this, I can say that there is some truth, although at the same time I have been pleasantly surprised. Initially, I had a basic inkjet printer that existed, attached via USB, but crippled in its driver-less state. Within a week, Windows Update had automatically found and installed a driver, and one day it "magically" worked. To date the only piece of hardware that remains less than fully functional is a TV tuner card, itself now about eight years old. Technically, there is a driver for it, but the OEM has not yet released Vista-compatible TV-viewing software. (The card predates the Media Center standard, and thus does not work with the Vista Media Center, and given its age, I would not expect it to do so.) 
<br><br>
The last major complaint I have seen is that old software will no longer work with the new OS. Like any OS upgrade, the official answer on this is that it depends. A great majority of software works flawlessly—and Vista’s “compatibility mode” functionality allows the operating system to impersonate previous OS-es for the sake of running legacy software. Some low-level programs, like Virus Scanners, that are tightly integrated into the OS functionality will not work. That said, most (if not all) major vendors will be releasing new versions for Vista. To the seasoned developer who understands the complexities of how software like virus scanners actually work, it is little surprise that they do not always work across operating systems. 
<br><br>
<span class="subtitle">The Install </span><br>
As with every OS upgrade, people stand on one side of a fence asking, “Should I upgrade my existing OS, or do a clean install?” People on the opposite side respond, “Clean install, definitely! 
<br><br>
For the moment, I will avoid going against the grain of this classic advice, as the fundamental ideas have not changed. That said, I will also point out that Vista’s install process is radically different from other Windows platforms. Rather than replacing out components on a file-by-file basis, the installer actually contains an image of what gets installed on the hard drive. During an upgrade, the previous OS is removed, the new image is loaded, and then settings are transported. 
<br><br>
Now, a bit of actual experience... release candidate 1 installed just fine for me, as an upgrade over an existing XP Professional install.  Release candidate 2 did not want to install at all.  The final product installed, but only as a clean install, the upgrade installation failing with a vague error message.  Of course, these experiences may, in part, have been due to using pre-release software -- but still, it does not fill me with confidence when "release candidate" software still has such an obvious issue.
<br><br>
<span class="subtitle">Using the Software</span><br>
Perhaps the most important question is: What is it like to actually use the software?  Though I have never been one for overly flashy UI (I was once quoted explaining how I was less than impressed by XP's "cartoon meets game show" interface), the new Aero Glass look has found favor with me.  And you can relax about at least one important thing – the TopCoder Arena runs just fine.
<br><br>
All in all, I would describe it as sleek and stylish, but still professional and serious looking.  Browsing of media files, viewing slide shows and the like, is of course convenient and easy to use.  To this end, one of the biggest critics whenever I update software on my primary home system -- my wife -- even came to like "the new windows" within only a single day of using it.  With the number of pictures she takes of our kids, and the quantity of music she rips, downloads, and burns, her enjoyment was at least partly expected.
<br><br>
Security has been improved a bit as well, to the point where the OS literally asks for confirmation before opening up any system configuration utilities, or installing any system files.  Though taken by surprise at first, this has become a welcome feature, as it theoretically reduces the chances for infections with spyware and the like.  Of course, with added security comes a loss of convenience.  I spent some bit of time digging through all of the settings to get the built in firewall setup properly to allow me to do things like file sharing, remote desktop, and HTTP inside of my home network.
<br><br>
<span class="subtitle">The Bottom Line</span><br>
So, should you or shouldn't you upgrade? Here's a quick breakdown:
<br><br>
    <table class="formFrame" width="450" cellpadding="6" cellspacing="2" align="center">
        <tr class="sidebarTitle" nowrap="nowrap">
            <td>Why to Upgrade</td>
            <td>Why Not to Upgrade</td>
        </tr>
        <tr class="GAtableText">
            <td valign="top">
            <ul>
            <li>You love technology, and always like to have the latest and greatest.</li>
            <li>You're buying a new PC anyway and work primarily in Office and other standard applications.</li>
            <li>The only way to learn is hands-on.  Installation for one's own education is especially true if you have an extra partition, and can setup a dual-boot between Vista and XP.</li>
            <li>The new interface does look pretty nice.</li>
            <li>Improved viewing of pictures, media, etc.</li>
            <li>Security is improved: Windows Update is built right into the OS, Windows Defender is included, etc.</li>
            </ul>
            </td>
            <td valign="top">
            <ul>
            <li>The installation does take a fair amount of disk space, and requires relatively current hardware (though not nearly as much horsepower as many reviews have stated).</li>
            <li>Many businesses, as a rule, won't upgrade until at least SP1.  If you work as a consultant, it's nice to be on the same platform as everyone else.</li>
            <li>Hold off if you've got mission-critical third party or homegrown software that hasn't been officially vetted for Vista, especially if it is written in a pre-Vista language.</li>
            <li>Review your use of utilities that do network or low-level API calls – if a demotion to "least privileged" status would ruin your month, think hard before installing Vista.</li>
            <li>Although the Windows Vista upgrade advisor is pretty thorough, it may not recognize every piece of hardware and software you use.  Being an early adopter always carries the risk that some things won't work just yet.</li>
            </ul>
            </td>
        </tr>
      </table>
<br><br>
As for me, I am happily using Vista, and soon enough will have it on all my systems. Maybe I am just a tech junkie who cannot resist always installing the latest and greatest; maybe the new features really do justify the upgrade.  Maybe, unlike Rob, I don't read enough to mitigate the risks of utterly destroying my productive development environment -- or not. In reality, there is truth on both sides.  I wonder when Windows Vienna will be available for beta...



<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
