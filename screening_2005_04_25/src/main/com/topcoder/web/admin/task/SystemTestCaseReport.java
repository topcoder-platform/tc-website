package com.topcoder.web.admin.task;

import com.topcoder.common.web.data.Authentication;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.data.Problem;
import com.topcoder.common.web.data.Round;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.ContestAdminServices.ContestAdminServices;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;


public final class SystemTestCaseReport {


    private static final String DIR = com.topcoder.web.admin.XSLConstants.DIR + "systemtestcasereport/";
    private static final String SYSTEMTESTCASEREPORT_MENU_PAGE = DIR + "systemtestcasereport_menu.xsl";
    private static final String PROBLEMLIST_MENU_PAGE = DIR + "systemtestcasereport_problemmenu.xsl";
    private static final String CODERLIST_MENU_PAGE = DIR + "systemtestcasereport_codermenu.xsl";
    private static final String ROUND_MENU_PAGE = DIR + "systemtestcasereport_roundmenu.xsl";
    private static Logger log = Logger.getLogger(SystemTestCaseReport.class);


    public static String process(HttpServletRequest request, HttpServletResponse response,
                                 HTMLRenderer renderer, Navigation nav, XMLDocument document)
            throws NavigationException {

        String result = null;
        RecordTag contestTag = new RecordTag("SYSTEMTESTCASEREPORT");
        HashMap sessionObjects = nav.getSessionObjects();

        Authentication login = null;
        if (!sessionObjects.containsKey("login")) {
            login = new Authentication();
            sessionObjects.put("login", login);
        } else {
            login = (Authentication) sessionObjects.get("login");
        }


        try {
            String command = Conversion.checkNull(request.getParameter("Command"));
            log.debug("SystemTestResult: Command: " + command);
            if (command.equals("getRoundMenu")) {
                result = getRoundMenuScreen(renderer, request, document, nav, contestTag, sessionObjects);
            } else if (command.equals("getProblemList")) {
                result = getProblemList(renderer, request, document, nav, contestTag, sessionObjects);
            } else if (command.equals("getSystemTestCaseReportList")) {
                result = getSystemTestCaseReportList(renderer, request, document, nav, contestTag, sessionObjects);
            } else if (command.equals("getCoderList")) {
                result = getCoderList(renderer, request, document, nav, contestTag, sessionObjects);
            } else if (command.equals("removeSystemTestCaseReport")) {
                removeSystemTestResult(renderer, request, document, nav, contestTag, sessionObjects);
                result = getSystemTestCaseReportList(renderer, request, document, nav, contestTag, sessionObjects);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);

        }
        return result;
    }

