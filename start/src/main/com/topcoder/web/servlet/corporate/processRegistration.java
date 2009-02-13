package com.topcoder.subscriber;

import com.topcoder.common.*;
import com.topcoder.common.attr.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import com.topcoder.ejb.DataCache.*;
import com.topcoder.ejb.User.*;
import com.topcoder.ejb.AuthenticationServices.*;
import javax.transaction.*; 

public final class processRegistration {


  private static final boolean VERBOSE = true;
  private static final String XSL_DIR = "xsl/reg/";

 
  /**
   ***********************************************************************************
   * buildTag()
   * 
   * @author Greg Paul
   * @param request - the request
   * @param nav - 
   * @param document - the XML document
   * @throws ProcessingErrorException
   ************************************************************************************
   */ 
  static void buildTag(HttpServletRequest request, Navigation nav, XMLDocument document) 
    throws ProcessingErrorException { 

   }

  /**
   *************************************************************************************
   * buildLookupTags()
   * Build the XML tags to populate drop downs
   * @author Greg Paul
   * @param targetTag - the tag that we are adding to
   * @throws ProcessingErrorException
   *************************************************************************************
   */
  static void buildLookupTags(RecordTag targetTag) throws ProcessingErrorException {
    Log.msg(VERBOSE, "subscriber.processRegistration:buildLookupTags:called");
    try {
      DataCache dc = Common.getCache();
      targetTag.addTag(Common.getListXML("States", dc.getStates()));
      targetTag.addTag(Common.getListXML("Countries", dc.getCountries()));
    } catch (Exception e) {
      throw new ProcessingErrorException("subscriber.processRegistration:buildLookupTags:ERROR:"+e.getMessage());
    } 
  }
  

  /**
   *************************************************************************************
   * setCompanyUsingOffer()
   * Sets the information in the given CompanyAttributes object using the given offer number 
   * @author Greg Paul
   * @param offerNumber - an offer number that corresponds to a company
   * @param company - the company that we will fill with information
   * @return boolean - true if the offer number was found, and company was successfully set
   * false otherwise
   * @throws ProcessingErrorException
   *************************************************************************************
   */
  static boolean setCompanyUsingOffer(String offerNumber, CompanyAttributes company)
    throws ProcessingErrorException {
    Log.msg(VERBOSE, "subscriber.processRegistration:setCompanyUseringOffer():called");
    
    // put something in here when we have more definition on what an offer number is

    return false;

  }
  

  /**
   *************************************************************************************
   * modifySubscriber()
   * Makes changes to an existing subscriber
   * @author Greg Paul
   * @param user - the UserAttributes object that we're changing
   * @param  
*/

//Common.saveUser()




