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
						<div align="center"><IMG SRC="/i/pressroom/esj_logo.gif" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Sun Sponsors Collegiate Developer Tournament</span></p>
                        </div>
						by Matt Migliore<BR/><BR/>
						12/18/2001 - Sun Microsystems Inc. has committed to be the exclusive sponsor of the 2nd Annual TopCoder Collegiate Challenge for programmers, as it sets its sights on what it describes as an untapped market for Java and XML developers.<BR/><BR/>
						The event, which invites thousands of developers from universities across the United States to compete for 512 tournament spots, boasts a $150,000 prize purse and awards national rankings to developers based on performance. Beginning February 2002, the 512 programmers will participate in a series of online elimination rounds, culminating with the Sun and TopCoder Collegiate Challenge finals on April 19-20, 2002 onsite at the University Park Hotel at Massachusetts Institute of Technology in Cambridge, Massachusetts.<BR/><BR/>
						"[Sun] does a lot of stuff to get Java and XML in university curriculums worldwide," says Matt Thompson, group manager for technology evangelism at Sun. He says, Sun has had great success in doing so, and by sponsoring the TopCoder event hopes to be able to recruit some of the university system's leading Java and XML programmers.<BR/><BR/>
						Although Sun's agreement with TopCoder is a one-year deal, Thompson says he is looking at it as a long-term partnership. He says, Sun has been interested for some time in the idea of a developer tournament, but has never had the time to stage a quality event itself.<BR/><BR/>
						In 1996, Sun attempted to start its own programming tournament called the Java Cup. But the event failed to generate sufficient interest among developers, and was held for just one year. "I think TopCoder has this down much better than we ever did," says Thompson.<BR/><BR/>
						"Student are developers in training," Thompson says. "So, obviously the more Java programmers we have out there, the better the platform is going to be."<BR/><BR/>
						The TopCoder Collegiate Challenge is not a Java-only tournament. However, Rob Hughes, TopCoder's president and CEO, says Java was the platform of choice for the majority of entrants during last year's event. "Eighty-five percent of the competing members used Java to compete," he says.<BR/><BR/>
						In order to compete in the event, programmers must be registered members of TopCoder. According to Hughes, TopCoder's member base consists of the top computer science school's in the country. MIT, Stanford, Virginia Tech, Rensselaer Polytechnic Institute, Michigan, and Carnegie Mellon are the top six representative schools among TopCoder members.<BR/><BR/>
						The tournaments format involves a series of online elimination rounds, beginning Feb. 19, 2002. Those rounds will narrow the field from 512 to 16 for the final two rounds at MIT from April 19-20, 2002. The winner will receive $100,000 of the $150,000 prize purse.<BR/><BR/>
						Hughes says the primary function of the competition's TopCoder stages is to provide a fertile recruiting ground for IT-intensive organizations. "It's part of the TopCoder business model," he says. "We are not actively out there looking for placement of these individuals, but our sponsors have a leg up on looking at them."<BR/><BR/>
						In addition to the Collegiate Challenge, TopCoder also holds an invitational tournament once a year, which hosts programmers outside the collegiate ranks, as well as weekly online events. All of the competitions are sponsorable.<BR/><BR/>
						Last year's Collegiate Challenge was won by MIT student Jason Woolever.<BR/><BR/>
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
