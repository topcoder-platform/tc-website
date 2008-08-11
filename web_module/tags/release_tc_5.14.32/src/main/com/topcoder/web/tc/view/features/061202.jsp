<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>To in-house or to out-source, that is the question</B></FONT><BR/>
Wednesday, June 12, 2002<BR/>
By&#160;polgara,<I>TopCoder Member</I><BR/>
</P>

<P>
Outsourcing is an effective way of providing a variety of services, particularly for a small 
or medium-sized IT department or corporation.  At my company for example, clients access 
delayed stock data, U.S. and Canadian news, and other financial information via our website. 
To negotiate individual agreements with every exchange, as well as pay the fees associated 
with directly obtaining data from every exchange, would have proven to be extremely 
time-consuming and expensive.  A cheaper solution was to buy the stock and news data 
off a licensed re-seller, who specializes in this arena.  For similar costing reasons, 
we utilize an external, world leader in edge-technologies, to speed-up the delivery of 
video and audio feeds to our clients.
</P>

<P>
Proper research including background checks when choosing a vendor may mature into a 
mutually beneficial, long-term relationship with a valuable partner.  This can result 
in perks like Beta product availability to your company, in advance of competitors, or 
the ability to request those specific features be incorporated into future product packages.  
There might even be free trials of other products by the same vendor.  But like many good 
things, there is always the potential for problems.
</P>

<P>
<B>Reality Bites or He Said, She Said...</B>
</P>

<P>
Development ideas often originate from the business leaders within a company.  
Good business leaders will consult with their Information Technology department 
to determine the technical feasibility of the project.  Business leaders are 
busy people, with restrictions on their time, and do not necessarily possess 
extensive technical knowledge.  Vendors sometimes take advantage of this fact 
and focus on the positives of their product, making light of any technical or 
integration concerns.  In contrast, in-house IT staff tend to be more critical, 
citing the technical difficulties or obstacles in the way of accomplishing the 
project when examining the overall feasibility of the project.  IT staff may be 
able to articulate more clearly and vociferously the extent and complexity of the 
integration work required to mesh with current systems, since they are more familiar 
with the strengths and limitations of existing company applications.  Unfortunately, 
business managers can interpret this realistic perspective as due to a lack of ability 
or knowledge on the part of the in-house staff, preferring to listen to the outsider 
who "tells them what they want to hear".
</P>

<P>
<B>IT - (the) Ignored Technologists...</B>
</P>

<P>
One financial house that I know of, learned the hard way that it would have been prudent 
to pay attention to the assessment of its own IT department before entering into a 
contract to purchase a customized version of a popular Contact Management Software package.  
The vendor extolled the versatility, user-friendliness and low-cost ($0.5 million) of this 
product to a credulous Research department.  The IT department expressed concerns about the 
programming language used (Visual Basic), speed of execution of code and the potential for 
conflicts with existing systems.  The Research department dismissed these as professional 
jealousy, incompetence or laziness to assist in integration of new software with existing 
systems.  Sixteen months and $1.5 million later (the extra dollars was for patches and 
"workarounds existing systems"), problems with the software continued to occur.  The 
research department that had been continually on the defensive whenever the software did 
not function correctly, finally acknowledged they were throwing away good money after bad.  
They had to concede that their in-house IT staff were right and to request that they build 
a replacement system.  In less than two months, IT staff were able to design and build a 
replacement application, not only with functionality equal to that of the vendor's package, 
but with enhanced versatility and efficiency.  The IT staff had always maintained that they 
could build the application, but their proposal had not been presented in as slick a manner 
as the vendor's sales presentations.
</P>

<P>
<B>The trouble with five-cent cigars is that they cost a quarter...</B>
</P>