  /**
   *************************************************************************************
   * createSubscriber()
   * Builds the necessary attributes objects to create a new subscriber
   * @author Greg Paul
   * @param request - the HttpServletRequest that contains all the pertinant information
   * @param response
   * @param nav - the navigation object
   * @throws ProcessingErrorException
   *************************************************************************************
   */
  static void createSubscriber(HttpServletRequest request, HttpServletResponse response, Navigation nav)
    throws ProcessingErrorException {
    Log.msg(VERBOSE, "subscriber.processRegistration:createSubscriber:called");

    SubscriberAttributes subscriber = null;
    GroupUserAttributes group = null;
    HashMap userTypeDetails = null;
    ArrayList groups = null;
    boolean found = false;
    ContactAttributes contact = null;   
    CompanyAttributes offerCompany = null;
    SubscriptionAttributes subscription = null;
    boolean validOffer = false;
    UserAttributes user = null; 
    Context ctx = null;
    UserTransaction ux = null;
    UserHome uHome = null;        
    User userEJB = null;
    String code = null;

    String contactId = null;
    String companyId = null;
    String firstName = null;
    String lastName = null;
    String address1 = null;
    String address2 = null;
    String city = null;
    String stateCode = null;
    String countryCode = null;
    String zip = null;
    String phone = null;
    String fax = null;
    String email = null;
    String offerNumber = null;

    try {
      user = nav.getUser();
      userTypeDetails = user.getUserTypeDetails();
      subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");     
      subscriber.setModified("A");

      contactId = Conversion.checkNull(request.getParameter("ContactId"));
      companyId = Conversion.checkNull(request.getParameter("CompanyId"));
      firstName = Conversion.checkNull(request.getParameter("FirstName"));
      lastName = Conversion.checkNull(request.getParameter("LastName"));
      address1 = Conversion.checkNull(request.getParameter("Address1"));
      address2 = Conversion.checkNull(request.getParameter("Address2"));
      city = Conversion.checkNull(request.getParameter("City"));
      stateCode = Conversion.checkNull(request.getParameter("StateCode"));
      countryCode = Conversion.checkNull(request.getParameter("CountryCode"));
      zip = Conversion.checkNull(request.getParameter("Zip"));
      phone = Conversion.checkNull(request.getParameter("Phone"));
      fax = Conversion.checkNull(request.getParameter("Fax"));
      email = Conversion.checkNull(request.getParameter("Email"));
      offerNumber = Conversion.checkNull(request.getParameter("OfferNumber"));

      subscriber.setContact(buildContact(contactId, companyId, firstName, lastName, address1, 
        address2, city, stateCode, countryCode, zip, phone, fax, email));

      if (!offerNumber.equals(""))
        validOffer = setCompanyUsingOffer(offerNumber, subscriber.getCompany());

      if (!validOffer) {
        subscriber.getCompany().setCompanyName(request.getParameter("CompanyName"));
        subscriber.getCompany().setModified("A");
        subscriber.getCompany().setContact(buildContact(contactId, companyId, firstName, lastName,
          address1, address2, city, stateCode, countryCode, zip, phone, fax, email));   //set the company the same contact as this new subscriber
      }

      // if the user did not check the SameAsContact Info checkbox, use the info
      // from that form, otherwise we just use the same info as the contact 
      if (Conversion.checkNull(request.getParameter("SameAsContact")).equals("")) {
        contactId = Conversion.checkNull(request.getParameter("BillingContactId"));
        companyId = Conversion.checkNull(request.getParameter("BillingCompanyId"));
        firstName = Conversion.checkNull(request.getParameter("BillingFirstName"));
        lastName = Conversion.checkNull(request.getParameter("BillingLastName"));
        address1 = Conversion.checkNull(request.getParameter("BillingAddress1"));
        address2 = Conversion.checkNull(request.getParameter("BillingAddress2"));
        city = Conversion.checkNull(request.getParameter("BillingCity"));
        stateCode = Conversion.checkNull(request.getParameter("BillingStateCode"));
        countryCode = Conversion.checkNull(request.getParameter("BillingCountryCode"));
        zip = Conversion.checkNull(request.getParameter("BillingZip"));
        phone = Conversion.checkNull(request.getParameter("BillingPhone"));
        fax = Conversion.checkNull(request.getParameter("BillingFax"));
        email = Conversion.checkNull(request.getParameter("BillingEmail"));
      }

      subscriber.setDefaultBilling(buildContact(contactId, companyId, firstName, 
        lastName, address1, address2, city, stateCode, countryCode, zip, phone, fax, email));

      subscription = new SubscriptionAttributes();
      subscription.setModified("A");
      subscription.setEndDate(new Timestamp(System.currentTimeMillis() + (60*60*24*365)));
      subscription.setBillingContact(subscriber.getDefaultBilling());
      subscriber.getSubscriptions().add(subscription);

      // fill in user info
      user.setUserName(Conversion.checkNull(request.getParameter("UserName")));
      user.setPassword(Conversion.checkNull(request.getParameter("Password")));
      user.setConfirmPassword(Conversion.checkNull(request.getParameter("ConfirmPassword")));
      user.setStatus("A");
      user.setEmail(Conversion.checkNull(request.getParameter("UserEmail")));
      user.setModified("A");

      groups = user.getGroups();
      for (int i=0; i<groups.size()&&!found; i++) {
        group = (GroupUserAttributes) groups.get(i);
        if (group.getGroup().getGroupId() == Common.SUBSCRIBER_GROUP_ID)
          found=true;
      }
      if (!found) {
        group = new GroupUserAttributes();
        group.setUserId(user.getUserId());
        group.getGroup().setGroupId(Common.SUBSCRIBER_GROUP_ID);
        group.getGroup().setGroupDesc("Subscribers");
        group.setModified("A");
        user.getGroups().add(group);           
      }

      user.setSIdType("U");        //USER
      user.getDefaultUserType().setUserTypeId(Common.SUBSCRIBER_USER_TYPE_ID);
      user.getDefaultUserType().setUserTypeDesc("Subscriber");
      user.setStatus("U");
      

      ctx = TCContext.getInitial();
      ux = Common.getTransaction();
      uHome = (UserHome) ctx.lookup("UserHome");

      // create the user
      if (Tran.beginTran(ux)) {
        if (user.getModified().equals("A"))
          userEJB = uHome.create(user);
      }
      nav.setUserId(user.getUserId());

      // commit the transcation
      if (!Tran.commitTran(ux)) {
        throw new ProcessingErrorException("subscriber:processRegistration:save:ERROR:\n" +
          "failed to commit user insert");
      }

      code = processAuthentication.generateActivationCode(Integer.toString(user.getUserId()));
      subscriber.setActivationCode(code);

      // if we've made it this far, the user should be created...
      // so send them an activation email
      try {
        Mail.sendActivationMail( nav.getUserId(), user.getEmail(),
          nav.getSubscriberURL(request, response), nav.cookiesEnabled(request, response),
          code, user.getUserName(), user.getPassword() );
      } catch (ProcessingErrorException pe) {
        throw new NavigationException("taskRegistration:sendMail:ERROR\n"+pe,
          "fake_error_page.xsl");
      }




    } catch (Exception e) {
      try {
        if ( ux.getStatus()==Status.STATUS_ACTIVE ) {
          if (!Tran.rollbackTran(ux)) {
            throw new ProcessingErrorException("subscriber:taskRegistration:createSubscriber:user insert rollback failed:\n"+e.getMessage());
          }
        }
      } catch (Exception te) {
        throw new NavigationException("subscriber:taskRegistration:createSubscriber:failed to roll back transaction.\n" + te.getMessage(),
          "fake_error_page");
      }
      e.printStackTrace();
      throw new NavigationException("taskRegistration:displayRegSave:ERROR:\n"+e,
        "fake_error_page.xsl");
    } finally {
      if (ctx!=null){try {ctx.close();}catch (Exception ignore) {} }
    }   
  }


