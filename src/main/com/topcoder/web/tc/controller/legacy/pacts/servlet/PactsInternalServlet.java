package com.topcoder.web.tc.controller.legacy.pacts.servlet;

/******************************************************************************\
 *
 * File:          PactsInternalServlet.java
 * Creation date: March 06, 2002 23:05
 * Author:        Matt Murphy
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.RequestTracker;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.AffidavitBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_internal.dispatch.*;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.StringTokenizer;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 */
public class PactsInternalServlet extends BaseServlet implements PactsConstants {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;


    private static final int INT_TYPE = 1;
    private static final int BOOL_TYPE = 2;
    private static final int STRING_TYPE = 3;
    private static final int LONG_TYPE = 4;
    private static final int DOUBLE_TYPE = 5;
    private static final int FLOAT_TYPE = 6;
    private static final int DATE_TYPE = 7;
    private static final int NULL_MULT = 8;
    private static final int NULL_DATE_TYPE = DATE_TYPE * NULL_MULT;
    private static final int NULL_BOOL_TYPE = BOOL_TYPE * NULL_MULT;
    private static final int NULL_INT_TYPE = INT_TYPE * NULL_MULT;
    private static final int NULL_STRING_TYPE = STRING_TYPE * NULL_MULT;
    private static final int NULL_LONG_TYPE = LONG_TYPE * NULL_MULT;
    private static final int NULL_FLOAT_TYPE = FLOAT_TYPE * NULL_MULT;
    private static final int NULL_DOUBLE_TYPE = DOUBLE_TYPE * NULL_MULT;

