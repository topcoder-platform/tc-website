<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="../top.jsp"/>

        <jsp:include page="../primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Competition Details</span>
            </div>
            
<div class="linkBox">
    <a href="http://csf.topcoder.com/forums?module=ThreadList&amp;forumID=8">Discuss this</a>
</div>

<div class="breadcrumb">
    <a href="/?module=Static&d1=competitions">Competitions</a>
    > <a href="/?module=Static&d1=assembly&d2=activeContests">Active Assembly Competitions</a>
    > Microsoft Session Manifest Tool
</div>

<%--
        <div align="center">
        <table class="bodyText" style="margin-top: 20px; margin-bottom: 20px; width: 320px;" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td width="100%">
                        <div class="bigRed" style="border-top: 1px solid #999999; border-bottom: 1px solid #999999;">
                            <div style="float: right; text-align: right;">
                                $6,000.00<br>$2,000.00<br>$1000.00<br>06.05.2007
                            </div>
                            <strong>
                                First:<br>
                                Second:<br>
                                Third:<br>
                                Due date:
                            </strong>
                        </div>
                    </td>
                    <td style="padding: 10px 5px 10px 20px;" align="right">
                        <a class="button" style="width: 60px;" href="/?module=SecureStatic&d1=assembly&d2=reg">Register</a>
                    </td>
                    <td style="padding: 10px 0px 10px 5px;" align="right">
                        <a class="button" style="width: 60px;" href="/?module=Static&d1=assembly&d2=orIntro">Submit</a>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <div align="center"><span class="bigRed">Prizes doubled!</span></div>
--%>

<h2>Project Overview</h2>

<p align="center"><strong>A Part of the Microsoft Connected Services Framework Mashup Service Design and Development Competition Series</strong></p>

<p align="center"><strong>Official Rules (Supplemental)</strong></p>

<p><strong>NO PURCHASE NECESSARY TO ENTER OR WIN. A PURCHASE WILL NOT INCREASE YOUR CHANCE OF WINNING.  VOID WHERE PROHIBITED.</strong></p> 

<p><strong>For ELIGIBILITY, ENTRANCE and GENERAL CONDITIONS, see the <a href="/?module=Static&d1=rules ">Official Rules for the Contest Series</a>.</strong></p> 

<p><strong>Overview</strong></p>

<p>
Microsoft Corp is inviting contestants to build a web based tool for the Microsoft Connected Services Framework Session Management component. The session manifest consists of the following elements:
</p>

<ol>
<li>Participant Details
    <ol>
    <li>Web Service Participants</li>
    <li>Persona Participants</li>
    </ol>
</li>
<li>Message Routing Rules</li>
<li>Policy Details</li>
</ol>

<p>
See the section below called "What's a Session Manifest?" for more info.
</p>

