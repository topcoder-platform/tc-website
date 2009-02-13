package com.topcoder.subscriber;

import com.topcoder.common.*;
import com.topcoder.common.attr.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import com.topcoder.ejb.DataCache.*;


public final class processJobPosting {


  private static final boolean VERBOSE = true;


  ////////////////////////////////////////////////////////////////////////////////
  static void buildTag ( HttpServletRequest request, Navigation nav, XMLDocument document )
    throws ProcessingErrorException {
  ////////////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "subscriber.processJobPosting:buildTag:called" );
    try {
      if ( nav.getLoggedIn() && processAuthentication.hasMinimumPermission(nav.getUser()) ) {
        HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
        SubscriberAttributes subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");
        RecordTag jobPostingsTag = new RecordTag ( "JobPostings" );
        ArrayList jobPostings = subscriber.getJobPostings();
        for ( int i = 0; i < jobPostings.size(); i++ ) {
          JobPostingAttributes jobPosting = (JobPostingAttributes) jobPostings.get(i);
          if ( jobPosting.getStatus().equals("A") ) {
            jobPostingsTag.addTag ( jobPosting.getXML() );
          }
        }
        document.addTag ( jobPostingsTag );
        String jumpToJob = Conversion.checkNull ( request.getParameter("JumpToJob") );
        if ( jumpToJob.equals("Y") ) {
          document.addTag ( new ValueTag("JumpToJob","Y") );
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new ProcessingErrorException ( 
        "subscriber.processJobPosting:buildTag:ERROR:"+e.getMessage()
      );
    }
  }


  ////////////////////////////////////////////////////////////////////////////////
  static void buildLookupTags ( RecordTag jobTag ) throws ProcessingErrorException {
  ////////////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "subscriber.processJobPosting:buildLookupTags:called" );
    try {
      DataCache cache = Common.getCache();
      jobTag.addTag ( Common.getListXML("JobLevels",cache.getJobLevels()) );
      jobTag.addTag ( Common.getListXML("PayPeriods",cache.getPayPeriods()) );
      jobTag.addTag ( Common.getListXML("JobTypes",cache.getJobTypes()) );
      jobTag.addTag ( Common.getListXML("States",cache.getStates()) );
      jobTag.addTag ( Common.getListXML("Countries",cache.getCountries()) );
    } catch ( Exception e ) {
      e.printStackTrace();
      throw new ProcessingErrorException (
        "subscriber.processJobPosting:buildLookupTags:ERROR:"+e.getMessage()
      );
    } 
  }


  ////////////////////////////////////////////////////////////////////////////////
  static void evalMode ( HttpServletRequest request, HttpServletResponse response, 
    Navigation nav, RecordTag jobTag ) throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    boolean removeUnselected            = false;
    String mode                         = "Insert";
    JobPostingAttributes editJobPosting = null;
    try {
      /////////////////////////////////////
      // EVALUATE MODE TO PROCESS SESSION 
      /////////////////////////////////////
      if ( request.getParameterValues("Mode")!=null ) {
        mode = (String) request.getParameter ( "Mode" );
        //************************ insert mode *************************
        HashMap sessionObjects = nav.getSessionObjects();
        if ( mode.equals("") || mode.equals("Insert") ) {
          if ( sessionObjects.containsKey("PreviewJobPosting") ) {
            editJobPosting = (JobPostingAttributes) sessionObjects.get("PreviewJobPosting");
          } else { 
            editJobPosting = new JobPostingAttributes();
            editJobPosting.setModified ( "A" );
          }
        } 
        //************************ save mode *************************
        else if ( mode.equals("Save") ) {
          processJobPosting.save (nav, request);
          Common.saveUser ( nav );
          sessionObjects.remove ( "PreviewJobPosting" );
          mode = "Insert";
        }
        //************************ preview mode *************************
        else if ( mode.equals("Preview") ) {
          processJobPosting.save (nav, request);
          editJobPosting = (JobPostingAttributes) sessionObjects.get("PreviewJobPosting");
          jobTag.addTag( new ValueTag("PreviewId", editJobPosting.getJobPostingId()) );
          mode = "Edit";
        }
        //************************ edit mode *************************
        else if ( mode.equals("Edit") ) {
          String EditJobPostingId = Conversion.checkNull ( request.getParameter("EditJobPostingId") );
          editJobPosting = processJobPosting.get ( nav.getUser(), EditJobPostingId );
          sessionObjects.remove ( "PreviewJobPosting" );
        } 
        //************************ delete mode *************************
        else if ( mode.equals("Delete") ) {
          String EditJobPostingId = Conversion.checkNull ( request.getParameter("EditJobPostingId") );
          processJobPosting.delete ( nav.getUser(), EditJobPostingId );
          Common.saveUser ( nav );
          sessionObjects.remove ( "PreviewJobPosting" );
          mode = "Insert";
        } 
        //************************ cancel mode *************************
        else if ( mode.equals("Cancel") ) {
          sessionObjects.remove ( "PreviewJobPosting" );
          mode = "Insert";
        }
      }
      jobTag.addTag( new ValueTag("Mode", mode) );
      if ( editJobPosting != null ) {
        RecordTag editRec = new RecordTag("Edit");
        editRec.addTag ( editJobPosting.getXML() );
        jobTag.addTag ( editRec );
        if (VERBOSE) {
          XMLDocument test = new XMLDocument ( "new"  );
          test.addTag ( jobTag );
          System.out.println ( test.getXML(2) );
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new NavigationException ( 
        "subscriber.processJobPosting:evalMode:ERROR:"+e.getMessage(),
        task.NAVIGATION_ERROR_URL
      );
    }
  }


  /*******************************************************************************
   * add the XML for a preview of the current job posting to the job RecordTag
   * 
   * @author Steve Burrows
   * @param HttpServletRequest request
   * @param Navigation nav
   * @param RecordTag jobTag
   * @throws NavigationException
  ********************************************************************************
  */
  ////////////////////////////////////////////////////////////////////////////////
  static void preview ( HttpServletRequest request, Navigation nav, RecordTag jobTag )
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    JobPostingAttributes previewPosting = null;
    try {
      HashMap sessionObjects = nav.getSessionObjects();
      previewPosting = (JobPostingAttributes) sessionObjects.get ( "PreviewJobPosting" );
      if ( previewPosting != null ) {
        jobTag.addTag ( previewPosting.getXML() );
        jobTag.addTag( new ValueTag("DisableLinks","Y") );
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new NavigationException (
        "subscriber.processJobPosting:preview:ERROR:"+e.getMessage(),
        task.NAVIGATION_ERROR_URL
      );
    }
  }


  /*******************************************************************************
   * save build a JobPostingAttributes object from the given information and either
   * add it to the user's list of JobPostings or update a particular member of that
   * list
   * @author Greg Paul
   * @param UserAttributes user
   * @param HttpServletRequest request
   * @throws ProcessingErrorException
  ********************************************************************************
  */
  static void save (Navigation nav, HttpServletRequest request)
    throws ProcessingErrorException {

    Log.msg(VERBOSE,"XXX in processJobPosting.save()");

    SubscriberAttributes subscriber = null;
    JobPostingAttributes save = null;
    ContactAttributes contact = null;
    ////////////////////Dear Special, I put this in for preview... Steve///////////////////
    ArrayList payPeriods = null;
    ArrayList jobLevels = null;
    ArrayList jobTypes = null;
    ArrayList states = null;
    ArrayList countries = null;
    ///////////////////////////////////////////////////////////////////////////////////////
    try {

      String jobPostingId = Conversion.checkNull(request.getParameter("JobPostingId"));
      String subscriberId = Conversion.checkNull(request.getParameter("SubscriberId"));
      String title = Conversion.clean(request.getParameter("Title"));
      String salaryMin = Conversion.checkNull(request.getParameter("SalaryMin"));
      String salaryMax = Conversion.checkNull(request.getParameter("SalaryMax"));
      String payPeriodId = Conversion.checkNull(request.getParameter("PayPeriodId"));
      String jobLevelId = Conversion.checkNull(request.getParameter("JobLevelId"));
      String jobTypeId = Conversion.checkNull(request.getParameter("JobTypeId"));
      String description = Conversion.checkNull(request.getParameter("Description"));
      String city = Conversion.checkNull(request.getParameter("City"));
      String stateCode = Conversion.checkNull(request.getParameter("StateCode"));
      String countryCode = Conversion.checkNull(request.getParameter("CountryCode"));
      String ad = Conversion.checkNull(request.getParameter("Ad"));
      ////////////////////Dear Special, I put this in for preview... Steve///////////////////
      String mode = Conversion.checkNull(request.getParameter("Mode"));
      String status = Conversion.checkNull(request.getParameter("Status"));
      ///////////////////////////////////////////////////////////////////////////////////////

      if ( mode.equals("Preview") ) {
        DataCache cache = Common.getCache();
        payPeriods = cache.getPayPeriods(); 
        jobLevels = cache.getJobLevels(); 
        jobTypes = cache.getJobTypes();
        states = cache.getStates();
        countries = cache.getCountries();
      }
      HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
      subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");
      save = new JobPostingAttributes();
      if ( status.equals("") ) {
        save.setStatus ( "U" );
      } else {
        Log.msg ( VERBOSE, "STEVE SAY'S status="+status );
        save.setStatus ( status );
      }
      Log.msg ( VERBOSE, "STEVE SAY'S jobPostingId="+jobPostingId );
      if ( !(jobPostingId.equals("")||jobPostingId.equals("0")) ) {
        save.setModified("U");
        save.setJobPostingId(Conversion.convertStringToInt(jobPostingId));
      } else {
        save.setModified("A");
      }
      save.setSubscriberId(subscriber.getSubscriberId());
      save.setTitle(title);
      if (!salaryMin.equals(""))
        save.setSalaryMin(Conversion.convertStringToInt(salaryMin));
      if (!salaryMax.equals(""))
        save.setSalaryMax(Conversion.convertStringToInt(salaryMax));
      if (!payPeriodId.equals("")) {
        int id = Conversion.convertStringToInt(payPeriodId);
        save.getPayPeriod().setPayPeriodId(id);
        if ( mode.equals("Preview") ) {
          for ( int i = 0; i < payPeriods.size(); i++ ) {
            PayPeriodAttributes payPeriod = (PayPeriodAttributes) payPeriods.get(i);
            if ( payPeriod.getPayPeriodId() == id ) {
              save.getPayPeriod().setPayPeriodDesc(payPeriod.getPayPeriodDesc());
            }
          }
        }
      }
      if (!jobLevelId.equals("")) {
        int id = Conversion.convertStringToInt(jobLevelId);
        save.getJobLevel().setJobLevelId(id);
        if ( mode.equals("Preview") ) {
          for ( int i = 0; i < jobLevels.size(); i++ ) {
            JobLevelAttributes jobLevel = (JobLevelAttributes) jobLevels.get(i);
            if ( jobLevel.getJobLevelId() == id ) {
              save.getJobLevel().setJobLevelDesc(jobLevel.getJobLevelDesc());
            }
          }
        }
      }
      if (!jobTypeId.equals("")) {
        int id = Conversion.convertStringToInt(jobTypeId);
        save.getJobType().setJobTypeId(id);
        if ( mode.equals("Preview") ) {
          for ( int i = 0; i < jobTypes.size(); i++ ) {
            JobTypeAttributes jobType = (JobTypeAttributes) jobTypes.get(i);
            if ( jobType.getJobTypeId() == id ) {
              save.getJobType().setJobTypeDesc(jobType.getJobTypeDesc());
            }
          }
        }
      }
      save.setDescription(Conversion.clean(description));
      save.setCity(city);
      if (!stateCode.equals("")) {
        save.getState().setStateCode(stateCode);
        if ( mode.equals("Preview") ) {
          for ( int i = 0; i < states.size(); i++ ) {
            StateAttributes state = (StateAttributes) states.get(i);
            if ( state.getStateCode().equals(stateCode) ) {
              save.getState().setStateName(state.getStateName());
            }
          }
        }
      }
      if (!countryCode.equals("")) {
        save.getCountry().setCountryCode(countryCode);
        if ( mode.equals("Preview") ) {
          for ( int i = 0; i < countries.size(); i++ ) {
            CountryAttributes country = (CountryAttributes) countries.get(i);
            if ( country.getCountryCode().equals(countryCode) ) {
              save.getCountry().setCountryName(country.getCountryName());
            }
          }
        }
      }
      save.setAd(ad);

      if (save.getAd().equals("Y")) {  //if it's an ad, load billing contact info
        save.setBillingContact(subscriber.getDefaultBilling());

        String adCompanyName = Conversion.checkNull(request.getParameter("AdCompanyName"));
        String adFirstName = Conversion.checkNull(request.getParameter("AdFirstName"));
        String adMiddleName = Conversion.checkNull(request.getParameter("AdMiddleName"));
        String adLastName = Conversion.checkNull(request.getParameter("AdLastName"));
        String adAddress1 = Conversion.checkNull(request.getParameter("AdAddress1"));
        String adAddress2 = Conversion.checkNull(request.getParameter("AdAddress2"));
        String adCity = Conversion.checkNull(request.getParameter("AdCity"));
        String adStateCode = Conversion.checkNull(request.getParameter("AdStateCode"));
        String adCountryCode = Conversion.checkNull(request.getParameter("AdCountryCode"));
        String adZip = Conversion.checkNull(request.getParameter("AdZip"));
        String adPhone = Conversion.checkNull(request.getParameter("AdPhone"));
        String adFax = Conversion.checkNull(request.getParameter("AdFax"));
        String adEmail = Conversion.checkNull(request.getParameter("AdEmail"));

        save.setAdCompanyName(adCompanyName);
        save.setAdFirstName(adFirstName);
        save.setAdMiddleName(adMiddleName);
        save.setAdLastName(adLastName);
        save.setAdAddress1(adAddress1);
        save.setAdAddress2(adAddress2);
        save.setAdCity(adCity);

        if (!adStateCode.equals("")) {
          save.getAdState().setStateCode(adStateCode);
          if ( mode.equals("Preview") ) {
            for ( int i = 0; i < states.size(); i++ ) {
              StateAttributes state = (StateAttributes) states.get(i);
              if ( state.getStateCode().equals(adStateCode) ) {
                save.getAdState().setStateName(state.getStateName());
              }
            }
          }
        }
        if (!adCountryCode.equals("")) {
          save.getAdCountry().setCountryCode(adCountryCode);
          if ( mode.equals("Preview") ) {
            for ( int i = 0; i < countries.size(); i++ ) {
              CountryAttributes country = (CountryAttributes) countries.get(i);
              if ( country.getCountryCode().equals(adCountryCode) ) {
                save.getAdCountry().setCountryName(country.getCountryName());
              }
            }
          }
        }

        save.setAdZip(adZip);
        save.setAdPhone(adPhone);
        save.setAdFax(adFax);
        save.setAdEmail(adEmail);      

      }
      if ( mode.equals("Preview") ) {
        HashMap sessionObjects = nav.getSessionObjects();
        sessionObjects.put ( "PreviewJobPosting", save  );
        if (VERBOSE) {
          XMLDocument saveDoc = new XMLDocument("PREVIEW_POSTING");
          saveDoc.addTag ( save.getXML() );
          Log.msg ( saveDoc.getXML(2) );
        }
      } else {
        ArrayList jobPostings = subscriber.getJobPostings();
        boolean updated = false;
        int tempJobPostingId = 0;
        for (int i=0; i < jobPostings.size(); i++) {
          JobPostingAttributes jobPosting = (JobPostingAttributes) jobPostings.get(i);
          if ( save.getJobPostingId()!=0 && jobPosting.getJobPostingId()==save.getJobPostingId() ) {
            save.setModified ( "U" );
            jobPostings.set ( i, save );
            updated = true;
          }
        }
        if ( !updated ) {
          jobPostings.add ( save );
        }
        if (VERBOSE) {
          XMLDocument saveDoc = new XMLDocument("SAVED_POSTING");
          saveDoc.addTag ( save.getXML() );
          Log.msg ( saveDoc.getXML(2) );
        }
      }
    } catch (Exception e) {
      throw new ProcessingErrorException (   
        "subscriber.processJobPosting:save:ERROR:"+e.getMessage() 
      );
    }
  }


  //////////////////////////////////////////////////////////////////////////
  static JobPostingAttributes get ( UserAttributes user, String jobPostingId ) 
    throws ProcessingErrorException {
  //////////////////////////////////////////////////////////////////////////
    JobPostingAttributes result = null;
    try {
      HashMap userTypeDetails = user.getUserTypeDetails();
      SubscriberAttributes subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");
      if ( jobPostingId == null || jobPostingId.equals("") ) {
        throw new ProcessingErrorException (
          "processCoder:get:ERROR:invalid job posting id."
        );
      }
      int intJobPostingId = Integer.parseInt ( jobPostingId );
      ArrayList jobPostings = subscriber.getJobPostings();
      for (int i=0; i<jobPostings.size(); i++) { 
        JobPostingAttributes jobPosting = (JobPostingAttributes) jobPostings.get(i);
        if ( jobPosting.getJobPostingId() == intJobPostingId ) {
          result = jobPosting;
        }
      }
    } catch ( Exception e ) {
      throw new ProcessingErrorException ( 
        "subscriber.processJobPosting:get:ERROR:"+e.getMessage() 
      );
    }
    return result;
  }


  //////////////////////////////////////////////////////////////////////////
  static void delete ( UserAttributes user, String editJobPostingId ) 
    throws ProcessingErrorException {
  //////////////////////////////////////////////////////////////////////////
    try {
      HashMap userTypeDetails = user.getUserTypeDetails();
      SubscriberAttributes subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");
      if ( editJobPostingId != null && !editJobPostingId.equals("") ) {
        ArrayList jobPostings = subscriber.getJobPostings();
        int jobPostingSize = jobPostings.size();
        HashMap sessionHash = new HashMap ( jobPostingSize );
        int i = 0;
        JobPostingAttributes jobPosting = null;
        for ( ; i < jobPostingSize; i++ ) {
          jobPosting = (JobPostingAttributes) jobPostings.get(i);
          Integer hashKey = new Integer( jobPosting.getJobPostingId() );
          sessionHash.put ( hashKey, jobPosting );
        }
        StringTokenizer jobIds = new StringTokenizer ( editJobPostingId, "," );
        while ( jobIds.hasMoreTokens() ) {
          Integer lookup = new Integer ( jobIds.nextToken() );
          if ( sessionHash.containsKey(lookup) ) {
            jobPosting = (JobPostingAttributes) sessionHash.get ( lookup );
            jobPosting.setStatus   ( "I" );
            jobPosting.setModified ( "U" );
          }
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new ProcessingErrorException (
        "subscriber.processJobPosting:delete:ERROR:\n"+e.getMessage()
      );
    }
  }

}