    private static Logger log = Logger.getLogger(PactsInternalServlet.class);


    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        // Thread for expiring old payments
        Thread tExpired = new Thread() {
            public void run() {
                DataInterfaceBean dib = new DataInterfaceBean();
                while (true) {
                    try {
                        log.info("Expiring old payments");
                        dib.expireOldPayments();
                        sleep(86400000);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        tExpired.start();
    }

    public void trace(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

        StringBuffer loginfo = new StringBuffer(100);
        loginfo.append("[* ");
        loginfo.append(info.getHandle());
        loginfo.append(" * ");
        loginfo.append(request.getRemoteAddr());
        loginfo.append(" * ");
        loginfo.append(request.getMethod());
        loginfo.append(" ");
        loginfo.append(info.getRequestString());
        loginfo.append(" *]");
        log.info(loginfo);
    }

/*
    protected WebAuthentication createAuthentication(TCRequest request, TCResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession(true)), request, response,
                BasicAuthentication.PACTS_INTERNAL_SITE);
    }
*/


    /*
    Handles all GET requests.

    Checks to make sure the session is authenticated, that t and c are valid,
    and that all parameters exist for t and c.
    All subsequent get methods can assume that the above is already done.
    */
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {
        //Searches require at least one parameter to be filled in.
        //This is an encapluated boolean to store that information
        PassedParam pp = new PassedParam();
        try {
            //just jamming in the new way of doing things.  perhaps one day this whole system will leave the dark side
            if (request.getParameter(MODULE) != null || request.getAttribute(MODULE) != null) {
                process(request, response);
                return;
            }
            
            trace(request, response);
            if (!doAuthenticate(request, response)) return;

            String task = request.getParameter(TASK_STRING);
            String command = request.getParameter(CMD_STRING);

            if (task != null && command != null) {
                if (task.equals(LOGOUT_TASK)) {
                    doLogout(request, response);
                    return;
                }
                if (task.equals(SEARCH_TASK)) {
                    if (command.equals(USER_CMD)) {
                        doSearchUsers(request, response);
                        return;
                    }
                    if (command.equals(PAYMENT_CMD)) {
                        doSearchPayments(request, response);
                        return;
                    }
                    if (command.equals(AFFIDAVIT_CMD)) {
                        doSearchAffidavits(request, response);
                        return;
                    }
                    if (command.equals(CONTRACT_CMD)) {
                        doSearchContracts(request, response);
                        return;
                    }
                    if (command.equals(TAX_FORM_CMD)) {
                        doSearchTaxForms(request, response);
                        return;
                    }
                    if (command.equals(USER_TAX_FORM_CMD)) {
                        doSearchUserTaxForms(request, response);
                        return;
                    }
                    if (command.equals(NOTE_CMD)) {
                        doSearchNotes(request, response);
                        return;
                    }
                    doSearch(request, response);
                    return;
                } else if (task.equals(LIST_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter(STATUS_CODE), false, pp)
                                        && checkParam(INT_TYPE, request.getParameter(TYPE_CODE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(EARLIEST_CREATION_DATE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(LATEST_CREATION_DATE), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(PAYMENT_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(AFFIDAVIT_ID), false, pp)
                                        && checkParam(BOOL_TYPE, request.getParameter(IS_AFFIRMED), false, pp)
                                        && checkParam(BOOL_TYPE, request.getParameter(IS_NOTARIZED), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(ROUND_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(USER_ID), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(HANDLE), false, pp)
                                        && pp.get()) {

                            doAffidavitList(request, response);
                        } else {
                            throw new NavigationException("Invalid Search Parameter or No Search Parameter Specified");
                        }
                        return;
                    }
                    if (command.equals(CONTRACT_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter(STATUS_CODE), false, pp)
                                        && checkParam(INT_TYPE, request.getParameter(TYPE_CODE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(EARLIEST_CREATION_DATE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(LATEST_CREATION_DATE), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(PAYMENT_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(CONTRACT_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(USER_ID), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(HANDLE), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(CONTRACT_NAME), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(EARLIEST_START_DATE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(EARLIEST_END_DATE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(LATEST_START_DATE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(LATEST_END_DATE), false, pp)
                                        && pp.get()) {

                            doContractList(request, response);
                        } else {
                            throw new NavigationException("Invalid Search Parameter or No Search Parameter Specified");
                        }
                        return;
                    }
                    if (command.equals(TAX_FORM_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter(STATUS_CODE), false)
                                        && checkParam(DOUBLE_TYPE, request.getParameter(LOWEST_WITHHOLDING_AMOUNT), false)
                                        && checkParam(DOUBLE_TYPE, request.getParameter(HIGHEST_WITHHOLDING_AMOUNT), false)
                                        && checkParam(FLOAT_TYPE, request.getParameter(LOWEST_WITHHOLDING_PERCENTAGE), false)
                                        && checkParam(FLOAT_TYPE, request.getParameter(HIGHEST_WITHHOLDING_PERCENTAGE), false)) {

                            doTaxFormList(request, response);
                        } else {
                            throw new NavigationException("Invalid Search Parameter");
                        }
                        return;
                    }
                    if (command.equals(USER_TAX_FORM_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter(STATUS_CODE), false, pp)
                                        && checkParam(DOUBLE_TYPE, request.getParameter(LOWEST_WITHHOLDING_AMOUNT), false, pp)
                                        && checkParam(DOUBLE_TYPE, request.getParameter(HIGHEST_WITHHOLDING_AMOUNT), false, pp)
                                        && checkParam(FLOAT_TYPE, request.getParameter(LOWEST_WITHHOLDING_PERCENTAGE), false, pp)
                                        && checkParam(FLOAT_TYPE, request.getParameter(HIGHEST_WITHHOLDING_PERCENTAGE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(EARLIEST_DATE_FILED), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(LATEST_DATE_FILED), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(USER_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(HANDLE), false, pp)
                                        && pp.get()) {

                            doUserTaxFormList(request, response);
                        } else {
                            throw new NavigationException("Invalid Search Parameter or No Search Parameter Specified");
                        }
                        return;
                    }
                    if (command.equals(USER_CMD)) {
                        if (
                                checkParam(STRING_TYPE, request.getParameter(FIRST_NAME), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(MIDDLE_NAME), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(LAST_NAME), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(HANDLE), false, pp)
                                        && checkParam(BOOL_TYPE, request.getParameter(HAS_ACTIVE_CONTRACTS), false, pp)
                                        && checkParam(BOOL_TYPE, request.getParameter(HAS_PENDING_AFFIDAVITS), false, pp)
                                        && checkParam(BOOL_TYPE, request.getParameter(HAS_TAX_FORMS_ON_FILE), false, pp)
                                        && checkParam(BOOL_TYPE, request.getParameter(IS_OWED_MONEY), false, pp)
                                        && checkParam(BOOL_TYPE, request.getParameter(HAS_GLOBAL_AD), false, pp)
                                        && pp.get()) {

                            doUserList(request, response);
                        } else {
                            throw new NavigationException("Invalid Search Parameter or No Search Parameter Specified");
                        }
                        return;
                    }
                    if (command.equals(NOTE_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter(SUBMITTING_USER_ID), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(SUBMITTING_HANDLE), false, pp)
                                        && checkParam(INT_TYPE, request.getParameter(TYPE_CODE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(EARLIEST_CREATION_DATE), false, pp)
                                        && checkParam(DATE_TYPE, request.getParameter(LATEST_CREATION_DATE), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(PAYMENT_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(CONTRACT_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(USER_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(TAX_FORM_USER_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(AFFIDAVIT_ID), false, pp)
                                        && checkParam(LONG_TYPE, request.getParameter(NOTE_ID), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(HANDLE), false, pp)
                                        && checkParam(STRING_TYPE, request.getParameter(IN_DEPTH_HANDLE), false, pp)
                                        && pp.get()) {

                            doNoteList(request, response);
                        } else {
                            throw new NavigationException("Invalid Search Parameter or No Search Parameter Specified");
                        }
                        return;
                    }
                    if (command.equals(COMBO_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(NOTE_ID), true))
                            doComboList(request, response);
                        else {
                            throw new NavigationException("Invalid Note ID or No Note ID Specified");
                        }
                        return;
                    }
                    throw new NavigationException("Invalid command " + command);
                } else if (task.equals(VIEW_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(AFFIDAVIT_ID), true))
                            doAffidavit(request, response);
                        else {
                            throw new NavigationException("Invalid Affidavit ID or No Affidavit ID Specified");
                        }
                        return;
                    }
                    if (command.equals(CONTRACT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(CONTRACT_ID), true))
                            doContract(request, response);
                        else {
                            throw new NavigationException("Invalid Contract ID or No Contract ID Specified");
                        }
                        return;
                    }
                    if (command.equals(PAYMENT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(PAYMENT_ID), true)) {
                            doPayment(request, response);
                        } else {
                            throw new NavigationException("Invalid Payment ID or No Payment ID Specified");
                        }
                        return;
                    }
                    if (command.equals(PAYMENT_AUDIT_TRAIL_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(PAYMENT_ID), true))
                            doPaymentAuditTrail(request, response);
                        else {
                            throw new NavigationException("Invalid Payment ID or No Payment ID Specified");
                        }
                        return;
                    }
                    if (command.equals(TAX_FORM_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), true))
                            doTaxForm(request, response);
                        else {
                            throw new NavigationException("Invalid Tax Form ID or No Tax Form ID Specified");
                        }
                        return;
                    }
                    if (command.equals(USER_TAX_FORM_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), true)
                                        && checkParam(LONG_TYPE, request.getParameter(USER_ID), true))
                            doUserTaxForm(request, response);
                        else {
                            throw new NavigationException("Invalid ID or No ID Specified");
                        }
                        return;
                    }
                    if (command.equals(USER_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(USER_ID), true))
                            doUser(request, response);
                        else {
                            throw new NavigationException("Invalid User ID or No User ID Specified");
                        }
                        return;
                    }
                    if (command.equals(NOTE_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(NOTE_ID), true))
                            doNote(request, response);
                        else {
                            throw new NavigationException("Invalid Note ID or No Note ID Specified");
                        }
                        return;
                    }
                    if (command.equals(TEXT_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter("object_id"), true)
                                        && checkParam(INT_TYPE, request.getParameter("object_type"), true))
                            doText(request, response);
                        else {
                            throw new NavigationException("Invalid ID or Type or No ID or Type Specified");
                        }
                        return;
                    }
                    throw new NavigationException("Invalid command " + command);
                } else if (task.equals(ADD_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(USER_ID), true))
                            doAddAffidavit(request, response);
                        else {
                            throw new NavigationException("Invalid User ID or No User ID Specified");
                        }
                        return;
                    }
                    if (command.equals(CONTRACT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(USER_ID), true))
                            doAddContract(request, response);
                        else {
                            throw new NavigationException("Invalid User ID or No User ID Specified");
                        }
                        return;
                    }
                    if (command.equals(PAYMENT_CMD)) {
                        if (
                                checkParam(LONG_TYPE, request.getParameter(USER_ID), true)
                                        || checkParam(LONG_TYPE, request.getParameter(CONTRACT_ID), true))
                            doAddPayment(request, response);
                        else {
                            throw new NavigationException("Invalid User ID or No User ID Specified");
                        }
                        return;
                    }
                    if (command.equals(TAX_FORM_CMD)) {
                        doAddTaxForm(request, response);
                        return;
                    }
                    if (command.equals(USER_TAX_FORM_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(USER_ID), true))
                            doAddUserTaxForm(request, response);
                        else {
                            throw new NavigationException("Invalid User ID or No User ID Specified");
                        }
                        return;
                    }
                    if (command.equals(NOTE_CMD)) {
                        if (
                                checkParam(INT_TYPE, request.getParameter("object_type"), true)
                                        && checkParam(LONG_TYPE, request.getParameter("object_id"), true))
                            doAddNote(request, response);
                        else {
                            throw new NavigationException("Invalid ID Type or No ID or Type Specified");
                        }
                        return;
                    }
                    if (command.equals(NOTE_LINK_CMD)) {
                        doAddNoteLink(request, response);
                        return;
                    }
                    throw new NavigationException("Invalid command " + command);
                } else if (task.equals(UPDATE_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(AFFIDAVIT_ID), true))
                            doUpdateAffidavit(request, response);
                        else {
                            throw new NavigationException("Invalid Affidavit ID or No Affidavit ID Specified");
                        }
                        return;
                    }
                    if (command.equals(CONTRACT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(CONTRACT_ID), true))
                            doUpdateContract(request, response);
                        else {
                            throw new NavigationException("Invalid Contract ID or No Contract ID Specified");
                        }
                        return;
                    }
                    if (command.equals(PAYMENT_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(PAYMENT_ID), true))
                            doUpdatePayment(request, response);
                        else {
                            throw new NavigationException("Invalid Payment ID or No Payment ID Specified");
                        }
                        return;
                    }
                    if (command.equals(TAX_FORM_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), true))
                            doUpdateTaxForm(request, response);
                        else {
                            throw new NavigationException("Invalid Tax Form ID or No Tax Form ID Specified");
                        }
                        return;
                    }
                    if (command.equals(USER_TAX_FORM_CMD)) {
                        if (checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), true) &&
                                checkParam(LONG_TYPE, request.getParameter(USER_ID), true))
                            doUpdateUserTaxForm(request, response);
                        else {
                            throw new NavigationException("Invalid User or Tax Form ID or No ID Specified");
                        }
                        return;
                    }
                    throw new NavigationException("Invalid command " + command);
                } else if (task.equals(PAYMENT_TASK)) {
                    throw new NavigationException("Invalid command " + command);
                } else if (task.equals(AFFIRM_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        //Parameters are checked in doAffirmAffidavit(request, response)
                        doAffirmAffidavit(request, response);
                        return;
                    }
                    throw new NavigationException("Invalid command " + command);
                }
                throw new NavigationException("Invalid task " + task);
            } else {
                doSearch(request, response);
            }
        } catch (Throwable e) {
            try {
                handleException(request, response, e);
            } catch (Exception e1) {
                log.fatal("forwarding to error page failed", e);
                e.printStackTrace();
                response.setContentType("text/html");
                response.setStatus(500);
                PrintWriter out = response.getWriter();
                out.println("<html><head><title>Internal Error</title></head>");
                out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
                out.println("</body></html>");
                out.flush();
            }
        }
    }


    /*
    Handles all POST requests.

    Checks to make sure the session is authenticated, that t and c are valid,
    and that all parameters exist for t and c.
    All subsequent post methods can assume that the above is already done.
    */
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException, IOException {
        String message = "";


        try {
            //just jamming in the new way of doing things.  perhaps one day this whole system will leave the dark side
            if (request.getParameter(MODULE) != null || request.getAttribute(MODULE) != null) {
                process(request, response);
                return;
            }

            trace(request, response);
            if (!doAuthenticate(request, response)) return;

            String task = null;
            String command = null;

            log.debug("doPost<br>");
            task = request.getParameter(TASK_STRING);
            command = request.getParameter(CMD_STRING);
            log.debug("t = " + task + "<br>");
            log.debug("c = " + command + "<br>");
            if (task != null && command != null) {
                if (task.equals(ADD_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(USER_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + USER_ID + " = ";
                            message += request.getParameter(USER_ID) + "<br>\n";
                            throw new NavigationException(message);
                        }
                        if (!checkParam(BOOL_TYPE, request.getParameter(IS_NOTARIZED), true))
                            message += "Invalid parameter " + IS_NOTARIZED + " = " + request.getParameter(IS_NOTARIZED) + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("affidavit_status_id"), true))
                            message += "Invalid parameter affidavit_status_id = " + request.getParameter("affidavit_status_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("affidavit_type_id"), true))
                            message += "Invalid parameter affidavit_type_id = " + request.getParameter("affidavit_type_id") + ".<br>\n";
                        if (!checkParam(NULL_INT_TYPE, request.getParameter("round_id"), true))
                            message += "Invalid parameter round_id = " + request.getParameter("round_id") + ".<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("affidavit_desc"), true))
                            message += "Affidavit Description was invalid.<br>\n";

                        log.debug("payment dec:" + request.getParameter("payment_desc") + ":");
                        if (!"".equals(StringUtils.checkNull(request.getParameter("payment_desc")))) {
                            if (!checkParam(INT_TYPE, request.getParameter("payment_status_id"), true))
                                message += "Invalid parameter payment_status_id = " + request.getParameter("payment_status_id") + ".<br>\n";
                            if (!checkParam(INT_TYPE, request.getParameter("payment_type_id"), true))
                                message += "Invalid parameter payment_type_id = " + request.getParameter("payment_type_id") + ".<br>\n";
                            if (!checkParam(INT_TYPE, request.getParameter("payment_method_id"), true))
                                message += "Invalid parameter payment_method_id = " + request.getParameter("payment_method_id") + ".<br>\n";
                            if (!checkParam(STRING_TYPE, request.getParameter("payment_desc"), true))
                                message += "Payment Description was invalid.<br>\n";
                            if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_paid"), true)) {
                                message += "Date Paid is invalid make sure it is a legal";
                                message += " date in the format " + DATE_FORMAT_STRING;
                                message += ".<br>\n";
                            }
                            if (!checkParam(NULL_DOUBLE_TYPE, request.getParameter("net_amount"), true))
                                message += "Net Amount was invalid.<br>\n";
                            if (!checkParam(DOUBLE_TYPE, request.getParameter("gross_amount"), true))
                                message += "Gross Amount was invalid.<br>\n";
                            if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_due"), true)) {
                                message += "Date Due is invalid make sure it is a legal";
                                message += " date in the format " + DATE_FORMAT_STRING;
                                message += ".<br>\n";
                            }
                        } else {
                            log.debug("payment desc was null");
                        }
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_printed"), true)) {
                            message += "Date Printed is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (message.length() == 0)
                            doAddAffidavitPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doAddAffidavit(request, response);
                        }
                        return;
                    }
                    if (command.equals(CONTRACT_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(USER_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + USER_ID + " = ";
                            message += request.getParameter(USER_ID) + "<br>\n";
                            throw new NavigationException(message);
                        }
                        if (!checkParam(STRING_TYPE, request.getParameter("contract_desc"), true))
                            message += "Description was invalid.<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("name"), true))
                            message += "Name was invalid.<br>\n";
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("end_date"), true)) {
                            message += "End Date is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("start_date"), true)) {
                            message += "Start Date is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Invalid parameter status_id = " + request.getParameter("status_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("contract_type_id"), true))
                            message += "Invalid parameter contract_type_id = " + request.getParameter("contract_type_id") + ".<br>\n";
                        if (!checkParam(NULL_STRING_TYPE, request.getParameter("text"), true))
                            message += "Required parameter missing: text.<br>\n";

                        if (message.length() == 0)
                            doAddContractPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doAddContract(request, response);
                        }
                        return;
                    }
                    if (command.equals(PAYMENT_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(CONTRACT_ID), true) &&
                                !checkParam(LONG_TYPE, request.getParameter(USER_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was missing or invalid: " + CONTRACT_ID + " = ";
                            message += request.getParameter(CONTRACT_ID) + "<br>or<br>\n";
                            message += "Parameter was missing or invalid: " + USER_ID + " = ";
                            message += request.getParameter(USER_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Invalid parameter status_id = " + request.getParameter("status_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("payment_type_id"), true))
                            message += "Invalid parameter payment_type_id = " + request.getParameter("payment_type_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("payment_method_id"), true))
                            message += "Invalid parameter payment_method_id = " + request.getParameter("payment_method_id") + ".<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("payment_desc"), true))
                            message += "Description was invalid.<br>\n";
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_paid"), true)) {
                            message += "Date Paid is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_printed"), true)) {
                            message += "Date Printed is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_due"), true)) {
                            message += "Date Due is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DOUBLE_TYPE, request.getParameter("net_amount"), true))
                            message += "Net Amount was invalid.<br>\n";
                        if (!checkParam(DOUBLE_TYPE, request.getParameter("gross_amount"), true))
                            message += "Gross Amount was invalid.<br>\n";

                        if (request.getParameter("missing_reference") != null)
                            message += request.getParameter("missing_reference");


                        if (message.length() == 0)
                            doAddPaymentPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doAddPayment(request, response);
                        }
                        return;
                    }
                    if (command.equals(TAX_FORM_CMD)) {
                        if (!checkParam(STRING_TYPE, request.getParameter("tax_form_desc"), true))
                            message += "Description was invalid.<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("name"), true))
                            message += "Name was invalid.<br>\n";
                        if (!checkParam(DOUBLE_TYPE, request.getParameter("default_withholding_amount"), true))
                            message += "Default Withholding Amount was invalid.<br>\n";
                        if (!checkParam(FLOAT_TYPE, request.getParameter("default_withholding_percentage"), true))
                            message += "Default Withholding Percentage was invalid.<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Invalid Parameter status_id = " + request.getParameter("status_id") + ".<br>\n";
                        if (!checkParam(NULL_STRING_TYPE, request.getParameter("text"), true))
                            message += "Required parameter missing: text.<br>\n";
                        if (!checkParam(BOOL_TYPE, request.getParameter("default_use_percentage"), true)) {
                            message += "Invalid Parameter default_use_percentage = ";
                            message += request.getParameter("default_use_percentage") + ".<br>\n";
                        }
                        if (message.length() == 0)
                            doAddTaxFormPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doAddTaxForm(request, response);
                        }
                        return;
                    }
                    if (command.equals(USER_TAX_FORM_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(USER_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + USER_ID + " = ";
                            message += request.getParameter(USER_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + TAX_FORM_ID + " = ";
                            message += request.getParameter(TAX_FORM_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Parameter \"status_id\" was invalid.<br>\n";
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_filed"), true)) {
                            message += "Date Filed is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (message.length() == 0)
                            doAddUserTaxFormPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doAddUserTaxForm(request, response);
                        }
                        return;
                    }
                    if (command.equals(NOTE_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter("object_id"), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: object_id = ";
                            message += request.getParameter("object_id") + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("object_type"), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: object_type = ";
                            message += request.getParameter("object_type") + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(STRING_TYPE, request.getParameter("text"), true))
                            message += "You must fill in the note text.";
                        if (message.length() == 0)
                            doAddNotePost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doAddNote(request, response);
                        }
                        return;
                    }
                    if (command.equals(NOTE_LINK_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(NOTE_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + NOTE_ID + " = ";
                            message += request.getParameter(NOTE_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(LONG_TYPE, request.getParameter("object_id"), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: object_id = ";
                            message += request.getParameter("object_id") + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("object_type"), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: object_type = ";
                            message += request.getParameter("object_type") + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (message.length() == 0)
                            doAddNoteLinkPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doAddNoteLink(request, response);
                        }
                        return;
                    }
                    doGet(request, response);
                    return;
                }
                if (task.equals(UPDATE_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(AFFIDAVIT_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + AFFIDAVIT_ID + " = ";
                            message += request.getParameter(AFFIDAVIT_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(BOOL_TYPE, request.getParameter(IS_NOTARIZED), true))
                            message += "Invalid parameter " + IS_NOTARIZED + " = " + request.getParameter(IS_NOTARIZED) + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("affidavit_status_id"), true))
                            message += "Invalid parameter affidavit_status_id = " + request.getParameter("affidavit_status_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("affidavit_type_id"), true))
                            message += "Invalid parameter affidavit_type_id = " + request.getParameter("affidavit_type_id") + ".<br>\n";
                        if (!checkParam(NULL_INT_TYPE, request.getParameter("round_id"), true))
                            message += "Invalid parameter round_id = " + request.getParameter("round_id") + ".<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("affidavit_desc"), true))
                            message += "Description was invalid.<br>\n";
                        if (message.length() == 0)
                            doUpdateAffidavitPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doUpdateAffidavit(request, response);
                        }
                        return;
                    }
                    if (command.equals(CONTRACT_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(CONTRACT_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + CONTRACT_ID + " = ";
                            message += request.getParameter(CONTRACT_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(STRING_TYPE, request.getParameter("contract_desc"), true))
                            message += "Description was invalid.<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("name"), true))
                            message += "Name was invalid.<br>\n";
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("end_date"), true)) {
                            message += "End Date is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("start_date"), true)) {
                            message += "Start Date is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Invalid parameter status_id = " + request.getParameter("status_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("contract_type_id"), true))
                            message += "Invalid parameter contract_type_id = " + request.getParameter("contract_type_id") + ".<br>\n";
                        if (!checkParam(NULL_STRING_TYPE, request.getParameter("text"), true))
                            message += "Required parameter missing: text.<br>\n";
                        if (message.length() == 0)
                            doUpdateContractPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doUpdateContract(request, response);
                        }
                        return;
                    }
                    if (command.equals(PAYMENT_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(PAYMENT_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + PAYMENT_ID + " = ";
                            message += request.getParameter(PAYMENT_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Invalid parameter status_id = " + request.getParameter("status_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("payment_type_id"), true))
                            message += "Invalid parameter payment_type_id = " + request.getParameter("payment_type_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("payment_method_id"), true))
                            message += "Invalid parameter payment_method_id = " + request.getParameter("payment_method_id") + ".<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("modification_rationale_id"), true))
                            message += "Invalid parameter modification_rationale_id = " + request.getParameter("modification_rationale_id") + ".<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("payment_desc"), true))
                            message += "Description was invalid.<br>\n";
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_paid"), true)) {
                            message += "Date Paid is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_printed"), true)) {
                            message += "Date Printed is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_due"), true)) {
                            message += "Date Due is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        if (!checkParam(NULL_DOUBLE_TYPE, request.getParameter("net_amount"), true))
                            message += "Net Amount was invalid.<br>\n";
                        if (!checkParam(DOUBLE_TYPE, request.getParameter("gross_amount"), true))
                            message += "Gross Amount was invalid.<br>\n";
                        if (message.length() == 0)
                            doUpdatePaymentPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doUpdatePayment(request, response);
                        }
                        return;
                    }
                    if (command.equals(TAX_FORM_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + TAX_FORM_ID + " = ";
                            message += request.getParameter(TAX_FORM_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(STRING_TYPE, request.getParameter("tax_form_desc"), true))
                            message += "Description was invalid.<br>\n";
                        if (!checkParam(STRING_TYPE, request.getParameter("name"), true))
                            message += "Name was invalid.<br>\n";
                        if (!checkParam(DOUBLE_TYPE, request.getParameter("default_withholding_amount"), true))
                            message += "Default Withholding Amount was invalid.<br>\n";
                        if (!checkParam(FLOAT_TYPE, request.getParameter("default_withholding_percentage"), true))
                            message += "Default Withholding Percentage was invalid.<br>\n";
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Invalid Parameter status_id = " + request.getParameter("status_id") + ".<br>\n";
                        if (!checkParam(NULL_STRING_TYPE, request.getParameter("text"), true))
                            message += "Required parameter missing: text.<br>\n";
                        if (!checkParam(BOOL_TYPE, request.getParameter("default_use_percentage"), true)) {
                            message += "Invalid Parameter default_use_percentage = ";
                            message += request.getParameter("default_use_percentage") + ".<br>\n";
                        }
                        if (message.length() == 0)
                            doUpdateTaxFormPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doUpdateTaxForm(request, response);
                        }
                        return;
                    }
                    if (command.equals(USER_TAX_FORM_CMD)) {
                        if (!checkParam(LONG_TYPE, request.getParameter(USER_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + USER_ID + " = ";
                            message += request.getParameter(USER_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(LONG_TYPE, request.getParameter(TAX_FORM_ID), true)) {
                            message = "There was an error processing your request:<br>\n";
                            message += "Parameter was invalid: " + TAX_FORM_ID + " = ";
                            message += request.getParameter(TAX_FORM_ID) + "<br>\n";
                            request.setAttribute("message", message);
                        }
                        if (!checkParam(INT_TYPE, request.getParameter("status_id"), true))
                            message += "Parameter \"status_id\" was invalid.<br>\n";
                        if (!checkParam(NULL_DATE_TYPE, request.getParameter("date_filed"), true)) {
                            message += "Date Filed is invalid make sure it is a legal";
                            message += " date in the format " + DATE_FORMAT_STRING;
                            message += ".<br>\n";
                        }
                        //if (!checkParam(DOUBLE_TYPE, request.getParameter("withholding_amount"), true))
                        //    message += "Withholding Amount was invalid.<br>\n";
                        if (!checkParam(FLOAT_TYPE, request.getParameter("withholding_percentage"), true))
                            message += "Withholding Percentage was invalid.<br>\n";
                        //if (!checkParam(BOOL_TYPE, request.getParameter("use_percentage"), true))
                        //    message += "Parameter \"use_percentage\" was invalid.<br>\n";
                        if (message.length() == 0)
                            doUpdateUserTaxFormPost(request, response);
                        else {
                            request.setAttribute("message", message);
                            doUpdateUserTaxForm(request, response);
                        }
                        return;
                    }
                }
                if (task.equals(AFFIRM_TASK)) {
                    if (command.equals(AFFIDAVIT_CMD)) {
                        doAffirmAffidavitPost(request, response);
                        return;
                    }
                }
            }
        } catch (Throwable e) {
            try {
                handleException(request, response, e);
            } catch (Exception e1) {
                log.fatal("forwarding to error page failed", e);
                e.printStackTrace();
                response.setContentType("text/html");
                response.setStatus(500);
                PrintWriter out = response.getWriter();
                out.println("<html><head><title>Internal Error</title></head>");
                out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
                out.println("</body></html>");
                out.flush();
            }
        }


        doGet(request, response);
    }


    // Encapsulated boolean Class which describes
    // whether or not a valid search parameter has
    // been specified.
    private static class PassedParam {
        boolean val;

        private PassedParam() {
            this(false);
        }

        private PassedParam(boolean v) {
            val = v;
        }

        private boolean get() {
            return val;
        }

        private void set() {
            set(true);
        }

        private void set(boolean v) {
            val = v;
        }
    }


    private boolean makeBoolean(String booleanString) throws Exception {

        booleanString = booleanString.toUpperCase();
        if (booleanString.equals("T") || booleanString.equals("TRUE"))
            return true;
        if (booleanString.equals("F") || booleanString.equals("FALSE"))
            return false;
        throw new Exception("String " + booleanString + " could not be converted to boolean type");
    }


    private boolean checkParam(int type, String param, boolean required) {

        return checkParam(type, param, required, null);
    }


    private boolean checkParam(int type, String param, boolean required, PassedParam pp) {

        log.debug("checking for " + param);
        if ((type % NULL_MULT != 0) && (param == null || param.equals(""))) return !required;
        if ((type % NULL_MULT == 0) && (param == null || param.equals(""))) return true;

        log.debug("checking param - " + param + " - type: " + type);

        switch (type) {
            case NULL_INT_TYPE:
            case INT_TYPE:
                try {
                    Integer.parseInt(param);
                } catch (Exception e) {
                    return false;
                }
                break;
            case NULL_BOOL_TYPE:
            case BOOL_TYPE:
                try {
                    makeBoolean(param);
                } catch (Exception e) {
                    return false;
                }
                break;
            case NULL_LONG_TYPE:
            case LONG_TYPE:
                try {
                    Long.parseLong(param);
                } catch (Exception e) {
                    return false;
                }
                break;
            case NULL_DOUBLE_TYPE:
            case DOUBLE_TYPE:
                try {
                    Double.parseDouble(param);
                } catch (Exception e) {
                    return false;
                }
                break;
            case NULL_FLOAT_TYPE:
            case FLOAT_TYPE:
                try {
                    Float.parseFloat(param);
                } catch (Exception e) {
                    return false;
                }
                break;
            case NULL_DATE_TYPE:
                try {
                    String s = TCData.dateForm(param, param, false);
                    if (s.equals("00/00/0000")) return true;
                } catch (Exception e) {
                    return false;
                }
            case DATE_TYPE:
                try {
                    StringTokenizer t = new StringTokenizer(param, "/");
                    String s = (String) t.nextElement();
                    if (s.length() > 2) return false;
                    int i = Integer.parseInt(s);
                    if (i < 1 || i > 12) return false;
                    s = (String) t.nextElement();
                    if (s.length() > 2) return false;
                    i = Integer.parseInt(s);
                    if (i < 1 || i > 31) return false;
                    s = (String) t.nextElement();
                    if (s.length() != 2 && s.length() != 4) return false;
                    i = Integer.parseInt(s);
                } catch (Exception e) {
                    return false;
                }
        }

        log.debug("  OK");

        if (pp != null) pp.set();
        return true;
    }


    // Pulls up the Add Affidavit Page
    /**
     * @deprecated
     */
    private void doAddAffidavit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.warn("Using deprecated processor, please use module=AddAffidavit insted");
        if (request.getParameter(PAYMENT_ID) == null) {
            forward(Links.addAffidavit(Long.parseLong(request.getParameter(USER_ID))), request, response);
        } else {
            forward(Links.addAffidavitForPayment(Long.parseLong(request.getParameter(USER_ID)),
                    Long.parseLong(request.getParameter(PAYMENT_ID))), request, response);
        }

/*
        log.debug("doAddAffidavit<br>");

        // Give the JSP the User object
        InternalDispatchUserProfileHeader bean =
                new InternalDispatchUserProfileHeader(request, response);
        UserProfileHeader results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        // Give the JSP the list of Affidavit Types
        DataInterfaceBean dib = new DataInterfaceBean();
        Map map = dib.getAffidavitTypes();
        request.setAttribute(AFFIDAVIT_TYPE_LIST, map.get(AFFIDAVIT_TYPE_LIST));

        // Give the JSP the list of Payment Types
        map = dib.getPaymentTypes();
        request.setAttribute(PAYMENT_TYPE_LIST, map.get(PAYMENT_TYPE_LIST));

        // Give the JSP the list of Payment Methods
        map = dib.getPaymentMethods();
        request.setAttribute(PAYMENT_METHOD_LIST, map.get(PAYMENT_METHOD_LIST));

        // Give the JSP the list of Affidavit Statuss
        map = dib.getStatusCodes(PactsConstants.AFFIDAVIT_OBJ);
        request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

        // Give the JSP the list of Payment Statuses
        map = dib.getStatusCodes(PactsConstants.PAYMENT_OBJ);
        request.setAttribute(STATUS_CODE_LIST + "2", map.get(STATUS_CODE_LIST));

        // Give the JSP the list of Rounds
        map = dib.getRounds();
        request.setAttribute(ROUND_LIST, map.get(ROUND_LIST));

        forward(INTERNAL_ADD_AFFIDAVIT_JSP, request, response);
*/
    }


    // Trys to add the Affidavit.  If successful, pulls up the View Affidavit, otherwise returns
    // the user to the Add Affidavit Page
    /**
     * @deprecated
     */
    private void doAddAffidavitPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        throw new IllegalArgumentException("Deprecated. It never should came here!!");
