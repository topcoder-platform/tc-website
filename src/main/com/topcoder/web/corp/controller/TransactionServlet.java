package com.topcoder.web.corp.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.request.Login;
import com.topcoder.web.corp.model.TransactionInfo;
import com.topcoder.web.ejb.product.*;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseHome;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseHome;
import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.security.TCSubject;
import com.topcoder.security.NotAuthorizedException;

import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;
import java.io.IOException;
import java.sql.Date;
import java.util.Hashtable;
import java.util.HashMap;
import java.util.Vector;
import java.net.URLEncoder;

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
    private static final Hashtable currentTransactions = new Hashtable();

    public static final String KEY_OPERATION = "op";
    private static final String KEY_RC = "rc";
    private static final String KEY_TRANSACTION_INFO = "TransactionInfo";

    public static final String KEY_PRODUCT_ID = "prod-id";
    public static final String KEY_RETPAGE = "back-to";
    public static final String KEY_EXCEPTION = "caught-exception";

    public static final String OP_TX_BEGIN = "begin";
    public static final String OP_TX_COMMIT = "commit";
    public static final String OP_TX_STATUS = "status";
    public static final String OP_TERMS = "terms";

    private static final String FRMKEY_CCTX_UID = "USER1";

    private static final String RETKEY_IRESULT = "RESULT";
    private static final String RETKEY_SRESULT = "RESPMSG";
