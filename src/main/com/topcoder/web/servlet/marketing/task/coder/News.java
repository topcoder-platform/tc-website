package com.topcoder.marketing.task.coder;

import marketing.*;
import com.topcoder.common.*;
import com.topcoder.common.attr.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import com.topcoder.ejb.NewsServices.*;


public final class News {


  private static final boolean VERBOSE     = false;
  private static final String  DIR         = XSL.DIR + "coder/news/";
  private static final int     RETURN_ROWS = 100;


  ////////////////////////////////////////////////////////////////////////////////
  public static String process ( HttpServletRequest request, HttpServletResponse response,
    RenderHTML HTMLmaker, Navigation nav, XMLDocument document )
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result            = null;
    try {
      String xsldocURLString = null;
      String requestCommand  = Conversion.checkNull ( request.getParameter("Command") );
      if ( requestCommand.equals("") ) {
        result = getNews ( HTMLmaker, request, response, nav, document ); 
      }
      else if ( requestCommand.equals("remove") ) {
        result = removeNews ( HTMLmaker, request, response, nav, document ); 
      }
      else {
        StringBuffer msg = new StringBuffer( 150                             );
        msg.append ( "marketing.task.coder.News:processCommands:ERROR:invalid task:" );
        msg.append ( requestCommand                                          );
        throw new NavigationException (
          msg.toString()
          ,XSL.NAVIGATION_ERROR_URL
        );
      }
    } catch ( NavigationException ne ) {
      Log.msg("marketing.task.coder.News:ERROR:\n"+ne);
      throw ne;
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer ( 150                               );
      msg.append ( "marketing.task.coder.News:process:"                               );
      msg.append ( ":ERROR:\n"                                                );
      msg.append ( e.getMessage()                                             );
      throw new NavigationException ( msg.toString(), XSL.INTERNAL_ERROR_URL );
    } 
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String getNews ( RenderHTML HTMLmaker, HttpServletRequest request,
    HttpServletResponse response, Navigation nav, XMLDocument document )
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    Context ctx = null;
    try {
      RecordTag requestTag = new RecordTag ( "REQUEST" );
      ctx = TCContext.getInitial();
      NewsServicesHome home = (NewsServicesHome) ctx.lookup ( "jma.NewsServicesHome" );
      NewsServices newsServices = home.create();
      NewsAttributes criteria = new NewsAttributes();
      criteria.setStatus ( "A" );
      String direction = "next";
      int currentRow   = 0;
      ArrayList news = newsServices.getNews ( criteria, true, direction, currentRow, RETURN_ROWS );
      requestTag.addTag ( Common.getListXML("News",news) );
      document.addTag ( requestTag );
      String xsldocURLString = DIR + "news.xsl";
      result = Common.render ( HTMLmaker, nav, document, xsldocURLString, null );
    } catch ( NavigationException ne ) {
      throw ne;
    } catch ( Exception e ) {
      e.printStackTrace();
      throw new NavigationException ( 
        "marketing.task.coder.News:getNews:ERROR:\n"+e, XSL.INTERNAL_ERROR_URL 
      );
    } finally {
      if ( ctx != null ) try { ctx.close(); ctx = null; } catch ( Exception ignore ) {}
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String removeNews ( RenderHTML HTMLmaker, HttpServletRequest request,
    HttpServletResponse response, Navigation nav, XMLDocument document )
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    Context ctx = null;
    try {
      String[] strId = request.getParameterValues ( "NewsId" );
      if ( strId != null ) {
        int[] id = Conversion.convertStringArrayToInt ( strId, false );
        ctx = TCContext.getInitial();
        NewsServicesHome home =
          (NewsServicesHome) ctx.lookup ( "jma.NewsServicesHome" );
        NewsServices srServices = home.create();
        for ( int i = 0; i < id.length; i++ ) {
          NewsAttributes req = srServices.getNews ( id[i] );
          req.setStatus ( "I" );
          req.setModified ( "U" );
          srServices.saveNews ( req );
        }
      }
      result = getNews ( HTMLmaker, request, response, nav, document );
    } catch ( NavigationException ne ) {
      throw ne;
    } catch ( Exception e ) {
      e.printStackTrace();
      throw new NavigationException (
        "marketing.task.coder.News:removeNews:ERROR:\n"+e
        ,XSL.INTERNAL_ERROR_URL
      );
    } finally {
      if ( ctx != null ) try { ctx.close(); ctx = null; } catch ( Exception ignore ) {}
    }
    return result;
  }


}
