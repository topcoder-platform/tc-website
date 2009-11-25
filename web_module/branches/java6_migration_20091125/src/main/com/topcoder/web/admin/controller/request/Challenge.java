package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.XSLConstants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.common.web.data.Room;
import com.topcoder.common.web.data.Problem;
import com.topcoder.common.web.data.Round;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.ejb.ContestAdminServices.ContestAdminServices;

import javax.naming.InitialContext;
import java.util.ArrayList;
import java.io.PrintWriter;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 22, 2005
 */
public class Challenge extends BaseProcessor {

    private static final String DIR = XSLConstants.DIR + "challenge/";
    private static final String CHALLENGE_MENU_PAGE = DIR + "challengemenu.xsl";
    private static final String ROOM_MENU_PAGE = DIR + "roommenu.xsl";
    private static final String PROBLEM_MENU_PAGE = DIR + "challengeproblemmenu.xsl";
    private static final String ROUND_MENU_PAGE = DIR + "challengeroundmenu.xsl";
    private static final String CODER_MENU_PAGE = DIR + "challengecodermenu.xsl";
    private static Logger log = Logger.getLogger(Challenge.class);


    public void businessProcessing() throws Exception {
        HTMLRenderer renderer = new HTMLRenderer();
        XMLDocument doc = new XMLDocument("TC");

        String ret = process(getRequest(), renderer, doc);
        PrintWriter out = getResponse().getWriter();
        getResponse().setContentType("text/html");
        out.print(ret);
        out.flush();

    }



    public static String process(TCRequest request, HTMLRenderer renderer, XMLDocument document)
            throws NavigationException {

        log.info("Servlet Challenge: process called .");
        String result = null;
        RecordTag contestTag = new RecordTag("CHALLENGE");

        try {
            String command = Conversion.checkNull(request.getParameter("Command"));
            document.addTag(new ValueTag("Command", command));
            if (command.equals("getRoundMenu")) {
                result = getRoundMenuScreen(renderer, document, contestTag);

            } else if (command.equals("getProblemList")) {
                result = getProblemMenuScreen(renderer, request, document, contestTag);

            } else if (command.equals("getCoderList")) {
                result = getCoderMenuScreen(renderer, request, document, contestTag);

            } else if (command.equals("getProblemChallengeList")) {
                result = getProblemChallengeList(renderer, request, document, contestTag);

            } else if (command.equals("getCoderChallengeList")) {
                result = getCoderChallengeList(renderer, request, document, contestTag);

            } else if (command.equals("getChallengeList")) {
                result = getChallengeList(renderer, request, document, contestTag);

            } else if (command.equals("getRoomList")) {
                result = getRoomList(renderer, request, document, contestTag);

            } else if (command.equals("removeChallenge")) {
                removeChallenge(request);
                result = getChallengeList(renderer, request, document, contestTag);
            } else if (command.equals("overturnChallenge")) {

                overturnChallenge(request);
                result = getChallengeList(renderer, request, document, contestTag);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);

        }
        return result;
    }

