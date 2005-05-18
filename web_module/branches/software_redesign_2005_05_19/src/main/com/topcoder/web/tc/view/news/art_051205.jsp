<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
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
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
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
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                        <div align="center">
                        <p><span class="bodyTitle">Interview with Jack Hughes</span><br />
                        </p>
                        </div>
                        
                        <p><strong>GLASTONBURY, CT, April 22, 2005&#151;</strong>The following is an interview The Wall Street Transcript had with Jack Hughes.
<br><br>
<strong>TWST:</strong> Can we start with a little history and an overview of TopCoder?
<br><br>
<strong>Mr. Hughes:</strong> TopCoder was started in April of 2002. It was about a year after we sold the previous company, Tallan, where some of the concepts for TopCoder came from. The idea at the time was to aggregate some of the top developers around the world. We decided to use what we consider to be a truly unique approach to that in making competition the core of the business. So, we started with a set of widely recognized competitions, tournaments. We attracted some of the larger technology companies to be sponsors of those competitions. To date, we have aggregated about 53,000 members, which we use for everything, from developing software to placement services, both contract and permanent.
<br><br>
<strong>TWST:</strong> Now, you've got the competition set up. What's the product?
<br><br>
<strong>Mr. Hughes:</strong> We provide software development services for clients, typically Fortune 1000 companies, people like ABB, Praxair, Philip Morris, ING, Pfizer, Wyeth, a number of different large companies. What we do is, we go in with TopCoder employees, TopCoder project management and take an application, break it down into component pieces. We put those pieces out on the Web to our member base. Our member base comes in and competes to develop each of those pieces. We then take those pieces and integrate them into a product which is delivered to our corporate client.
<br><br>
<strong>TWST:</strong> So, it's got, like, open source software?
<br><br>
<strong>Mr. Hughes:</strong> One of the terms we like to use is -- open source means capitalism, if you will. The idea being that it's not free software in terms of -- I don't know how familiar you are with the terms in open source.
<br><br>
<strong>TWST:</strong> But, open source from a development perspective?
<br><br>
<strong>Mr. Hughes:</strong> Yes, it's very collaborative. Probably the most unique aspect to it is that it's competitive. All the software that we develop is on a competitive format. So, we may have anywhere from 2 to 50 people working on the exact same piece of software. We will then take the best, what we call submission, the best submission for that piece of software, and we will reward whoever wrote that with a payment in terms of a price for coming in the first place. We actually pay the second place person as well. And then those are the pieces of software that we use to build the applications for our end client.
<br><br>
<strong>TWST:</strong> You pay the first and the second. How about the rest of the people who collaborated on it? They don't get anything?
<br><br>
<strong>Mr. Hughes:</strong> They didn't collaborate. They competed on it. So, it's a very strict competition in the sense that everything is done in a very rigorous fashion, so that everyone is getting the same exact requirements. They are building to those requirements. Then we are reviewing and scoring those submissions, and the winner gets paid.
<br><br>
<strong>TWST:</strong> Typically, does the winner, so to speak, do the whole project or just a piece of it?
<br><br>
<strong>Mr. Hughes:</strong> No, they are just doing pieces of it. The way our process works is, we go into a client, we bring a project manager, who is a TopCoder employee, into the client. The project manager scopes out whatever project that the client is thinking of building. We break that down -and the project manager builds a set of requirements. We take those set of requirements, we give them to, what we call, a component architect, also a TopCoder employee. The component architect breaks that specification down into pieces. Those pieces are then posted to our Web site where our members can come in and look at each piece and decide whether or not they want to compete in that component competition. Once they have decided they want to compete on it, they submit a solution, whether it be a design or a development solution. They submit a solution that goes through a proprietary scoring process of ours, and then a winner is identified for that piece of it. That piece of it is brought and put into our catalog, and then used in the integration of that application along with the other pieces. So, there may be anywhere from 20 to well over 200 components in any particular application.
<br><br>
<strong>TWST:</strong> Who is the customer?
<br><br>
<strong>Mr. Hughes:</strong> Our client base is made up of primarily Fortune 1000 companies. The customer within those client, like I mentioned ABB, Praxair, and those types of folks, can be anywhere -  from someone on the business side that's looking to have a specific application built for a specific purpose, maybe they are building a Web site that's going to have some customer-facing capability to it, so customers can come in and order product or attract product, to the customer on the IT side who is looking for foundational applications. Foundational in our parlance means things like security applications, data transfer applications, data warehousing and analysis applications, those types of applications.
<br><br>
<strong>TWST:</strong> What gives you an advantage vis-à-vis somebody who just comes in and bids on the same project at the company?
<br><br>
<strong>Mr. Hughes:</strong> There are really three main advantages to our model. One is the member base itself. We're talking about a member base that's a good amount over 53,000 members at this point, about 10,000 of whom are active. So, it gives us a very large distributed resource base, that's a globally distributed resource base. We have members from almost every country in the world, over 190 countries, the primary ones being US, India, China, Canada, as well as many Eastern European nations. So, customers have access to a global resource base. Then the second unique advantage of our business is that it is a competitive model where we control a process by which everything is done in a very rigorous format, so that all of the deliverables really are done upfront as opposed to after a project. So, in order for us to keep the project competitive, we have to do all of the design upfront, all of the documentation upfront, all of the review deliverables are upfront whereas you wouldn't get that in a normal process from a competitor. And then the third element is that we have a dedicated -- at least for the US, a dedicated domestic base -- project management resource base that's full-time TopCoder employees that keep the contact level with our clients, so that we have dedicated project managers per client, meaning there is a very smooth requirement gathering one phase to the client and a very smooth transition to this Web-based type of approach, where if you looked at other Web-based approaches, there is typically the client either going directly to the Web or there is some aggregation function, but there is no consistency as to how that's delivered to the Web in terms of what the project entails.
<br><br>
<strong>TWST:</strong> So, that's what you tie together?
<br><br>
<strong>Mr. Hughes:</strong> Exactly.
<br><br>
<strong>TWST:</strong> And how do you control the quality?
<br><br>
<strong>Mr. Hughes:</strong> The quality is controlled through a proprietary process by which we lay out every time how we do a specification of our project,  - it's done the same way. So, there are metrics built in right from the beginning in terms of how we are going to make sure we have caught all of the aspects of what we call a functional requirement, so that we are not missing anything, if you will. So, we go from that step to what I termed before as component architecture, where that specification is broken down into a series of components, which all can be done in a consistent fashion and it can either be pulled out of our catalog of components, where we have used these previously, which gives us a fair amount of leverage to our process, and an absolute consistency between the deliverables. It's much like buying parts for a car, if you will, where all of the parts are modularized, known, documented and tagged in terms of where they came from and went through a quality control process. The next level of our process is actually the reviewing and scoring of each submission, so that three highly rated members of ours review each submission and score it with the same scorecard, so that we get a consistency in what they are looking at in each submission. Those scores are boiled down to an average score and that's how we determine the winner. But, in that process, they have looked at every element of the submission that can be looked at. At the next level of our process is a testing level where a component, which is what we call each one of these pieces, goes through stress tests, meaning that it's looked at for how much volume of data it can handle, does it break at a certain level of use (Audio-Gap) the results that it can come up with or the results that it actually comes up with. And that's what we call a Failure Tester, which is used to make sure that it will work in any number of environments, so that if we bring up a piece of software it doesn't break the system it's running on.
<br><br>
<strong>TWST:</strong> So, lot of checkpoints?
<br><br>
<strong>Mr. Hughes:</strong> A lot of checkpoints.
<br><br>
<strong>TWST:</strong> If we look out over the next two or three years, what are the goals that you have set for TopCoder?
<br><br>
<strong>Mr. Hughes:</strong> We refer to TopCoder as a leveraged services model. So, TopCoder very much looks like it has the scale of a product company with the delivery capability of a services company, and that was sort of the idea for the company at the outset, and that's what we are looking for going forward. So, we built a lot of infrastructures for these processes that I've just talked about. And going forward, we expect to be able to scale up the model very quickly relative to other types of service delivery models.
<br><br>
<strong>TWST:</strong> So, it doesn't sound like there is any sealing on what you can do.
<br><br>
<strong>Mr. Hughes:</strong> No. From the outset we did what I would term as some of the hard things first. We went after a global resource base. The reason for that was both cost as well as to be able to have a distributed workforce with a difficult national security environment, it makes it much easier for us to make sure that any client's work isn't in one place. It can be in any number of places and it gives us some flexibility there. It gives us the ability to avail ourselves of really what is a blended rate across the world in looking for the top quality.
<br><br>
<strong>TWST:</strong> What kind of growth are you capable of generating then?
<br><br>
<strong>Mr. Hughes:</strong> Today, we have been growing in the multiple hundreds of percents. We started from zero. So, that's pretty easy in the early years, but we are in our third year. We will grow about 300% this year. That's on a relatively significant revenue base, and I expect that -- I don't know that it will be at that rate, but I expect it to be in the triple digits for the foreseeable future, at least.
<br><br>
<strong>TWST:</strong> Do you have the management capacity to control that?
<br><br>
<strong>Mr. Hughes:</strong> The management for TopCoder came from what was really a traditional IT services company prior to TopCoder. That was also a company that I co-founded with some of my family members. That company grew very rapidly as well. It was sold in March of 2000. And we started this and we have a fair amount of the management that was at that company. It appears that we are very familiar with the space, very familiar with how to manage a high-growth company and similarly, particularly with the client base that we are trying to address.
<br><br>
<strong>TWST:</strong> How about from a financial point of view? Do you have the resources you need?
<br><br>
<strong>Mr. Hughes:</strong> Yes, we are a self-funded company. Again, the proceeds of the sale of the prior company is really what we're using to fund this company and have been able to do that on our own, and I would never say that we wouldn't look at outside investment or any of that, but we're fully capable of financing the growth of the company at the moment.
<br><br>
<strong>TWST:</strong> What's the risk here, what's can go wrong?
<br><br>
<strong>Mr. Hughes:</strong> The early risks were really the execution of the model. The model sounded great conceptually. There were real questions about, would we be able to attract the member base that we've been able to, would we be able to put in and maintain a process of the rigor that we were trying to. We really look at this very much like a manufacturing process, and we don't think that's been done in software previously. So, there were real questions of -- that sounds great in theory and there are plenty of books that have been written on it, but can you actually do it? So, those were the primary risks. Now, I think the risks are, can we manage the growth, can we do that without messing up a client or having a poor engagement. Those risks, I think, are always there. Those are the types of things that, if we were to get derailed that I think would derail us.
<br><br>
<strong>TWST:</strong> If you were talking to people about the company, what are the two or three reasons you'd give them to take a look at TopCoder at this juncture?
<br><br>
<strong>Mr. Hughes:</strong> The two or three reasons -- the primary reasons would be that, because it is a unique model, I don't know of any other competitive models that are out there for developing true enterprise class software. So, that would be reason one, and I think it's from a client's perspective. It puts a tremendous amount of control back in the client's hands where it takes it out of the vendor's hands. We're very happy to take that control-- and that's both from a pricing standpoint, as well as a quality standpoint. The client can really feel that they are truly getting a top-quality product for the best possible price out there. The second reason, I would say, is that because it is different and it includes a lot of the aspects of open source in terms of community base development, it's a very interesting and engaging experience. We have customer forums, developer forums. Customers and developers can talk any time they want about anything they want. This is all done in a private venue, so that other people can't see what they are talking about. So, they get to avail themselves of a resource that may have particular knowledge of their problem domain space even if that resource is in, say, China, and it would be prohibitively expensive or they probably couldn't find that person any other way. And then thirdly, it's also tremendously engaging on the competition side where we have large clients like Yahoo, Google, Microsoft, all who avail themselves of our ability to reach really what are some of the top developers in the world, both from a recruiting and marketing standpoint. That experience can be tremendously engaging and it's helpful to a customer who has got to avail themselves of those same resources.
<br><br>
<strong>TWST:</strong> Anything else we should touch on?
<br><br>
<strong>Mr. Hughes:</strong> I don't know. I looked at some of the interviews you did with some of the other folks. I have a packet here. I'm just trying to see if there is any question there that makes any sense here. But, I think that's it. Did I miss anything major? I didn't talk a lot about the recruiting and placement side of the business, both on a contract and permanent basis.
<br><br>
<strong>TWST:</strong> No, what's going on there?
<br><br>
<strong>Mr. Hughes:</strong> That's a significant source of revenue for us also. We call that side -- the side that I talked about in terms of the application side, we call that the software side, and that's the prime source of revenue. But, the placement and recruiting side is also significant. What that does is allow us to reach into the member base because all of these developers are rated and ranked, people know their relative level of skill in a variety of technologies. So, we have large companies that are doing heavy recruiting - everyone from, as I mentioned before, Google to Yahoo to Microsoft, all looking at this member base as a base of people to recruit from. We also provide those services for the corporate side of our clientele. So, if they are looking for somebody who has got tremendous capability to develop anything from financial trading systems to biotech search algorithms to -- we've even had people talk to us about nanotech (RFID?)and robotics. It really is a very high-level talent base. These people are all coming from schools like MIT, Stanford, Warsaw University, Caltech, Waterloo up in Canada. So, it gives a clientele a tremendous ability to reach in and find some of the best people, when you are looking at really tough problems that are very difficult to solve - we could do a complete separate interview about that. And just like I said, it's a significant amount of revenue. That's what that (?) and again, it's used on either a permanent placement basis or a contract basis when someone is not looking to have an application developed, but a particular knowledge in a problem domain space.
<br><br>
<strong>TWST:</strong> As you look out at the future of the company, will it remain a private company, or is this eventually going to become a public entity?
<br><br>
<strong>Mr. Hughes:</strong> I don't know. I said I would never sell the last company, and it got sold. So, I'm very reluctant to never say never about anything. I'd probably be perfectly happy than any listener is. What I would be concerned about is, how well are the people here going to be dealt with, whether it's in a public format or if it got sold, and I'm certainly concerned about that from a private standpoint, also very concerned about how we handle, relate to, and deal with our member base. To get a group of people -- a community like this together and hold it together, it takes a tremendous amount of integrity. You have to be honest, you have to be willing to admit mistakes. God knows we have made plenty of them. You have to be willing to correct things, when you are doing them wrong. So, I want to make sure in any of those scenarios, all of those things remain in place.
<br><br>
<strong>TWST:</strong> Thank you.
<br><br>
<strong>Mr. Hughes:</strong> Thank you.
                        </p>
                        <p>###</p>
                        <p><br /></p>
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
