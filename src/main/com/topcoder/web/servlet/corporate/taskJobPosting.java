package com.topcoder.subscriber;

import com.topcoder.common.*;
import com.topcoder.common.attr.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import com.topcoder.ejb.DataCache.*;


public final class taskJobPosting {


  private static final String  XSL_URL = task.XSL_URL + "job/posting.xsl";
  private static final String  PREVIEW_URL = task.XSL_URL + "job/preview.xsl";
  private static final boolean VERBOSE = false;


  ////////////////////////////////////////////////////////////////////////////////
  static String process ( HttpServletRequest request, HttpServletResponse response,
    RenderHTML HTMLmaker, Navigation nav, XMLDocument document )
    throws NavigationException, SessionClobberedException {
  ////////////////////////////////////////////////////////////////////////////////
    String result  = null;
    try {
      if ( nav.sessionClobbered() ) {
        throw new SessionClobberedException ( 
          "subscriber.taskJobPosting:process:ERROR:session clobbered" 
        );
      }
      if ( nav.getLoggedIn() && processAuthentication.hasMinimumPermission(nav.getUser()) ) {
        HttpSession session    = request.getSession(true);
        String cacheKey        = null;
        String xsldocURLString = XSL_URL;
        RecordTag jobTag       = new RecordTag ( "JOB" ); 
        String command         = Conversion.checkNull ( request.getParameter("Command") );
        //************************ job command *************************
        if ( command.equals("") || command.equals("job") ) {
          processJobPosting.evalMode ( request, response, nav, jobTag );
          //document.addTag ( new ValueTag("JumpToJob","Y") );
        }
        //************************ preview command *************************
        else if ( command.equals("preview") ) {
          processJobPosting.preview ( request, nav, jobTag );
          xsldocURLString = PREVIEW_URL;
        }
        processJobPosting.buildLookupTags ( jobTag );
        HashMap userTypeDetails         = nav.getUser().getUserTypeDetails();
        SubscriberAttributes subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");
        if ( subscriber != null ) {
          ArrayList jobPostings           = subscriber.getJobPostings();
          jobTag.addTag ( Common.getListXML("JobPostings",jobPostings) );
          ContactAttributes contact       = subscriber.getContact();
          CompanyAttributes company       = subscriber.getCompany();
          jobTag.addTag ( contact.getXML() );
          jobTag.addTag ( new ValueTag("CompanyName",company.getCompanyName()) );
          ArrayList subscriptions = subscriber.getSubscriptions();
          Common.sort ( subscriptions );
          jobTag.addTag (
            new ValueTag ( "EndDate",((SubscriptionAttributes)subscriptions.get(0)).getEndDate() )
          );
        }
        document.addTag ( jobTag );
        Log.msg ( VERBOSE, document.getXML(2) );
        result = task.render ( HTMLmaker, nav, document, xsldocURLString, cacheKey );
      } else {
        throw new NavigationException (
          "subscriber.taskJobPosting:ERROR:NotLoggedInOrInsufficientAccessRights",
            task.NAVIGATION_ERROR_URL
        );
      }
    } catch ( SessionClobberedException se ) {
      throw se;
    } catch ( NavigationException ne ) {
      Log.msg ( "subscriber.taskJobPosting:ERROR:\n" + ne );
      throw ne;
    } catch ( Exception e ) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer ( 150         );
      msg.append ( "subscriber.taskJobPosting:process:" );
      msg.append ( ":ERROR:\n"                          );
      msg.append ( e.getMessage()                       );
      throw new NavigationException ( 
        msg.toString(), task.INTERNAL_ERROR_URL 
      );
    } 
    return result;
  }


}
