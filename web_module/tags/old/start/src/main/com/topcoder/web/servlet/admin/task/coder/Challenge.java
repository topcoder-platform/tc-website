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
  import com.topcoder.common.Log;
  import com.topcoder.common.TCContext;
  

  public final class Challenge  {

    private static final boolean VERBOSE          = false;

    private static final String DIR                    = XSL.DIR+"challenge/";
    private static final String CHALLENGE_MENU_PAGE    = DIR+"challengemenu.xsl";
    private static final String ROOM_MENU_PAGE         = DIR+"roommenu.xsl";
    private static final String ROUND_MENU_PAGE        = DIR+"challengeroundmenu.xsl";
    private static final String ROUNDSEGMENT_MENU_PAGE = DIR+"roundsegmentmenu.xsl";
    private static final String CONTEST_RESULTS_PAGE   = DIR+"contestresults.xsl";


    ///////////////////////////////////////////////////////////////////////////////////
    public static String process ( HttpServletRequest request, HttpServletResponse response,
      RenderHTML renderer, Navigation nav, XMLDocument document )
      throws NavigationException {
    //////////////////////////////////////////////////////////////////////////////////
    
      String result = null;
      RecordTag contestTag = new RecordTag( "CHALLENGE" );
      HashMap sessionObjects = nav.getSessionObjects();
      ArrayList roundList = null;
      ArrayList challengeList = null;
      Integer roomId = null;
      Integer roundId = null;
/*     
      Authentication login = null;
      if ( !sessionObjects.containsKey("login") ) {
        login = new Authentication();
        sessionObjects.put("login", login);
      } else {
        login = (Authentication) sessionObjects.get("login");
      }
*/


      try {
        String command = Conversion.checkNull( request.getParameter("Command") );
        if (command.equals("getRoundMenu")) {
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
          Log.msg("Challenge: getRoomList error retrieving room list .");
          Log.msg("MSG: " + e);
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
        Log.msg( VERBOSE, document.getXML(2) );
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
          } catch (Exception ex) { ex.printStackTrace(); }
          try {
           filter = Integer.parseInt(request.getParameter("filter"));
          } catch (Exception ex) { ex.printStackTrace(); }
          try {
            roomId = Integer.parseInt(request.getParameter("roomid"));
          } catch (Exception ex) { ex.printStackTrace(); }
         if (roomId == 0) {
              roomId = ((Integer)sessionObjects.get("RoomId")).intValue();
         } else {
              sessionObjects.put("RoomId", new Integer(roomId));
         }
         if (roundId == 0) {
              roundId = ((Integer)sessionObjects.get("RoundId")).intValue();
         } else {
              sessionObjects.put("RoundId", new Integer(roundId));
         }
          challengeList = contestEJB.getChallengeList(roundId, roomId, filter);
          contestHome = null;
        } catch (Exception e) {
          Log.msg("Challenge: getChallengeList error retrieving challenge list .");
          Log.msg("MSG: " + e);
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
        Log.msg( VERBOSE, document.getXML(2) );
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
          contestEJB.removeChallenge(challengeId);
          contestHome = null;
        } catch (Exception e) {
          Log.msg("Challenge: removeChallenge error removing challenge .");
          Log.msg("MSG: " + e);
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
          Log.msg("Challenge: overturnChallenge error overturning challenge .");
          Log.msg("MSG: " + e);
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
        Log.msg("Challenge: getRoundMenuScreen error retrieving contest list .");
        Log.msg("MSG: " + e);
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
      Log.msg(VERBOSE, document.getXML(2) );
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

