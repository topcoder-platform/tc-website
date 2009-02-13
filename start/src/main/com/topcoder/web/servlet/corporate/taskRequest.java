package corporate;

import com.topcoder.common.*;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.xml.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import com.topcoder.ejb.CorporateContactServices.*;


public final class taskRequest {


  private static final String XSL_DIR = task.XSL_URL + "request/";
  //private static final String[] NOTIFY_EMAIL = { "sburrows@topcoder.com" };
  private static final String[] NOTIFY_EMAIL = { "dvaughn@topcoder.com", "rhughes@topcoder.com"};


  ////////////////////////////////////////////////////////////////////////////////
  static String process (HttpServletRequest request, HttpServletResponse response,
                       RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result            = null;
    User user      = null;
    try {
      String xsldocURLString = null;
      String cacheKey        = null;
      String requestCommand = Conversion.checkNull ( request.getParameter("Command") );
      if ( requestCommand.equals("") ) {
        xsldocURLString = XSL_DIR + "request.xsl";
        result = task.render ( HTMLmaker, nav, document, xsldocURLString, cacheKey );
      } else if ( requestCommand.equals("req_save") ) {
        result = saveRequest ( HTMLmaker, request, response, nav, document ); 
      }
    } catch (NavigationException ne) {
      Log.msg ( "taskRequest:ERROR:\n" + ne );
      throw ne;
    } catch (Exception e) {
      StringBuffer msg = new StringBuffer ( 150                                );
      msg.append ( "taskRequest:process:"                                      );
      msg.append ( ":ERROR:\n"                                                 );
      msg.append ( e.getMessage()                                              );
      throw new NavigationException ( msg.toString(), task.INTERNAL_ERROR_URL  );
    } 
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String saveRequest (RenderHTML HTMLmaker, HttpServletRequest request,
    HttpServletResponse response, Navigation nav, XMLDocument document)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    Context ctx = null;
    try {
      String screen = Conversion.checkNull ( request.getParameter("Screen")                     );
      if ( screen.equals("request") ) {
        CorporateContact corporateRequest = new CorporateContact();
        corporateRequest.setModified    ( "A"                                                   );
        corporateRequest.setResponseSent( "N"                                                   );
        corporateRequest.setCompanyName ( Conversion.clean(request.getParameter("CompanyName")) );
        String strCompanySize = Conversion.checkNull ( request.getParameter("CompanySize")      );
        int companySize = 0;
        if ( !strCompanySize.equals("") ) {
          companySize = Integer.parseInt   ( strCompanySize                                     );
          corporateRequest.setCompanySize ( companySize                                         );
        }
        corporateRequest.setFirstName   ( Conversion.clean(request.getParameter("FirstName"))   );
        corporateRequest.setMiddleName  ( Conversion.clean(request.getParameter("MiddleName"))  );
        corporateRequest.setLastName    ( Conversion.clean(request.getParameter("LastName"))    );
        corporateRequest.setTitle       ( Conversion.clean(request.getParameter("Title"))       );
        corporateRequest.setPhone       ( Conversion.clean(request.getParameter("Phone"))       );
        corporateRequest.setEmail       ( Conversion.clean(request.getParameter("Email"))       );
        String comment = Conversion.checkNull ( request.getParameter("Comment")                 );
        corporateRequest.setComment     ( comment                        );
        ctx = TCContext.getInitial();
        CorporateContactServicesHome home = (CorporateContactServicesHome) ctx.lookup("jma.CorporateContactServicesHome");
        CorporateContactServices corpBean = home.create();
        corpBean.saveCorporateContact ( corporateRequest );

        EMailMessage mail = new EMailMessage();
        for ( int i=0; i < NOTIFY_EMAIL.length; i++ ) {
          mail.setMailSubject     ( "New Sponsor Contact" );
          mail.setReason          ( "sponsor" );
          mail.setMailSentDate    ( new java.sql.Date(System.currentTimeMillis()) );
          StringBuffer msg        = new StringBuffer ( 1000 );
          msg.append              ( "Corporate Partner Request for Information Posted:\n");
          msg.append              ( "\nCompany Name:  " );
          msg.append              ( corporateRequest.getCompanyName() );
          msg.append              ( "\nCompany Size:  " );
          msg.append              ( corporateRequest.getCompanySize() );
          msg.append              ( "\nFirst Name:    " );
          msg.append              ( corporateRequest.getFirstName() );
          msg.append              ( "\nMiddle Name:   " );
          msg.append              ( corporateRequest.getMiddleName() );
          msg.append              ( "\nLast Name:     " );
          msg.append              ( corporateRequest.getLastName() );
          msg.append              ( "\nTitle:         " );
          msg.append              ( corporateRequest.getTitle() );
          msg.append              ( "\nEMail:         " );
          msg.append              ( corporateRequest.getEmail() );
          msg.append              ( "\nPhone:         " );
          msg.append              ( corporateRequest.getPhone() );
          msg.append              ( "\nMessage:     \n" );
          msg.append              ( corporateRequest.getComment() );
          mail.setMailText        ( msg.toString() );
          mail.setMailFromAddress ( "service@topcoder.com" );
          mail.setMode            ( "S" );
          mail.setMailToAddress   ( NOTIFY_EMAIL[i] );
          Mail.sendMail           ( mail );
        }
        String xsldocURLString = XSL_DIR + "thank_you.xsl";
        String cacheKey = null;
        result = task.render ( HTMLmaker, nav, document, xsldocURLString, cacheKey );
      } else {
        throw new NavigationException ( 
          "taskRequest:saveRequest:ERROR:invalid screen submission" 
          ,task.NAVIGATION_ERROR_URL
        );
      }
    } catch (NavigationException ne) {
      throw ne;
    } catch (Exception e) {
      e.printStackTrace();
      throw new NavigationException (
        "taskRequest:saveRequest:ERROR:\n" + e.getMessage()
        ,task.INTERNAL_ERROR_URL);
    } finally {
      if ( ctx != null ) try { ctx.close(); ctx = null; } catch ( Exception ignore ) {}
    }
    return result;
  }


}