/*
        try {
            log.debug("doAddAffidavitPost<br>");

            long round_id = Long.parseLong(request.getParameter("round_id"));

            // Make the Affidavit
            Affidavit a = new Affidavit(
                    // If the round id is invalid, there is no round.
                    round_id < 0 ? null : new Long(round_id),
                    Long.parseLong(request.getParameter("user_id")),
                    Integer.parseInt(request.getParameter("affidavit_status_id")),
                    request.getParameter("affidavit_desc"),
                    Integer.parseInt(request.getParameter("affidavit_type_id")),
                    false,
                    makeBoolean(request.getParameter(IS_NOTARIZED)));

            // Leaving net amount blank is equivalent to entering 0
            String net = request.getParameter("net_amount");
            if (net == null || net.equals("")) net = "0";

            // Make the Payment
            Payment p = null;
            if (!"".equals(StringUtils.checkNull(request.getParameter("payment_desc")))) {
                p = new Payment(
                    Long.parseLong(request.getParameter("user_id")),
                    request.getParameter("payment_desc"),
                    Integer.parseInt(request.getParameter("payment_type_id")),
                    Integer.parseInt(request.getParameter("payment_method_id")),
                    // dpecora 05/03 - fix
                    // Double.parseDouble(request.getParameter(net)),
                    Double.parseDouble(net),
                    Double.parseDouble(request.getParameter("gross_amount")),
                    Integer.parseInt(request.getParameter("payment_status_id")));
                p.setDueDate(TCData.dateForm(request.getParameter("date_due")));
            }

            // Add the Affidavit and the Payment
            DataInterfaceBean dib = new DataInterfaceBean();
            String text = "".equals(StringUtils.checkNull(request.getParameter("text"))) ? null : request.getParameter("text");
            long affidavit_id = dib.addAffidavit(a, text, p);

            // Now get the Affidavit to view and give it to the JSP
            InternalDispatchAffidavit bean =
                    new InternalDispatchAffidavit(request, response);
            Affidavit results = bean.get(affidavit_id);
            request.setAttribute(PACTS_INTERNAL_RESULT, results);

            forward(INTERNAL_AFFIDAVIT_JSP, request, response);

        } catch (Throwable e) {
            try {
                handleException(request, response, e);
            } catch (Exception e1) {
                log.fatal("forwarding to error page failed", e);
                e.printStackTrace();
                response.setContentType("text/html");
                response.setStatus(500);
                PrintWriter out = response.getWriter();
                out.println("<html><head><title>Internal Error</title></head>");
                out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
                out.println("</body></html>");
                out.flush();
            }
        }*/
    }


    // Pulls up the Add Contract page.
    private void doAddContract(HttpServletRequest request, HttpServletResponse response) throws Exception {

        log.debug("doAddContract<br>");

        // Give the JSP the User Object
        InternalDispatchUserProfileHeader bean =
                new InternalDispatchUserProfileHeader(request, response);
        UserProfileHeader results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        // Give the JSP the list of Contract Types
        DataInterfaceBean dib = new DataInterfaceBean();
        Map map = dib.getContractTypes();
        request.setAttribute(CONTRACT_TYPE_LIST, map.get(CONTRACT_TYPE_LIST));

        // Give the JSP the list of Contract Statuss
        map = dib.getStatusCodes(PactsConstants.CONTRACT_OBJ);
        request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

        forward(INTERNAL_ADD_CONTRACT_JSP, request, response);

    }


    // Trys to add the Contract and, if successful, pulls up the View Contract page
    // otherwise returns the user to the Add Contract page
    private void doAddContractPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddContractPost<br>");

        Contract c = new Contract(
                request.getParameter("name"),
                Long.parseLong(request.getParameter("user_id")),
                TCData.dateForm(request.getParameter("start_date")),
                TCData.dateForm(request.getParameter("end_date")),
                request.getParameter("contract_desc"),
                Integer.parseInt(request.getParameter("status_id")),
                Integer.parseInt(request.getParameter("contract_type_id")));

        DataInterfaceBean dib = new DataInterfaceBean();
        long contract_id = dib.addContract(c, request.getParameter("text"));

        InternalDispatchContract bean =
                new InternalDispatchContract(request, response);
        Contract results = bean.get(contract_id);
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        forward(INTERNAL_CONTRACT_JSP, request, response);

    }


    /*
    Forwarding JSP: "addPayment.jsp"
    */
    /**
     * @deprecated
     */
    private void doAddPayment(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.warn("Using deprecated processor, please use module=EditPayment insted");
        if (request.getParameter(CONTRACT_ID) != null) {
            forward(Links.addContractPayment(Long.parseLong(request.getParameter(CONTRACT_ID))), request, response);
        } else {
            forward(Links.addPayment(Long.parseLong(request.getParameter(USER_ID))), request, response);
        }
        /*
        log.debug("doAddPayment<br>");

        if (request.getParameter(CONTRACT_ID) != null) {

            InternalDispatchContract bean =
                    new InternalDispatchContract(request, response);
            ContractHeader results = bean.get().getHeader();
            request.setAttribute(PACTS_INTERNAL_RESULT, results);
        } else {
            InternalDispatchUserProfileHeader bean =
                    new InternalDispatchUserProfileHeader(request, response);
            UserProfileHeader results = bean.get();
            request.setAttribute(PACTS_INTERNAL_RESULT, results);
        }

        DataInterfaceBean dib = new DataInterfaceBean();
        Map map = dib.getPaymentTypes();
        request.setAttribute(PAYMENT_TYPE_LIST, map.get(PAYMENT_TYPE_LIST));
        map = dib.getPaymentMethods();
        request.setAttribute(PAYMENT_METHOD_LIST, map.get(PAYMENT_METHOD_LIST));
        map = dib.getStatusCodes(PactsConstants.PAYMENT_OBJ);
        request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

        forward(INTERNAL_ADD_PAYMENT_JSP, request, response);
*/
    }

    /*
    This method adds and links a payment.

    Forwarding JSPs: "viewPayment.jsp" "viewContract.jsp"
    */
    private void doAddPaymentPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new IllegalArgumentException("Deprecated. It never should came here!!");
        /*
        log.debug("doAddPaymentPost");

        String net = request.getParameter("net_amount");
        if (net == null || net.equals("")) net = "0";

        Payment p = new Payment(
                Long.parseLong(request.getParameter("user_id")),
                request.getParameter("payment_desc"),
                Integer.parseInt(request.getParameter("payment_type_id")),
                Integer.parseInt(request.getParameter("payment_method_id")),
                Double.parseDouble(net),
                Double.parseDouble(request.getParameter("gross_amount")),
                Integer.parseInt(request.getParameter("status_id")));

        Calendar dueDate = Calendar.getInstance();
        dueDate.setTime(new Date());
        dueDate.add(Calendar.DAY_OF_YEAR, DUE_DATE_INTERVAL);
        StringBuffer buf = new StringBuffer(10);
        buf.append(dueDate.get(Calendar.MONTH) + 1);
        buf.append("/");
        buf.append(dueDate.get(Calendar.DAY_OF_MONTH));
        buf.append("/");
        buf.append(dueDate.get(Calendar.YEAR));

        log.debug("due date: |" + request.getParameter("date_due") + "| default " + buf.toString());

        p.setDueDate(TCData.dateForm(request.getParameter("date_due"), buf.toString(), true));
        p.getHeader().setAlgorithmRoundId(getLongParam(request, "algorithm_round_id"));
        p.getHeader().setComponentProjectId(getLongParam(request, "component_project_id"));
        p.getHeader().setAlgorithmProblemId(getLongParam(request, "algorithm_problem_id"));
        p.getHeader().setStudioContestId(getLongParam(request, "studio_contest_id"));
        p.getHeader().setComponentContestId(getLongParam(request, "component_contest_id"));
        p.getHeader().setDigitalRunStageId(getLongParam(request, "digital_run_stage_id"));
        p.getHeader().setDigitalRunSeasonId(getLongParam(request, "digital_run_season_id"));
        p.getHeader().setParentPaymentId(getLongParam(request, "parent_reference_id"));

        if (request.getParameter("client") != null) {
            p.getHeader().setClient((String) request.getParameter("client"));
        }

        DataInterfaceBean dib = new DataInterfaceBean();

        if (request.getParameter(CONTRACT_ID) != null) {
            long contract_id = Long.parseLong(request.getParameter(CONTRACT_ID));
            dib.addContractPayment(contract_id, p);
            InternalDispatchContract bean =
                    new InternalDispatchContract(request, response);
            Contract results = bean.get(contract_id);
            request.setAttribute(PACTS_INTERNAL_RESULT, results);

            InternalDispatchNoteList nlb =
                    new InternalDispatchNoteList(request, response);
            Map search = new HashMap();
            search.put(CONTRACT_ID, request.getParameter(CONTRACT_ID));
            request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

            forward(INTERNAL_CONTRACT_JSP, request, response);
        } else {
            long payment_id = dib.addPayment(p);

            //InternalDispatchPayment bean =
                    //new InternalDispatchPayment(request, response);
            //Payment results = bean.get(payment_id);
            //request.setAttribute(PACTS_INTERNAL_RESULT, results);
            //String creationDate = bean.getCreationDate(results.getHeader());
            //request.setAttribute(CREATION_DATE, creationDate);
            //forward(INTERNAL_PAYMENT_JSP, request, response);

            //forward("/PactsInternalServlet?module=ViewPayment&payment_id=" + payment_id, request, response);

        }
*/
    }

    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("PactsInternalServlet");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }

    /*
    Forwardidng JSP: "addTaxForm.jsp"
    */
    private void doAddTaxForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddTaxForm<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        Map map = dib.getStatusCodes(PactsConstants.TAX_FORM_OBJ);
        request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

        forward(INTERNAL_ADD_TAX_FORM_JSP, request, response);

    }


    /*
    This method adds a new tax form.

    Forwarding JSP: "viewTaxForm.jsp"
    */
    private void doAddTaxFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddTaxFormPost<br>");

        TaxForm t = new TaxForm(
                request.getParameter("name"),
                request.getParameter("tax_form_desc"),
                Float.parseFloat(request.getParameter("default_withholding_percentage")),
                Double.parseDouble(request.getParameter("default_withholding_amount")),
                Integer.parseInt(request.getParameter("status_id")),
                makeBoolean(request.getParameter("default_use_percentage"))
        );

        DataInterfaceBean dib = new DataInterfaceBean();
        long tax_form_id = dib.addTaxForm(t, request.getParameter("text"));

        InternalDispatchTaxForm bean =
                new InternalDispatchTaxForm(request, response);
        TaxForm results = bean.get(tax_form_id);
        request.setAttribute(PACTS_INTERNAL_RESULT, results);
        forward(INTERNAL_TAX_FORM_JSP, request, response);

    }


    /*
    Forwarding JSP: "addUserTaxForm.jsp"
    */
    private void doAddUserTaxForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddUserTaxForm<br>");

        InternalDispatchTaxFormList bean =
                new InternalDispatchTaxFormList(request, response);

        TaxFormHeader[] results = bean.get();

        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PactsConstants.USER_TAX_FORM_OBJ).get(STATUS_CODE_LIST));

        InternalDispatchUserProfileHeader uphb =
                new InternalDispatchUserProfileHeader(request, response);

        request.setAttribute("user", uphb.get());

        forward(INTERNAL_ADD_USER_TAX_FORM_JSP, request, response);

    }


    /*
    This method adds a new user tax form.

    Forwarding JSP: "viewUserTaxForm.jsp"
    */
    private void doAddUserTaxFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddUserTaxFormPost<br>");

        TaxForm t = new TaxForm(
                Long.parseLong(request.getParameter("user_id")),
                Long.parseLong(request.getParameter("tax_form_id")),
                TCData.dateForm(request.getParameter("date_filed")),
                Integer.parseInt(request.getParameter("status_id")));

        DataInterfaceBean dib = new DataInterfaceBean();
        dib.addUserTaxForm(t);

        InternalDispatchUserTaxForm bean =
                new InternalDispatchUserTaxForm(request, response);
        TaxForm results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        forward(INTERNAL_USER_TAX_FORM_JSP, request, response);

    }


    /*
    This method gets the details for an affidavit.

    Forawrding JSP: "viewAffidavit.jsp"
    */
    private void doAffidavit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAffidavit<br>");

        InternalDispatchAffidavit bean =
                new InternalDispatchAffidavit(request, response);
        Affidavit results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        NoteHeader[] notes = nlb.get();
        request.setAttribute(NOTE_HEADER_LIST, notes);

        forward(INTERNAL_AFFIDAVIT_JSP, request, response);

    }


    /*
    This method gets a list of affidavits.

    Forwarding JSP: "affidavitList.jsp"
    */
    private void doAffidavitList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAffidavitList<br>");
        InternalDispatchAffidavitList bean =
                new InternalDispatchAffidavitList(request, response);
        AffidavitHeader[] results = bean.get();
        if (results.length != 1) {
            request.setAttribute(PACTS_INTERNAL_RESULT, results);
            forward(INTERNAL_AFFIDAVIT_LIST_JSP, request, response);
        } else {
            InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
            Map search = new HashMap();
            search.put(AFFIDAVIT_ID, "" + results[0].getId());
            NoteHeader[] notes = nlb.get(search);
            request.setAttribute(NOTE_HEADER_LIST, notes);

            InternalDispatchAffidavit ab = new InternalDispatchAffidavit(request, response);
            Affidavit affidavit = ab.get(results[0].getId());
            request.setAttribute(PACTS_INTERNAL_RESULT, affidavit);

            forward(INTERNAL_AFFIDAVIT_JSP, request, response);
        }

    }

    /*
    This method forwards to a jsp.
    */
    private void forward(String href, HttpServletRequest request, HttpServletResponse response) {
        try {
            log.debug("Forwarding to ..." + href);

            getServletConfig().getServletContext().getRequestDispatcher(href).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Override to use getUser instead of getActiveUser, so that it just looks in the sesion and not in the cookie,
     */
    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        log.debug("PactsInternalServlet.hasPermission, user=" + auth.getUser().getUserName());
        return createAuthorization(auth.getUser()).hasPermission(r);
    }

    /*
    This method authenticates the session and forwards
    the user to a login page if there is an error.
    */
    private boolean doAuthenticate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TCRequest tcRequest = HttpObjectFactory.createRequest(request);
        WebAuthentication auth = createAuthentication(tcRequest,
                HttpObjectFactory.createResponse(response));
        ClassResource resource = new ClassResource(this.getClass());

        log.debug("PactsInternalServlet.doAuthenticate, user=" + auth.getUser().getUserName());
        if (hasPermission(auth, resource)) {
            return true;
        } else {
            TCSubject user = getUser(auth.getActiveUser().getId());
            SessionInfo info = createSessionInfo(tcRequest, auth, user.getPrincipals());

            if (auth.getUser().isAnonymous()) {
                handleLogin(request, response, info);
            } else {
                handleException(request, response, new PermissionException(auth.getActiveUser(), resource));
            }

            return false;
        }
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) {
        log.debug("doLogout");
        HttpSession session = request.getSession(true);
        session.setAttribute(NAV_OBJECT_ATTR, null);
        forward(LOGIN_URL, request, response);
    }

    /*
    This method gets the details for a contract.

    Forwarding JSP: "viewContract.jsp"
    */
    private void doContract(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doContract<br>");

        InternalDispatchContract bean =
                new InternalDispatchContract(request, response);
        Contract results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        NoteHeader[] notes = nlb.get();
        request.setAttribute(NOTE_HEADER_LIST, notes);

        forward(INTERNAL_CONTRACT_JSP, request, response);

    }


    /*
    This method gets a list of contracts.

    Forwarding JSP: "contractList.jsp"
    */
    private void doContractList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doContractList<br>");

        InternalDispatchContractList bean =
                new InternalDispatchContractList(request, response);
        ContractHeader[] results = bean.get();

        if (results.length != 1) {
            request.setAttribute(PACTS_INTERNAL_RESULT, results);

            forward(INTERNAL_CONTRACT_LIST_JSP, request, response);
        } else {
            InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
            Map search = new HashMap();
            search.put(CONTRACT_ID, "" + results[0].getId());
            NoteHeader[] notes = nlb.get(search);
            request.setAttribute(NOTE_HEADER_LIST, notes);

            InternalDispatchContract cb = new InternalDispatchContract(request, response);
            Contract contract = cb.get(results[0].getId());
            request.setAttribute(PACTS_INTERNAL_RESULT, contract);

            forward(INTERNAL_CONTRACT_JSP, request, response);
        }

    }


    /*
    This method gets the details of a payment.

    Forwarding JSP: "viewPayment.jsp"
    */
    private void doPayment(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.warn("Using deprecated processor, please use module=ViewPayment insted");
        forward(Links.viewPayment(Long.parseLong(request.getParameter(PAYMENT_ID))), request, response);
/*
        log.debug("doPayment<br>");

        InternalDispatchPayment bean =
                new InternalDispatchPayment(request, response);
        Payment results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);
        String creationDate = bean.getCreationDate(results.getHeader());
        request.setAttribute(CREATION_DATE, creationDate);

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        Map search = new HashMap();
        search.put(PAYMENT_ID, request.getParameter(PAYMENT_ID));
        request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

        forward(INTERNAL_PAYMENT_JSP, request, response);
*/
    }


    /*
    This method gets the audit trail of a payment.

    Forwarding JSP: "viewPaymentAuditTrail.jsp"
    */
    private void doPaymentAuditTrail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doPaymentAuditTrail<br>");

        InternalDispatchPaymentAuditTrail bean =
                new InternalDispatchPaymentAuditTrail(request, response);
        Payment[] results = bean.get();

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        Map search = new HashMap();
        search.put(PAYMENT_ID, request.getParameter(PAYMENT_ID));
        request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

        request.setAttribute(PACTS_INTERNAL_RESULT, results);
        forward(INTERNAL_PAYMENT_AUDIT_TRAIL_JSP, request, response);

    }

    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doSearch<br>");

        forward(INTERNAL_SEARCH_JSP, request, response);
    }


    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearchUsers(HttpServletRequest request, HttpServletResponse response) {
        log.debug("doSearchUsers<br>");

        forward(INTERNAL_SEARCH_USERS_JSP, request, response);
    }


    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearchPayments(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doSearch<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(PAYMENT_TYPE_LIST, dib.getPaymentTypes().get(PAYMENT_TYPE_LIST));
        request.setAttribute(PAYMENT_TYPE_LIST, dib.getPaymentTypes().get(PAYMENT_TYPE_LIST));
        request.setAttribute(PAYMENT_STATUS_LIST, PaymentStatusFactory.getAllStatusList());
        request.setAttribute(PAYMENT_METHOD_LIST, dib.getPaymentMethods().get(PAYMENT_METHOD_LIST));

        forward(INTERNAL_SEARCH_PAYMENTS_JSP, request, response);
    }

    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearchAffidavits(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doSearch<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(AFFIDAVIT_OBJ).get(STATUS_CODE_LIST));
        request.setAttribute(AFFIDAVIT_TYPE_LIST, dib.getAffidavitTypes().get(AFFIDAVIT_TYPE_LIST));
        request.setAttribute(ROUND_LIST, dib.getRounds().get(ROUND_LIST));

        forward(INTERNAL_SEARCH_AFFIDAVITS_JSP, request, response);
    }

    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearchContracts(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doSearch<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(CONTRACT_OBJ).get(STATUS_CODE_LIST));
        request.setAttribute(CONTRACT_TYPE_LIST, dib.getContractTypes().get(CONTRACT_TYPE_LIST));

        forward(INTERNAL_SEARCH_CONTRACTS_JSP, request, response);
    }

    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearchTaxForms(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doSearch<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(TAX_FORM_OBJ).get(STATUS_CODE_LIST));

        forward(INTERNAL_SEARCH_TAX_FORMS_JSP, request, response);
    }

    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearchUserTaxForms(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doSearch<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(USER_TAX_FORM_OBJ).get(STATUS_CODE_LIST));

        forward(INTERNAL_SEARCH_USER_TAX_FORMS_JSP, request, response);
    }

    /*
    Forwarding JSP: "search.jsp"
    */
    private void doSearchNotes(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doSearch<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(NOTE_TYPE_LIST, dib.getNoteTypes().get(NOTE_TYPE_LIST));

        forward(INTERNAL_SEARCH_NOTES_JSP, request, response);
    }

    /*
    This method gets the details for a tax form.

    Forwarding JSP: "viewTaxForm.jsp"
    */
    private void doTaxForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doTaxForm<br>");

        InternalDispatchTaxForm bean =
                new InternalDispatchTaxForm(request, response);
        TaxForm results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);
        forward(INTERNAL_TAX_FORM_JSP, request, response);

    }

    /*
    This method gets a list of tax forms.

    Forwarding JSP: "taxFormList.jsp"
    */
    private void doTaxFormList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doTaxFormList<br>");

        InternalDispatchTaxFormList bean =
                new InternalDispatchTaxFormList(request, response);
        TaxFormHeader[] results = bean.get();
        if (results.length != 1) {
            request.setAttribute(PACTS_INTERNAL_RESULT, results);
            forward(INTERNAL_TAX_FORM_LIST_JSP, request, response);
        } else {
            InternalDispatchTaxForm tfb = new InternalDispatchTaxForm(request, response);
            request.setAttribute(PACTS_INTERNAL_RESULT, tfb.get(results[0].getId()));
            forward(INTERNAL_TAX_FORM_JSP, request, response);
        }

    }

    /*
    This method gets the details for a tax form.

    Forwarding JSP: "viewUserTaxForm.jsp"
    */
    private void doUserTaxForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUserTaxForm<br>");

        InternalDispatchUserTaxForm bean =
                new InternalDispatchUserTaxForm(request, response);
        TaxForm results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        NoteHeader[] notes = nlb.get(results.getHeader().getUser().getId());
        request.setAttribute(NOTE_HEADER_LIST, notes);

        forward(INTERNAL_USER_TAX_FORM_JSP, request, response);

    }


    /*
    This method gets a list of tax forms.

    Forwarding JSP: "userTaxFormList.jsp"
    */
    private void doUserTaxFormList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUserTaxFormList<br>");

        InternalDispatchUserTaxFormList bean =
                new InternalDispatchUserTaxFormList(request, response);
        TaxFormHeader[] results = bean.get();
        if (results.length != 1) {
            request.setAttribute(PACTS_INTERNAL_RESULT, results);

            forward(INTERNAL_USER_TAX_FORM_LIST_JSP, request, response);
        } else {
            InternalDispatchUserTaxForm utfb = new InternalDispatchUserTaxForm(request, response);
            request.setAttribute(PACTS_INTERNAL_RESULT, utfb.get(results[0].getId(), results[0].getUser().getId()));

            InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
            Map search = new HashMap();
            search.put(TAX_FORM_ID, "" + results[0].getId());
            search.put(TAX_FORM_USER_ID, "" + results[0].getUser().getId());
            request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

            forward(INTERNAL_USER_TAX_FORM_JSP, request, response);
        }

    }


    /*
    Forwarding JSP: "updateAffidavit.jsp"
    */
    /**
     * @deprecated
     */
    private void doUpdateAffidavit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.warn("Using deprecated processor, please use module=UpdateAffidavit insted");
        forward(Links.updateAffidavit(Long.parseLong(request.getParameter(AFFIDAVIT_ID))), request, response);
