<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="onsiteevents"/>
                    <jsp:param name="tabLev3" value="blogs"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <h1><span>Algorithm Semifinal Room #2 - 06.27.07 9:00 PM EDT</span></h1>
                    
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>

                        <img src="/i/m/Petr_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                    
                        <p>3:49 - the competitors have already been given some time to prepare their computers for the battle. We're at ten minutes before the start.</p>
                        <p>3:53 - the competitors are being called up for the pre-contest lineup announcement.</p>
                        <p>3:55 - <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="8357090" context="algorithm"/> are the odds-on favorites, but I expect the others to give them a fight.
                        
                        <p>3:57 - no announcement yet. Will it run in time?
                          
                        <p>3:58 - the announcement has been canceled, the competitors proceeded to the stage. The round starts soon.
                            
                        <p>4:00 - GO, GO, GO!
                              
                        <p>4:02 - the easy is a geometrical problem, and those are never too easy. Although this one is pretty straightforward. Let's hope precision will not be an issue today.
                                
                        <p>4:05 - the medium is a probability problem. Once you get acquainted with the statement it should not be too complicated to code, as the idea is pretty straightforward.
                                  
                        <p>4:07 - 243.26 for <tc-webtag:handle coderId="144400" context="algorithm"/> on the easy. I expect him to blaze through the medium as well. The hard may become a decider in this round.
                                    
                        <p>4:16 - <tc-webtag:handle coderId="311170" context="algorithm"/> starts the pursuit. Meanwhile, the discussion on the hard has led to the following outcome: it should finally be reducible to bipartite matching (i.e., for some k the k first elements should have the same match quality, and the next should have a greater match quality - that gives us the graph for the matching. That way we check if some prefix of the solution can be completed. I understand this is not even a solution sketch, but still :))
                                      
                        <p>4:19 - <tc-webtag:handle coderId="8472826" context="algorithm"/>, <tc-webtag:handle coderId="15117368" context="algorithm"/> and <tc-webtag:handle coderId="7390224" context="algorithm"/> are in the race.
                                        
                        <p>4:21 - more on the hard: practically, we need to iterate over all possibilities to split candidate into three parts: those elements that stay in place, those that get replaced but keep the same match quality, and the remaining ones. Having fixed such a split, we get a bipartite matching problem when checking if such a split is possible. Having written the possibility function, we get the answer by calling it for the increasing answer prefixes. These two steps can probably be bundled together to increase the speed, too. Generally, this problem will require a lot of accuracy but still seems to be doable during the round.
                                          
                        <p>4:24 - <tc-webtag:handle coderId="19721111" context="algorithm"/> submits the medium and takes the lead.
                                            
                        <p>4:25 - <tc-webtag:handle coderId="7442498" context="algorithm"/> has submitted the easy, too.
                                              
                        <p>4:28 - <tc-webtag:handle coderId="21822659" context="algorithm"/> and <tc-webtag:handle coderId="22653739" context="algorithm"/> have submitted the easy.
                                                
                        <p>4:29 - <tc-webtag:handle coderId="7485898" context="algorithm"/> suggests that the medium seems to include some nasty difficulties when some following player has equal probabilities of winning regardless of her decision. Or will this never happen?
                                                  
                        <p>4:31 - <tc-webtag:handle coderId="144400" context="algorithm"/> regains the lead by submitting the medium.
                                                    
                        <p>4:33 - <tc-webtag:handle coderId="8357090" context="algorithm"/> and <tc-webtag:handle coderId="7546003" context="algorithm"/> are also in with the easy. I'm quite surprised there's still that few submissions.
                                                      
                        <p>4:40 - <tc-webtag:handle coderId="303644" context="algorithm"/> helped to resolve the aforementioned difficulty by pointing out the important constraint: "The probabilities of a contestant winning if they decide to stop or spin again will differ by at least 1e-6, unless both probabilities are zero." So this is not an issue here.
                                                        
                        <p>4:46 - <tc-webtag:handle coderId="311170" context="algorithm"/> has submitted the hard, but his solution seems not to take care of the case when some match qualities are equal. The examples don't test anything, so the solution can easily be wrong.
                                                          
                        <p>4:47 - <tc-webtag:handle coderId="7479769" context="algorithm"/> has submitted the easy. No resubmits as of yet.
                                                            
                        <p>4:50 - I stand corrected by <tc-webtag:handle coderId="22627975" context="algorithm"/>, <tc-webtag:handle coderId="8472826" context="algorithm"/> has resubmitted his 250. Meanwhile, <tc-webtag:handle coderId="7442498" context="algorithm"/> and <tc-webtag:handle coderId="14886245" context="algorithm"/> have submitted the medium. <tc-webtag:handle coderId="14886245" context="algorithm"/> is still struggling with the easy, though.
                                                              
                        <p>4:51 - <tc-webtag:handle coderId="22628392" context="algorithm"/> with another hard, <tc-webtag:handle coderId="7390224" context="algorithm"/> with the medium.
                                                                
                        <p>4:52 - either we don't understand something fundamental, or <tc-webtag:handle coderId="22628392" context="algorithm"/>'s solution is wrong as well.
                                                                  
                        <p>4:53 - <tc-webtag:handle coderId="8357090" context="algorithm"/> and <tc-webtag:handle coderId="15117368" context="algorithm"/> with the medium. <tc-webtag:handle coderId="8357090" context="algorithm"/> now has the highest score on it.
                                                                    
                        <p>4:54 - by "we" I mean <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="11829284" context="algorithm"/>, <tc-webtag:handle coderId="15881985" context="algorithm"/>, <tc-webtag:handle coderId="7485898" context="algorithm"/>, <tc-webtag:handle coderId="9927526" context="algorithm"/>. This commentary team was at some point supported by <tc-webtag:handle coderId="251074" context="algorithm"/> and <tc-webtag:handle coderId="272072" context="algorithm"/>, too.
                                                                      
                        <p>4:55 - This contest seems to be balanced much better than the previous one. I like that.
                                                                        
                        <p>4:56 - Although, as <tc-webtag:handle coderId="9927526" context="algorithm"/> pointed out, if the hard proves to be too difficult, the challenges will get too much weight.
                                                                          
                        <p>4:58 - <tc-webtag:handle coderId="22653739" context="algorithm"/> and <tc-webtag:handle coderId="21822659" context="algorithm"/> go with the medium. The contestants are starting to gather around the hard :)
                                                                            
                        <p>4:59 - I believe <tc-webtag:handle coderId="144400" context="algorithm"/> to be the main favorite today regardless of (possibly) upcoming hard submissions.
                                                                              
                        <p>5:00 - and <tc-webtag:handle coderId="11829284" context="algorithm"/> reports that <tc-webtag:handle coderId="144400" context="algorithm"/> is on the right track in the hard, he already has a bipartite matching function header.
                                                                                
                        <p>5:03 - a submission on the medium by <tc-webtag:handle coderId="7340263" context="algorithm"/>. <tc-webtag:handle coderId="22628392" context="algorithm"/> has resubmitted his hard, although seemingly with no effect - still wrong.
                                                                                  
                        <p>5:04 - <tc-webtag:handle coderId="8357090" context="algorithm"/>, <tc-webtag:handle coderId="19721111" context="algorithm"/> and <tc-webtag:handle coderId="7442498" context="algorithm"/> come unexpected with ridiculously fast hard submissions. Let's see what they have.
                                                                                    
                        <p>5:06 - all the five submissions on the hard look alike. We are probably missing something and the problem is really easier than it seems.
                                                                                      
                        <p>5:07 - or they all are missing something.
                                                                                        
                        <p>5:09 - at least <tc-webtag:handle coderId="8357090" context="algorithm"/>'s seems to be wrong for sure. Probably we can try to construct a testcase to fail it?
                                                                                          
                        <p>5:12 - these submissions constitute a great ground for an interesting challenge phase.
                                                                                            
                        <p>5:13 - the Arena discussion has come to the conclusion that <tc-webtag:handle coderId="144400" context="algorithm"/> has missed an 'r' in the easy problem, whatever it means.
                                                                                              
                        <p>5:15 - and that probably puts him on the border of elimination as well. However, he still has a chance to finish his 1000 to become (probably) the only one to solve it correctly.
                                                                                                
                        <p>5:16 - another lightning-fast seemingly-wrong submission on the hard by <tc-webtag:handle coderId="7546003" context="algorithm"/>.
                                                                                                  
                        <p>5:18 - the easy problem sample tests only features +-1 circle radii. The contest seems to be very miserly with the testcases, which is quite strange for an onsite.
                                                                                                    
                        <p>5:20 - <tc-webtag:handle coderId="144400" context="algorithm"/> submits the hard. Now that's a proper solution, 3 pages of code.
                                                                                                      
                        <p>5:21 - <tc-webtag:handle coderId="22653739" context="algorithm"/>'s submission on the hard is somewhat in between <tc-webtag:handle coderId="8357090" context="algorithm"/>'s shortness and <tc-webtag:handle coderId="144400" context="algorithm"/>'s rightness. I still believe it will be either nobody, or only <tc-webtag:handle coderId="144400" context="algorithm"/>.
                                                                                                        
                        <p>5:24 - however, the 500 is the problem that gets the last submission. <tc-webtag:handle coderId="311170" context="algorithm"/>, having started with the 1000, finally managed to complete all three.
                                                                                                          
                        <p>5:25 - <tc-webtag:handle coderId="22628392" context="algorithm"/> takes the last submit prize from <tc-webtag:handle coderId="311170" context="algorithm"/> with his 250.
                                                                                                            
                        <p>5:26 - the challenge phase starts in 3 minutes.
                                                                                                              
                        
                        <p>5:27 - will somebody go blind?
                                                                                                                
                        <p>5:29 - some resubmits on 250 went unnoticed. Probably it will turn out not to be so easy?
                                                                                                                  
                        <p>5:30 - <tc-webtag:handle coderId="22628392" context="algorithm"/>'s 250 is the first to fail, too. <tc-webtag:handle coderId="7340263" context="algorithm"/> the challenger returns :)
                                                                                                                    
                        <p>5:31 - <tc-webtag:handle coderId="7546003" context="algorithm"/>'s hard is down, a couple of unsuccessful challenges go in as well.
                                                                                                                      
                        <p>5:32 - <tc-webtag:handle coderId="19721111" context="algorithm"/> and <tc-webtag:handle coderId="8357090" context="algorithm"/> forfeit their hards. It seems we were right.
                                                                                                                        
                        <p>5:33 - <tc-webtag:handle coderId="7442498" context="algorithm"/> and <tc-webtag:handle coderId="22628392" context="algorithm"/> lose their hards as well. <tc-webtag:handle coderId="14886245" context="algorithm"/> seems to be the most active challenger.
                                                                                                                          
                        <p>5:34 - <tc-webtag:handle coderId="8472826" context="algorithm"/> adds <tc-webtag:handle coderId="22653739" context="algorithm"/> and <tc-webtag:handle coderId="311170" context="algorithm"/>, while <tc-webtag:handle coderId="7442498" context="algorithm"/> challenges <tc-webtag:handle coderId="22653739" context="algorithm"/>'s 250.
                                                                                                                            
                        <p>5:35 - <tc-webtag:handle coderId="144400" context="algorithm"/>'s hard has survived one challenge.
                                                                                                                              
                        <p>5:35 - the scoreboard is still very tight.
                                                                                                                                
                        <p>5:37 - the main remaining question is whether <tc-webtag:handle coderId="144400" context="algorithm"/>'s hard will stand. If not, he will probably even miss the wildcard.
                                                                                                                                  
                        <p>5:38 - there were still no challenges on the medium problem - probably a lot of those will fail, too?
                                                                                                                                    
                        <p>5:40 - a wise last-second challenge by <tc-webtag:handle coderId="14886245" context="algorithm"/>, as -25 didn't hurt him at all. It was unsuccessful, unfortunately. The exciting challenge phase is over, let's wait for the systests.
                                                                                                                                      
                        <p>5:43 - it is actually quite surprising that many top competitors submitted wrong solutions on the hard. Probably it's the tension.
                                                                                                                                        
                        <p>5:45 - the systest results are ready.
                                                                                                                                          
                        <p>5:45 - <tc-webtag:handle coderId="7479769" context="algorithm"/> and <tc-webtag:handle coderId="8472826" context="algorithm"/> pass, <tc-webtag:handle coderId="7340263" context="algorithm"/> fails.
                                                                                                                                            
                        <p>5:46 - a lot of solutions fail, I can't type that fast.
                                                                                                                                              
                        <p>5:46 - <tc-webtag:handle coderId="21822659" context="algorithm"/> and <tc-webtag:handle coderId="14886245" context="algorithm"/> in the finals.
                                                                                                                                                
                        <p>5:47 - <tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="7390224" context="algorithm"/>, <tc-webtag:handle coderId="311170" context="algorithm"/> and <tc-webtag:handle coderId="7442498" context="algorithm"/> in the wildcard.
                                                                                                                                                  
                        <p>5:48 - <tc-webtag:handle coderId="21822659" context="algorithm"/> has the easy and the medium, <tc-webtag:handle coderId="14886245" context="algorithm"/>, <tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="7390224" context="algorithm"/> and <tc-webtag:handle coderId="311170" context="algorithm"/> have only the medium, <tc-webtag:handle coderId="7442498" context="algorithm"/>, <tc-webtag:handle coderId="8472826" context="algorithm"/>, <tc-webtag:handle coderId="15117368" context="algorithm"/>, <tc-webtag:handle coderId="7546003" context="algorithm"/>, <tc-webtag:handle coderId="8357090" context="algorithm"/> and <tc-webtag:handle coderId="7479769" context="algorithm"/> have only the easy.
                                                                                                                                                    
                        <p>5:49 - now that was unexpected. I will probably try to shed some light on why so many solutions failed later today.

                        <br /><br />
                        
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>