  package admin.task.coder;

  import java.io.*;
  import java.util.*;
  import java.sql.Timestamp;
  import javax.servlet.*;
  import javax.servlet.http.*;
  import javax.naming.*;
  import javax.transaction.UserTransaction;
  import javax.transaction.Status;

  import com.topcoder.ejb.ContestAdminServices.*;
  import admin.*;
  import com.topcoder.common.*;
  import com.topcoder.common.web.util.*; 
  import com.topcoder.common.web.xml.*; 
  import com.topcoder.common.web.data.*;
  import com.topcoder.common.web.error.*;
  import com.topcoder.common.TCContext;
  import org.apache.log4j.*;
  

  public final class Challenge  {

    private static final boolean  VERBOSE               = false;
    private static final String   DIR                    = XSL.DIR+"challenge/";
    private static final String   CHALLENGE_MENU_PAGE    = DIR+"challengemenu.xsl";
    private static final String   ROOM_MENU_PAGE         = DIR+"roommenu.xsl";
    private static final String   PROBLEM_MENU_PAGE      = DIR+"challengeproblemmenu.xsl";
    private static final String   ROUND_MENU_PAGE        = DIR+"challengeroundmenu.xsl";
    private static final String   ROUNDSEGMENT_MENU_PAGE = DIR+"roundsegmentmenu.xsl";
    private static final String   CONTEST_RESULTS_PAGE   = DIR+"contestresults.xsl";
    private static Category log   = Category.getInstance( Challenge.class.getName() );


    ///////////////////////////////////////////////////////////////////////////////////
    public static String process ( HttpServletRequest request, HttpServletResponse response,
      RenderHTML renderer, Navigation nav, XMLDocument document )
      throws NavigationException {
    //////////////////////////////////////////////////////////////////////////////////
    
      log.info("Servlet Challenge: process called .");
      String result = null;
      RecordTag contestTag = new RecordTag( "CHALLENGE" );
      HashMap sessionObjects = nav.getSessionObjects();
      ArrayList roundList = null;
      ArrayList challengeList = null;
      Integer roomId = null;
      Integer roundId = null;

      try {
        String command = Conversion.checkNull( request.getParameter("Command") );
        if (command.equals("getRoundMenu")) {
          result = getRoundMenuScreen (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("getProblemList") ) {
          result = getProblemMenuScreen (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("getCoderList") ) {
          result = getRoundMenuScreen (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("getChallengeList") ) {
          result = getChallengeList (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("getRoomList") ) {
          result = getRoomList (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("removeChallenge") ) {
          removeChallenge (renderer, request, document, nav, contestTag, sessionObjects );
          result = getChallengeList (renderer, request, document, nav, contestTag, sessionObjects );
        } else if ( command.equals("overturnChallenge") ) {
          overturnChallenge (renderer, request, document, nav, contestTag, sessionObjects );
          result = getChallengeList (renderer, request, document, nav, contestTag, sessionObjects );
        } 
        
      } catch (Exception e) {
      e.printStackTrace();
            throw new NavigationException("Challenge: process method: ERROR:\n "+e, XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }

    ////////////////////////////////////////////////////////////////////////////////
    private static String getRoomList (RenderHTML HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList roomList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminServicesHome");
        try {
          contestEJB = contestHome.create();
          int roundId = Integer.parseInt(request.getParameter("results"));
          int filter = Integer.parseInt(request.getParameter("filter"));
          roomList = contestEJB.getRoomList(roundId );
          contestHome = null;
        } catch (Exception e) {
          log.error("Challenge: getRoomList error retrieving room list .");
          log.error("MSG: " + e);
          throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { ignore.printStackTrace(); }
          ctx = null;
        }

        for (int i = 0; i < roomList.size(); i++) {
          contestTag.addTag(((Room)roomList.get(i)).getXML());
        }

        document.addTag(contestTag);
        log.debug( document.getXML(2) );
        String xsldocURLString = ROOM_MENU_PAGE;
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
      throw ne;
      } catch (Exception e) {
      throw new NavigationException("Challenge: getRoomMenuScreen : ERROR:\n "+e,
        XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }


    ////////////////////////////////////////////////////////////////////////////////
    private static String getChallengeList (RenderHTML HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      log.info("Servlet: Challenge: getChallengeList called ");
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList challengeList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminServicesHome");
        try {
          contestEJB = contestHome.create();
          int roundId = 0;
          int filter = 0;
          int roomId = 0;
          try {
           roundId = Integer.parseInt(request.getParameter("roundid"));
          } catch (Exception ignore) {}
          try {
           filter = Integer.parseInt(request.getParameter("filter"));
          } catch (Exception ignore) {}
          try {
            roomId = Integer.parseInt(request.getParameter("roomid"));
          } catch (Exception ignore) {}
         if (roomId == 0) {
              roomId = ((Integer)sessionObjects.get("RoomId")).intValue();
              log.warn("Challenge: getChallengeList: roomId set to "+roomId+" from session");
         } else {
              sessionObjects.put("RoomId", new Integer(roomId));
              log.warn("Challenge: getChallengeList: roomId added to session as "+roomId);
         }
         if (roundId == 0) {
              roundId = ((Integer)sessionObjects.get("RoundId")).intValue();
              log.warn("Challenge: getChallengeList: roundId set to "+roundId+" from session");
         } else {
              sessionObjects.put("RoundId", new Integer(roundId));
              log.warn("Challenge: getChallengeList: roundId added to session as "+roundId);
         }
          log.debug("Challenge: getChallengeList: filter set to "+filter);
          log.debug("Challenge: getChallengeList: roundId set to "+roundId);
          log.debug("Challenge: getChallengeList: roomId set to "+roomId);
          challengeList = contestEJB.getChallengeList(roundId, roomId, filter);
          contestHome = null;
        } catch (Exception e) {
          log.error("Challenge: getChallengeList error retrieving challenge list .");
          log.error("MSG: " + e);
          throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
          ctx = null;
        }

        for (int i = 0; i < challengeList.size(); i++) {
          contestTag.addTag(((com.topcoder.common.web.data.Challenge)challengeList.get(i)).getXML());
        }

        document.addTag(contestTag);
        log.debug(document.getXML(2) );
        String xsldocURLString = CHALLENGE_MENU_PAGE;
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
      throw ne;
      } catch (Exception e) {
      e.printStackTrace(); //TONY
      throw new NavigationException("Challenge: getRoundMenuScreen : ERROR:\n "+e,
        XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }


    ////////////////////////////////////////////////////////////////////////////////
    private static void removeChallenge (RenderHTML HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      ContestAdminServices contestEJB = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminServicesHome");
        try {
          contestEJB = contestHome.create();
          int challengeId = Integer.parseInt(request.getParameter("remove"));
          contestEJB.nullifyChallenge(challengeId);
          contestHome = null;
        } catch (Exception e) {
          log.error("Challenge: removeChallenge error removing challenge .");
          log.error("MSG: " + e);
          throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
          ctx = null;
        }

      } catch (Exception e) {
      throw new NavigationException("Challenge: removeChallenge  : ERROR:\n "+e,
        XSL.NAVIGATION_ERROR_URL);

      }
    }

    ////////////////////////////////////////////////////////////////////////////////
    private static void overturnChallenge (RenderHTML HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      ContestAdminServices contestEJB = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminServicesHome");
        try {
          contestEJB = contestHome.create();
          int challengeId = Integer.parseInt(request.getParameter("overturn"));
          contestEJB.overturnChallenge(challengeId);
          contestHome = null;
        } catch (Exception e) {
          log.error("Challenge: overturnChallenge error overturning challenge .");
          log.error("MSG: " + e);
          throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
          ctx = null;
        }

      } catch (Exception e) {
      throw new NavigationException("Challenge: overturnChallenge  : ERROR:\n "+e,
        XSL.NAVIGATION_ERROR_URL);

      }
    }

    ////////////////////////////////////////////////////////////////////////////////
    private static String getProblemMenuScreen (RenderHTML HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects
      ) throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      log.info("Servlet Challenge: getProblemMenuScreen called  ");
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList problemList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminServicesHome");
        try {
          contestEJB = contestHome.create();
          int roundId = 0;
          try {
           roundId = Integer.parseInt(request.getParameter("roundid"));
           log.debug("roundId set to "+roundId+" from request");
          } catch (Exception exception1) 
          { 
               log.error("Servlet Challenge: getProbelmMenu: error getting roundid request parameter ");
               log.error("EXCEPTION: " + exception1);
          }
          if (roundId == 0) {
               roundId = ((Integer)sessionObjects.get("RoundId")).intValue();
               log.warn("Challenge: getChallengeList: roundId set to "+roundId+" from session");
               log.warn("Challenge: getChallengeList: getting roundId from session here is a whole in the logic ");
               log.warn("Challenge: getChallengeList: it will throw a null pointer exception if it does not exist in session ");
          } else {
              sessionObjects.put("RoundId", new Integer(roundId));
              log.warn("Challenge: getChallengeList: roundId added to session as "+roundId);
          }
          log.debug("Challenge: getChallengeList: roundId set to "+roundId);
          problemList = contestEJB.getProblemList( roundId );
          log.debug("problemList.size(): "+problemList.size());
          contestHome = null;
        } catch (Exception e) {
          log.error("Servlet Challenge: getProblemMenuScreen error retrieving probelm list .");
          log.error("MSG: " + e);
          throw new NavigationException("", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
          ctx = null;
        }
  
        Object a = null;
        try {
           for (int i = 0 ; i < problemList.size(); i++ ) {
              a = problemList.get(i);
                  contestTag.addTag(((Problem)problemList.get(i)).getXML());
           }    
        } catch (Exception ex) { ex.printStackTrace();  }
  
  
        try {
            document.addTag(contestTag);
            log.debug(document.getXML(2) );
            String xsldocURLString = PROBLEM_MENU_PAGE;
            nav.setScreen(xsldocURLString);
            result = HTMLmaker.render(document, xsldocURLString, null);
        } catch (Exception ei) { ei.printStackTrace();  }
          } catch (NavigationException ne) {
                throw ne;
      } catch (Exception e) {
              throw new NavigationException("Servlet Challenge: getProblemMenuScreen : ERROR:\n "+e,
                XSL.NAVIGATION_ERROR_URL);
    
      }
    return result;
  }

    ////////////////////////////////////////////////////////////////////////////////
    private static String getRoundMenuScreen (RenderHTML HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag contestTag, HashMap sessionObjects
      ) throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestEJB = null;
      ArrayList roundList = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestHome = (ContestAdminServicesHome) ctx.lookup("jma.ContestAdminServicesHome");
        try {
          contestEJB = contestHome.create();
          roundList = contestEJB.getRoundList();
          contestHome = null;
      } catch (Exception e) {
        log.error("Challenge: getRoundMenuScreen error retrieving contest list .");
        log.error("MSG: " + e);
        throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
      }
      finally {
        try {
          if (ctx != null) ctx.close(); ctx = null;
        } catch (Exception ignore) { }
        ctx = null;
      }

      Object a = null;
  try {
      for (int i = 0 ; i < roundList.size(); i++ ) {
         a = roundList.get(i);
             contestTag.addTag(((Round)roundList.get(i)).getXML());
      } 
 } catch (Exception ex) { ex.printStackTrace();  }


  try {
      document.addTag(contestTag);
      log.debug(document.getXML(2) );
      String xsldocURLString = ROUND_MENU_PAGE;
      nav.setScreen(xsldocURLString);
      result = HTMLmaker.render(document, xsldocURLString, null);
 } catch (Exception ei) { ei.printStackTrace();  }
    } catch (NavigationException ne) {
          throw ne;
    } catch (Exception e) {
          throw new NavigationException("Challenge: getRoundMenuScreen : ERROR:\n "+e,
            XSL.NAVIGATION_ERROR_URL);

    }
    return result;
  }

}