    private static String getSystemTestCaseReportList(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                                      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList systemTestCaseReportList = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                int roundId = 0;
                int problemId = 0;
                int coderId = 0;
                int filter = 0;
                try {
                    roundId = Integer.parseInt(request.getParameter("roundid"));
                } catch (Exception e) {
                }
                try {
                    problemId = Integer.parseInt(request.getParameter("problemid"));
                } catch (Exception e) {
                }
                try {
                    coderId = Integer.parseInt(request.getParameter("coderid"));
                } catch (Exception e) {
                }
                try {
                    filter = Integer.parseInt(request.getParameter("filter"));
                } catch (Exception e) {
                }

                if (filter == 0) {
                    filter = ((Integer) sessionObjects.get("Filter")).intValue();
                } else {
                    sessionObjects.put("Filter", new Integer(filter));
                }
                if (coderId == 0) {
                    coderId = ((Integer) sessionObjects.get("CoderId")).intValue();
                } else {
                    sessionObjects.put("CoderId", new Integer(coderId));
                }
                if (problemId == 0) {
                    problemId = ((Integer) sessionObjects.get("ProblemId")).intValue();
                } else {
                    sessionObjects.put("ProblemId", new Integer(problemId));
                }
                if (roundId == 0) {
                    roundId = ((Integer) sessionObjects.get("RoundId")).intValue();
                } else {
                    sessionObjects.put("RoundId", new Integer(roundId));
                }
                systemTestCaseReportList = contestEJB.getSystemTestCaseReportList(roundId, problemId, coderId, filter);
            } catch (Exception e) {
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            for (int i = 0; i < systemTestCaseReportList.size(); i++) {
                contestTag.addTag(((com.topcoder.common.web.data.SystemTestCaseReport) systemTestCaseReportList.get(i)).getXML());
            }

            document.addTag(contestTag);
            log.debug(document.getXML(2));
            String xsldocURLString = SYSTEMTESTCASEREPORT_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);

        }
        return result;
    }


    private static String getCoderList(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                       XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList coderList = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                int roundId = 0;
                int problemId = 0;
                try {
                    roundId = Integer.parseInt(request.getParameter("roundid"));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    problemId = Integer.parseInt(request.getParameter("problemid"));
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (problemId == 0) {
                    problemId = ((Integer) sessionObjects.get("ProblemId")).intValue();
                } else {
                    sessionObjects.put("ProblemId", new Integer(problemId));
                }
                if (roundId == 0) {
                    roundId = ((Integer) sessionObjects.get("RoundId")).intValue();
                } else {
                    sessionObjects.put("RoundId", new Integer(roundId));
                }
                coderList = contestEJB.getCoderList(roundId, problemId);
            } catch (Exception e) {
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

            if (coderList == null)
                throw new NavigationException("CODER LIST IS NULL");

            for (int i = 0; i < coderList.size(); i++) {
                contestTag.addTag(((com.topcoder.common.web.data.SystemTestCaseReport) coderList.get(i)).getXML());
            }

            document.addTag(contestTag);
            log.debug(document.getXML(2));
            String xsldocURLString = CODERLIST_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);

        }
        return result;
    }


    private static String getProblemList(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                         XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList problemList = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                int roundId = 0;
                int filter = 0;
                try {
                    roundId = Integer.parseInt(request.getParameter("results"));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    filter = Integer.parseInt(request.getParameter("filter"));
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (filter == 0) {
                    filter = ((Integer) sessionObjects.get("Filter")).intValue();
                } else {
                    sessionObjects.put("Filter", new Integer(filter));
                }
                if (roundId == 0) {
                    roundId = ((Integer) sessionObjects.get("RoundId")).intValue();
                } else {
                    sessionObjects.put("RoundId", new Integer(roundId));
                }

                problemList = contestEJB.getProblemList(roundId);
            } catch (Exception e) {
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            for (int i = 0; i < problemList.size(); i++) {
                contestTag.addTag(((Problem) problemList.get(i)).getXML());
            }

            document.addTag(contestTag);
            log.debug(document.getXML(2));
            String xsldocURLString = PROBLEMLIST_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);

        }
        return result;
    }

    private static void removeSystemTestResult(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                               XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
            throws NavigationException {
        ContestAdminServices contestEJB = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                int roundId = Integer.parseInt(request.getParameter("roundid"));
                int coderId = Integer.parseInt(request.getParameter("coderid"));
                int problemId = Integer.parseInt(request.getParameter("problemid"));
                int testCaseId = Integer.parseInt(request.getParameter("testcaseid"));
                contestEJB.removeSystemTestResult(roundId, coderId, problemId, testCaseId);
            } catch (Exception e) {
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


    private static String getRoundMenuScreen(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                             XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects
                                             )
            //,Contest contest)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestEJB = null;
        ArrayList roundList = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestEJB = (ContestAdminServices) BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                roundList = contestEJB.getRoundList();
            } catch (Exception e) {
                throw new NavigationException(e);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            //contest.setRoundList(roundList);
            //contestTag.addTag(contest.getXML());
            for (int i = 0; i < roundList.size(); i++) {
                contestTag.addTag(((Round) roundList.get(i)).getXML());
            }
            document.addTag(contestTag);
            log.debug(document.getXML(2));
            String xsldocURLString = ROUND_MENU_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);
        }
        return result;
    }

}

