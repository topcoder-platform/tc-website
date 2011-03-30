<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>About TopCoder - Overview</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<style type="text/css">
div.bioOdd, div.bioEven {
margin-bottom: 40px;
padding-top: 0px;
border-top: 1px solid #999999;
text-align: justify;
}

div.bioOdd div.photo {
float: right;
margin: 0px 0px 10px 10px;
border: 1px solid #999999;
border-top: none;
}

div.bioEven div.photo {
float: left;
margin: 0px 10px 10px 0px;
border: 1px solid #999999;
border-top: none;
}

div.bioOdd h2, div.bioOdd h3 {
text-align: left;
}

div.bioEven h2, div.bioEven h3 {
text-align: right;
}

h2 {
margin-top: 10px;
}
</style>
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
                <jsp:param name="node" value="management_team"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="board_of_directors"/>
            <jsp:param name="title" value=""/>
        </jsp:include>

<div class="bioOdd">
    <%--<div class="photo"><img src="/i/about/management/jhughes.jpg" alt="" /></div>--%>
    <h2>Jack Hughes</h2>
    <h3><i>Founder and Chairman</i></h3>
    
    <p>
    In November 2000, Jack Hughes founded TopCoder on the premise that talent and skill are the determinant factors in the quality and utility of software -- and software has become central to the global economy.
    </p>
    <p>
    In both his own programming experience and as co-founder and chairman of Tallán Inc., a provider of web-enabled business solutions, Jack recognized that while successful projects were driven by superior programming skills, the talent was unqualified and largely unrecognized. TopCoder's mission is to create objective ratings that place high value on the programming industry's best and brightest, and build opportunity and community for programmers through ongoing programming tournaments and employer connections.
    </p>
    <p>
    Under Hughes' tenure as chairman at Tallán, the company was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte & Touche and by Inc. magazine for its outstanding performance. In 2000, CMGI, Inc. acquired a majority ownership of the company.  
    </p>
    <p>
    Hughes holds a Bachelor of Science degree in computer science from Boston College. He is Chairman of the Board for the Christopher & Dana Reeve Foundation. 
    </p>
</div>

<div class="bioOdd">
    <h2>Nicholas M. Donofrio</h2>
    
    <p>
    Nick Donofrio is a renowned global business leader who, in his 44-year career at IBM, helped lead the company to its position as a global technology and innovation leader. Donofrio was the leader of IBM's technology strategy and a champion for innovation across IBM and its global ecosystem. His responsibilities included IBM Research, the Personal Systems Group, the Integrated Supply Chain and Integrated Product Development teams, Governmental Programs, Environmental Health and Product Safety, Quality, and IBM's enterprise on-demand transformation team.  
    </p>
    <p>
    He also headed the IBM Technology Team, was a member of IBM's Strategy Team, and was chairman of the board of governors for the IBM Academy of Technology. At his retirement in 2008, Nick was IBM's Executive Vice President, Innovation and Technology. 
    </p>
    <p>
    Nick Donofrio is a Fellow of the Institute for Electrical and Electronics Engineers, a Fellow of the Royal Academy of Engineering (U.K.), and a member of the National Academy of Engineering. He served on the U.S. Department of Education's Commission for the Future of Higher Education. Nick serves on several company boards, including The Bank of New York Mellon Corporation, Advanced Micro Devices Inc. and Liberty Mutual. He is on the board of trustees for the Rensselaer Polytechnic Institute and is co-chair of the New York Hall of Science Board of Trustees. He holds a Bachelor of Science in electrical engineering from Rensselaer Polytechnic Institute and an Master of Science degree in electrical engineering from Syracuse University, and he has been awarded honorary doctorates in engineering, sciences and technology.
    </p>
</div>

<div class="bioOdd">
    <h2>Laurie Paternoster</h2>
    
    <p>
    Laurie Paternoster joined TopCoder as a member of the Board of Directors in December 2008.  Prior to joining the Board, Laurie served as an advisor to the company and one of the original investors.  Laurie, a private investor and entrepreneur, is active in numerous small and mid-market business and technology and real estate ventures as an advisor, board member and investor.  Additionally, she is the Founder, Chairman and CEO of the Beacon Woods Equestrian Center. Laurie was a Co-founder and member of executive management for Tallán, Inc. for approximately 15 years up to its sale in March of 2000. Laurie is a graduate of the University of Connecticut.
    </p>
