package com.topcoder.web.screening.request;

import com.topcoder.web.common.RequestProcessor;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

/** getRequest() Processor for Session Set-up getRequest()s.
 * @author Nathaniel Dean
 * @date 27-Dec-2002
 * @version 1.0.0
 * History
 * version 1.0.0 -- 27-Dec-2002 -- created.
 */
 
 public class SessionSetup extends BaseProcessor{
     public void process(){
         try{
         String testprofile=getRequest().getParameter("testprofile");
         String candidate=getRequest().getParameter("candidate");
         String beginmonth=getRequest().getParameter("beginmonth");
         String beginday=getRequest().getParameter("beginday");
         String beginyear=getRequest().getParameter("beginyear");
         String begintod=getRequest().getParameter("begintod");
         String endmonth=getRequest().getParameter("endmonth");
         String endday=getRequest().getParameter("endday");
         String endyear=getRequest().getParameter("endyear");
         String endtod=getRequest().getParameter("endtod");
         String candidateemail=getRequest().getParameter("candidateemail");
         String adminemail=getRequest().getParameter("adminemail");
         String command=getRequest().getParameter("command");
         if(command.equals("save")){
             //add it through the beans
         } else if(command.equals("view")){
             //load it through the beans, put it in the response
             //and load the confirm page
         } else if(command.equals("remove")){
             //remove it through the beans,
             //and return to overall view webpage.
         } else {
             //I didn't understand the command
             setNextPage("errorPage.jsp?error=\"SessionSetup was given an illegal command:"+command+"\"");
         }
         }catch(Exception e){
             setNextPage("errorPage.jsp?error=\"Unrecoverable error in session setup processing."+e.getMessage()+"\"");
             return;
         }
     }
 }
 