/*
        log.debug("doUpdateAffidavit<br>");
        InternalDispatchAffidavit bean =
                new InternalDispatchAffidavit(request, response);
        Affidavit results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PactsConstants.AFFIDAVIT_OBJ).get(STATUS_CODE_LIST));
        request.setAttribute(ROUND_LIST, dib.getRounds().get(ROUND_LIST));
        request.setAttribute(AFFIDAVIT_TYPE_LIST, dib.getAffidavitTypes().get(AFFIDAVIT_TYPE_LIST));

        forward(INTERNAL_UPDATE_AFFIDAVIT_JSP, request, response);
*/
    }


    /*
    Forwarding JSP: "viewAffidavit.jsp"
    */
    /**
     * @deprecated
     */
    private void doUpdateAffidavitPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new IllegalArgumentException("Deprecated. It never should came here!!");
        /*
        log.debug("doUpdateAffidavitPost<br>");

        InternalDispatchAffidavit bean =
                new InternalDispatchAffidavit(request, response);
        Affidavit affidavit = bean.get();

        long round_id = Long.parseLong(request.getParameter("round_id"));

        affidavit.setRoundId(round_id < 0 ? null : new Long(round_id));
        affidavit.getHeader().setStatusId(Integer.parseInt(request.getParameter("affidavit_status_id")));
        affidavit.getHeader().setDescription(request.getParameter("affidavit_desc"));
        affidavit.getHeader().setTypeId(Integer.parseInt(request.getParameter("affidavit_type_id")));
        affidavit.getHeader().setNotarized(makeBoolean(request.getParameter(IS_NOTARIZED)));

        DataInterfaceBean dib = new DataInterfaceBean();
        dib.updateAffidavit(affidavit);

        if (!affidavit.getHeader().isAffirmed() &&
                affidavit.getHeader().getStatusId() == AFFIDAVIT_AFFIRMED_STATUS) {
            doAffirmAffidavitPost(request, response);
        } else {
            affidavit = bean.get();

            request.setAttribute(PACTS_INTERNAL_RESULT, affidavit);

            InternalDispatchNoteList notes =
                    new InternalDispatchNoteList(request, response);
            Map search = new HashMap();
            search.put(AFFIDAVIT_ID, request.getParameter(AFFIDAVIT_ID));
            request.setAttribute(NOTE_HEADER_LIST, notes.get(search));

            forward(INTERNAL_AFFIDAVIT_JSP, request, response);
        }
        */
    }


    /*
    Forwarding JSP: "updateContract.jsp"
    */
    private void doUpdateContract(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUpdateContract<br>");

        InternalDispatchContract bean =
                new InternalDispatchContract(request, response);
        Contract results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        InternalDispatchText tb =
                new InternalDispatchText(request, response);
        request.setAttribute("text", tb.get(results.getHeader().getId(), CONTRACT_OBJ));

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(CONTRACT_TYPE_LIST, dib.getContractTypes().get(CONTRACT_TYPE_LIST));
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PactsConstants.CONTRACT_OBJ).get(STATUS_CODE_LIST));

        forward(INTERNAL_UPDATE_CONTRACT_JSP, request, response);

    }


    /*
    Forwarding JSP: "viewContract.jsp"
    */
    private void doUpdateContractPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUpdateContractPost<br>");

        InternalDispatchContract bean =
                new InternalDispatchContract(request, response);
        Contract contract = bean.get();

        contract.getHeader().setName(request.getParameter("name"));
        contract.setStartDate(TCData.dateForm(request.getParameter("start_date")));
        contract.setEndDate(TCData.dateForm(request.getParameter("end_date")));
        contract.setDescription(request.getParameter("contract_desc"));
        contract.getHeader().setStatusId(Integer.parseInt(request.getParameter("status_id")));
        contract.getHeader().setTypeId(Integer.parseInt(request.getParameter("contract_type_id")));

        DataInterfaceBean dib = new DataInterfaceBean();
        dib.updateContract(contract);
        dib.updateText(contract.getHeader().getId(), CONTRACT_OBJ, request.getParameter("text"));

        contract = bean.get();

        request.setAttribute(PACTS_INTERNAL_RESULT, contract);

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        Map search = new HashMap();
        search.put(CONTRACT_ID, request.getParameter(CONTRACT_ID));
        request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

        forward(INTERNAL_CONTRACT_JSP, request, response);
    }


    /*
    Forwarding JSP: "updatePayment.jsp"
    */
    /**
     * @deprecated
     */
    private void doUpdatePayment(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.warn("Using deprecated processor, please use module=EditPayment insted");
        forward(Links.updatePayment(Long.parseLong(request.getParameter(PAYMENT_ID))), request, response);
/*
        log.debug("doUpdatePayment<br>");

        InternalDispatchPayment bean =
                new InternalDispatchPayment(request, response);
        Payment results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(MODIFICATION_RATIONALE_LIST, dib.getModificationRationales().get(MODIFICATION_RATIONALE_LIST));
        request.setAttribute(PAYMENT_TYPE_LIST, dib.getPaymentTypes().get(PAYMENT_TYPE_LIST));
        request.setAttribute(PAYMENT_METHOD_LIST, dib.getPaymentMethods().get(PAYMENT_METHOD_LIST));
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PactsConstants.PAYMENT_OBJ).get(STATUS_CODE_LIST));

        forward(INTERNAL_UPDATE_PAYMENT_JSP, request, response);
        */
    }


    /*
    Forwarding JSP: "viewPaymentAuditTrail.jsp"
    */
    /**
     * @deprecated
     */
    private void doUpdatePaymentPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new IllegalArgumentException("Deprecated. It never should came here!!");
        /*
        log.debug("doUpdatePaymentPost<br>");

        InternalDispatchPayment pb =
                new InternalDispatchPayment(request, response);
        Payment payment = pb.get();

        String net = request.getParameter("net_amount");
        if (net == null || net.equals("")) net = "0";

        payment.getHeader().setDescription(request.getParameter("payment_desc"));
        payment.getHeader().setTypeId(Integer.parseInt(request.getParameter("payment_type_id")));
        payment.getHeader().setMethodId(Integer.parseInt(request.getParameter("payment_method_id")));
        payment.getHeader().setClient(StringUtils.checkNull(request.getParameter("client")).trim());
        payment.setGrossAmount(Double.parseDouble(request.getParameter("gross_amount")));
        // dpecora 05/03 - fix
        // payment._netAmount = Double.parseDouble(request.getParameter(net));
        payment.setNetAmount(Double.parseDouble(net));
        payment.setStatusId(Integer.parseInt(request.getParameter("status_id")));
        payment.setPayDate(TCData.dateForm(request.getParameter("date_paid")));
        payment.setDueDate(TCData.dateForm(request.getParameter("date_due")));
        payment.setRationaleId(Integer.parseInt(request.getParameter("modification_rationale_id")));

        DataInterfaceBean dib = new DataInterfaceBean();
        dib.updatePayment(payment);

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        Map search = new HashMap();
        search.put(PAYMENT_ID, request.getParameter(PAYMENT_ID));
        request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

        InternalDispatchPaymentAuditTrail bean =
                new InternalDispatchPaymentAuditTrail(request, response);
        Payment[] results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        forward(INTERNAL_PAYMENT_AUDIT_TRAIL_JSP, request, response);
*/
    }


    /*
    Forwarding JSP: "updateTaxForm.jsp"
    */
    private void doUpdateTaxForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUpdateTaxForm<br>");

        InternalDispatchTaxForm bean =
                new InternalDispatchTaxForm(request, response);
        TaxForm results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        InternalDispatchText tb =
                new InternalDispatchText(request, response);
        request.setAttribute("text", tb.get(results.getHeader().getId(), TAX_FORM_OBJ));

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PactsConstants.TAX_FORM_OBJ).get(STATUS_CODE_LIST));

        forward(INTERNAL_UPDATE_TAX_FORM_JSP, request, response);

    }


    /*
    Forwarding JSP: "viewTaxForm.jsp"
    */
    private void doUpdateTaxFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUpdateTaxFormPost<br>");

        InternalDispatchTaxForm bean =
                new InternalDispatchTaxForm(request, response);
        TaxForm taxForm = bean.get();

        taxForm.getHeader().setName(request.getParameter("name"));
        taxForm.setDescription(request.getParameter("tax_form_desc"));
        taxForm.setDefaultWithholdingPercentage(Float.parseFloat(request.getParameter("default_withholding_percentage")));
        taxForm.setDefaultWithholdingAmount(Double.parseDouble(request.getParameter("default_withholding_amount")));
        taxForm.setGenericFormStatusID(Integer.parseInt(request.getParameter("status_id")));
        taxForm.setDefaultUsePercentage(makeBoolean(request.getParameter("default_use_percentage")));

        DataInterfaceBean dib = new DataInterfaceBean();
        dib.updateTaxForm(taxForm);
        dib.updateText(taxForm.getHeader().getId(), TAX_FORM_OBJ, request.getParameter("text"));

        taxForm = bean.get();

        request.setAttribute(PACTS_INTERNAL_RESULT, taxForm);

        forward(INTERNAL_TAX_FORM_JSP, request, response);

    }


    /*
    Forwarding JSP: "updateUserTaxForm.jsp"
    */
    private void doUpdateUserTaxForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUpdateUserTaxForm<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PactsConstants.USER_TAX_FORM_OBJ).get(STATUS_CODE_LIST));

        InternalDispatchUserTaxForm bean =
                new InternalDispatchUserTaxForm(request, response);
        TaxForm results = bean.get();
        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        forward(INTERNAL_UPDATE_USER_TAX_FORM_JSP, request, response);
    }


    /*
    Forwarding JSP: "viewUserTaxForm.jsp"
    */
    private void doUpdateUserTaxFormPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUpdateUserTaxFormPost<br>");

        InternalDispatchUserTaxForm bean =
                new InternalDispatchUserTaxForm(request, response);
        TaxForm userTaxForm = bean.get();

        userTaxForm.setWithholdingPercentage(Float.parseFloat(request.getParameter("withholding_percentage")));

        // Update 02/17/2011. Don't use the withholding amount, only the percentage.
        userTaxForm.setWithholdingAmount(0.0);
        //userTaxForm.setWithholdingAmount(Double.parseDouble(request.getParameter("withholding_amount")));

        userTaxForm.getHeader().setStatusId(Integer.parseInt(request.getParameter("status_id")));
        userTaxForm.getHeader().setDateFiled(TCData.dateForm(request.getParameter("date_filed")));

        // Update 02/17/2011. Always use percentage value from now on.
        userTaxForm.setUsePercentage(true);
        //userTaxForm.setUsePercentage(makeBoolean(request.getParameter("use_percentage")));

        DataInterfaceBean dib = new DataInterfaceBean();
        dib.updateUserTaxForm(userTaxForm);

        userTaxForm = bean.get();

        request.setAttribute(PACTS_INTERNAL_RESULT, userTaxForm);

        InternalDispatchNoteList notes =
                new InternalDispatchNoteList(request, response);
        Map search = new HashMap();
        search.put(TAX_FORM_ID, request.getParameter(TAX_FORM_ID));
        search.put(TAX_FORM_USER_ID, request.getParameter(USER_ID));
        request.setAttribute(NOTE_HEADER_LIST, notes.get(search));

        forward(INTERNAL_USER_TAX_FORM_JSP, request, response);

    }


    /*
    Forwarding JSP: "addNote.jsp"
    */
    private void doAddNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddNote<br>");

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(NOTE_TYPE_LIST, dib.getNoteTypes().get(NOTE_TYPE_LIST));

        forward(INTERNAL_ADD_NOTE_JSP, request, response);
    }


    /*
    This method adds a note.

    Forwarding JSP: "viewNote.jsp"
    */
    private void doAddNotePost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddNotePost<br>");

        WebAuthentication auth = createAuthentication(HttpObjectFactory.createRequest(request),
                HttpObjectFactory.createResponse(response));
        long user_id = auth.getActiveUser().getId();

        Note n = new Note(
                request.getParameter("text"),
                Integer.parseInt(request.getParameter("note_type_id")),
                user_id,
                Long.parseLong(request.getParameter("user_id")));

        DataInterfaceBean dib = new DataInterfaceBean();

        long note_id = dib.addObjectNote(
                Long.parseLong(request.getParameter("object_id")),
                Integer.parseInt(request.getParameter("object_type")),
                Long.parseLong(request.getParameter("tax_form_user_id")),
                n);

        InternalDispatchNote bean = new InternalDispatchNote(request, response);
        n = bean.get(note_id);

        request.setAttribute(PACTS_INTERNAL_RESULT, n);

        forward(INTERNAL_NOTE_JSP, request, response);

    }

    /*
    This method gets a list of items a note is attached to.

    Forwarding JSP: "comboList.jsp"
    */
    private void doComboList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doComboList<br>");

        InternalDispatchPactsEntryList bean =
                new InternalDispatchPactsEntryList(request, response);

        PactsEntry[] results = bean.get();

        request.setAttribute(PACTS_INTERNAL_RESULT, results);

        forward(INTERNAL_COMBO_LIST_JSP, request, response);
    }

    /*
    This method gets the details of a note.

    Forwarding JSP: "viewNote.jsp"
    */
    private void doNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doNote<br>");

        InternalDispatchNote bean = new InternalDispatchNote(request, response);
        Note n = bean.get();

        request.setAttribute(PACTS_INTERNAL_RESULT, n);

        forward(INTERNAL_NOTE_JSP, request, response);

    }


    /*
    This method gets a list of notes.

    Forwarding JSP: "noteList.jsp"
    */
    private void doNoteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doNoteList<br>");

        InternalDispatchNoteList bean = new InternalDispatchNoteList(request, response);
        NoteHeader[] n = bean.get();

        if (n.length != 1) {
            request.setAttribute(PACTS_INTERNAL_RESULT, n);

            forward(INTERNAL_NOTE_LIST_JSP, request, response);
        } else {
            InternalDispatchNote nb = new InternalDispatchNote(request, response);

            request.setAttribute(PACTS_INTERNAL_RESULT, nb.get(n[0].getId()));
            forward(INTERNAL_NOTE_JSP, request, response);
        }
    }

    /*
    This method gets some text.

    Forwarding JSP: "viewText.jsp"
    */
    private void doText(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doText<br>");

        InternalDispatchText bean = new InternalDispatchText(request, response);
        String text = bean.get();

        request.setAttribute(PACTS_INTERNAL_RESULT, text);

        forward(INTERNAL_TEXT_JSP, request, response);

    }


    /*
    This method gets the details of a user.

    Forwarding JSP: "viewUser.jsp"
    */
    private void doUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUser<br>");

        InternalDispatchUserProfile bean = new InternalDispatchUserProfile(request, response);
        UserProfile u = bean.get();

        InternalDispatchNoteList nlb =
                new InternalDispatchNoteList(request, response);
        Map search = new HashMap();
        search.put(USER_ID, request.getParameter(USER_ID));
        request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

        DataInterfaceBean dib = new DataInterfaceBean();
        request.setAttribute(HAS_GLOBAL_AD, dib.hasGlobalAD(u.getHeader().getId()));
        request.setAttribute(PACTS_INTERNAL_RESULT, u);

        forward(INTERNAL_USER_JSP, request, response);
    }


    /*
    This method gets a list of users.

    Forwarding JSP: "userList.jsp"
    */
    private void doUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doUserList<br>");

        InternalDispatchUserProfileList bean = new InternalDispatchUserProfileList(request, response);
        UserProfileHeader[] u = bean.get();

        if (u.length != 1) {
            request.setAttribute(PACTS_INTERNAL_RESULT, u);

            forward(INTERNAL_USER_LIST_JSP, request, response);
        } else {
            InternalDispatchUserProfile upb = new InternalDispatchUserProfile(request, response);
            request.setAttribute(PACTS_INTERNAL_RESULT, upb.get(u[0].getId()));

            InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
            Map search = new HashMap();
            search.put(USER_ID, "" + u[0].getId());
            request.setAttribute(NOTE_HEADER_LIST, nlb.get(search));

            DataInterfaceBean dib = new DataInterfaceBean();
            request.setAttribute(HAS_GLOBAL_AD, dib.hasGlobalAD(u[0].getId()));

            forward(INTERNAL_USER_JSP, request, response);
        }
    }

    /*
    Forwarding JSP: "addNoteLink.jsp"
    */
    private void doAddNoteLink(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddNoteLink<br>");

        forward(INTERNAL_ADD_NOTE_LINK_JSP, request, response);
    }


    /*
    Forwarding JSP: "viewNote.jsp"
    */
    private void doAddNoteLinkPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("doAddNoteLink<br>");

        DataInterfaceBean dib = new DataInterfaceBean();

        String tfuID = request.getParameter(TAX_FORM_USER_ID);
        long user_id;
        if (tfuID != null)
            user_id = Long.parseLong(tfuID);
        else
            user_id = 0;

        dib.addObjectNoteLink(
                Long.parseLong(request.getParameter(OBJECT_ID)),
                Integer.parseInt(request.getParameter(OBJECT_TYPE)),
                user_id,
                Long.parseLong(request.getParameter(NOTE_ID)));

        InternalDispatchNote bean =
                new InternalDispatchNote(request, response);

        request.setAttribute(PACTS_INTERNAL_RESULT, bean.get());

        forward(INTERNAL_NOTE_JSP, request, response);
    }

    protected void handleException(HttpServletRequest request, HttpServletResponse response, Exception e) throws IOException {

        try {
            super.handleException(request, response, e);
        } catch (Throwable ex) {
            log.fatal("forwarding to error page failed", ex);
            ex.printStackTrace();

            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }

    }

    private void doAffirmAffidavit(HttpServletRequest request, HttpServletResponse response) {
        forward(INTERNAL_AFFIRM_AFFIDAVIT_JSP, request, response);
    }

    private void doAffirmAffidavitPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        AffidavitBean bean = new AffidavitBean();

        // extract the affidavit id
        long affidavitId = 0;
        String birthday = new String("");
        String aged = new String("");
        String family = new String("");
        try {
            affidavitId = Long.parseLong(request.getParameter(AFFIDAVIT_ID));
            birthday = request.getParameter("date_of_birth");
            aged = request.getParameter("aged");
            family = request.getParameter("family_name");
        } catch (Exception e) {
            log.error(AFFIDAVIT_ID + " is not in the request. error");
            throw new NavigationException(AFFIDAVIT_ID + " is not in the request. error");
        }


        AffidavitWithText a = bean.getAffidavitWithText(affidavitId);
        if (a == null) {
            log.error("we got null from getAffidavitWithText");
            throw new NavigationException("we got null from getAffidavitWithText");
        }

        // check for birthday parameter, if it is not there get it from the affidavit
        if (birthday == null || birthday.equals("")) {
            log.debug("did not get the birthday in affidavit affirmation");
            birthday = a.getAffidavit().getBirthday();
        }

        // try to extract the birthday and forward to the error page if it is malformed
        SimpleDateFormat dfmt = new SimpleDateFormat(DATE_FORMAT_STRING);
        Date d = null;
        if (birthday.trim().length() != DATE_FORMAT_STRING.length()) {
            throw new NavigationException("Invalid date format.");
        }
        try {
            d = dfmt.parse(birthday);
        } catch (Throwable e3) {
            handleException(request, response, e3);
            return;
        }
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        if (c.get(Calendar.YEAR) < 1900 || c.get(Calendar.YEAR) > 2099) {
            throw new NavigationException("Birth date must be between 01/01/1900 to 12/31/2099.");
        }

        // if it is for india, replace the form text with what they enterd
        if (a.getPayment().getCountry().equals("India")) {
            if ((aged == null) || (family == null) || (aged.length() == 0) || (family.length() == 0)) {
                log.debug("did not get the aged or family text");
                request.setAttribute("message", "Aged and Family must be filled in.<br>\n");
                doAffirmAffidavit(request, response);
                return;
            }

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

        doAffidavit(request, response);
    }


}
