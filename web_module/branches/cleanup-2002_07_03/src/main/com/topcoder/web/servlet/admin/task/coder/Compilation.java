  package com.topcoder.web.servlet.admin.task.coder;

  import java.io.*;
  import java.util.*;
  import java.sql.Timestamp;
  import javax.servlet.*;
  import javax.servlet.http.*;
  import javax.naming.*;
  import javax.transaction.UserTransaction;
  import javax.transaction.Status;
  import com.topcoder.ejb.ContestAdminServices.*;
  import com.topcoder.common.*;
  import com.topcoder.common.web.data.*;
  import com.topcoder.common.web.error.*;
  import com.topcoder.common.web.xml.HTMLRenderer;
  import com.topcoder.shared.docGen.xml.*;
  import com.topcoder.common.web.util.*;
  import com.topcoder.common.web.data.Navigation;
  import com.topcoder.web.servlet.admin.*;

  public final class Compilation  {


    private static final String DIR = XSL.DIR + "compilation/";
    private static final boolean VERBOSE = false;


    ///////////////////////////////////////////////////////////////////////////////////
    public static String process ( HttpServletRequest request, HttpServletResponse response,
      HTMLRenderer renderer, Navigation nav, XMLDocument document )
      throws NavigationException {
    //////////////////////////////////////////////////////////////////////////////////
    
      String result = null;
      RecordTag compilationTag = new RecordTag("COMPILATION");
      HashMap sessionObjects = nav.getSessionObjects();

      try {
        String command = Conversion.checkNull( request.getParameter("Command") );
        if (command.equals("get_rounds")) {
          result = getRounds(renderer, request, document, nav, compilationTag);
        } else if ( command.equals("get_coders") ) {
          result = getCoders(renderer, request, document, nav, compilationTag);
        } else if ( command.equals("get_problems") ) {
          result = getCompilations(renderer, request, document, nav, compilationTag);
        }
      } catch (Exception e) {
        e.printStackTrace();
        throw new NavigationException("admin.task.coder.Compilation: ERROR:\n "+e, XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }

    ////////////////////////////////////////////////////////////////////////////////
    private static String getRounds (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag compilationTag)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestAdminServicesEJB = null;
      ArrayList rounds = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestAdminServicesHome = (ContestAdminServicesHome) ctx.lookup(ApplicationServer.CONTEST_ADMIN_SERVICES);
        try {
          contestAdminServicesEJB = contestAdminServicesHome.create();
          rounds = contestAdminServicesEJB.getRounds();
          contestAdminServicesHome = null;
        } catch (Exception e) {
          e.printStackTrace();
          throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
            ctx = null;
        }

        for (int i = 0; i < rounds.size(); i++) {
          compilationTag.addTag(((Round)rounds.get(i)).getXML());
        }

        document.addTag(compilationTag);
        Log.msg(VERBOSE, document.getXML(2) );
        String xsldocURLString = DIR+"get_rounds.xsl";
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
        throw ne;
      } catch (Exception e) {
        throw new NavigationException("admin.task.coder.Compilation.getRounds: ERROR:\n "+e,
        XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }

    ////////////////////////////////////////////////////////////////////////////////
    private static String getCoders (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag compilationTag)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestAdminServicesEJB = null;
      ArrayList coders = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestAdminServicesHome = (ContestAdminServicesHome) ctx.lookup(ApplicationServer.CONTEST_ADMIN_SERVICES);
        try {
          contestAdminServicesEJB = contestAdminServicesHome.create();
          coders = contestAdminServicesEJB.getCodersByRound(Integer.parseInt(request.getParameter("RoundId")));
          contestAdminServicesHome = null;
        } catch (Exception e) {
          e.printStackTrace();
          throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
            ctx = null;
        }

        compilationTag.addTag(new ValueTag("RoundId", request.getParameter("RoundId")));
        for (int i = 0; i < coders.size(); i++) {
          compilationTag.addTag(((com.topcoder.common.web.data.admin.Coder)coders.get(i)).getXML());
  
        }

        document.addTag(compilationTag);
        Log.msg(VERBOSE, document.getXML(2) );
        String xsldocURLString = DIR+"get_coders.xsl";
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
        throw ne;
      } catch (Exception e) {
        throw new NavigationException("admin.task.coder.Compilation.getCoders: ERROR:\n "+e,
        XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }


    ////////////////////////////////////////////////////////////////////////////////
    private static String getCompilations (HTMLRenderer HTMLmaker, HttpServletRequest request,
      XMLDocument document, Navigation nav, RecordTag compilationTag)
      throws NavigationException {
    ////////////////////////////////////////////////////////////////////////////////
      String result = null;
      ContestAdminServices contestAdminServicesEJB = null;
      ArrayList compilations = null;
     
      try {
        Context ctx = TCContext.getInitial();
        ContestAdminServicesHome contestAdminServicesHome = (ContestAdminServicesHome) ctx.lookup(ApplicationServer.CONTEST_ADMIN_SERVICES);
        try {
          contestAdminServicesEJB = contestAdminServicesHome.create();
          compilations = contestAdminServicesEJB.getCoderCompilations(Integer.parseInt(request.getParameter("RoundId")), Integer.parseInt(request.getParameter("CoderId")));
          contestAdminServicesHome = null;
        } catch (Exception e) {
          e.printStackTrace();
          throw new NavigationException("DB ERROR", XSL.NAVIGATION_ERROR_URL);
        }
        finally {
          try {
            if (ctx != null) ctx.close(); ctx = null;
          } catch (Exception ignore) { }
            ctx = null;
        }
        String temp = request.getParameter("ProblemId");
        if (temp!=null) compilationTag.addTag(new ValueTag("ProblemId", temp));
        compilationTag.addTag(new ValueTag("RoundId", request.getParameter("RoundId")));
        for (int i = 0; i < compilations.size(); i++) {
          compilationTag.addTag(((com.topcoder.common.web.data.admin.Compilation)compilations.get(i)).getXML());
        }

        document.addTag(compilationTag);
        Log.msg(VERBOSE, document.getXML(2) );
        String xsldocURLString = DIR+"get_compilations.xsl";
        nav.setScreen(xsldocURLString);
        result = HTMLmaker.render(document, xsldocURLString, null);
      } catch (NavigationException ne) {
        throw ne;
      } catch (Exception e) {
        throw new NavigationException("admin.task.coder.Compilation.getCompilations : ERROR:\n "+e,
        XSL.NAVIGATION_ERROR_URL);

      }
      return result;
    }


}
