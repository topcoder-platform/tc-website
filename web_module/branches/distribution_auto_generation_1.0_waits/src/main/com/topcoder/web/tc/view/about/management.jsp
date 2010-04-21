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
            <jsp:param name="image" value="management_team"/>
            <jsp:param name="title" value=""/>
        </jsp:include>

<p style="text-align: justify; margin-bottom: 40px;">
TopCoder's accomplished management team includes some of the most successful professionals in the software industry. Together they have an unparalleled record of successful projects, an unrivalled roster of industry-leading clients, and more than 125 years of combined experience.
</p>

<div class="bioOdd">
    <%--<div class="photo"><img src="/i/about/management/jhughes.jpg" alt="" /></div>--%>
    <h2>Jack Hughes</h2>
    <h3><i>Founder and Chairman</i></h3>
    
    <p>
    In November 2000, Jack Hughes founded TopCoder on the premise that talent and skill are the determinant factors in the quality and utility of software -- and software has become central to the global economy. 
    </p>
    <p>
    In both his own programming experience and as co-founder and chairman of Tallán Inc., a provider of web-enabled business solutions, Hughes recognized that while successful projects were driven by superior programming skills, the talent was unqualified and largely unrecognized. TopCoder's mission is to create objective ratings that place high value on the programming industry's best and brightest, and build opportunity and community for programmers through ongoing programming tournaments and employer connections. 
    </p>
    <p>
    Under Hughes' tenure as chairman at Tallán, the company was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte & Touche and by Inc. magazine for its outstanding performance. In 2000, CMGI, Inc. acquired a majority ownership of the company. 
    </p>
    <p>
    Hughes holds a B.S. degree in computer science from Boston College. He is director and vice chair of the executive committee and chair of the strategy committee for the Christopher Reeve Paralysis Foundation. 
    </p>
</div>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/rhughes.jpg" alt="" /></div>
    <h2>Robert Hughes</h2>
    <h3><i>Chief Operating Officer</i></h3>
    
    <p>
    In June 2001, Robert Hughes was named President and Chief Operating Officer of TopCoder, Inc. of Glastonbury, Connecticut. He is responsible for overseeing the day-to-day operations of the company. Prior to his role at TopCoder, Hughes served as the Chief Operating Officer of Tallán Inc. since 1997. Tallán is an Internet professional services firm that creates fully-integrated, technologically advanced solutions for their clients. From 1992-1997, he held various management positions in recruiting, sales and operations at Tallán. 
    </p>
    <p>
    During his tenure with Tallán, the company was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte & Touche and by Inc. magazine for its outstanding performance. In 2000, CMGI, Inc. acquired a majority ownership of the company. 
    </p>
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/dtanacea.jpg" alt="" /></div>
    <h2>David Tanacea</h2>
    <h3><i>President</i></h3>
    
    <p>
    David Tanacea is an exemplary software industry leader with the keen ability to turn technology vision into business value. Appointed president in 2002, he brings more than 20 years of experience to TopCoder Software. Driving the technology direction and distribution of TopCoder Software's application development offerings, he is best known for increasing the productivity, and decreasing the cost, of the software development process for global companies across all industries. Tanacea's passion and expertise in the component based development (CBD), component management consulting and productivity tool arenas are reflected in the proven results delivered by TopCoder Software. He has spoken at a wide range of technology events, and frequently writes for publications and online outlets. 
    </p>
    <p>
    Prior to joining TopCoder Software, Tanacea spent seven years with Tallán Inc., a custom software development company purchased by CMGI in 1999. As general manager, he led development efforts for marquee Fortune 1000 companies, including Priceline, Ingram Micro, PepBoys, Mott's, Bloomingdale's, Talbots and Best Buy. Tanacea's legacy includes millions of dollars that he has saved clients through the implementation of specialized software to improve their technology infrastructure. 
    </p>
    <p>
    Other career highlights include vice president of information technology for Zany Brainy, vice president of development for Ann Taylor and director of merchandising systems for WaldenBooks. Tanacea launched his career in the early 1980's with Eastman Kodak as an application developer. 
    </p>
</div>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/iheffan.jpg" alt="" /></div>
    <h2>Ira Heffan</h2>
    <h3><i>General Counsel</i></h3>
    
    <p>
    Ira Heffan has been working with TopCoder since 2001, previously as outside counsel to the company, and now as its General Counsel.  Heffan brings to TopCoder over ten years of experience in working with technology companies on their legal matters, particularly in the areas of intellectual property and community-based models.  Prior to joining TopCoder, he was in the Intellectual Property Transactions and Strategies Group of the law firm Goodwin Procter.  Heffan holds a JD from Stanford Law School, an MS in Computer Science from Boston University, and a BSEE from Union College.
    </p>
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/mmorris.jpg" alt="" /></div>
    <h2>Michael Morris</h2>
    <h3><i>Senior Vice President</i></h3>
    
    <p>
    Joining TopCoder Software in 2002 as the Vice President of Software Development, Michael P. Morris brings a decade of technology experience, across vertical markets, to drive the company's technology vision, product development and virtual project teams. Morris' commitment to the proper design and development of software applications has elevated him to "guru" status among programmers, managers and chief technology officers alike. His specialties - Component Based Development and Web services - have earned him published articles, industry recognition and speaking engagements at acclaimed institutions, such as Java One and Harvard University. 
    </p>
    <p>
    Formerly, Morris was the director of design and development for the northern California region of Tallán, a custom software development and consulting company. Having successfully managed projects for companies, such as Barnes & Noble, eBay, Bertlesmann and Loudeye, Morris established a reputation for quality software design that was delivered on time and under budget. He was previously a director of design and development, project manager and consultant with Tallán as well. 
    </p>
    <p>
    Prior to Tallán, Morris served as software programmer for Invensys, a developer of process automation and resource tracking software.
    </p>
