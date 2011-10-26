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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="516773" message="Discuss this article" />
</div>

<span class="bigTitle">Test Drive: TenFold SOA</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/zmij_big.jpg" alt="Author" />
</div>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22630158" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">

<p>Service Oriented Architecture (SOA) is a hot topic. But with so much "buzz" around the subject, it's hard to separate the products that really deliver and the ones that just market an idea and wrap it in shiny paper. I was approached by TopCoder to test drive an SOA tool, <strong>TenFold SOA Personal Edition</strong>, to see what it promises and whether or not it actually delivers.</p>
<p>Before I started, I didn't know all that much about SOA and SOA tools. I knew the basic ideas behind it but had not had the chance (until now) to test a tool and to become more familiar with the concepts. In this article, I'll share what I learned with you.</p>

<h3>What is SOA?</h3>
    <ul>
        <li>SOA is a software development technique for creating modular components that perform very specific services within a software application. SOA is not a technology, it's a style of architecture -- it's the policy behind the mechanism and, more than anything, it's a thought process.</li>
        <li>SOA is about quantization of tasks: discrete procedures that together would automate every aspect of managing a business. It's as scaleable for small companies as it is for Fortune 500 ones.</li>
        <li>SOA is a more general term that includes (but is not limited to) "Web Services," which is the most common type of programming technique used to create SOA applications.</li>
        <li>SOA is designed to work in a heterogeneous computing environment: it brings together different types of computer hardware, running different types of operating systems.</li>
    </ul>

<h3>What is a Service?</h3>
    <ul>
        <li>A Service is an implementation of a well-defined business functionality that operates independent of the state of any other Service defined within the system.</li>
        <li>Services have a set of interfaces and operate through a pre-defined contract between the client of the Service and the Service itself.</li>
        <li>A Business Service might mean "getAccountBalance," a Business Transaction Service might mean "makeCreditCardPayment," or a System Service might offer an operation like "createFile" or "deleteFile".</li>
    </ul>

<h3>What makes SOA work?</h3>
    <ul>
        <li>The growth and improvement of the Internet.</li>
        <li>The globalization of the business process -- as companies tend to have offices spread around the world, the need for good communication and management of processes within their own realm and with their customers has increased.</li>
        <li>The virtualization of the business process -- there are companies that have a relative small number of "in office" employees and a large number of "off-site" collaborators. Providing them with good tools to make the collaboration efficient is a must (TopCoder and the TopCoder business model, actually is an excellent example of the situation described above, as are open source development projects).</li>
        <li>The evolution of technologies that contribute to interoperability: XML, SOAP (Simple Object Access Protocol), platform agnostic languages as Java, Python and C#, web technologies as AJAX, Rails, ASP.NET.</li>
    </ul>

<h3>Why do we need SOA?</h3>
    <ul>
        <li>Ever-changing business model.</li>
        <li>One of the keys to success is the ability to quickly adapt to new customer base and new business partners.</li>
        <li>SOA promises (and brings) flexibility and reusability to the business model.</li>
    </ul>

<h3>Who can use it?</h3>
    <ul>
        <li>Small and large companies can benefit from SOA.</li>
        <li>There are SOA services that are made available to the general public.</li>
        <li>Other SOA services require authentication restricting them to clients that provide the right credentials or to members / employees of a certain organization.</li>
    </ul>

<p>There is surely more detailed information I could cover, but this should be a good starting point for understanding SOA and evaluating the tool in question - <strong>TenFold SOA Personal Edition</strong>.</p>

