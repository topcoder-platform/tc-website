package com.topcoder.web.screening.request;

import com.topcoder.web.common.RequestProcessor;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import com.topcoder.web.ejb.session.*;

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
             InitialContext context = new InitialContext();
             SessionHome sHome = (SessionHome)PortableRemoteObject.narrow(context.lookup(SessionHome.class.getName()), SessionHome.class);
             Session session = sHome.create();
        
         String testprofile=getRequest().getParameter("testprofile");
         String candidate=getRequest().getParameter("candidate");
         String beginmonth=getRequest().getParameter("beginmonth");
         String beginday=getRequest().getParameter("beginday");
         String beginyear=getRequest().getParameter("beginyear");
         String begintod=getRequest().getParameter("begintod");
         Date bDate = formDate(beginday,beginmonth,beginyear,begintod);
         if(bDate==null)throw new Exception("Bad start date!");
         java.sql.Date cbDate = new java.sql.Date(bDate.getTime());
         String endmonth=getRequest().getParameter("endmonth");
         String endday=getRequest().getParameter("endday");
         String endyear=getRequest().getParameter("endyear");
         String endtod=getRequest().getParameter("endtod");
         Date eDate = formDate(endday,endmonth,endyear,endtod);
         if(eDate==null)throw new Exception("Bad ending date!");
         java.sql.Date ceDate = new java.sql.Date(eDate.getTime());
         String candidateemail=getRequest().getParameter("candidateemail");
         String adminemail=getRequest().getParameter("adminemail");
         String command=getRequest().getParameter("command");
         if(command.equals("save")){
             session.createSession(100L,100L,cbDate,ceDate,candidateemail.equals("TRUE"),adminemail.equals("TRUE"),100L);
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
     
     public Date formDate(String day,String month,String year,String tod)
     {
         GregorianCalendar gc = new GregorianCalendar();
         String months[] = new String[]{"April","August","December","February","January","June","July","March","May","November","October","September"};
         if(Arrays.binarySearch(months,month)==-1) return null;
         int monthCode[] = new int[]{Calendar.APRIL,Calendar.AUGUST,Calendar.DECEMBER,Calendar.FEBRUARY,Calendar.JANUARY,Calendar.JUNE,Calendar.JULY,Calendar.MARCH,Calendar.MAY,
         Calendar.NOVEMBER,Calendar.OCTOBER,Calendar.SEPTEMBER};
         gc.set(Calendar.MONTH,monthCode[Arrays.binarySearch(months,month)]);
         gc.set(Calendar.DAY_OF_MONTH,Integer.parseInt(day));
         gc.set(Calendar.YEAR,Integer.parseInt(year));
         int todint = (tod.endsWith("PM")?12:0)+(Integer.parseInt(tod.substring(0,2))%12);
         gc.set(Calendar.HOUR,todint);
         return gc.getTime();
     }
     
 }
 