//    private static final String CCTX_TYPE       = "S"; // payment/sale

    private static final int RCINT_APPROVED = 0;

    private String defaultPageSuccess = null;
    private String defaultPageFailure = null;
    private String defaultPageIntForm = null;
    private String defaultPageTerms = null;
    private String errorPageSecurity = null;
    private String loginApplicationPage = null;


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
        errorPageSecurity = cfg.getInitParameter("page-error-security");
        loginApplicationPage = cfg.getInitParameter("page-login");
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
        String op = req.getParameter(KEY_OPERATION);
        req.setAttribute(Constants.KEY_LINK_PREFIX, Util.appRootPage());
        WebAuthentication auth = null;
        if (OP_TX_STATUS.equals(op)) {
            try {
                // put prefix of the url into request
                String retPage = txStatus(req);
                req.getRequestDispatcher(retPage).forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(defaultPageFailure).forward(req, resp);
            }
        } else if (OP_TERMS.equals(op)) {
            try {
                SessionPersistor store = new SessionPersistor(req.getSession(true));
                auth = new BasicAuthentication(store, req, resp);
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

                TransactionInfo txInfo = buildTermsTransactionInfo(req, resp);
                req.setAttribute(KEY_TRANSACTION_INFO, txInfo);
                req.getRequestDispatcher(defaultPageTerms).forward(req, resp);
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String op = req.getParameter(KEY_OPERATION);
        req.setAttribute(Constants.KEY_LINK_PREFIX, Util.appRootPage());
        WebAuthentication auth = null;
        if (OP_TX_STATUS.equals(op)) {
            try {
                String retPage = txStatus(req);
//                req.getRequestDispatcher(retPage).forward(req, resp);
                resp.sendRedirect(retPage);
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(defaultPageFailure).forward(req, resp);
            }
        } else if (OP_TX_BEGIN.equals(op)) {
            try {
                SessionPersistor store = new SessionPersistor(req.getSession(true));
                auth = new BasicAuthentication(store, req, resp);
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
                //only begin if they have agreed to terms.
                if ("on".equalsIgnoreCase(req.getParameter(Constants.KEY_AGREE_TO_TERMS))) {
                    txBegin(req, resp);
                    req.getRequestDispatcher(defaultPageIntForm).forward(req, resp);
                } else {
                    TransactionInfo txInfo = buildTermsTransactionInfo(req, resp);
                    req.setAttribute(KEY_TRANSACTION_INFO, txInfo);
                    HashMap formErrors = new HashMap();
                    Vector v = new Vector();
                    v.add("You must agree to terms in order to make a purchase.");
                    formErrors.put(Constants.KEY_AGREE_TO_TERMS, v);
                    req.setAttribute(BaseTag.CONTAINER_NAME_FOR_ERRORS, formErrors);
                    req.getRequestDispatcher(defaultPageTerms).forward(req, resp);
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
        } else if (OP_TX_COMMIT.equals(op)) {
            try {
                log.debug("CcTx commit successful [" + txCommit(req) + "]");
                resp.setStatus(HttpServletResponse.SC_OK);
            } catch (Exception e) {
                try {
                    ((TransactionInfo) currentTransactions.get(transactionKey(req))).setTcExc(e);
                } catch (Exception ex) {
					ex.printStackTrace();
                }

                log.error("Can't complete CC Tx", e);
                resp.setStatus(HttpServletResponse.SC_ACCEPTED);
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
     * @param req
     * @throws Exception
     */
    private String txStatus(HttpServletRequest req)
            throws Exception {
        // VeriSign has returned after transaction copletion
//        String txRc = req.getParameter(KEY_RC);
        TransactionInfo txInfo = (
                (TransactionInfo) currentTransactions.get(transactionKey(req))
                );
        if (txInfo == null) {
            throw new Exception("there is not transaction in progress");
        }
        if (!refreshRetCode(req, txInfo)) {
            throw new Exception("Rejected by VeriSign [" + txInfo.getRcVeriSign() + "]");
        }
        if (txInfo.getTcExc() != null) {
            // was not able to store tx info in the DB
            throw new Exception(txInfo.getTcExc().getMessage());
        }
        return
                txInfo.getUserBackPage() == null ? defaultPageSuccess : txInfo.getUserBackPage();
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
     * @param resp used to build auth token (to identify buyer user and
     * his company)
     *
     * @throws Exception transaction parameters are invalid or there was an
     * errors when trying to fetch product and / or user information from the DB
     */
    private void txBegin(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        TransactionInfo txInfo = buildTransactionInfo(req, resp);
        InitialContext ic = (InitialContext) TCContext.getInitial();
        UserTermsOfUse userTerms = ((UserTermsOfUseHome) ic.lookup("corp:"+UserTermsOfUseHome.EJB_REF_NAME)).create();
        if (!userTerms.hasTermsOfUse(txInfo.getContactID(), Constants.GENERAL_PRODUCT_TERMS_ID)) {
            userTerms.createUserTermsOfUse(txInfo.getContactID(), Constants.GENERAL_PRODUCT_TERMS_ID);
        }
        txInfo.setAgreed(true);
        req.setAttribute(Constants.KEY_CCTX_SUM, "" + (txInfo.getCost()));
//        req.setAttribute(Constants.KEY_CCTX_LOGIN, Constants.CCTX_LOGIN);
//        req.setAttribute(Constants.KEY_CCTX_PARTNER, Constants.CCTX_PARTNER);
//        req.setAttribute(Constants.KEY_CCTX_CONFIRM, Constants.CCTX_CONFIRM);
//        req.setAttribute(Constants.KEY_CCTX_URL, Constants.CCTX_URL);
//        req.setAttribute(Constants.KEY_CCTX_TYPE, Constants.CCTX_TYPE);
        return;
    }

    /**
     * Refreshes transaction completion status by request accepted from
     * VeriSign. If there is not any transaction related information in the
     * request, then transaction state remains unchanged and current approval
     * status will be returned.
     *
     * @param req request possible containnig VeriSign transaction completion
     * information
     * @param txi transaction information to be updated
     * @return boolean true if transaction is approved
     */
    private boolean refreshRetCode(HttpServletRequest req, TransactionInfo txi) {
        String rcString = req.getParameter(RETKEY_IRESULT);
        log.info("request return code: " + rcString);
        if (rcString == null || rcString.trim().length() == 0) {
            return txi.getRcVeriSign() == null;
        }

        int rc = -1;
        try {
            rc = Integer.parseInt(rcString);
        } catch (Exception e) {
        }

        if (rc != RCINT_APPROVED) {
            txi.setRcVeriSign(req.getParameter(RETKEY_SRESULT) + ", " + KEY_RC + "=" + rc);
        } else {
            txi.setRcVeriSign(null);
        }
        log.debug("return code in transactino info object: " + txi.getRcVeriSign());
        return rc == RCINT_APPROVED;
    }

    /**
     * Transaction commit routine. Updates purcase DB.
     *
     * @param req request reseived upon silent POST from VeriSign.
     *
     * @return boolean commit status. True if transaction has successfully
     * commited (purchase DB has updated, etc.). False otherwise.
     *
     * @throws Exception is thrown if there is not transaction to be completed,
     * DB errors occured, etc.
     */
    private boolean txCommit(HttpServletRequest req) throws Exception {
        TransactionInfo txInfo;
        txInfo = (TransactionInfo) currentTransactions.get(transactionKey(req));
        if (txInfo == null) {
            throw new Exception("there is not transaction in progress");
        }

        if (!refreshRetCode(req, txInfo)) {
            log.debug("refreshRetCode returned false");
            return false;
        }

        // store information into the DB
        InitialContext icEJB = null;
        Transaction dbTx = null;
        try {
            icEJB = (InitialContext) TCContext.getInitial();
            dbTx = Util.beginTransaction();
            Purchase purchaseTable = (
                    (PurchaseHome) icEJB.lookup(PurchaseHome.EJB_REF_NAME)
                    ).create();
            long purchaseID;
            purchaseID = purchaseTable.createPurchase(
                    txInfo.getCompanyID(),
                    txInfo.getProductID(),
                    txInfo.getContactID(),
                    txInfo.getCost()
            );
            Date startDate = purchaseTable.getCreateDate(purchaseID);
            purchaseTable.setStartDate(purchaseID, startDate);
            purchaseTable.setEndDate(purchaseID, txInfo.getEnd(startDate));
            //purchaseTable.setSumPaid(purchaseID, txInfo.sum);
            dbTx.commit();
            log.debug("CcTx completed");
        } catch (Exception e) {
            if (dbTx != null) {
                dbTx.rollback();
            }
            throw e;
        } finally {
            Util.closeIC(icEJB);
        }
        return true;
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
    private TransactionInfo buildTransactionInfo(
            HttpServletRequest req,
            HttpServletResponse resp
            )
            throws Exception {
        TransactionInfo txInfo = new TransactionInfo(req, resp);
        currentTransactions.put(transactionKey(req), txInfo);
        log.debug("CcTx started");
        return txInfo;
    }

    private TransactionInfo buildTermsTransactionInfo(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        TransactionInfo txInfo = new TransactionInfo(req, resp);
        InitialContext ic = (InitialContext) TCContext.getInitial();
        TermsOfUse terms = ((TermsOfUseHome) ic.lookup(TermsOfUseHome.EJB_REF_NAME)).create();
        txInfo.setTerms(terms.getText(Constants.GENERAL_PRODUCT_TERMS_ID));
        UserTermsOfUse userTerms = ((UserTermsOfUseHome) ic.lookup("corp:"+UserTermsOfUseHome.EJB_REF_NAME)).create();
        if (userTerms.hasTermsOfUse(txInfo.getContactID(), Constants.GENERAL_PRODUCT_TERMS_ID)) {
            txInfo.setAgreed(true);
        } else {
            txInfo.setAgreed(false);
        }
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
    private String transactionKey(HttpServletRequest req) {
        String key = req.getParameter(FRMKEY_CCTX_UID);
        if (key == null || key.trim().length() == 0) {
            key = req.getSession(true).toString();
        }
        return key;
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

        String contextPrefix = req.getContextPath();
        boolean startsWithContextPath = dest.startsWith(contextPrefix);
        if (forward) {
            // forwarded pages *must not* contain servlet context path
            if (startsWithContextPath) {
                dest = dest.substring(contextPrefix.length());
            }
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
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void fetchLoginPage(
            HttpServletRequest req,
            HttpServletResponse resp
            )
            throws ServletException, IOException {
        String originatingPage = req.getRequestURI();
        if (req.getQueryString() != null) {
            originatingPage += "?" + req.getQueryString();
        }
        log.debug("fetchLoginPage request, orginatingPage = " + originatingPage);

        StringBuffer loginPageDest = new StringBuffer(128);
        loginPageDest
                .append(loginApplicationPage).append('?')
                .append(Login.KEY_DESTINATION_PAGE).append('=')
                .append(URLEncoder.encode(originatingPage));
        fetchRegularPage(req, resp, loginPageDest.toString(), true);
    }




}