<p>
The challenge is to write a web based tool (preferably using  Silverlight (<A href="http://www.microsoft.com/silverlight/">http://www.microsoft.com/silverlight/</A>) that can do the following:
</p>

<ol>
<li>Connect to a CSF Session Manager Web Service (for the purpose of this competition, you will use <A href="http://csfsession.networkmashups.com/session30/sessionmanageradmin.ashx">http://csfsession.networkmashups.com/session30/sessionmanageradmin.ashx</A>). <A href="http://msdn2.microsoft.com/en-us/library/aa303394.aspx">More information on the session manager</A></li>
<li>Obtain a list of sessions that already exist. Remember there will be thousands of sessions and the user interface has to deal with this. Just enumerating and listing the session would make the user experience very bad. For example, a search-based mechanism would be beneficial here.</li>
<li>Once the desired session is found, then the user should be able to click on the session to load the session onto the tool. The tool should parse the results returned from GetSessionInfo() and display the contents appropriately. Remember that the contents of the session (the participants) have to be visually appealing.</li>
<li>Once you have the session loaded, you should be able to add/modify/remove participants, routing tables, policies, filters, etc. The more manipulation capabilities in addition to the above you can add to the tool, the more useful the tool will be. There should be no typing of XML content into the tool at all - even though at any point in time the manifest contents should be viewable in read-only format.</li>
</ol>

<p>
Another scenario is one in which a session could be constructed manually from scratch. In this scenario, the tool would do the following:
</p>

<ol>
<li>Connect to a session manager and create an empty session</li>
<li>Load the empty session onto the tool</li>
<li>Allow the user to manipulate the session in the same way as above.</li>
</ol>

<p>
The tool should be capable of exporting the manifest as a serialized XML file that could be saved on the file system. In the same way, a saved Session Manifest file should be loaded into the tool and then, through the tool, call the session manager to create an instance of that session manifest. 
</p>

<p>
There are three very important interfaces for you to complete this work:
</p>

<ol>
<li><A href="http://csfsession.networkmashups.com/session30/sessionmanageradmin.ashx">Session Manager Admin</A> - This is the host for all sessions and the interface where you create, delete and search for sessions. <A href="http://csfsession.networkmashups.com/session30/sessionmanageradmin.ashx">More information</A> on this interface can be found on MSDN.</li>
<li><A href="http://csfsession.networkmashups.com/session30/sessionadmin.ashx">Session Admin</A> - The interface that allows you to manipulate each individual session. <A href="http://msdn2.microsoft.com/en-us/library/aa303401.aspx">More information</A> about this interface can be found on MSDN. </li>
<li><A href="http://csfsession.networkmashups.com/session30/session.ashx">Session</A> - the interface of the session, which allows you to route a message and put a session into hibernate mode. <A href="http://msdn2.microsoft.com/en-us/library/aa303452.aspx">More information</A> about this interface can be found on MSDN.</li>
</ol>

<p>
Other useful services that you might find useful to enhance the user experience are:
</p>

<ol>
<li><A href="http://sandboxapp.networkmashups.com/servicecatalogWSE/servicecatalog.ashx">Service Catalog</A> - a searchable catalog of service information. So when adding a service into the session, this catalog could be used to search for it and find it.</li>
<li><A href="http://csf.networkmashups.com/IdentityManager30/IdentityManager.ashx">Identity Management</A> - the component that provides the details about the persona participant. <A href="http://msdn2.microsoft.com/en-us/library/aa303438.aspx">More information can be found here.</A></li>
</ol>

<p>
<strong>IMPORTANT NOTE:</strong> Recognizing the fact that sometimes it is difficult to connect to these services across firewalls and security boundaries, you can also build the tool against the CSF Developer Lite edition. This edition will deploy the session services locally on your PC so that you can connect to it locally instead of across the network. You can download the <A href="http://msdn2.microsoft.com/en-us/communicationssector/bb363476.aspx">CSF Dev Lite version</A>.
</p>

<h3>What is the "Session Manifest"?</h3>

<p>
<A href="/i/download/msSessionManifest/manifest.xml">manifest.xml</A> provides an idea about the format of Session manifest, details about participant manifest, types of participants, routing rules & policy details.
</p>

<p>
<A href="http://msdn2.microsoft.com/en-us/library/aa303401.aspx">This API</A> is used to manipulate the Session manifest. 
</p>

<p>
The enclosed manifest.xml provides an idea about the format of Session manifest, details about participant manifest, types of participants, routing rules & policy details. 
</p>
 
<p>
<A href="http://msdn2.microsoft.com/en-us/library/aa303401.aspx">Details about the API</A> that could be used to manipulate the Session manifest. 
</p>

<p>
All the services are registered in Service catalog and can be queried <A href="http://msdn2.microsoft.com/en-us/library/aa303485.aspx">using the APIs</A>.
</p>

<p>
When a persona participant needs to be added to the session manifest, the Identity Manager service should be added as a participant to the service.
</p>

<p>
A persona participant manifest would look as described below
</p>

<pre>
&lt;Participant timeout="30" role="Persona" inChannelResponse="true" type="WebService" servicePrincipalName="a/b"&gt;
    &lt;SoapVersion&gt;Soap12&lt;/SoapVersion&gt;
    &lt;ParticipantID&gt;PersonaParticipant&lt;/ParticipantID&gt;
    &lt;ParticipantName&gt;PersonaParticipant&lt;/ParticipantName&gt;
    &lt;ParticipantUrl&gt;http://csf.networkmashups.com/IdentityManager30/IdentityManager.ashx&lt;/ParticipantUrl&gt;
    &lt;SecurityToken&gt;
        &lt;UsernameToken&gt;
            &lt;Username&gt;User@csf.com&lt;/Username&gt;
            &lt;Password&gt;Password3&lt;/Password&gt;
        &lt;/UsernameToken&gt;
    &lt;/SecurityToken&gt;
    &lt;PolicyDocument&gt;
        &lt;Reference&gt;PersonaParticipantPolicy&lt;/Reference&gt;
    &lt;/PolicyDocument&gt;
&lt;/Participant&gt;
</pre>

<A href="http://msdn2.microsoft.com/en-us/library/aa303446.aspx">More information</A>

<h3>Example Visualizations</h3>

<p>
<A href="/i/download/msSessionManifest/form1.jpg">form1.jpg</A>
<br><A href="/i/download/msSessionManifest/sessionDiagram.jpg">sessionDiagram.jpg</A>
</p>

<h3>What Microsoft is looking For</h3>

<ol>
<li>.Net/Javascript Source code for the tool that you have built with the appropriate level of in-code comments</li>
<li>The tools concept and layout must be visually appealing and usable. Usability is very important.</li>
<li>Compiled Tool that connects to the services (i.e. the session manager admin web service, the session service, etc) above.</li>
<li>User guide or documentation on how the tool is to be used</li>
</ol>

<h2>How to Enter</h2>

<p>
<span class="bigRed">Read the complete Official Rules for information about eligibility.</span>
</p>

<p>
Your goal is to produce the full source code, compiled binary for the windows platform and the necessary deployment and user guide documentation.
</p>

<p>
Submission Requirements:
</p>

<ul>
<li>You should use Silverlight or the Microsoft Atlas framework (the Microsoft Ajax Framework)</li>
<li>Use .Net Framework and related technologies to build your solution.</li>
<li>All submissions must include source and compiled binary.</li>
<li>All submissions must include a deployment guide and user guide as Microsoft Word docs.</li>
<li>All source code submitted must be commented appropriately. Source code with no commentary in code will be rejected.</li>
</ul>


<h2>Selection of the Winner</h2>

<p>
After the submissions are sent to Microsoft and carefully reviewed, Microsoft will choose the winners. Winners will be announced on June 18, 2007.
</p>

<h2>Prizes</h2>

<p>
The contest will award cash prizes totaling $4,500 to up to three (3) competitors, with the possibility of additional discretionary prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner(s). See the Official Contest Rules for more information.
</p>

<p>
Prizes will be distributed as follows:
</p>

<p>
<strong>
1st Place: $6,000.00
<br>2nd Place: $2,000.00
<br>3rd Place: $1,000.00
</strong>
</p>

<h3>Discretionary Prizes</h3>

<p>
Microsoft may choose at its discretion to have more winners than the three outlined above.  In such cases, the above competition terms would apply and prize monies would be determined within the above range.
</p>

<h2>Required Deliverables From Winner</h2>

<p>
The winner must deliver the final files created, including the following:
</p>

<ul>
<li>Full sources for the implementation.</li>
<li>A VS.NET solution file or NAnt build script set up to fully build the implementation.</li>
<li>A document in RTF format explaining how to set up any dependency services or components, and deploy the application to the CSF sandbox. 
    <ul>
    <li>This document should also contain a section listing all (if any) of the TopCoder components that were used in the prototype.</li>
    </ul>
</li>
</ul>

<h2>Timeline</h2>

<p>
All submissions are required to be submitted by the End Date. 
</p>

<div align="center">
    <table cellpadding="4" cellspacing="0" width="250">
        <tbody>
            <tr>

                <td nowrap="nowrap" valign="top"><strong>Start Date:</strong></td>
                <td>
                    Tuesday, May 22, 2007 at 16:00 EDT
                </td>
            </tr>
            <tr>
                <td nowrap="nowrap" valign="top"><strong>End Date:</strong></td>
                <td>

                    Tuesday, June 8, 2007 at 17:00 EDT
                </td>
            </tr>
        </tbody>
    </table>
</div>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>