    private static String getRoomList(HTMLRenderer HTMLmaker, TCRequest request,
                                      XMLDocument document, RecordTag contestTag)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList roomList = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                int roundId = Integer.parseInt(request.getParameter("roundid"));
                roomList = contestEJB.getRoomList(roundId);
            } catch (Exception e) {
                log.error("Challenge: getRoomList error retrieving room list .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
                ctx = null;
            }

            for (int i = 0; i < roomList.size(); i++) {
                contestTag.addTag(((Room) roomList.get(i)).getXML());
            }

            document.addTag(contestTag);
            //log.debug(document.getXML(2));
            String xsldocURLString = ROOM_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);

        }
        return result;
    }

    private static String getCoderChallengeList(HTMLRenderer HTMLmaker, TCRequest request,
                                                XMLDocument document, RecordTag contestTag)
            throws NavigationException {
        log.info("Servlet: Challenge: getCoderChallengeList called ");
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList challengeList = null;
        int roundId = 0;
        int filter = 0;
        int coderId = 0;
        int constraintId = 3;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);

                try {
                    constraintId = Integer.parseInt(request.getParameter("constraintid"));
                } catch (Exception ignore) {
                }

                try {
                    roundId = Integer.parseInt(request.getParameter("roundid"));
                } catch (Exception ignore) {
                }
                try {
                    filter = Integer.parseInt(request.getParameter("filter"));
                } catch (Exception ignore) {
                }
                try {
                    coderId = Integer.parseInt(request.getParameter("coderid"));
                } catch (Exception ignore) {
                }

                contestTag.addTag(new ValueTag("RoundId", roundId));


                log.debug("Challenge: getCoderChallengeList: constraintid set to " + constraintId);
                log.debug("Challenge: getCoderChallengeList: filter set to " + filter);
                log.debug("Challenge: getCoderChallengeList: roundId set to " + roundId);
                log.debug("Challenge: getCoderChallengeList: coderId set to " + coderId);
                challengeList = contestEJB.getChallengeList(roundId, coderId, filter, constraintId);
            } catch (Exception e) {
                log.error("Challenge: getCoderChallengeList error retrieving challenge list .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            for (int i = 0; i < challengeList.size(); i++) {
                contestTag.addTag(((com.topcoder.common.web.data.Challenge) challengeList.get(i)).getXML());
            }
            document.addTag(contestTag);
            document.addTag(new ValueTag("CONSTRAINTID", constraintId));
            //log.debug(document.getXML(2));
            log.debug("This is the code that is running");
            String xsldocURLString = CHALLENGE_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            e.printStackTrace(); //TONY
            throw new NavigationException(e);

        }
        return result;
    }


    private static String getProblemChallengeList(HTMLRenderer HTMLmaker, TCRequest request,
                                                  XMLDocument document, RecordTag contestTag)
            throws NavigationException {
        log.info("Servlet: Challenge: getProblemChallengeList called ");
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList challengeList = null;
        int roundId = 0;
        int filter = 0;
        int problemId = 0;
        int constraintId = 2;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);

                try {
                    constraintId = Integer.parseInt(request.getParameter("constraintid"));
                } catch (Exception ignore) {
                }

                try {
                    roundId = Integer.parseInt(request.getParameter("roundid"));
                } catch (Exception ignore) {
                }
                try {
                    filter = Integer.parseInt(request.getParameter("filter"));
                } catch (Exception ignore) {
                }
                try {
                    problemId = Integer.parseInt(request.getParameter("problemid"));
                } catch (Exception ignore) {
                }

                contestTag.addTag(new ValueTag("RoundId", roundId));
                contestTag.addTag(new ValueTag("ProblemId", problemId));
                log.debug("Challenge: getProblemChallengeList: constraintid set to " + constraintId);
                log.debug("Challenge: getProblemChallengeList: filter set to " + filter);
                log.debug("Challenge: getProblemChallengeList: roundId set to " + roundId);
                log.debug("Challenge: getProblemChallengeList: problemId set to " + problemId);
                challengeList = contestEJB.getChallengeList(roundId, problemId, filter, constraintId);
            } catch (Exception e) {
                log.error("Challenge: getProblemChallengeList error retrieving challenge list .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            for (int i = 0; i < challengeList.size(); i++) {
                contestTag.addTag(((com.topcoder.common.web.data.Challenge) challengeList.get(i)).getXML());
            }

            document.addTag(contestTag);
            document.addTag(new ValueTag("CONSTRAINTID", constraintId));
            //log.debug(document.getXML(2));
            String xsldocURLString = CHALLENGE_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            e.printStackTrace(); //TONY
            throw new NavigationException(e);

        }
        return result;
    }


    private static String getChallengeList(HTMLRenderer HTMLmaker, TCRequest request,
                                           XMLDocument document, RecordTag contestTag)
            throws NavigationException {
        log.info("Servlet: Challenge: getChallengeList called ");
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList challengeList = null;
        int roundId = 0;
        int filter = 0;
        int roomId = 0;
        int constraintId = 1;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);

                try {
                    constraintId = Integer.parseInt(request.getParameter("constraintid"));
                } catch (Exception ignore) {
                }

                try {
                    roundId = Integer.parseInt(request.getParameter("roundid"));
                } catch (Exception ignore) {
                }

                try {
                    filter = Integer.parseInt(request.getParameter("filter"));
                } catch (Exception ignore) {
                }

                try {
                    roomId = Integer.parseInt(request.getParameter("roomid"));
                } catch (Exception ignore) {
                }
                contestTag.addTag(new ValueTag("RoundId", roundId));
                contestTag.addTag(new ValueTag("RoomId", roomId));


                log.debug("Challenge: getChallengeList: constraintid set to " + constraintId);
                log.debug("Challenge: getChallengeList: filter set to " + filter);
                log.debug("Challenge: getChallengeList: roundId set to " + roundId);
                log.debug("Challenge: getChallengeList: roomId set to " + roomId);
                challengeList = contestEJB.getChallengeList(roundId, roomId, filter, constraintId);
            } catch (Exception e) {
                log.error("Challenge: getChallengeList error retrieving challenge list .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            for (int i = 0; i < challengeList.size(); i++) {
                contestTag.addTag(((com.topcoder.common.web.data.Challenge) challengeList.get(i)).getXML());
            }

            document.addTag(contestTag);
            document.addTag(new ValueTag("CONSTRAINTID", constraintId));
            //log.debug(document.getXML(2));
            String xsldocURLString = CHALLENGE_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            e.printStackTrace(); //TONY
            throw new NavigationException(e);

        }
        return result;
    }


    private static void removeChallenge(TCRequest request)
            throws NavigationException {
        ContestAdminServices contestEJB = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                int challengeId = Integer.parseInt(request.getParameter("remove"));
                contestEJB.nullifyChallenge(challengeId);
            } catch (Exception e) {
                log.error("Challenge: removeChallenge error removing challenge .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

        } catch (Exception e) {
            throw new NavigationException(e);

        }
    }

    private static void overturnChallenge(TCRequest request)
            throws NavigationException {
        ContestAdminServices contestEJB = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
            try {
                int challengeId = Integer.parseInt(request.getParameter("overturn"));
                contestEJB.overturnChallenge(challengeId);
            } catch (Exception e) {
                log.error("Challenge: overturnChallenge error overturning challenge .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

        } catch (Exception e) {
            throw new NavigationException(e);

        }
    }

    private static String getProblemMenuScreen(HTMLRenderer HTMLmaker, TCRequest request,
                                               XMLDocument document, RecordTag contestTag) throws NavigationException {
        log.info("Servlet Challenge: getProblemMenuScreen called  ");
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList problemList = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                int roundId = 0;
                try {
                    roundId = Integer.parseInt(request.getParameter("roundid"));
                    log.debug("roundId set to " + roundId + " from request");
                } catch (Exception exception1) {
                    log.error("Servlet Challenge: getProblemMenu: error getting roundid request parameter ");
                    log.error("EXCEPTION: " + exception1);
                }
                log.debug("Challenge: getChallengeList: roundId set to " + roundId);
                problemList = contestEJB.getProblemList(roundId);
                log.debug("problemList.size(): " + problemList.size());
            } catch (Exception e) {
                log.error("Servlet Challenge: getProblemMenuScreen error retrieving probelm list .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            try {
                for (int i = 0; i < problemList.size(); i++) {
                    contestTag.addTag(((Problem) problemList.get(i)).getXML());
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }


            try {
                document.addTag(contestTag);
                log.debug(document.getXML(2));
                String xsldocURLString = PROBLEM_MENU_PAGE;
                result = HTMLmaker.render(document, xsldocURLString);
            } catch (Exception ei) {
                ei.printStackTrace();
            }
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);

        }
        return result;
    }


    private static String getCoderMenuScreen(HTMLRenderer HTMLmaker, TCRequest request,
                                             XMLDocument document, RecordTag contestTag) throws NavigationException {
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList coderList = null;
        int roundId = 0;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                try {
                    roundId = Integer.parseInt(request.getParameter("roundid"));
                } catch (Exception ignore) {
                }
                coderList = contestEJB.getCoderList(roundId);
            } catch (Exception e) {
                log.error("Challenge: getCoderMenuScreen error retrieving coder list .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            try {
                for (int i = 0; i < coderList.size(); i++) {
                    contestTag.addTag(((com.topcoder.common.web.data.SystemTestCaseReport) coderList.get(i)).getXML());
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }


            try {
                document.addTag(contestTag);
                //log.debug(document.getXML(2));
                String xsldocURLString = CODER_MENU_PAGE;
                result = HTMLmaker.render(document, xsldocURLString);
            } catch (Exception ei) {
                ei.printStackTrace();
            }
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);

        }
        return result;
    }

    private static String getRoundMenuScreen(HTMLRenderer HTMLmaker, XMLDocument document, RecordTag contestTag) throws NavigationException {
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList roundList = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                roundList = contestEJB.getRoundList();
            } catch (Exception e) {
                log.error("Challenge: getRoundMenuScreen error retrieving contest list .");
                e.printStackTrace();
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            try {
                for (int i = 0; i < roundList.size(); i++) {
                    contestTag.addTag(((Round) roundList.get(i)).getXML());
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            try {
                document.addTag(contestTag);
                //log.debug(document.getXML(2));
                String xsldocURLString = ROUND_MENU_PAGE;
                result = HTMLmaker.render(document, xsldocURLString);
            } catch (Exception ei) {
                ei.printStackTrace();
            }
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);

        }
        return result;
    }






}