<P>
Franklin Adams' observation aptly describes the predicament of companies who purchase a 
software package out-of-the-box, only to find that it needs to be customized to actually 
meet their needs.  The cost of customization is usually in addition to the cost of the 
software, and can cost more than the package itself.  The problem occurs, not just the 
financial industry, as in the example of the previous paragraph, but in all business sectors.  
A few months ago, a friend from my university days who works with the IT department of a chain 
of retail stores mentioned that his company had just purchased a program to automatically 
create marketing letters, en masse. The software cost $100,000, but the customization 
would cost "something extra".  A month later, he told me that customization was being 
billed at $4,000/day with an estimated 60 days being required to "tweak" the software 
to the point of usability for the dept.  The department had signed on the contract, 
without any clear arrangements about cost of customization.
</P>

<P>
<B>Income Tax was a temporary measure too...</B>
</P>

<P>
Relying on an outsider for development frequently means relying on them for maintenance 
or future changes.  Many firms hire outsiders to build an application or fill a specific 
need, expecting that there would be a transfer of knowledge to in-house staff at the 
termination of the engagement.  In theory this sounds wonderful, in practice, in-house 
staff can resent being forcibly trained by an outsider. As well, when the time comes, 
out-sourcers resist transferring their knowledge - not only to safeguard their own 
future job prospects but also so that the company which purchases their software is 
forced to hire them again to fix problems with the software. They are very aware that 
without that transfer of knowledge, the IT department is not always able to resolve 
the problem.  Remember too, vendors and out-sourcers have more to gain by prolonging 
an engagement, particularly if their bill for servicing clients is based on the amount 
of time spent, rather than the amount of work completed
</P>

<P>
<B>If this is an Emergency, press 1 to leave a voice message...</B>
</P>

<P>
Outsourcing services and products means losing direct control over those systems. You 
and your company are at the mercy of the hosting company; this might mean they are not 
readily available in emergencies.  In the best case scenario where the hosting company 
is available 24x7, there is still the delay in contacting and conveying the problem 
specifications.  In addition, there can be delays when implementing code changes, as 
development timing is contingent on the availability and convenience of the coders at 
the hosting company
</P>

<P>
The decision on whether to rely on in-house staff or take the plunge into outsourcing 
a new undertaking is never easy.  There is the risk that your IT staff does not possess 
sufficient time, resources or range of knowledge required.  On the other hand, the 
consequences of outsourcing can be unpredictable.  I have found the following tips to 
be helpful, when deciding whether to have internal staff complete a new project, or look 
for resources outside the company:
</P>

<P>
<B>Resistance is Futile (pointy hair optional)...</B>
</P>

<P>
Yeah, I know this sounds daft, but one of the techniques that I have found to be 
successful in nudging business heads in the right direction, is to behave like a 
marketing person.  This is difficult for the average person, let alone the average coder.  
But do not worry, the change is not permanent, and usually will not result in long-term 
mental damage (unless you do this for days at a time J).  If you have an in-house marketing 
department, then it might be helpful to consult them, in creating your presentation.   
Business leaders have limited time, and so try to tailor presentations to focus on a few, 
key points, rather than a lengthy discussion of the problem and potential solutions.  
Presentation software like Presentation (Corel), Power Point (Microsoft) or Presentation 
(Astound) as well as storyboards have the capacity to be very effective, since they convey 
large amounts of information in a relatively quick and easy fashion.  
(See <A HREF="http://www.dilbert.com" TARGET="_blank" CLASS="bodyGeneric">http://www.dilbert.com</A> 
for effectiveness of some of these strategies)
</P>

<P>
<B> Half a loaf is better than none...</B>
</P>
 
<P>
It is not an all-or-nothing situation.  If the notion of outsourcing all of your IT 
products and services is too intimidating, try outsourcing components.  Assess core 
competencies, identifying areas where in-house staff is particularly brilliant or 
cost-effective as well as areas where there are weaknesses or gaps in skill levels.  
Evaluate the risk factor tolerable for each component to be out-sourced, including a 
consideration of latency times in terms of development or emergency response times 
that could occur with utilizing outside services.
</P>


