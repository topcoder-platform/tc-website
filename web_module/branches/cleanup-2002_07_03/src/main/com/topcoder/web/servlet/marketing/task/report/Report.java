package com.topcoder.web.servlet.marketing.task.report;

import com.topcoder.web.servlet.marketing.*;
import com.topcoder.common.*;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import com.topcoder.ejb.Reporting.*;


public final class Report {


  private static final boolean VERBOSE     = true;
  private static final String  DIR         = XSL.DIR + "report/";
  private static final int     RETURN_ROWS = 100;


  ////////////////////////////////////////////////////////////////////////////////
  private static Reporting getReportingBean() throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    Reporting result = null;
    Context ctx      = null;
    try {
      ctx = TCContext.getInitial();
      ReportingHome home = (ReportingHome) ctx.lookup ( "jma.ReportingHome" );
      result = home.create();
    } catch ( Exception e ) {  
      e.printStackTrace();
      throw new TCException (
        "com.topcoder.web.servlet.marketing.task.report.Report.getReporting:ERROR:"+e.getMessage()
      );      
    } finally {
      if ( ctx != null ) { try { ctx.close(); } catch ( Exception ignore ) {} }
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  public static String process (HttpServletRequest request, HttpServletResponse response,
    HTMLRenderer renderer, Navigation nav, XMLDocument document)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result            = null;
    try {
      String xsldocURLString = null;
      String requestCommand  = Conversion.checkNull ( request.getParameter("Command") );
      Reporting report = getReportingBean();
      //************************ daily_reg ************************
      if ( requestCommand.equals("daily_reg") ) {
        java.sql.Timestamp after = null;
        String strAfter = Conversion.checkNull ( request.getParameter("After") );
        if ( !strAfter.equals("") ) {
          after = Conversion.convertStringToTimestamp(strAfter);
          document.addTag ( new ValueTag("After",after) );
        }
        RecordTag tag = report.getDayReg(after);
        if ( tag != null ) {
          document.addTag ( tag );
        }
        result = renderer.render ( document, DIR+"day_reg.xsl", null );
      }
      //************************ school_count ************************
      else if ( requestCommand.equals("school_count") ) {
        java.sql.Timestamp before = null;
        String strBefore = Conversion.checkNull ( request.getParameter("Before") );
        if ( !strBefore.equals("") ) {
          before = Conversion.convertStringToTimestamp(strBefore);
          document.addTag ( new ValueTag("Before",before) );
        }
        RecordTag tag = report.getSchoolCount(before);
        if ( tag != null ) {
          document.addTag ( tag );
        }
        result = renderer.render ( document, DIR+"school_count.xsl", null );
      }
      else {
        StringBuffer msg = new StringBuffer( 150                                   );
        msg.append ( "com.topcoder.web.servlet.marketing.task.corp.Request:processCommands:ERROR:invalid task:" );
        msg.append ( requestCommand                                                );
        throw new NavigationException (
          msg.toString()
          ,XSL.NAVIGATION_ERROR_URL
        );
      }
    } catch ( NavigationException ne ) {
      Log.msg("com.topcoder.web.servlet.marketing.task.corp.Request:ERROR:\n"+ne);
      throw ne;
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer ( 150                               );
      msg.append ( "com.topcoder.web.servlet.marketing.task.corp.Request:process:"                               );
      msg.append ( ":ERROR:\n"                                                );
      msg.append ( e.getMessage()                                             );
      throw new NavigationException ( msg.toString(), XSL.INTERNAL_ERROR_URL );
    } 
    return result;
  }


}
