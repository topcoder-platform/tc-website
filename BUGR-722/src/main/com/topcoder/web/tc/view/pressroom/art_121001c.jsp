<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
						<div align="center"><IMG SRC="/i/pressroom/darwin_logo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Five Thoughts about Hiring IT Professionals</span></p>
                        </div>
						With Jack Hughes, founder and chairman of TopCoder Inc., a company that specializes in the evaluation of programmers.<BR/>
						By Daniel J. Horgan<BR/><BR/>
						November 29, 2001 - Without a standard, objective means of differentiation, finding the most qualified professional for your IT team is a very tricky feat. To get the lowdown on attaining and retaining skilled IT professionals, Darwinmag.com spoke with Jack Hughes, the founder and chairman of TopCoder Inc., a company that specializes in the evaluation and grading of programmers through competition.<BR/><BR/>
						Darwinmag.com: How would you describe the dream IT professionals?<BR/><BR/>
						Hughes: The ideal IT workers would be grounded in technology, but would understand business, too. They would have gone to school for computer science or electrical engineering or some technical discipline. They would have spent time utilizing technology and implementing it in a position for a technical company. But they also would have time on the business side, where they got a good feel for what the objectives of a business are so they can understand the application of technologies to business problems.<BR/><BR/>
						To the extent that IT pros are at fault for what I consider this wedge between IT and the rest of the company, I put most of the blame for that on the IT professionals and their unwillingness to learn the business side.<BR/><BR/>
						<B>What's the best way for a company to attract qualified IT professionals?</B><BR/><BR/>
						The single biggest factor in attracting the ideal IT worker is to keep the work interesting. If it is not interesting work, regardless of how much money you pay somebody, that person is not going to stay. The best employees will leave and go to an environment in which they feel challenged. If they are not challenged, you need to set up an environment in which they are. That has a lot to do with the types of projects given, the way they are assessed, and the reward system in place -- whether it be bonuses or promotions or both. It must be an environment that is constantly changing, constantly giving them new challenges and rewarding them for their work along the path.<BR/><BR/>
						<B>Is there still a skills shortage within the IT community?</B><BR/><BR/>
						Yes, and it is not likely to go away any time soon. The systems environments in which we work get more complex all the time, and they move up in order of magnitudes and complexities. That means you need both more people on an absolute basis to handle more and more systems, and you need more highly developed skills. There is definitely a shortage of the highly skilled folks, although it can be argued that there's not as much a shortage in absolute numbers as there was two or three years ago, but there is still an overall shortage. The supply has yet to meet the demand.<BR/><BR/>
						<B>How important a role does education play in the future of IT?</B><BR/><BR/>
						A big role. The lack of rigor and desire for learning science, math and the technical disciplines is a large issue affecting American IT folks. There is going to be a bigger gulf between demand and supply, especially if the economy turns up. If this country is going to have a viable IT workforce, it's going to have to put an awful lot more emphasis on education earlier on, in elementary school and high school. We have to come up with more creative ways to do that. You have to get kids interested in computers themselves and how they work. Otherwise, much like what happened with manufacturing labor, the manufacturing capacity will head offshore and jobs will follow. Although companies will say it's a cost issue, if they can't find the talent they need here, then they will go offshore looking for it. And once companies start looking offshore, they are going to stay there.<BR/><BR/>
						<B>In the current harsh hiring climate, who must adapt/evolve: The employer or the IT professional?</B><BR/>
						Both. You can't be an employer and act as if individuals are interchangeable. If you try to do that then you are going to lose some of the better talent you have. If you are letting people go or cutting back on bonuses, you have to be selective in how you do it. You can't just take a broad brush.<BR/><BR/>
						The IT professionals have some thinking to do as well. It is going to be much tougher for an employer to give them bonuses like in the past, and even their pay may be too high. They are going to have to get used to less pay, probably not for any less work. The job functions aren't likely to change and may even increase if the company is cutting people, it is going to put more work on their shoulders. They just have to reset their expectations.<BR/><BR/>
<p><br></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
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