<B>If you decide to Out-source:</B>
<OL>
<P>
	<LI> Make proper agreements to ensure that you own the code (assuming 
your company wishes to do that), or have access to the application 
through an API, or direct access to the source code for future modifications. 
Keep in mind that very few applications work perfectly, forever.  To address this 
need, a maintenance contract which clearly delineates the extent of responsibilities (and cost) 
of the outsourcing company should be signed at the same time as the engagement contract.  
Finally, problems and difficulties are probable when the outsourcing company does not furnish
 proper documentation or white papers on the design and architecture of the application that 
 has been built for your company.  Alternately, if a vendor is providing an ongoing service, 
 it might be more advantageous to consider a short-term contract of one or two years.  
 This way, your company has an advantage over the outsourcing company.  The vendor is alert 
 to the need to provide the best service, not just during the initial or pilot phases of the 
 engagement, but on a daily basis, since there is the danger of terminating the contract 
 without penalty.  Thus the contracting company retains the flexibility to switch to another, 
 similar service provider.</LI>
</P>

<P>
<LI> Consult your IT staff.  They generally have the time, resources and experience to assess 
the technical merits of an external vendor.  In-house IT staff are familiar with existing systems, 
and are capable of  zero-ing on potential conflicts or data issues to be resolved during the 
integration phase of an engagement with an outside company.  In addition, use your IT staff to 
ensure there is proper and continuous technical supervision throughout the product implementation 
by the vendor.  The vendor and contracting corporation should agree on measurable business and 
technical goals, as well as project deadlines, with penalties for failing to meet a deadline. 
Optionally, if your company wishes, bonuses add an extra incentive for the vendor to complete a 
project earlier or to exceed set goals.</LI>  
</P>

<P>
<LI> Carry out research to determine whether the vendor's company is the only one providing such 
a service.  If other companies are providing the same or similar services, comparison shop and 
choose the company that best suits your current requirements.  Ask vendors for references from 
previous customers, and validate the vendor claims by checking with those references.  In addition, 
previous customers are a valuable source of information in providing tips, hints or advice on how 
best to use and integrate the services offered by a particular vendor.  Searches on sites like 
<A HREF="http://www.deja.com" TARGET="_blank" CLASS="bodyGeneric">http://www.deja.com</A>,  
<A HREF="http://www.cnet.com/" TARGET="_blank" CLASS="bodyGeneric">http://www.cnet.com</A> 
or <A HREF="http://www.sys-con.com/java/" TARGET="_blank" CLASS="bodyGeneric">http://www.sys-con.com/java/</A> frequently provide 
beneficial guidance in terms of evaluating a vendor.</LI>
</P>

<P>
<LI> Check the programming skills of the group being hired.   The outsourcing company may be very 
technically proficient, but still not be familiar or competent in the language, platform or operating 
systems in use by your company.  Many software providers choose to develop in Visual Basic, ASP or 
other Microsoft technologies, since those can be relatively simpler development platforms.  
This might result in programming inconsistencies, connectivity concerns or security dilemmas 
if your company habitually utilizes Java, Linux or other non-windows technology.</LI>
</P>

</OL>


<P>
Comments from actual vendors:
<UL>
	<LI>"Is your browser configured to see JSP pages" (browser in question being IE 5.0) - Portfolio Manager Company</LI>
	<LI>"Our software is platform independent-  by the way, you must have IE 5.0  installed for our product to work" - Financial Web Services Provider</LI>
	<LI>"We can solve the problem using one of our company's  VBJavaScript beans" - E-Design company</LI>
	<LI>"We provide 24x7 web hosting solutions for your company with less than 0.01% down time - oh, our site must be having problems rights now, our site is unavailable so I can't show you the demo online" - Web Hosting Company</LI>
</UL>
</P>

<IMG SRC="/i/m/polgara_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;polgara<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=153650" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a weekly feature?</A></P>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