</div>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/dobrien.jpg" alt="" /></div>
    <h2>Dave O'Brien</h2>
    <h3><i>Vice President of Sales</i></h3>
    
    <p>
    Dave O'Brien has over 20 years of sales experience in the computer industry. Prior to joining TopCoder Software, he spent 11 years at Tallán, Inc. holding the positions of Senior Account Executive and Sales Director. O'Brien holds an MBA with a concentration in Computer Science from the University of New Haven and a Bachelor of Science in Business Administration from Quinnipiac University. 
    </p>
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/mlydon.jpg" alt="" /></div>
    <h2>Mike Lydon</h2>
    <h3><i>Chief Technology Officer</i></h3>
    
    <p>
    Mike Lydon joined TopCoder in April of 2001 as the Chief Technology Officer. Lydon brought to TopCoder his 10 years of experience designing and managing large-scale distributed web-based and data-warehousing systems. Prior to joining TopCoder, Lydon worked as Vice President of Technology Services at Tallán, Inc. a custom software development and consulting company. Lydon holds a business degree from the University of Connecticut where his focus was on Information Systems. 
    </p>
</div>

<div class="bioEven">
    <div class="photo"><img src="/i/about/management/gtsipolitis.jpg" alt="" /></div>
    <h2>George Tsipolitis</h2>
    <h3><i>Senior Vice President</i></h3>
    
    <p>
    George Tsipolitis manages TopCoder's Software Development, Events, and Employment Services divisions which use competition to build software applications for companies and to match the brightest software engineers in the world with companies looking to market to and attract top talent. 
    </p>
    <p>
    Tsipolitis joined TopCoder in September 2001 as Vice President of Development. As VP of Development, he architected and managed the development of TopCoder's patented algorithm competition software. He also managed the distributed process of software development projects through the use of the TopCoder member base. 
    </p>
    <p>
    Prior to joining TopCoder, Tsipolitis was Senior Project Manager with Tallán, Inc., an Internet professional services firm that creates technically advanced Internet and e-Business solutions for clients. 
    </p>
    <p>
    Tsipolitis holds a business degree from the University of Connecticut where his focus was on Information Systems.
    </p>

</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/jmckeown.jpg" alt="" /></div>
    <h2>Jim McKeown</h2>
    <h3><i>Director of Communications</i></h3>
    
    <p>
    Jim McKeown brings ten years of experience in the field of strategic communications and public relations to TopCoder. McKeown has gained top tier placement for clients in leading media outlets such as The Wall Street Journal, BusinessWeek, NewsWeek, Fortune, The New York Times, The Boston Globe, CNN International and CNBC, among others. Prior to joining TopCoder, McKeown held account positions with Boston high technology public relations firms Schwartz Communications and Copithorne & Bellows. 
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
    <div class="photo"><img src="/i/about/management/thorgan.jpg" alt="" /></div>
    <h2>Tanya Horgan, CPA</h2>
    <h3><i>Vice President, Finance</i></h3>
    
    <p>
    Tanya Horgan joined TopCoder in February 2001.  Before coming to TopCoder, Tanya spent six years at PricewaterhouseCoopers, LLP (PwC).  As a manager in PwC's Technology Practice, Horgan provided business advisory services, including audit and transaction services support, to several technology companies throughout Connecticut.  She served as an advisor to her clients involved in initial public offerings and several mergers and acquisitions.  Horgan obtained a Bachelor of Science degree in Accounting from Boston College.
    </p>
</div>

<div class="bioOdd">
    <div class="photo"><img src="/i/about/management/tjefts.jpg" alt="" /></div>
    <h2>Tony Jefts</h2>
    <h3><i>Director of Software Operations</i></h3>
    
    <p>
    Jefts has a decade of experience in delivering cutting edge technical enterprise solutions to high profile corporations. He leads TopCoder's unique initiatives by seeking and establishing operational solutions and processes to support the growth of the TopCoder model. Focused on excellence and capitalizing on untapped efficiencies, Jefts leads the talented group of Project Managers who deliver high quality software for TopCoder clients. Before joining TopCoder, Jefts worked at Tallán, Inc. where he held the titles of Developer, Senior Consultant and Project Manager. He earned a B. S. in Computer Science from Binghamton University.
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
