  package com.topcoder.web.servlet.admin.task.coder;

  import java.io.*;
  import java.util.*;
  import java.sql.Timestamp;
  import javax.servlet.*;
  import javax.servlet.http.*;
  import javax.naming.*;
  import javax.transaction.UserTransaction;
  import javax.transaction.Status;

  import com.topcoder.web.servlet.admin.*;
  import com.topcoder.shared.util.*;
  import com.topcoder.common.web.data.*;
  import com.topcoder.shared.docGen.xml.*;
  import com.topcoder.common.web.error.*;
  import com.topcoder.common.web.xml.HTMLRenderer;
  import com.topcoder.common.web.util.Conversion;
  import com.topcoder.shared.util.logging.Logger;
  import com.topcoder.ejb.ContestAdminServices.*;
  import com.topcoder.ejb.AuthenticationServices.*;
  

  public final class SystemTestCaseReport  {


    private static final String DIR = com.topcoder.web.servlet.admin.XSL.DIR+"systemtestcasereport/";
    private static final String SYSTEMTESTCASEREPORT_MENU_PAGE = DIR+"systemtestcasereport_menu.xsl";
    private static final String PROBLEMLIST_MENU_PAGE = DIR+"systemtestcasereport_problemmenu.xsl";
    private static final String CODERLIST_MENU_PAGE = DIR+"systemtestcasereport_codermenu.xsl";
    private static final String ROUND_MENU_PAGE = DIR+"systemtestcasereport_roundmenu.xsl";
    private static Logger log = Logger.getLogger(SystemTestCaseReport.class);


    ///////////////////////////////////////////////////////////////////////////////////
    public static String process ( HttpServletRequest request, HttpServletResponse response,
      HTMLRenderer renderer, Navigation nav, XMLDocument document )
      throws NavigationException {
    //////////////////////////////////////////////////////////////////////////////////
    
      String result = null;
      RecordTag contestTag = new RecordTag( "SYSTEMTESTCASEREPORT" );
      HashMap sessionObjects = nav.getSessionObjects();
      ArrayList roundList = null;
      ArrayList STRList = null;
      int problemId = -1;

      Authentication login = null;
      if ( !sessionObjects.containsKey("login") ) {
        login = new Authentication();
        sessionObjects.put("login", login);
      } else {
        login = (Authentication) sessionObjects.get("login");
      }


      try {
        String command = Conversion.checkNull( request.getParameter("Command") );
        log.debug("SystemTestResult: Command: "+ command); 
        if (command.equals("getRoundMenu")) {
          result = getRoundMenuScreen (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("getProblemList") ) {
          result = getProblemList (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("getSystemTestCaseReportList") ) {
          result = getSystemTestCaseReportList (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("getCoderList") ) {
          result = getCoderList (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("removeSystemTestCaseReport") ) {
          removeSystemTestResult (renderer, request, document, nav, contestTag, sessionObjects );
          result = getSystemTestCaseReportList (renderer, request, document, nav, contestTag, sessionObjects );
        } 
      } catch (Exception e) {
        e.printStackTrace();
        throw new NavigationException("SystemTestResult: process method: ERROR:\n "+e, com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }

    ////////////////////////////////////////////////////////////////////////////////
    private static String getSystemTestCaseReportList (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects )
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList systemTestCaseReportList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminHome");
        try {
          contestEJB = contestHome.create();
          int roundId = 0;
          int problemId = 0;
          int coderId = 0;
          int filter = 0;
          try {
             roundId = Integer.parseInt(request.getParameter("roundid"));
          } catch (Exception e) {  }
          try {
             problemId = Integer.parseInt(request.getParameter("problemid"));
          } catch (Exception e) {  }
          try {
             coderId = Integer.parseInt(request.getParameter("coderid"));
          } catch (Exception e) { }
          try {
             filter = Integer.parseInt(request.getParameter("filter"));
          } catch (Exception e) {  }
          
           if (filter == 0) {
                filter = ((Integer)sessionObjects.get("Filter")).intValue();
           } else {
              sessionObjects.put("Filter", new Integer(filter));
           }
           if (coderId == 0) {
                coderId = ((Integer)sessionObjects.get("CoderId")).intValue();
           } else {
              sessionObjects.put("CoderId", new Integer(coderId));
           }
          if (problemId == 0) {
                problemId = ((Integer)sessionObjects.get("ProblemId")).intValue();
           } else {
                sessionObjects.put("ProblemId", new Integer(problemId));
           }
           if (roundId == 0) {
                roundId = ((Integer)sessionObjects.get("RoundId")).intValue();
           } else {
              sessionObjects.put("RoundId", new Integer(roundId));
           }
          systemTestCaseReportList = contestEJB.getSystemTestCaseReportList(roundId, problemId, coderId, filter);
          contestHome = null;
        } catch (Exception e) {
          e.printStackTrace();
          log.debug("SystemTestResult: getSystemTestCaseReportList error retrieving systemtestcasereport  list .");
          log.debug("MSG: " + e);
          throw new NavigationException("Exception:", com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
          ctx = null;
        }

        for (int i = 0; i < systemTestCaseReportList.size(); i++) {
          contestTag.addTag(((com.topcoder.common.web.data.SystemTestCaseReport)systemTestCaseReportList.get(i)).getXML());
        }

        document.addTag(contestTag);
        log.debug(document.getXML(2) );
        String xsldocURLString = SYSTEMTESTCASEREPORT_MENU_PAGE;
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
        throw ne;
      } catch (Exception e) {
        throw new NavigationException("SystemTestCaseReport: remove systemtestcase  : ERROR:\n "+e,
        com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }


    ////////////////////////////////////////////////////////////////////////////////
    private static String getCoderList (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList coderList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminHome");
        try {
          contestEJB = contestHome.create();
          int roundId = 0;
          int problemId = 0;
          int coderId = 0;
          try {
             roundId = Integer.parseInt(request.getParameter("roundid"));
          } catch (Exception e) { e.printStackTrace(); }
          try {
             problemId = Integer.parseInt(request.getParameter("problemid"));
          } catch (Exception e) { e.printStackTrace(); }
          
          if (problemId == 0) {
                problemId = ((Integer)sessionObjects.get("ProblemId")).intValue();
           } else {
                sessionObjects.put("ProblemId", new Integer(problemId));
           }
           if (roundId == 0) {
                roundId = ((Integer)sessionObjects.get("RoundId")).intValue();
           } else {
              sessionObjects.put("RoundId", new Integer(roundId));
           }
           coderList = contestEJB.getCoderList(roundId,problemId);
          contestHome = null;
        } catch (Exception e) {
          log.debug("SystemTestResult: getCoder error retrieving coder list.");
          log.debug("MSG: " + e);
          throw new NavigationException("DB ERROR", com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { ignore.printStackTrace(); }
          ctx = null;
        }

        if (coderList == null) 
          throw new NavigationException("CODER LIST IS NULL", com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);
        
        for (int i = 0; i < coderList.size(); i++) {
          contestTag.addTag(((com.topcoder.common.web.data.SystemTestCaseReport)coderList.get(i)).getXML());
        }

        document.addTag(contestTag);
        log.debug(document.getXML(2) );
        String xsldocURLString = CODERLIST_MENU_PAGE;
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
        throw ne;
      } catch (Exception e) {
        throw new NavigationException("SystemTestCaseReport:  getCoderList  : ERROR:\n "+e,
        com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }


    ////////////////////////////////////////////////////////////////////////////////
    private static String getProblemList (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList problemList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminHome");
        try {
          contestEJB = contestHome.create();
          int roundId = 0;
          int filter = 0;
          try {
            roundId = Integer.parseInt(request.getParameter("results"));
          } catch (Exception e) { e.printStackTrace(); }
          try {
            filter = Integer.parseInt(request.getParameter("filter"));
          } catch (Exception e) { e.printStackTrace(); }

           if (filter == 0) {
                filter = ((Integer)sessionObjects.get("Filter")).intValue();
           } else {
              sessionObjects.put("Filter", new Integer(filter));
           }
           if (roundId == 0) {
                roundId = ((Integer)sessionObjects.get("RoundId")).intValue();
           } else {
              sessionObjects.put("RoundId", new Integer(roundId));
           }

          problemList = contestEJB.getProblemList(roundId);
          contestHome = null;
        } catch (Exception e) {
          log.debug("SystemTestResult: getProblemList error retrieving problem list.");
          log.debug("MSG: " + e);
          throw new NavigationException("DB ERROR", com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
          ctx = null;
        }

        for (int i = 0; i < problemList.size(); i++) {
          contestTag.addTag(((Problem)problemList.get(i)).getXML());
        }

        document.addTag(contestTag);
        log.debug(document.getXML(2) );
        String xsldocURLString = PROBLEMLIST_MENU_PAGE;
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
        throw ne;
      } catch (Exception e) {
        throw new NavigationException("SystemTestCaseReport:  getProblemList  : ERROR:\n "+e,
        com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }

    ////////////////////////////////////////////////////////////////////////////////
    private static void removeSystemTestResult (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      ContestAdminServices contestEJB = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminHome");
        try {
          contestEJB = contestHome.create();
          int roundId = Integer.parseInt(request.getParameter("roundid"));
          int coderId = Integer.parseInt(request.getParameter("coderid"));
          int problemId = Integer.parseInt(request.getParameter("problemid"));
          int testCaseId = Integer.parseInt(request.getParameter("testcaseid"));
          contestEJB.removeSystemTestResult(roundId, coderId, problemId, testCaseId);
          contestHome = null;
        } catch (Exception e) {
          log.debug("SystemTestResult: removeSystemTestResult error removing challenge .");
          log.debug("MSG: " + e);
          throw new NavigationException("DB ERROR", com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
          ctx = null;
        }

      } catch (Exception e) {
      throw new NavigationException("SystemTestResult: removeSystemTestResult  : ERROR:\n "+e,
        com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);

      }
    }


    ////////////////////////////////////////////////////////////////////////////////
    private static String getRoundMenuScreen (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects
     )
     //,Contest contest)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList roundList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminHome");
        try {
        contestEJB = contestHome.create();
        roundList = contestEJB.getRoundList();
        contestHome = null;
      } catch (Exception e) {
          log.debug("SystemTestResult: getRoundMenuScreen error retrieving contest list .");
          log.debug("MSG: " + e);
          throw new NavigationException("DB ERROR", com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);
      }
      finally {
        try {
          if (ctx != null) ctx.close(); ctx = null;
         } catch (Exception ignore) { }
         ctx = null;
      }
        
      //contest.setRoundList(roundList);
      //contestTag.addTag(contest.getXML());
      for (int i = 0; i < roundList.size(); i++) {
         contestTag.addTag(((Round)roundList.get(i)).getXML());
      }
      document.addTag(contestTag);
      log.debug(document.getXML(2) );
      String xsldocURLString = ROUND_MENU_PAGE;
      nav.setScreen(xsldocURLString);
      result = HTMLmaker.render(document, xsldocURLString, null);
            } catch (NavigationException ne) {
                  throw ne;
            } catch (Exception e) {
                  e.printStackTrace();
                  throw new NavigationException("SystemTestResult: getRoundMenuScreen : ERROR:\n "+e,
                    com.topcoder.web.servlet.admin.XSL.NAVIGATION_ERROR_URL);
        
            }
            return result;
          }

}