</div>

<div class="bioOdd">
    <h2>Peter A. Bourdon</h2>
    <h3><i>Chief Financial Officer</i></h3>
    
    <p>
    Peter joined TopCoder in March of 2009 as the Chief Financial Officer.  He became a member of the Board of Directors in December of 2008.  Prior to TopCoder, Peter held various executive management and board positions including Chief Financial Officer, Chief Executive Officer and Board member of Tallán. While an Executive Officer, he participated in numerous financing and capital transactions including private placements ranging in deal size from $1 million to $30 million.  Additionally, he has been involved in several merger and acquisition transactions with deal transaction valuations up to $1 billion. 
    </p>
    <p>
   	Peter graduated from Assumption College in 1982.  He is a Certified Public Accountant and spent 15 years in public accounting upon graduation from Assumption.
    </p>
</div>


        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="management_team"/>
            <jsp:param name="title" value=""/>
        </jsp:include>

<p style="text-align: justify; margin-bottom: 40px;">
TopCoder's accomplished management team includes some of the most successful professionals in the software industry. Together they have an unparalleled record of successful projects, an unrivalled roster of industry-leading clients, and more than 125 years of combined experience.
</p>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/rhughes.jpg" alt="" /></div>
    <h2>Robert Hughes</h2>
    <h3><i>President & Chief Operating Officer</i></h3>
    
    <p>
    In June 2001, Robert Hughes was named President and Chief Operating Officer of TopCoder, Inc. of Glastonbury, Connecticut. He is responsible for overseeing the day-to-day operations of the company. Prior to his role at TopCoder, Hughes served as the Chief Operating Officer of Tallán Inc. since 1997. Tallán is an Internet professional services firm that creates fully-integrated, technologically advanced solutions for their clients. 
    </p>
    <p>
    During his tenure with Tallán, the company was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte & Touche and by Inc. magazine for its outstanding performance. In 2000, CMGI, Inc. acquired a majority ownership of the company. 
    </p>
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/dtanacea.jpg" alt="" /></div>
    <h2>David Tanacea</h2>
    <h3><i>General Manager Enterprise Platforms </i></h3>
    
    <p>
    David Tanacea joined TopCoder as president in 2002, bringing more than 20 years of experience to TopCoder Software. As General Manager of TopCoder's Enterprise Platforms division, he oversees the technology direction and distribution of TopCoder Software's application development offerings for Fortune 500 companies.
    </p>
    <p>
    Prior to joining TopCoder Software, Tanacea spent seven years with Tallán and as general manager leading development efforts for marquee Fortune 1000 companies, including Priceline, Ingram Micro, PepBoys, Mott's, Bloomingdale's, Talbots and Best Buy. Tanacea was previously vice president of information technology for Zany Brainy, vice president of development for Ann Taylor and director of merchandising systems for WaldenBooks. Tanacea launched his career in the early 1980's with Eastman Kodak as an application developer. 
    </p>
</div>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/mlydon.jpg" alt="" /></div>
    <h2>Mike Lydon</h2>
    <h3><i>Chief Technology Officer</i></h3>
    
    <p>
    Mike Lydon joined TopCoder in April of 2001 as the Chief Technology Officer. Lydon brought to TopCoder his 10 years of experience designing and managing large-scale distributed web-based and data-warehousing systems. Prior to joining TopCoder, Lydon worked as Vice President of Technology Services at Tallán. Lydon holds a business degree from the University of Connecticut where his focus was on Information Systems. 
    </p>
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/iheffan.jpg" alt="" /></div>
    <h2>Ira Heffan</h2>
    <h3><i>General Counsel</i></h3>
    
    <p>
    Ira Heffan has been working with TopCoder since 2001, previously as outside counsel to the company, and now as its General Counsel. Heffan brings to TopCoder over ten years of experience in working with technology companies on their legal matters, particularly in the areas of intellectual property and community-based models. Prior to joining TopCoder, he was in the Intellectual Property Transactions and Strategies Group of the law firm Goodwin Procter. Heffan holds a JD from Stanford Law School, an MS in Computer Science from Boston University, and a BSEE from Union College. 
    </p>
