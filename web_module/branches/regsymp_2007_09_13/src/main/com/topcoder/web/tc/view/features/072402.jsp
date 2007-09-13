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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Attack of the Moans: Building Applications for Users</B></FONT><BR/>
<!-- <I>Avoid Overloading!</I><BR/><BR/> -->
Wednesday, July 24, 2002<BR/>
By&#160;polgara,<I>TopCoder Member</I><BR/>
</P>

<P>
Users. You gotta love them. Managing user expectations throughout the entire development process can be a wearisome and time-consuming task, and at times it may seem like nothing a coder ever writes will permanently satisfy users.  Upon the initial completion of a project, users are often effusively grateful;  this 'honeymoon' period can be quite brief though, frequently followed by a list of demands for additional or enhanced features.  But does it always have to be an adversarial relationship?  Is it possible to work through a development cycle, pleasing clients, without driving yourself - and everyone around you - crazy?
</P>

<P>
One of the most difficult tasks involves getting all the interested parties to articulate their requirements at the early phases of the project.  Avoiding scope creep during the middle and later phases of development is also important to maintaining sanity for both implementors and stakeholders.  Once building of the application begins, there are design principles and suggestions that can not only produce a better end-product for the user, but also can result in creating a positive atmosphere for future development projects.
</P>

<P>
<B>You have to think like me if you want to code for me</B>
</P>

<P>
The key to guiding and shaping user expectations is understanding their perspective - put yourself in their shoes.  Consider it your opportunity to be a Hollywood celebrity, and indulge in some method acting.  For example:
<UL>
	<P><LI> Users have a different focus.  They are concerned with what they see and use, and are not particularly interested in what happens behind the scenes.  They are not really impressed by the fact that your database is fully normalized, but they have strong feelings about the exact shade of blue that you use for a drop-down box. </LI></P>
	<P><LI> Users can sometimes be easy to please.  This is not to make light of their expectations, but rather to point out that because their focus is on the interface, relatively minor cosmetic changes can enhance their faith in the coder.  Of course there are cases where cosmetic changes actually take longer than a more sophisticated database or programming modification.  This can be frustrating to the developer, but is a case where diplomacy and customer education are necessary.  Demystifying the coding process, without the extensive use of technical jargon, is helpful in explaining how and why the change is not a simple one to execute.</LI></P>
	<P><LI> Users frequently say,  "but I saw this other program and it does this, that and the other..." Closely tied to this problem is the comment that "if my 13 year old son can do /create the same, how come you take so long and charge so much?"  There is no real solution to this frustration, beyond explaining as simply as possible why a two-page web site built in Microsoft's Front-Page is not the same as a fully functional E-commerce web application.  Much patience is required.</LI></P>
	<P><LI> Users, unlike coders, put little thought into the concept of "Exceptions." Their initial specifications to the developer will often only include perfect examples of the relevant business processes at work. A colleague who worked at a financial company created an application to reconcile/match cheques from two differing sources.  The program took three months to build, and functioned correctly - when the data sent to it was in the format as described in the initial specifications. Unfortunately, almost every day non-standard cheques were sent to the system, which meant that the program failed regularly, requiring a 1-2 hour intervention from the coder.  The system was eventually abandoned.</LI></P>
	<P><LI> Users do not always consider the need for ongoing maintenance, assuming that the program will "magically" work flawlessly, once implemented. For example, they forget that the best database application in the world is only as effective as the human who keeps its data up-to-date. </LI></P>
	<P><LI> Users change their minds. A lot.</LI></P>
</UL>
</P>

<P>
<B>We have ways of making you talk or giving us your requirements</B>
</P>

<P>
It is virtually impossible to get users to describe all of the requirements of the new application in advance, but there are some pointers that can help avoid a disaster.
</P>

<P>
<UL>
	<P><LI> Assess the level of computer literacy of the potential users.</LI> </P>
	<P><LI> Poll all interested parties. It is not enough to consult the primary instigator of the request for the application; all potential users (or representatives from each group of users) should also be involved in creating the specifications.  The danger of consulting only one type of user is that his/her needs may conflict with that of another type of user.</LI></P>
	<P><LI> Ensure that what a user has asked you to create will actually meet his or her needs.  One of the departments at my work place made a request for an internal search-engine program.  At the end of the development, when presented with the finished product, they admitted "you built what I asked you to build, but not what I wanted."  Get users to list the concrete tasks to be accomplished by the new software, as a means of verifying their specifications.</LI></P>
	<P><LI> Have users critique demonstration copies of existing software that appear to fulfill their requirements.  Get users to tell you what is useful about the existing product and what aspects could be improved.</LI></P>
	<P><LI> Build a simple prototype and have users try it out.</LI></P>
	<P><LI> Ask for cases of exceptions - when do regular rules differentiate and what circumstances occur out of the ordinary and need to be catered to, when coding the software.</LI></P>
	<P><LI> Develop a business-case document to capture what is driving users to want this program.  Include the high level objectives and goals of the project.</LI></P>
	<P><LI> Check with the legal department to ensure there are no issues over sensitive data being exposed inappropriately.  Check for any other compliance or security rules that need to be followed.</LI></P>
	<P><LI> If there are others in your team who have worked with the particular group of users in the past, ask for your colleague's opinion on successful strategies when building for that group.</LI></P>
	<P><LI> Think of it as a friendly competition - you against the old way of doing things.  </LI></P>
	<P><LI> Deal with data management and updates in the early stages of development design.  Educate users and ensure they understand their responsibilities in terms of maintaining the application. </LI></P>
	<P><LI> Buy, beg, borrow or steal as much time as possible to build a rock-solid design before beginning the coding phase, but assume there will be change requests along the way and steel yourself to deal with the inevitable scope creep.  Design and code your application with as much flexibility as possible.</LI></P>
