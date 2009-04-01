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
						<div align="center"><IMG SRC="/i/pressroom/rckymntnews.gif" ALT="Rocky Mountain News" border="0"/></div><BR/>
						<p><span class="bodyTitle">Massaro: Whiz cracks contest code</span></p>
                        </div>
						December 20, 2001<BR/><BR/>
						LAFAYETTE -- Daniel Wright is thinking ahead. Here, in the midst of the holiday season, he's looking forward to spring.<BR/><BR/>
						Don't think he's a grouch who sucks lemons instead of Christmas punch. He's going to spend the holidays at home. And he's going to be busy.<BR/><BR/>
						"I won't have any free time this winter break," he said. "I'll probably be working on an honors thesis."<BR/><BR/>
						Wright, 20, is studying computer science at Stanford University. He's pretty much a whiz. He finished second in the TopCoder national computer contest last month. Competitors solve complicated math problems. They were definitely not the kind of stuff you could solve with a hand-held calculator.<BR/><BR/>
						Going in, Wright was the favorite to win.<BR/><BR/>
						But his mind got to drifting when it should have been drafting. So he settled for second-best money of $25,000.<BR/><BR/>
						He had placed second in a previous contest in June.<BR/><BR/>
						"It was just lack of concentration," he said. "I had that in mind the whole time in this round. I didn't want to repeat that."<BR/><BR/>
						He did.<BR/><BR/>
						Wright is a native of South Africa. He moved to Boulder County with his family in December 1998.<BR/><BR/>
						"We moved out of the hot summer into a lot of snow," he said.<BR/><BR/>
						That's because Johannesburg is south of the equator, so seasons are reversed.<BR/><BR/>
						"It gets cold in winter. It just doesn't snow," he said. "We once had sleet when I was 7."<BR/><BR/>
						Wright's interest in computers goes "way, way back," he said. "My parents were both computer programmers. We had a computer in the house basically since I was in kindergarten. They taught me how to write some very simple programs. Then gave me a book. I've been programming since first or second grade."<BR/><BR/>
						He said he may become a professor, or go into research. Whatever, computers will be the root of his career.<BR/><BR/>
						Side note to Daniel's family: Don't expect any neat gifts for Christmas.<BR/><BR/>
						"I decided that whatever I won, I would put in safe deposit for three months -- just so I didn't do anything rash," he said. "I just don't want to throw it away very quickly. I'll probably have a nice spring break."<BR/><BR/>
						When Gary Massaro listens, people talk. Gary's column appears Tuesday, Wednesday, Thursday, Friday and Saturday. Contact him at (303) 892-5271 or massarog@RockyMountainNews.com.<BR/><BR/>
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