  /**
   *******************************************************************************************
   * buildContact()
   * Builds a ContactAttributes object from the given information
   * @author Greg Paul
   * @param contactId
   * @param companyId
   * @param lastName
   * @param address1
   * @param address2
   * @param city
   * @param stateCode
   * @param countryCode
   * @param zip
   * @param phone
   * @param fax
   * @param email
   * @return ContactAttributes - the object we've created
   *******************************************************************************************
   */
  private static ContactAttributes buildContact(String contactId,
                                                String companyId,
                                                String firstName,
                                                String lastName,
                                                String address1,
                                                String address2,
                                                String city,
                                                String stateCode,
                                                String countryCode,
                                                String zip,
                                                String phone,
                                                String fax,
                                                String email) {

    Log.msg(VERBOSE, "subscriber.processRegistration:buildContact:called");
    
    ContactAttributes result = new ContactAttributes();

    if (!contactId.equals(""))
      result.setContactId(Conversion.convertStringToInt(contactId));
    if (!companyId.equals(""))
      result.setCompanyId(Conversion.convertStringToInt(companyId));
    result.setFirstName(firstName);
    result.setLastName(lastName);
    result.setAddress1(address1);
    result.setAddress2(address2);
    result.setCity(city);
    result.getState().setStateCode(stateCode);
    result.getCountry().setCountryCode(countryCode);
    result.setZip(zip);
    result.setPhone(phone);
    result.setFax(fax);
    result.setEmail(email);
   
    result.setModified("A");    
 
    return result;
  }


  /**
   *******************************************************************************
   * isValidUserName()
   * Determines is the given user name is valid.
   * @author Greg Paul
   * @param name - the name that we're checking
   * @return boolean - true if this is a valid user name, false otherwise
   * @throws NavigationException
   *******************************************************************************
   */
  static boolean isValidUserName(String name) throws NavigationException {
    Log.msg(VERBOSE, "subscriber.processRegistration:isValidUserName:called");

    Context ctx = null;
    AuthenticationServicesHome aHome = null;
    AuthenticationServices aServices = null; 

    if ((name.length()>1 && name.substring(0, 2).compareToIgnoreCase("tc")==0) ||
       (name.length()>7 && name.substring(0, 8).compareToIgnoreCase("topcoder")==0) || 
       (name.length()>8 && name.substring(0, 9).compareToIgnoreCase("top_coder")==0))
       return false;
    
    try {  
      ctx = TCContext.getInitial();
      aHome = (AuthenticationServicesHome) ctx.lookup("jma.AuthenticationServicesHome");
      aServices = aHome.create();
      return aServices.validUserName(name);

    } catch (Exception e) {
      throw new NavigationException("subscriber.taskRegistration:process:ERROR:checking valid username:\n"+e,
        task.NAVIGATION_ERROR_URL);
    } finally {
      if (ctx!=null) {try {ctx.close();} catch(Exception ignore) {} }
    }
  } 






}