</UL>
</P>

<P>
<B>Curbing Scope Creep throughout the development process...</B>
</P>

<P>
Once the building phase has begun, there are often requests to expand the original specifications.  It is important to curb such scope creep, and limit the number of changes to ensure the project is not compromised.  Ideas to help keep a project on-track include:
</P>

<P>
<UL>
<P><LI> Create and implement a schedule to systematically solicit feedback from users.  Be sure to include users in all phases of the development process, keeping them posted on a regular basis. Users feel empowered, and less uneasy, as they have continuous input into the application they will eventually use.</LI></P>	
<P><LI> Keep communication lines open between users and yourself when developing applications.  Don't just say "No," but make clear the impact of suggested modifications when change requests are made during the development process.  Accommodate request changes which are relatively quick and easy to implement.  Both of these actions will increase the likelihood that users will accept your reasons when you do refuse to make a design or coding change to the new product, rather than assuming that "IT is just being difficult."  Avoid using technical jargon or squelching their enthusiasm for the entire project when making these explanations.</LI></P>	
<P>	<LI> Prioritize requirements by their relative importance.  This will help weed out high-cost/low-value functionality.  It will also assist in making informed and critical decisions when faced with time, resource or functionality trade-offs, or with the need to accommodate change requests to the original design, but still complete the project within the same time-lines.</LI></P>	
<P>	<LI> If your Information Technology department is functioning under constraints that impinge on a user's application, you should inform users of those limitations.</LI></P>	
<P>	<LI> Utilize professional project management software like GANTT charts to help avoid scope creep and track the progress of the application during development.</LI></P>	
<P>	<LI> Educate your users about general systems development principles in terms of being able to deliver any two out of the following three: low cost, fast implementation or no bugs.</LI></P>
</UL>
</P>

<B>Spruce It Up...</B>

<P>
Employing common design strategies can be a good way to build a good relationship with customers  by creating a more useful, attractive and accessible program.  Some common design principles are:
<UL>
	<P><LI> Keep it simple:</LI></P>
	<P><LI> Make the system as easy to use as possible.</LI></P>
	<P><LI> Don't crowd the screen with too many choices or buttons - the down side of this is that the user might miss important functionality because it is placed on a child-page, rather than the main, first page.  To avoid this, have the user prioritize functional tasks and place the most frequently accessed or key functions in the front and center of the application's interface.</LI></P>
	<P><LI> Group together similar functions, and avoid duplication of functionality.</LI></P>
	<P><LI> Avoid requiring that the user scroll off-screen to access a particular function or area.  </LI></P>
	<P><LI> Remember that the screen size and settings for a user might not be as sophisticated the those belonging to the developer.</LI></P>
	<P><LI> The "Three click Rule" recommends that all relevant parts of an application should be accessible within three mouse-clicks of the main page of the program's interface. If more clicks are required, this can lead to user frustration and abandonment of the software.</LI></P>
	<P><LI> Provide helpful error messages - java.lang.Exception might communicate volumes to a programmer, but is not particularly useful to the average user.</LI></P>
	<P><LI> Attractive applications make a better impression on users.  However, beware of what Jakob Nielsen describes as the "importance of not being Crayola", and going crazy with multiple, bright, flashing colours and buttons cluttering the screen.  Closely related to this is limiting the use of Flash when building Web pages (my pet peeve).</LI></P>
	<P><LI> Where possible and appropriate, make the application cute or funny.  A developer at a local library noticed that users of their search system would often incorrectly assume that typing the word "con" into the system would allow the user to continue through a list of book titles.  He modified the search system's code so that such requests would result in the following message: "You cannot con me, unless I let you."  Most users got a laugh.  However, humour and 'cuteness' should be used in limited doses, in a careful and sensitive manner, ensuring that no-one is hurt or insulted by such choices.</LI></P>
</UL>
</P>

<P>
<B>Rolling Out the Product:</B> 
</P>

<P>
The final stage involves rolling out the new application to users.  Starting with a small group, and singling out enthusiastic users for training, is one way of increasing the likelihood that the new software will be widely adopted and used by clients.  During training sessions, remember that using the program might be obvious to the coder, but not to a user.  Archive and maintain all training or FAQ documentation in an easily accessible position (an Intranet is a great place for such material) and train your help desk or first-level support staff to answer basic questions on the system.  A smooth and successful deployment process for a new product can provide a perfect opportunity to improve relationships between the development department and the rest of the customers throughout a company.  It can set the stage for a better working relationship for future development projects, and can make the overall process of systems development less of a battle and more like a fun, friendly challenge.
</P>

<P>
<B>Real Life User Comments/Stories:</B>
<UL>
	<P><LI> One user thought that "right-clicking" with a mouse meant that he could only use his right hand to use the mouse.  He was left-handed.</LI></P>
	<P><LI> Another refused to maintain an employee database via an Excel front-end, but insisted on updating exactly the same information  in an Excel workbook on her local hard drive.</LI></P>
</UL>
</P>

<IMG SRC="/i/m/polgara_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;polgara<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=153650" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>



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