</div>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/gtsipolitis.jpg" alt="" /></div>
    <h2>George Tsipolitis</h2>
    <h3><i>Senior Vice President</i></h3>
    
    <p>
    George Tsipolitis manages TopCoder's Software Development and Events divisions which use competition to build software applications for clients.
    </p>
    <p>
   	Tsipolitis joined TopCoder in September 2001 as Vice President of Development where he architected and managed the development of TopCoder's patented algorithm competition software. He also managed the distributed process of software development projects through the use of the TopCoder member base.  Prior to joining TopCoder, Tsipolitis was Senior Project Manager with Tallán. Tsipolitis holds a business degree from the University of Connecticut where his focus was on Information Systems.
    </p>
    
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/mmorris.jpg" alt="" /></div>
    <h2>Michael Morris</h2>
    <h3><i>Senior Vice President</i></h3>
    
    <p>
    Joining TopCoder Software in 2002 as Vice President of Software Development, Michael P. Morris brings more than a decade of technology experience across vertical markets with diverse clients including AOL, Disney, ESPN, PayPal and Verisign among others. His proven expertise in disciplines such as Component Based Development and Mobile Web services have earned him industry recognition and conference speaking engagements.
    </p>
    <p>
   Formerly, Morris was director of design and development for Tallán, where he successfully managed projects for companies such as Barnes & Noble, eBay, Bertlesmann and Loudeye. He was previously a project manager and consultant with Tallán as well.  Prior to Tallán, Morris served as software programmer for Invensys, a developer of process automation and resource tracking software. 
    </p>
</div>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/dobrien.jpg" alt="" /></div>
    <h2>Dave O'Brien</h2>
    <h3><i>Vice President of Sales</i></h3>
    
    <p>
    Dave O'Brien has over 20 years of sales experience in the computer industry. Prior to joining TopCoder Software, he spent 11 years at Tallán, holding the positions of Senior Account Executive and Sales Director. O'Brien holds an MBA with a concentration in Computer Science from the University of New Haven and a Bachelor of Science in Business Administration from Quinnipiac University. 
    </p>
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/jmckeown.jpg" alt="" /></div>
    <h2>Jim McKeown</h2>
    <h3><i>Director of Marketing Communications</i></h3>
    
    <p>
    Jim McKeown joined TopCoder in 2004 as director of communications and is responsible for TopCoder's global communication, marketing and brand management strategy and execution. He brings more than a decade of experience in the field of strategic communications and public relations to TopCoder and manages the company's integrated marketing, public relations, media and analyst relations. Prior to joining TopCoder, McKeown held account positions with Boston high tech public relations firms Schwartz Communications and Copithorne & Bellows. 
    </p>
    <p>
    McKeown holds a Master's Degree in Public Relations from Suffolk University, Boston. 
    </p>
</div>

<%--
<div class="bioEven">
    <div class="photo"><img src="/i/about/management/mluce.jpg" alt="" /></div>
    <h2>MaryBeth Luce</h2>
    <h3>Vice President, Operations</h3>
    
    <p>
    MaryBeth Luce manages new corporate initiatives, events, recruiting and TopCoder's Asian operations centered in Beijing, China. She joined TopCoder in April of 2001 as the Finance and Human Resources Manager. Prior to joining TopCoder, Luce worked as a Senior Business Assurance Associate at PricewaterhouseCoopers LLC, the world's largest professional services firm. Luce holds a Bachelor of Business Administration degree in Accounting from the University of Notre Dame.
    </p>
</div>
--%>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/tjefts.jpg" alt="" /></div>
    <h2>Tony Jefts</h2>
    <h3><i>Director of Software Operations</i></h3>
    
    <p>
   	Tony Jefts joined TopCoder in 2005 and brings over a decade of experience in leadership and delivery of cutting edge enterprise solutions to high profile corporations. At TopCoder, he spearheads the product and process development efforts that directly support TopCoder's unique platform model and growing customer base.  Focused on excellence and capitalizing on untapped efficiencies, Jefts' responsibilities include opening up the power of the TopCoder Platform to customers and end users around the globe in a way that revolutionizes the software engineering process.
    </p>
    <p>
    Before joining TopCoder, Jefts held the position of project manager at Tallán where he managed the delivery of high-end enterprise systems for many Fortune 100 companies.  He earned a Bachelor of Science degree in Computer Science from Binghamton University's Watson School of Engineering.
    </p>
</div>

            </div>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
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
