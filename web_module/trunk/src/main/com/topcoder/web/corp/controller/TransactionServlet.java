package com.topcoder.web.corp.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.model.TransactionInfo;
import com.topcoder.web.ejb.product.*;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseHome;
import com.topcoder.web.ejb.user.*;
import com.topcoder.web.ejb.address.AddressHome;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCRequestFactory;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.NotAuthorizedException;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;
import javax.transaction.Transaction;
import javax.rmi.PortableRemoteObject;

import java.io.IOException;
import java.rmi.RemoteException;
import java.sql.Date;
import java.util.*;
import java.text.DecimalFormat;

/**
 * Credit card transaction servlet. Used for both client and VeriSign
 * interaction. To start transaction client POSTs the request like the
 * '/corp/Tx/?op=begin'. This will fed he into secure SSL form provided by
 * VeriSign to fill out the fields required to perform transaction (CC#,
 * billing/sshipping address, etc) as specified by VeriSign transaction
 * manager's settings. If VeriSign approves transaction (ie. CC# number is
 * valid, there is required sum of money on the card account, etc.) it will
 * silently post confirmation to this module. When silent confirmation from
 * VeriSign is accepted, servlet tries update purchase information in the DB. If
 * DB has successfully updated, then servlet returns confirmation to VeriSign
 * after reception of which it will complete transaction. If some errors
 * have arised upon DB updating, confirmation to VeriSign is not returned and it
 * will roll transaction back.
 *
 * It is supposed that tansaction manager settings are:<br>
 * return URL 'http://site/corp/Tx/?op=status' method POST)<br>
 * silent post URL 'http://site/corp/Tx/?op=commit'<br>
 * failed silent post URL 'http://site/corp/Tx/?op=status'<br>
 * force silent post confirmation is ON
 *
 * Default success and failure pages are defined by the servlet init parameters
 * 'page-success' and 'page-failure' respectively in web.xml
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TransactionServlet extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    public static final String KEY_OPERATION = "op";
    private static final String KEY_TRANSACTION_INFO = "TransactionInfo";

    public static final String KEY_PRODUCT_ID = "pid";
    public static final String KEY_EXCEPTION = "caught-exception";

    public static final String OP_TX_BEGIN = "begin";
    public static final String OP_TX_COMMIT = "commit";
    public static final String OP_TX_STATUS = "status";
    public static final String OP_TERMS = "terms";

    private static final String FRMKEY_CCTX_UID = "USER1";

    private static final String RETURN_CODE_KEY = "RESULT";
    private static final String RESPONSE_MSG_KEY = "RESPMSG";
    private static final String FAILED_AVS = "AVSDECLINED";

    private static final int APPROVED = 0;

    private static String defaultPageSuccess = null;
    private static String defaultPageFailure = null;
    private static String defaultPageIntForm = null;
    private static String defaultPageTerms = null;
    private static String defaultPageBadCountry = null;
    private static String errorPageSecurity = null;

    /**
     * Sets up default success, failure and, intermediate form pages for servlet
     * from the configuration taken from web.xml
     *
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     */
    public void init(ServletConfig cfg) throws ServletException {
        super.init(cfg);
        defaultPageSuccess = cfg.getInitParameter("page-success");
        defaultPageFailure = cfg.getInitParameter("page-failure");
        defaultPageIntForm = cfg.getInitParameter("intermediate-form");
        defaultPageTerms = cfg.getInitParameter("terms");
        defaultPageBadCountry = cfg.getInitParameter("ineligible-country");
        errorPageSecurity = cfg.getInitParameter("page-error-security");
    }

    /**
     * Get method will be called by VeriSign if transaction was approved
     * but silent post confirmation process rejects transaction. There will
     * be message on the VeriSign form with the 'Information' button.
     * Pressing it will GETs information from the servlet<br><br>
     *
     * Recall failed silent post URL is 'http://site/corp/Tx/?op=status'<br>
     *
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        TCRequest tcRequest = TCRequestFactory.createRequest(req);
        String op = req.getParameter(KEY_OPERATION);
        req.setAttribute(Constants.KEY_LINK_PREFIX, Util.appRootPage());
        WebAuthentication auth = null;
        log.debug("query: " + req.getQueryString());
        if (OP_TX_STATUS.equals(op)) {
            try {
                SessionPersistor store = new SessionPersistor(req.getSession(true));
                auth = new BasicAuthentication(store, tcRequest, resp, BasicAuthentication.CORP_SITE);
                String retPage = txStatus(req,auth);
                req.getRequestDispatcher(retPage).forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(defaultPageFailure).forward(req, resp);
            }
        } else if (OP_TERMS.equals(op)) {
            try {
                SessionPersistor store = new SessionPersistor(req.getSession(true));
                auth = new BasicAuthentication(store, tcRequest, resp, BasicAuthentication.CORP_SITE);
                TCSubject tcUser = Util.retrieveTCSubject(auth.getActiveUser().getId());
                Authorization authorization = new TCSAuthorization(tcUser);

                if (!authorization.hasPermission(new ClassResource(this.getClass()))) {
                    log.debug("user [id=" + tcUser.getUserId() + "] has not enough " +
                            "permissions to work with module " + this.getClass().getName()
                    );
                    throw new NotAuthorizedException("Not enough permissions to work with requested module");
                }

                TransactionInfo txInfo = buildTermsTransactionInfo(req, resp);
                if (txInfo.isFromEligibleCountry()) {
                    req.setAttribute(KEY_TRANSACTION_INFO, txInfo);
                    req.getRequestDispatcher(defaultPageTerms).forward(req, resp);
                } else {
                    req.getRequestDispatcher(defaultPageBadCountry).forward(req, resp);
                }
            } catch (NotAuthorizedException nae) {
                if (auth.getUser().isAnonymous()) {
                    /* If the user is anonymous and tries to access a resource they
                       are not authorized to access, send them to login page.    */
                    log.debug("user unauthorized to access resource and user " +
                            "not logged in, forwarding to login page.");
                    fetchLoginPage(req, resp);
                    return;
                } else {
                    /* If the user is logged-in and is not authorized to access
                       the resource, send them to an authorization failed page */
                    log.error("Unauthorized Access to [" + this.getClass().getName() + "]", nae);
                    fetchErrorPage(req, resp, errorPageSecurity, nae);
                    //fetchAuthorizationFailedPage(request, response, nae);
                }
            } catch (Exception e) { // possible parameters are wrong
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(defaultPageFailure).forward(req, resp);
            }
        } else {
            throw new ServletException("get-op " + op + " not supported");
        }
    }

    /**
     * This method is called when user wants to start transaction (a), by silent
     * post procedure (b) and when returning back to shopping upon successful
     * transaction completion (c).
     *
     * <br>
     * (a) ?op=begin<br>
     * There *must be* next fields on the user form: 'prod-id' for ID of product
     * to be purchased, 'utype-id' standing for type of unit ID. There
     * *might be* 'back-to' parameter pointing to the page to be fetched by
     * the 'return to shopping' button when transaction has successfully
     * completed<br><br>
     *
     * (b) ?op=commit<br>
     * VeriSign provides a lot of transaction information when POSTing silent
     * post. Upon receiving this request, servlet updates purchase DB and
     * returns operation status depending on which VeriSign either completye
     * transaction or rolls it back. 200 ok means that transaction was accepted
     * by TC. Thus, VeriSign will complete it. Other return codes will roll
     * it back.<br><br>
     *
     * (c) ?op=status<br>
     * If there was 'back-to' parameter at the transaction begin, then this will
     * fetch that page otherwise default transaction success page is used.
     *
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TCRequest tcRequest = TCRequestFactory.createRequest(request);
        String op = request.getParameter(KEY_OPERATION);
        request.setAttribute(Constants.KEY_LINK_PREFIX, Util.appRootPage());
        WebAuthentication auth = null;
        if (OP_TX_STATUS.equals(op)) {
            try {
                SessionPersistor store = new SessionPersistor(request.getSession(true));
                auth = new BasicAuthentication(store, tcRequest, response, BasicAuthentication.CORP_SITE);
                String retPage = txStatus(request,auth);
                response.sendRedirect(retPage);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute(KEY_EXCEPTION, e);
                request.getRequestDispatcher(defaultPageFailure).forward(request, response);
            }
        } else if (OP_TX_BEGIN.equals(op)) {
            try {
                SessionPersistor store = new SessionPersistor(request.getSession(true));
                auth = new BasicAuthentication(store, tcRequest, response, BasicAuthentication.CORP_SITE);
                TCSubject tcUser = Util.retrieveTCSubject(auth.getActiveUser().getId());
                Authorization authorization = new TCSAuthorization(tcUser);

                if (!authorization.hasPermission(new ClassResource(this.getClass()))) {
                    log.debug("user [id=" + tcUser.getUserId() + "] has not enough " +
                            "permissions to work with module " + this.getClass().getName()
                    );
                    throw new NotAuthorizedException(
                            "Not enough permissions to work with requested module"
                    );
                }
                TransactionInfo txInfo = buildTransactionInfo(request, response);
                //only begin if they have agreed to terms.
                if ("on".equalsIgnoreCase(request.getParameter(Constants.KEY_AGREE_TO_TERMS))) {
                    if (txInfo.isFromEligibleCountry()) {
                        InitialContext ic = TCContext.getInitial();
                        UserTermsOfUse userTerms = ((UserTermsOfUseHome) ic.lookup(UserTermsOfUseHome.EJB_REF_NAME)).create();
                        //they must have agreeded to terms, since the purchase is beginning.  should probably be done outside
                        //but then we don't have access to the transaction info object
                        if (!userTerms.hasTermsOfUse(txInfo.getBuyerID(), txInfo.getTermsId(), DBMS.CORP_OLTP_DATASOURCE_NAME)) {
                            userTerms.createUserTermsOfUse(txInfo.getBuyerID(), txInfo.getTermsId(), DBMS.CORP_OLTP_DATASOURCE_NAME);
                        }
                        txInfo.setAgreed(true);
                        txBegin(request, txInfo);
                        request.getRequestDispatcher(defaultPageIntForm).forward(request, response);
                    } else {
                        request.getRequestDispatcher(defaultPageBadCountry).forward(request, response);
                    }
                } else {
                    txInfo = buildTermsTransactionInfo(request, response);
                    if (txInfo.isFromEligibleCountry()) {
                        request.setAttribute(KEY_TRANSACTION_INFO, txInfo);
                        HashMap formErrors = new HashMap();
                        Vector v = new Vector();
                        v.add("You must agree to terms in order to make a purchase.");
                        formErrors.put(Constants.KEY_AGREE_TO_TERMS, v);
                        request.setAttribute(BaseProcessor.ERRORS_KEY, formErrors);
                        request.getRequestDispatcher(defaultPageTerms).forward(request, response);
                    } else {
                        request.getRequestDispatcher(defaultPageBadCountry).forward(request, response);
                    }
                }
            } catch (NotAuthorizedException nae) {
                if (auth.getUser().isAnonymous()) {
                    /* If the user is anonymous and tries to access a resource they
                       are not authorized to access, send them to login page.    */
                    log.debug("user unauthorized to access resource and user " +
                            "not logged in, forwarding to login page.");
                    fetchLoginPage(request, response);
                    return;
                } else {
                    /* If the user is logged-in and is not authorized to access
                       the resource, send them to an authorization failed page */
                    log.error("Unauthorized Access to [" + this.getClass().getName() + "]", nae);
                    fetchErrorPage(request, response, errorPageSecurity, nae);
                    //fetchAuthorizationFailedPage(request, response, nae);
                }
            } catch (Exception e) { // possible parameters are wrong
                e.printStackTrace();
                request.setAttribute(KEY_EXCEPTION, e);
                request.getRequestDispatcher(defaultPageFailure).forward(request, response);
            }
        } else if (OP_TX_COMMIT.equals(op)) {
            try {
                txCommit(request);
                log.debug("CcTx commit successful");
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (Exception e) {
                try {
                    if (getTransaction(request)==null) e.printStackTrace();
                    else getTransaction(request).setTcExc(e.getMessage());
                } catch (Exception ex) {
					ex.printStackTrace();
                }

                log.error("Can't complete CC Tx", e);
                response.setStatus(HttpServletResponse.SC_ACCEPTED);
            }
            try {
                removeTransaction(request);
            } catch (Exception e) {
                log.error("failed to remove transaction");
                e.printStackTrace();
            }
        } else {
            throw new ServletException("post-op " + op + " not supported");
        }
        return;
    }

    /**
     * After transacton has completed, VeriSign will return user to status page.
     * This method contains the logic to show status of the transaction.
     *
     * @param request
     * @throws Exception
     */
    private String txStatus(HttpServletRequest request, WebAuthentication auth)
            throws Exception {
        TransactionInfo txInfo = getTransaction(request);
        if (txInfo == null) {
            sendEmail("there is no transaction in progress for the user", auth);
            throw new Exception("there is no transaction in progress");
        }
        if (!isSucessfulTransaction(request)) {
            sendEmail("Rejected by VeriSign [return code: " + getReturnCode(request) +
                    " response message: " + getResponseMessage(request)+ "]", auth);
            throw new Exception("Rejected by VeriSign [return code: " + getReturnCode(request) +
                    " response message: " + getResponseMessage(request)+ "]");
        }
        if (txInfo.getTcExc() != null) {
            // was not able to store tx info in the DB
            throw new Exception(txInfo.getTcExc());
        }
        //TODO generate a way to handle the case when a transaction fails, should probably be a new operation
        return txInfo.getUserBackPage() == null ? defaultPageSuccess : txInfo.getUserBackPage();
    }

    private void sendEmail(String body,WebAuthentication auth) {
        try {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("TopCoder Transaction Error");
            StringBuffer buf = new StringBuffer(300);
            if (auth!=null) {
                buf.append(auth.getActiveUser().getUserName());
                buf.append("(").append(auth.getActiveUser().getId()).append(")");
            } else {
                buf.append(" an unknown user ");
            }
            buf.append(" had the following problem " );

            mail.setBody(body);
            mail.addToAddress("service@topcoder.com", TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Because we do not want to hold / know any user private information we
     * must provide user with form which may be posted to VeriSign directrly.
     * Thus we provide some intermediate form, dinamically populated with
     * preffered transaction parameters (ie. transaction type, money amount,
     * etc.) and return it to user browser for further processing.
     * Once user browser received that form it will automatically post request
     * to VeriSign. Sure, we are able to pass all data from self but there
     * will be excessive duplicate SSL work in that case (one SSL channel
     * between us and client and one more between us and Verisign),
     * that is eliminated by approach used.
     *
     * @param req user request
     *
     * @throws Exception transaction parameters are invalid or there was an
     * errors when trying to fetch product and / or user information from the DB
     */
    private void txBegin(HttpServletRequest req, TransactionInfo txInfo)
            throws Exception {
        addTransaction(req, txInfo);
        log.debug("CcTx started");
        DecimalFormat formater = new DecimalFormat("#.##");
        log.debug("purchase being made for: " + txInfo.getCost() + " formmatted: " + formater.format(txInfo.getCost()));
        req.setAttribute(Constants.KEY_CCTX_SUM, formater.format(txInfo.getCost()));
        return;
    }

    /**
     * Checks the return code and response message in the given request to
     * determine if the transaction is good from verisign's perspective.
     *
     * @param request request possible containnig VeriSign transaction completion
     * information
     * @return boolean true if transaction is approved
     */
    private boolean isSucessfulTransaction(HttpServletRequest request) {
        log.info("request return code: " + getReturnCode(request) + " request response: " + getResponseMessage(request));

        int rc = -1;
        try {
            rc = Integer.parseInt(getReturnCode(request));
        } catch (Exception e) {
        }

        return (rc == APPROVED && !FAILED_AVS.equals(getResponseMessage(request)));
    }

    private String getReturnCode(HttpServletRequest request) {
        return request.getParameter(RETURN_CODE_KEY);
    }

    private String getResponseMessage(HttpServletRequest request) {
        return request.getParameter(RESPONSE_MSG_KEY);
    }

    /**
     * Transaction commit routine. Updates purcase DB.
     *
     * @param request request reseived upon silent POST from VeriSign.
     *
     * @throws Exception is thrown if there is not transaction to be completed,
     * DB errors occured, etc.
     */
    private void txCommit(HttpServletRequest request) throws Exception {
        TransactionInfo txInfo = getTransaction(request);
        if (txInfo == null) {
            throw new Exception("there is no transaction in progress");
        }

        if (!isSucessfulTransaction(request)) {
            log.debug("isSucessfulTransaction returned false");
            throw new Exception("Transaction error: return code: " + getReturnCode(request) +
                    " response message: " + getResponseMessage(request));
        }

        // store information into the DB
        InitialContext icEJB = null;
        Transaction dbTx = null;
        try {
            icEJB = TCContext.getInitial();
            dbTx = Util.beginTransaction();
            Purchase purchaseTable = ((PurchaseHome) icEJB.lookup(PurchaseHome.EJB_REF_NAME)).create();
            long purchaseID;
            purchaseID = purchaseTable.createPurchase(txInfo.getProductID(),txInfo.getBuyerID(),txInfo.getCost());
            if (txInfo.getCompanyID()>0) {
                purchaseTable.setCompanyId(purchaseID, txInfo.getCompanyID());
            }
            Date startDate = purchaseTable.getCreateDate(purchaseID);
            purchaseTable.setStartDate(purchaseID, startDate);
            purchaseTable.setEndDate(purchaseID, txInfo.getEnd(startDate));
            //purchaseTable.setSumPaid(purchaseID, txInfo.sum);

            // before commit transaction we are required
            // to set roles, on per product basis
            assignPerProductRoles(txInfo);

            dbTx.commit();
            log.debug("CcTx completed, redirectURL is "+txInfo.getUserBackPage());
        } catch (Exception e) {
            if (dbTx != null) {
                dbTx.rollback();
            }
            throw e;
        } finally {
            Util.closeIC(icEJB);
        }
    }

    /**
     * Builds initial transaction information based on transaction begin rfor
     * traequest/response pair and stores it for later commit request from
     * VeriSign.
     *
     * @param req transaction begin request
     * @param resp transaction begin response
     * @return tx transaction information
     *
     * @throws Exception there was errors building transaction information. They
     * include invalid product ID, unit type ID, user identifying errors, errors
     * in DB retrieval procedures
     */
    private TransactionInfo buildTransactionInfo(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        TransactionInfo txInfo = new TransactionInfo(req, resp);
        txInfo.setFromEligibleCountry(userCountryEligible(txInfo.getBuyerID(), txInfo.getProductID()));
        return txInfo;
    }

    /**
     * similar to buildTransactionInfo, but includes the actual terms text.
     * @param req
     * @param resp
     * @return
     * @throws Exception
     */
    private TransactionInfo buildTermsTransactionInfo(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        TransactionInfo txInfo = buildTransactionInfo(req, resp);
        InitialContext ic = TCContext.getInitial();
        TermsOfUse terms = ((TermsOfUseHome) ic.lookup(TermsOfUseHome.EJB_REF_NAME)).create();
        txInfo.setTerms(terms.getText(txInfo.getTermsId(), DBMS.COMMON_JTS_OLTP_DATASOURCE_NAME));
        return txInfo;
    }

    /**
     * Builds key for CC transaction based on the request given. If CC Tx just
     * have started then request goes from client and key is genereated on the
     * base of user's session info. This key will go through all interaction
     * with VeriSign (as USER1 parameter, for example) and later (upon silent
     * post procedure, in which case request goes from VeriSign) it is just
     * restored from that pass-thru parameter.
     *
     * @param req request to generate / pick up CC Tx key information from
     * @return String key for the CC transaction
     */
    public static String transactionKey(HttpServletRequest req) {
        String key = req.getParameter(FRMKEY_CCTX_UID);
        if (key == null || key.trim().length() == 0) {
            key = req.getSession(true).getId();
            log.debug("couldn't find key in request\nit is now\n"+key);
        } else {
            log.debug("key was " + key);
        }
        return key;
    }

    private boolean userCountryEligible(long userId, long productId) throws Exception {
        boolean eligible = true;
        InitialContext context = new InitialContext();

        UserAddressHome uaHome = (UserAddressHome)
            PortableRemoteObject.narrow(
                context.lookup(UserAddressHome.class.getName()), UserAddressHome.class);
        UserAddress userAddress = uaHome.create();
        AddressHome aHome = (AddressHome)
            PortableRemoteObject.narrow(
                context.lookup(AddressHome.class.getName()), AddressHome.class);
        Address address = aHome.create();
        ResultSetContainer rsc = userAddress.getUserAddresses(userId, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);

        //if they have no address, deny them
        eligible &= !rsc.isEmpty();

        DataAccessInt dataAccess = new DataAccess(DBMS.CORP_OLTP_DATASOURCE_NAME);
        Request dr = new Request();
        dr.setContentHandle("eligible_country_for_product");
        dr.setProperty("prodID", String.valueOf(productId));
        Map result = null;
        //go through all their addresses.  if any one is not eligible, then they are not eligible
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow)it.next();
            long addressId = ((Long)row.getItem("address_id").getResultData()).longValue();
            dr.setProperty("countryID", address.getCountryCode(addressId, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME));
            result = dataAccess.getData(dr);
            /* the query returns a row only if the country is ineligible to purchase the product */
            eligible &= ((ResultSetContainer) result.get("country_not_eligible_for_product")).isEmpty();
        }
        log.debug("user_id: " + userId + " product_id: " + productId + " eligible: " + eligible);
        return eligible;
    }


    /**
     *
     * @param req
     * @param resp
     * @param dest
     * @param forward
     * @throws IOException
     * @throws ServletException
     */
    private void fetchRegularPage(
            HttpServletRequest req,
            HttpServletResponse resp,
            String dest,
            boolean forward
            )
            throws IOException, ServletException {
        log.debug((forward ? "forwarding" : "redirecting") + " to " + dest);

        if (forward) {
            log.debug((forward ? "forwarding" : "redirecting") + " to " + dest);
            getServletContext().getRequestDispatcher(resp.encodeURL(dest)).forward(req, resp);
        } else {
            resp.sendRedirect(resp.encodeRedirectURL(dest));
        }
    }

    /**
     * Forces error page to be returned to user. As I think, all errors must
     * look similarly for the user - 403 forbidden. There is not any need to
     * show him software internals because he was going on the page for
     * some other reason. The only exception is debug time, at that time page
     * may optionally include stack trace.
     *
     * @param req
     * @param resp
     * @param errPage
     * @param exc
     * @throws ServletException
     * @throws IOException
     */
    private void fetchErrorPage(
            HttpServletRequest req,
            HttpServletResponse resp,
            String errPage,
            Throwable exc
            )
            throws ServletException, IOException {
        // error page is regular page too with the only difference - it
        // has an error attribute set in request, so..
        if (exc != null) {
            req.setAttribute(Constants.KEY_EXCEPTION, exc);
        }
        String contextPath = req.getContextPath();
        if (!errPage.startsWith(contextPath)) {
            errPage = contextPath + errPage;
        }
        fetchRegularPage(req, resp, errPage, true);
    }


    /**
     * private method for sending user to login page.
     *
     * @throws ServletException
     * @throws IOException
     */
    private void fetchLoginPage(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("message", "In order to continue, you must provide your user name " +
                "and password, even if you've logged in already.");
        request.setAttribute(BaseServlet.NEXT_PAGE_KEY,
                HttpUtils.getRequestURL(request) + "?" + request.getQueryString());
        request.setAttribute(Constants.KEY_MODULE, "Login");
        boolean forward = true;
        fetchRegularPage(request, response, "/", forward);
        return;
    }

    /**
     * Sets up roles for user on per product basis. If any exeption has arised,
     * then all changes are rolled back programmaticaly (because PrincipalManager
     * usage this cant be performed in transaction scope and, thus can't be
     * rolled back automatically)
     *
     * @param txInfo
     */
    private void assignPerProductRoles(TransactionInfo txInfo)
    throws CreateException, NamingException,RemoteException,
            GeneralSecurityException, NoSuchUserException, Exception
    {
        log.debug("assignPerProductRoles entered");
        PrincipalMgrRemote mgr = Util.getPrincipalManager();
        TCSubject buyerSubject = mgr.getUserSubject(txInfo.getBuyerID());
        UserPrincipal buyerPrincipal = mgr.getUser(txInfo.getBuyerID());
        Set assignedRoles = buyerSubject.getPrincipals();
        TCSubject appSubject = Util.retrieveTCSubject(Constants.CORP_PRINCIPAL);
        Iterator i = txInfo.getRolesPerProduct().iterator();
        log.debug("buyer ["+txInfo.getBuyerID()+"] has roles assigned "+assignedRoles);
        log.debug("roles to be added on per product basis "+txInfo.getRolesPerProduct());

        HashSet rollbackStore = new HashSet();
        Exception caught = null;

        while( i.hasNext() ) {
            RolePrincipal newRole = (RolePrincipal)i.next();
            if( assignedRoles.contains(newRole) ) continue;

            // it is really new role - try to assign it
            try {
                log.debug("trying to assign the role "+newRole);
                mgr.assignRole(buyerPrincipal, newRole, appSubject);
                rollbackStore.add(newRole);
            }
            catch(Exception e) {
                caught = e;
                break;
            }
        }
        if( caught != null ) {
            // some errors - rollback
            i = rollbackStore.iterator();
            while(i.hasNext()) {
                RolePrincipal role = (RolePrincipal)i.next();
                try {
                    mgr.unAssignRole(buyerPrincipal, role, appSubject);
                }
                catch(Exception ignore) {
                    log.error(
                        "Cant unassign role "+role+" within the bounds of transaction rollback"
                    );
                }
            }
            // rethrow caught exception to provide entire transaction rollback
            throw caught;
        }
        log.debug("leaving assignPerProductRoles. Role(s) succesfully assigned to user ["+
            txInfo.getBuyerID()+"] "+rollbackStore
        );
    }

    private TransactionInfo getTransaction(HttpServletRequest request) throws Exception {
        log.debug("get transaction");
        CacheClient cc = CacheClientFactory.createCacheClient();
        //keying based on the session id from the original request
        //verisign gives this back to us useing a parameter
        return (TransactionInfo)cc.get(KEY_TRANSACTION_INFO+transactionKey(request));

    }

    private void addTransaction(HttpServletRequest request, TransactionInfo info) throws Exception {
        log.debug("add transaction for " + info.getBuyerID() + " " + info.getProductID());
        CacheClient cc = CacheClientFactory.createCacheClient();
        //keying based on the session id from the original request
        cc.set(KEY_TRANSACTION_INFO+transactionKey(request), info, 1000*60*60);
    }

    private void removeTransaction(HttpServletRequest request) throws Exception {
        log.debug("remove transaction");
        CacheClient cc = CacheClientFactory.createCacheClient();
        cc.remove(KEY_TRANSACTION_INFO+transactionKey(request));


    }

}