<h3>Installing &amp; first time running</h3>
<p>I got the <strong>TenFold SOA Personal Edition</strong> from the Tenfold web site (<a href="http://www.tenfold.com/personaleditionwelcome.htm" alt="TenFold SOA site" target="_blank">http://www.tenfold.com/personaleditionwelcome.htm</a>) after completing a registration form. The distribution is fare in size, about 170 MB, and with a good Internet connection it can be downloaded pretty quickly.</p>
<p>Installing was not much of a hassle but the minimal requirements are pretty high, so one has to have a pretty good machine to run it (the requirements can be checked at <a href="http://www.tenfold.com/personaleditionrequirements.htm" alt="TenFold minimum requirements" target="_blank">http://www.tenfold.com/personaleditionrequirements.htm</a>). But I got into trouble from the first usage! I managed to freeze the app in the first ten minutes when I tried to import a database (partly it was my fault because I did not have enough space available on the disk at import time; the import of the database ate almost 3GB of extra space on my hard disk). I could not get the app up and running again until I uninstalled and reinstalled it twice.</p>

<h3>Features and claims</h3>
<p>After the rough start I relaxed a bit and turned to a more smoother approach by studying the advertised features (as well as what other people had to say about the product).</p>
<p>What does the tool promising? According to TenFold, <i>"EnterpriseTenFold SOA is a complete development platform for building SOA-compliant applications and full-business-function services without programming."</i> It <i>"automatically produces high-quality, functionally rich web services, which are 100% compatible with J2EE, .NET, or any Enterprise Service Bus."</i> It <i>"uses a declarative, model-driven approach that automatically includes powerful applications features and functions in every service."</i> It <i>"includes Ajax so you can build Ajax-ready applications without Ajax-related development costs"</i> and <i>"facilitates the TenFold Way, full-lifecycle methodology for building enterprise-scale applications as a collection of rich, reusable services."</i></p>
<p>One of the claims that made me skeptical was that, by using TenFold SOA, one is able to achieve 10-times faster development times for sophisticated enterprise applications than with traditional development techniques. Also <i>"EnterpriseTenFold SOA works with popular RDMSs like Oracle, DB2, SQL Server, Sybase, EnterpriseDB, and MySQL. EnterpriseTenFold SOA Personal Edition includes a fully configured EnterpriseDB installation to make your Personal Edition experience easy and not require that you install an RDBMS."</i> I would say it's a pretty impressive list of features!</p>

<h3>Getting the hang of it</h3>
<p>With all these promises in mind, I just grabbed the <a href="http://www.tenfold.com/tutorials/BasicConceptsTutorial.pdf" alt="Basic Concepts tutorial (PDF)" target="_blank">Basic Concepts tutorial (PDF)</a> from the TenFold site and got to work. The tutorial guided me through the features of an already built CRM (Customer Relationship Management) application, allowing and teaching me to make modifications to that application. This application, called SuperCRM, comes in two flavors: a Windows application and a Web-based application (all the apps that can be built using TenFold SOA can be generated to work as a "standalone" Windows app or as Web-based apps).</p>
<p>To generate the application (in both forms) I logged into the TenFold Personal Windows application and imported a .10F file (it's a proprietary format describing a TenFold app). Following the tutorial after a few clicks and just 15 minutes, I had a CRM app that looked like the one in the picture below, the database set up (EnterpriseDB) and all the database services up and running (I really appreciated that) and the TenFoldClient (tfcli), TenFold MessageServer, TenFold ServerManager (tfsrvmgr and tftskmst) ready to run.</p>
<p>TenFold SOA Personal edition comes also with built in application management features to some extent, with well-defined user roles. You have default user names and credentials for creating and building the application (User=Business, Pwd=Business), for creating and maintaining the database (User=IT, Pwd=IT) and for administrating the TenFold users and features.</p>
<div align="center"><img src="i/education/tenfold/tenfold_Win_app_tiny.png" /></div>
<p>I was pretty impressed, though of course the app was previously built and packed! But my enthusiasm scaled down as I opened the web app and found that it wasn't working due to an error that prevented me from signing on (check the below picture and look for the position of the "Sign on" button). In addition, it opened in Internet Explorer, although I have Firefox set as default on my PC, and I had no way to change the default browser from the TenFold SOA application builder (eventually I manually cut-and-pasted the URL to Firefox).</p>
<div align="center"><img src="i/education/tenfold/tenfold_explorer_tiny.png" /></div>
<p>After all that I finally managed to sign on to the Web app.  I found it more appealing than the standalone version -- it looked better from the UI perspective and did not have the odd menu bar the Windows version had. That menu is a little bit confusing at first glance because it's not the "File, Edit …" standard menu but it's something TenFold specific with things like "Opportunities, Accounts, Dashboard …" Still the Web app had a few things that did not make me very happy: an odd looking black label with a picture in it and the lack of any menu from my immediate visual perspective (see these in the picture below)</p>
<div align="center"><img src="i/education/tenfold/tenfold_main_tiny.png" /></div>
<p>Also the Firebug plug-in that I have installed for my Firefox browser quickly reported and discovered some errors in the JavaScript code the app generated for the hover frame object that presented the tool tip (was that the AJAX the features promised?).</p>
<div align="center"><img src="i/education/tenfold/tenfold_js_errors_tiny.png" /></div>
<p>Following the tutorial I got to the queries section. I have to say I'm not a big fan of writing database SQL queries by hand and I was pretty happy to see that TenFold handles that pretty well (they call it "SmartSQL"). The tutorial presented me with a plethora of queries and I did all of them very quickly with minimal effort. That minimal effort could be transformed to almost zero effort as the queries could be saved and rerun later (they call them "PowerQueries"). The feature is really powerful and the results of the queries can be visualized in many forms (all the results in one place, one result at a time with its details, or details that can be added or subtracted from the results dynamically) and also exported to Excel sheets. Still, at some point the UI came to disappoint me again. As you can see in the image below, when I tried to view all the results the buttons where trimmed and rendered unusable. No matter how much I tried to bring them to the visible area, I could not!</p>
<div align="center"><img src="i/education/tenfold/tenfold_multiple_tiny.png" /></div>
<p>Other notable features I could experience in that part of the tutorial were "AnyFile," which permits the addition of any files as attachments that can be saved in the database of the application, "TimeRelation," which automatically stores the applications-data changes, and "SecurityByValue," which allows data values to control data security allowing to protect fields from spurious edits.</p>
<p>Finally I got to the part I was waiting to try the most: application change. TenFold calls it XRAD (eXtremely Rapid Application Development) and it seems that it's one of the most important features advertised: <i>"XRAD lets you build a working, tested, usable application in less time than it normally takes for traditional requirements gathering."</i></p>
<p>I got to work to see if the feature really works as advertised. Following the tutorial first I created a new transaction that read some data from a ContactAddress table. Then I edited it so that it would display a Google Map as a result of an address query. Here is where the tutorial got a little bit blurry and really mechanical (something I hate, as I like to know what I'm doing and not just follow some instructions like push that button, go to that tab, fill that textbox) and it took me 3 tries to get right. Still, it was pretty rapid and I was able to link to Google Maps in a matter of minutes without having any special knowledge about the API behind it. I also added a menu in the application for the transaction and a zoom from the contact address to cleverly invoke the transaction. The last thing was to modify the existing database by adding a column to an existing table. Those last steps of the tutorial convinced me that TenFold really has some powerful built-in features that can be delivered to mainstream apps with little to medium effort (considering both development resources and time).</p>

<h3>Conclusions</h3>
<p>In starting out, I was impressed by the features TenFold featured and was eager to test them. The biggest selling point for TenFold (and a pretty scary one from my perspective, I guess) is that no code has to be written, and anyone could build and deploy a powerful application in a matter of days or weeks.</p>
<p>It's not quite that easy, of course, and I don't think anyone without IT training or a technical background could do it that quickly. The concepts behind the tool are pretty complex and relatively new and a non-technical person (let's say someone in finance or accounting) would require serious training to be able to deliver a powerful application. Even with technical help, it takes a very good architect to describe the application and a very good database designer to support a more complex application. In theory, a tool could describe an application in a non-code form and use that description to generate code and invent semantics, but you need the right people for that kind of task as well.</p>
<p>Based on my initial review of the TenFold SOA Personal Edition, I think it has some serious horsepower under the hood, and makes use of very powerful technologies and concepts, but they did not reinvent the wheel. Giving the features fancy names does not do that. Those technologies are packed well together, though, (albeit in a proprietary format) and work fairly well. All in all, I would say the tool deserves a <strong>B-</strong> for functionality.</p>
<p>With such a visually focused application, what ultimately sticks in your mind is how it looks, how it behaves, and how easy it is to use, not the fancy technologies behind it. From that point of view, TenFold needs some work. I couldn't get the Web app to work in Internet Explorer, I found the "proprietary" menu bar really odd and hard to use - simply put, nothing felt like it was in the right place. The Windows app was really heavy, visually, with too many fields, tabs, and checkboxes. To make matters worse, it did not always behave correctly and froze on me many times [2]. I would say the tool deserves a <strong>C</strong> for usability.</p>
<p>From the user support point of view, though, TenFold behaves almost admirably. The amount of user help is impressive, and they seem to really focus on that aspect of the tool. TenFold provides a FAQ, troubleshooting tips, good tutorials and even a forum where you can get your questions answered pretty quickly by staff or by other users of the tool. For advanced users TenFold provides a training program called <a href="http://www.tenfold.com/university.htm" alt="TenFold University" target="_blank">TenFold University</a>. I would say they deserve an <strong>A-</strong> for user support.</p>
<p>The problem with hot topics in technology, of course, is that products come to market in an effort to try to capitalize on the buzz before they're ready. While it's got a lot of promise, and some excellent features, in my opinion <strong>TenFold SOA Personal Edition</strong> does not quite deliver on its promises. The Enterprise edition may be more robust, of course, but with this (or any other tool that promises so much) I'd recommend you think twice, and do a lot of testing, before you commit.</p>

<h3>References and notes:</h3>
<p>[1] DDJ has a great series of articles about SOA and SaaS. Give them a look at <a href="http://www.ddj.com/" alt="DDJ.com" target="_blank">www.ddj.com</a> (search for SOA)<br />
    [2] I was not able in spite of my repeated efforts to follow the second tutorial (giving a glance of more advanced features) because I could not import the database. The import operation kept freezing the app (I even let it run for 90 minutes once with no progress)<br />
    [3] I have a pretty good machine that is above the requirements (so I could not verify how the app did not behaved due to unmet requirements): P4 3.0 GHz EE, with 1GB of RAM, 200 GB of hard disk space and a 2Mbit Internet connection</p>




<br>

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
