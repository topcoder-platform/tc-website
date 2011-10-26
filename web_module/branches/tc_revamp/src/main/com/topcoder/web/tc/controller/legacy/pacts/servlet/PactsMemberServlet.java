package com.topcoder.web.tc.controller.legacy.pacts.servlet;

/**
 * this class is the main class that processes incoming requests for
 * the pacts system.  It expects that the session parameter t (task)
 * is equal to pacts and will act on the specified command.  After
 * figuring out which command it is and getting the arguments
 * (coder_id, etc), the sevlet queries the database to get the
 * relevant information.  Then the response is forwarded to the
 * appropriate JSP.  As is the case with the main site, all authentication
 * information is passed using a session Navigation object.
 *
 * @author Sam King
 * @see com.topcoder.common.web.data.Navigation
 * @see PactsMemberTableModel
 */

import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.RequestTracker;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.AffidavitBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.ContractBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.PaymentBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.UserTaxFormBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitWithText;
import com.topcoder.web.tc.controller.legacy.pacts.common.ContractHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.ContractWithText;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsMemberTableModel;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxFormHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxFormWithText;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 */
public class PactsMemberServlet extends BaseServlet implements PactsConstants {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    private static Logger log = Logger.getLogger(PactsMemberServlet.class);

    /**
     * Used for modules. It checks that the user is authenticated.
     */
    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return !auth.getActiveUser().isAnonymous();
    }


    /**
     * this method handles all incoming http get requests.  It will
     * check to make sure the session has been autheniticated and that
     * the parameters are valid.  If the session is not authenticated,
     * it is forwarded to the login jsp.
     * <p/>
     * Expected Session Parameters
     * ---------------------------
     * t - a session parameter that is used to specify
     * the task.
     * c - a session parameter that is used to specify the command.
     * examples include affidavit_history, payment_history, etc.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {

                if (request.getParameter(MODULE) != null || request.getAttribute(MODULE) != null) {
                    process(request, response);
                } else {
                    TCRequest tcRequest = HttpObjectFactory.createRequest(request);
                    TCResponse tcResponse = HttpObjectFactory.createResponse(response);
                    //set up security objects and session info
                    WebAuthentication authentication = createAuthentication(tcRequest, tcResponse);
                    TCSubject user = getUser(authentication.getActiveUser().getId());
                    SessionInfo info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
                    tcRequest.setAttribute(SESSION_INFO_KEY, info);
                    //todo perhaps this should be configuraable...so implementing classes
                    //todo don't have to do it if they don't want to
                    RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

                    // check to see if the user has not logged in
                    if (info.isAnonymous()) {
                        // forward to login page
                        String errorURL = request.getRequestURI();
                        errorURL += (request.getQueryString() == null) ? "" : "?" + request.getQueryString();
                        StringBuffer buf = new StringBuffer();
                        for (int idx = 0; idx < errorURL.length(); idx++) {
                            char c = errorURL.charAt(idx);
                            String str = (c == '&') ? "%26" : c + "";
                            buf.append(str);
                        }
                        errorURL = buf.toString();

                        response.sendRedirect("http://" + request.getServerName() + "/tc?module=Login&c=login&message=" + "You must log in to view this portion of the site.&nextpage=" + errorURL);
                        return;

                    } else {
                        log.debug("we got the nav object");
                    }

                    String t = StringUtils.checkNull(request.getParameter(TASK_STRING));
                    String c = StringUtils.checkNull(request.getParameter(CMD_STRING));

                    log.debug("t= " + t + " c= " + c);
                    if (t.equals(AFFIDAVIT_TASK)) {
                        if (c.equals(AFFIDAVIT_DETAILS_CMD)) {
                            doAffidavitDetails(request, response);
                        } else if (c.equals(AFFIDAVIT_RENDER_CMD)) {
                            doAffidavitRender(request, response);
                        } else if (c.equals(AFFIDAVIT_HISTORY_CMD)) {

                            fetchRegularPage(request, response, info.getServletPath() + "?" + MODULE + "=AffidavitHistory", false);
                        } else {
                            throw new NavigationException();
                        }
                    } else if (t.equals(CONTRACT_TASK)) {
                        // it is a contract task
                        if (c.equals(CONTRACT_HISTORY_CMD)) {
                            doContractHistory(request, response);
                        } else if (c.equals(CONTRACT_PAYMENT_SUMMARY_CMD)) {
                            doContractPaymentSummary(request, response);
                        } else if (c.equals(CONTRACT_DETAILS_CMD)) {
                            doContractDetails(request, response);
                        } else {
                            throw new NavigationException();
                        }
                    } else if (t.equals(PAYMENT_TASK)) {
                        // it is a payment task
                        if (c.equals(PAYMENT_HISTORY_CMD)) {
                            doPaymentHistory(request, response);
                        } else if (c.equals(PAYMENT_DETAILS_CMD)) {
                            doPaymentDetails(request, response);
                        } else {
                            throw new NavigationException();
                        }
                    } else if (t.equals(TAX_FORM_TASK)) {
                        // it is a user tax for task
                        if (c.equals(TAX_FORM_HISTORY_CMD)) {
                            doTaxFormHistory(request, response);
                        } else if (c.equals(TAX_FORM_DETAILS_CMD)) {
                            doTaxFormDetails(request, response);
                        } else {
                            throw new NavigationException();
                        }
                    } else {
                        throw new NavigationException();
                    }
                }

            } catch (Throwable e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
             * one last attempt to get an error message to the browser
             */
        } catch (Exception e) {
            log.fatal("forwarding to error page failed", e);
            response.setContentType("text/html");
            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                if (request.getParameter(MODULE) != null || request.getAttribute(MODULE) != null) {
                    process(request, response);
                } else {
                    TCRequest tcRequest = HttpObjectFactory.createRequest(request);
                    TCResponse tcResponse = HttpObjectFactory.createResponse(response);
                    //set up security objects and session info
                    WebAuthentication authentication = createAuthentication(tcRequest, tcResponse);
                    TCSubject user = getUser(authentication.getActiveUser().getId());
                    SessionInfo info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
                    tcRequest.setAttribute(SESSION_INFO_KEY, info);
                    //todo perhaps this should be configuraable...so implementing classes
                    //todo don't have to do it if they don't want to
                    RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

                    // check to see if the user has not logged in
                    if (info.isAnonymous()) {
                        // forward to login page
                        //String loginHref = "/?t=authentication&c=login&errorMsg=You%20must%20login%20to%20to%20use%20the%20pacts%20system&errorURL=" + errorURL;
                        //forward(loginHref,request,response);
                        //return;

                        String errorURL = request.getRequestURI();
                        errorURL += (request.getQueryString() == null) ? "" : request.getQueryString();

                        response.sendRedirect("http://" + request.getServerName() + "/tc?module=Login&c=login&message=" + "You must log in to view this portion of the site.&nextpage=" + errorURL);
                        return;
                    } else {
                        log.debug("we got the nav object");
                    }

                    String t = StringUtils.checkNull(request.getParameter(TASK_STRING));
                    String c = StringUtils.checkNull(request.getParameter(CMD_STRING));

                    log.debug("t= " + t + " c= " + c);
                    if (t.equals(AFFIDAVIT_TASK)) {
                        log.debug("affidavit task");
                        if (c.equals(AFFIRM_AFFIDAVIT_CMD)) {
                            log.debug("affirm affidavit cmd");
                            doAffirmAffidavit(request, response);
                        } else {
                            throw new NavigationException();
                        }
                    } else if (t.equals("edit_personal_info")) {
                        doEditPersonalInfoPost(request, response);
                    } else {
                        throw new NavigationException();
                    }
                }

            } catch (Throwable e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
             * one last attempt to get an error message to the browser
             */
        } catch (Exception e) {
            log.fatal("forwarding to error page failed", e);
            response.setContentType("text/html");
            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }

    /************************** Get methods ******************************/


    /**
     * a helper function used to forward to jsps
     *
     * @param href     the refrerence string
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void forward(String href, HttpServletRequest request,
                         HttpServletResponse response) {
        try {
            log.debug("Forwarding to ... " + href);

            RequestDispatcher disp = getServletConfig().getServletContext().
                    getRequestDispatcher(href);
            if (disp == null) {
                log.warn("The page was invalid error");
                return;
            }

            //if we got here, the page is valid, sent it on
            disp.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * used to get all of the contracts for a user.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doContractHistory(HttpServletRequest request,
                                   HttpServletResponse response) {
        ContractBean bean = new ContractBean();
        ContractHeader[] contracts;

        String fullList = request.getParameter("full_list");
        if (fullList != null) {
            contracts = bean.getContractsForUser(getUserId(request));
        } else {
            contracts = bean.getActiveContractsForUser(getUserId(request));
        }

        if (contracts == null) {
            log.error("we got null from getContractForUser");
        } else {
            request.setAttribute(PACTS_MEMBER_RESULT, contracts);
        }

        forward(CONTRACT_HISTORY_JSP, request, response);
    }

    /**
     * used to view the details of a contract. Gets a ContractWithText
     * object from the Contract dispatch bean.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doContractDetails(HttpServletRequest request,
                                   HttpServletResponse response) {
        ContractBean bean = new ContractBean();

        String str = request.getParameter(CONTRACT_ID);
        try {
            long contractId = Long.parseLong(str);
            ContractWithText c = bean.getContractWithText(contractId);
            if (c == null) {
                log.error("got null returned from get tax form with text");
            } else {

                // make sure the contract user id is the same as for the nav ob
                if (getUserId(request) != c.getContract().getHeader().getUser().getId()) {
                    log.error("the contract user id != the nav user id");
                    return;
                }

                request.setAttribute(PACTS_MEMBER_RESULT, c);
                forward(CONTRACT_DETAILS_JSP, request, response);
            }
        } catch (Exception e) {
            log.error("we got excepted");
            e.printStackTrace();
        }
    }

    /**
     * used to display a summary of all payments associated with a contract.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doContractPaymentSummary(HttpServletRequest request,
                                          HttpServletResponse response) {
        ContractBean bean = new ContractBean();

        // get the contract id
        String str = request.getParameter(CONTRACT_ID);
        if (str == null) {
            log.error("we did not get the contract id parameter in the request");
            return;
        }
        long contractId = Long.parseLong(str);

        PaymentHeader[] payments = bean.getContractPaymentList(contractId);

        if (payments == null) {
            log.error("we did not get any payments from the contract");
            return;
        }

        //check one of the payment and see if it has the correct user id
        if (payments.length > 0) {
            if (payments[0].getUser().getId() != getUserId(request)) {
                log.error("bad bad bad, this user id does not equal the nav uid");
                return;
            }
        }


        request.setAttribute(PACTS_MEMBER_RESULT, payments);


        forward(PAYMENT_HISTORY_JSP, request, response);
    }

    /**
     * Used for many purposes.  It always passes the affidavit text to
     * the jsp.  If the affidavit has not been affirmed it will pass
     * a parameter telling the jsp if it can electronically affirm the
     * affidavit.  If it can be affirmed, it will fill in a table with
     * the current contact information.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doAffidavitDetails(HttpServletRequest request,
                                    HttpServletResponse response) {
        AffidavitBean bean = new AffidavitBean();

        // extract the affidavit id
        long affidavitId = 0;
        try {
            affidavitId = Long.parseLong((String)
                    request.getParameter(AFFIDAVIT_ID));
        } catch (Exception e) {
            log.error(AFFIDAVIT_ID + " is not in the request. error");
            return;
        }

        AffidavitWithText a = bean.getAffidavitWithText(affidavitId);

        if (a == null) {
            log.error("we got null from getAffidavitWithText");
        } else {

            // check and make sure that the user id is the same for the
            // affiavid and member that is logged in
            if (getUserId(request) != a.getAffidavit().getHeader().getUser().getId()) {
                log.error("the user id in the affidavit does not match the nav id");
                return;
            }

            // cannot affirm a canceled or deleted affidavit
            // affiavid and member that is logged in
            if (a.getAffidavit().getHeader().getStatusId() == AFFIDAVIT_CANCELED_STATUS ||
                    a.getAffidavit().getHeader().getStatusId() == AFFIDAVIT_DELETED_STATUS) {
                log.error("canceled or deleted affidavit");
                return;
            }
        }

        //if we got here, everything must by ok, pass the request to the jsp
        request.setAttribute(PACTS_MEMBER_RESULT, a);

        forward(AFFIDAVIT_DETAILS_JSP, request, response);
    }

    private void doAffidavitRender(HttpServletRequest request,
                                   HttpServletResponse response) {
        AffidavitBean bean = new AffidavitBean();

        // extract the affidavit id
        long affidavitId = 0;
        try {
            affidavitId = Long.parseLong((String)
                    request.getParameter(AFFIDAVIT_ID));
        } catch (Exception e) {
            log.error(AFFIDAVIT_ID + " is not in the request. error");
            return;
        }

        AffidavitWithText a = bean.getAffidavitWithText(affidavitId);

        if (a == null) {
            log.error("we got null from getAffidavitWithText");
        } else {

            // check and make sure that the user id is the same for the
            // affiavid and member that is logged in
            if (getUserId(request) != a.getAffidavit().getHeader().getUser().getId()) {
                log.error("the user id in the affidavit does not match the nav id");
                return;
            }
        }

        //if we got here, everything must by ok, pass the request to the jsp
        request.setAttribute(PACTS_MEMBER_RESULT, a.getAffidavitText());

        forward(AFFIDAVIT_RENDER_JSP, request, response);
    }

    /**
     * Used to display a history of all payments made to a member.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doPaymentHistory(HttpServletRequest request,
                                  HttpServletResponse response) {
        PaymentBean bean = new PaymentBean();
        PaymentHeader[] payments = bean.getPaymentsForUser(getUserId(request));

        if (payments == null) {
            log.error("we got null from getPaymentsForUser");
        } else {
            request.setAttribute(PACTS_MEMBER_RESULT, payments);
        }

        forward(PAYMENT_HISTORY_JSP, request, response);
    }


    /**
     * Used to show the data about a payment.  This is used for any
     * payment because there is sufficient info in the descp for affidavits
     * and contract payments.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doPaymentDetails(HttpServletRequest request,
                                  HttpServletResponse response) {
        PaymentBean bean = new PaymentBean();

        //make sure we got a payment id passed into us
        String str = request.getParameter(PAYMENT_ID);
        if (str == null) {
            log.error("did not find the payment id in the request paramters");
            return;
        }

        // grab the payment
        try {
            long paymentId = Long.parseLong(str);
            Payment payment = bean.getPayment(paymentId);
            if (payment == null) {
                log.error("could not get payment " + paymentId);
                return;
            }

            // make sure the payment user id matches the nav user id
            if (payment.getHeader().getUser().getId() != getUserId(request)) {
                log.error("Shame on you trying to get payments that are not for you");
                return;
            }

            /**
             * commented out by STK 4/11.  The desc has enough detail
             * so that there is no need for extra handling of contract
             * and affidavit payments.
             */
            // now check if we have to pass it on
            //if(payment._header._typeID == 1) { // affidavit
            //    doAffidavitPaymentDetails(request,response);
            //} else if (payment._header._typeID == 2) { // contract
            //doContractPaymentDetails(request, response);
            //}

            log.debug("just returned from specific payment details");
            // just a generic payment
            request.setAttribute(PACTS_MEMBER_RESULT, payment);
            forward(PAYMENT_DETAILS_JSP, request, response);
            return;
        } catch (Exception e) {
            log.error("we got excepted");
            e.printStackTrace();
        }

    }


    /**
     * used to show all of the tax forms that have been filed for the member.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doTaxFormHistory(HttpServletRequest request,
                                  HttpServletResponse response) {
        UserTaxFormBean bean = new UserTaxFormBean();
        TaxFormHeader[] taxForms = bean.getTaxFormsForUser(getUserId(request));

        if (taxForms == null) {
            log.error("we got null from getPaymentsForUser");
        } else {
            request.setAttribute(PACTS_MEMBER_RESULT, taxForms);
        }

        forward(TAX_FORM_HISTORY_JSP, request, response);
    }

    /**
     * used to get the details of a tax form, including the actual text.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doTaxFormDetails(HttpServletRequest request,
                                  HttpServletResponse response) {
        UserTaxFormBean bean = new UserTaxFormBean();

        // this expects the tax form id to be in the nav object
        String str = request.getParameter(TAX_FORM_ID);
        try {
            long taxId = Long.parseLong(str);
            TaxFormWithText tf = bean.getTaxFormWithText(taxId, getUserId(request));
            if (tf == null) {
                log.error("got null returned from get tax form with text");
            } else {
                request.setAttribute(PACTS_MEMBER_RESULT, tf);
                forward(TAX_FORM_DETAILS_JSP, request, response);
            }
        } catch (Exception e) {
            log.error("we got excepted");
            e.printStackTrace();
        }
    }

    /***********************************************************/

    /********************* Post methods ************************/

    /**
     * this method is used to update the personal infomormation when a
     * member wants to change it before affirming an affidavit.  When
     * done updating the database, it will forward the request to the
     * jsp specified by the forward session parameter.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doEditPersonalInfoPost(HttpServletRequest request,
                                        HttpServletResponse response) {
        // IMPLEMENT WHEN WE HAVE ACCESS TO THE MAIN SITE
        String forwardingURL = request.getRequestURI();
        forwardingURL += (request.getQueryString() == null) ? "" : request.getQueryString();
        String editHref = "/ref/index.jsp?forward=/PactsMemberServlet";
        forward(editHref, request, response);
    }

    /**
     * this is used to affirm an affidavit online.  Even though the
     * jsp should have not shown the affirm button if the member was
     * not eligable, it will check all of the relevant parameters.  everything
     * was ok, it forward to the affidavit history jsp.  If ther was
     * an error, it forwards to an error page.
     *
     * @param request  the http request, where the session is stored
     * @param response the http response
     */
    private void doAffirmAffidavit(HttpServletRequest request,
                                   HttpServletResponse response) {
        AffidavitBean bean = new AffidavitBean();

        // extract the affidavit id
        long affidavitId = 0;
        String birthday = new String("");
        String aged = new String("");
        String family = new String("");
        try {
            affidavitId = Long.parseLong((String)
                    request.getParameter(AFFIDAVIT_ID));
            birthday = request.getParameter("date_of_birth");
            aged = request.getParameter("aged");
            family = request.getParameter("family_name");
        } catch (Exception e) {
            log.error(AFFIDAVIT_ID + " is not in the request. error");
            return;
        }


        AffidavitWithText a = bean.getAffidavitWithText(affidavitId);
        if (a == null) {
            log.error("we got null from getAffidavitWithText");
            return;
        }

        // check for birthday parameter, if it is not there get it from the affidavit
        if (birthday == null) {
            log.debug("did not get the birthday in affidavit affirmation");
            birthday = a.getAffidavit().getBirthday();
        } else {
            // the birthday was there, get a new affidavit with it in there
            // STK 5/28/2002
            log.debug("getting the affidavit with new birthday " + birthday);
            a = bean.getAffidavitWithText(affidavitId, birthday);
        }

        // check and make sure that the user id is the same for the
        // affiavid and member that is logged in
        if (getUserId(request) != a.getAffidavit().getHeader().getUser().getId()) {
            log.error("the user id in the affidavit does not match the nav id");
            // changed error page jevans 5/29/02 5:39 pm  forward("/pacts/client/MemberError.jsp",request,response);
            forward("/errorPage.jsp", request, response);
            //Exception e = new Exception("the user id in the affidavit does not match the nav id");
            //throw e;

            return;
        }

        if (birthday.trim().length() != DATE_FORMAT_STRING.length()) {
            log.debug("exception parsing the date, the text is:\n" + birthday);
            forward("/errorPage.jsp?errorMsg=\"birthday is malformed, please use " + DATE_FORMAT_STRING + " format\"", request, response);
            return;
        }

        // try to extract the birthday and forward to the error page if it is malformed
        SimpleDateFormat dfmt = new SimpleDateFormat(DATE_FORMAT_STRING);
        Date d = null;
        try {
            d = dfmt.parse(birthday);
        } catch (Exception e3) {
            log.debug("exception parsing the date, the text is:\n" + birthday);
            // changed error page jevans 5/29/02 5:39 pm  forward("/pacts/client/MemberError.jsp?errorMsg=\"birthday is malformed, please use " + DATE_FORMAT_STRING + " format\"",request, response);
            forward("/errorPage.jsp?errorMsg=\"birthday is malformed, please use " + DATE_FORMAT_STRING + " format\"", request, response);
            //Exception e = new Exception("birthday is malformed, please use " + DATE_FORMAT_STRING + " format");
            //throw e;
            return;
        }

        // if it is for india, replace the form text with what they enterd
        if (a.getPayment().getCountry().equals("India")) {
            if ((aged == null) || (family == null) || (aged.length() == 0) || (family.length() == 0)) {
                log.debug("did not get the aged or family text");
                // changed error page jevans 5/29/02 5:39 pm  forward("/pacts/client/MemberError.jsp?errorMsg=\"error affirming the affidavit, make sure you fill in the aged and family edit boxes\"",request, response);
                forward("/errorPage.jsp?errorMsg=\"error affirming the affidavit, make sure you fill in the aged and family edit boxes\"", request, response);
                //Exception e = new Exception("error affirming the affidavit, make sure you fill in the aged and family edit boxes");

                //throw e;
                return;
            }

            //todo i don't think this is relevant anymore
            //first replace the aged
            int aIdx = a.getAffidavitText().indexOf("FILL IN AGED");
            int bIdx = aIdx + (new String("FILL IN AGED")).length();
            a.setAffidavitText(a.getAffidavitText().substring(0, aIdx) +
                    " " + aged + " " + a.getAffidavitText().substring(bIdx));

            //now the family name
            aIdx = a.getAffidavitText().indexOf("FILL IN BELOW");
            bIdx = aIdx + (new String("FILL IN BELOW")).length();
            a.setAffidavitText(a.getAffidavitText().substring(0, aIdx) +
                    " " + family + " " + a.getAffidavitText().substring(bIdx));
        }

        // if we got here everything is good, we should affirm the affidavit
        bean.affirmAffidavit(a.getAffidavit().getHeader().getId(), a.getAffidavitText(), dfmt.format(d));

        // send it back to the affidavit history page
        //doAffidavitHistory(request, response);
        forward("/PactsMemberServlet?module=AffidavitHistory", request, response);
    }

    /**
     * *******************************************************************
     */


    private long getUserId(HttpServletRequest request) {
        SessionInfo info = (SessionInfo) request.getAttribute(SESSION_INFO_KEY);
        return info.getUserId();
    }
}


