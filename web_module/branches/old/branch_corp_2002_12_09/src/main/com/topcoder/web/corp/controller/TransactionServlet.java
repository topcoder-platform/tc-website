package com.topcoder.web.corp.controller;

import java.io.IOException;
import java.rmi.RemoteException;
import java.sql.Date;
import java.util.Calendar;
import java.util.Hashtable;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.ejb.product.Product;
import com.topcoder.web.ejb.product.ProductHome;
import com.topcoder.web.ejb.product.Purchase;
import com.topcoder.web.ejb.product.PurchaseHome;
import com.topcoder.web.ejb.product.Unit;
import com.topcoder.web.ejb.product.UnitHome;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.ContactHome;

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
    
    public  static final String KEY_OPERATION   = "op";
    private static final String KEY_RC          = "rc";

    public  static final String KEY_PRODUCT_ID  = "prod-id";
    public  static final String KEY_UNITTYPE_ID = "utype-id";
    public  static final String KEY_RETPAGE     = "back-to";
    public  static final String KEY_EXCEPTION   = "caught-exception";

    public static final String  OP_TX_BEGIN     = "begin";
    public static final String  OP_TX_COMMIT    = "commit";
    public static final String  OP_TX_STATUS    = "status";
    
    private static final String FRMKEY_CCTX_UID = "USER1";
    
    private static final String RETKEY_IRESULT  = "RESULT";
    private static final String RETKEY_SRESULT  = "RESPMSG";
//    private static final String CCTX_TYPE       = "S"; // payment/sale
    
    private static final int    RCINT_APPROVED  = 0;
    
    private String defaultPageSuccess = null;
    private String defaultPageFailure = null;
    private String defaultPageIntForm = null;

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
    throws ServletException, IOException
    {
        String op = req.getParameter(KEY_OPERATION);
        if( OP_TX_STATUS.equals(op) ) {
            try {
                String retPage = txStatus(req, resp);
                req.getRequestDispatcher(retPage).forward(req, resp);
            }
            catch(Exception e) {
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(defaultPageFailure).forward(req, resp);
            }
            return;
        }
        throw new ServletException("get-op "+op+" not supported");
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
    throws ServletException, IOException
    {
        String op = req.getParameter(KEY_OPERATION);
        if( OP_TX_STATUS.equals(op) ) {
            try {
                String retPage = txStatus(req, resp);
//                req.getRequestDispatcher(retPage).forward(req, resp);
                resp.sendRedirect(retPage);
            }
            catch(Exception e) {
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(defaultPageFailure).forward(req, resp);
            }
        }
        else if( OP_TX_BEGIN.equals(op) ) {
            try {
                txBegin(req, resp);
            }
            catch(Exception e) { // possible parameters are wrong
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(defaultPageFailure).forward(req, resp);
            }
            req.getRequestDispatcher(defaultPageIntForm).forward(req, resp);
        }
        else if( OP_TX_COMMIT.equals(op) ) {
            try {
                log.debug("CcTx commit successful ["+txCommit(req)+"]");
                resp.setStatus(HttpServletResponse.SC_OK);
            }
            catch(Exception e) {
                try {
                    
                    ((transaction_info)currentTransactions
                    .get(transactionKey(req))).tcExc = e;
                }
                catch(Exception ignore) {}
                
                log.error("Can't complete CC Tx", e);
                resp.setStatus(HttpServletResponse.SC_ACCEPTED);
            }
        }
        else {
            throw new ServletException("post-op "+op+" not supported");
        }
        return;
    }
    
    /**
     * After transacton has completed, VeriSign will return user to status page.
     * This method contains the logic to show status of the transaction.
     * 
     * @param req
     * @param resp
     * @throws Exception
     */
    private String txStatus(HttpServletRequest req, HttpServletResponse resp)
    throws Exception
    {
        // VeriSign has returned after transaction copletion
        String txRc = req.getParameter(KEY_RC);
        transaction_info txInfo = (
            (transaction_info)currentTransactions.get(transactionKey(req))
        );
        if( txInfo == null ) {
            throw new Exception("there is not transaction in progress");
        }
        if( ! refreshRetCode(req, txInfo) ) {
            throw new Exception("Rejected by VeriSign ["+txInfo.rcVeriSign+"]");
        }
        if( txInfo.tcExc != null ) {
            // was not able to store tx info in the DB
            throw new Exception(txInfo.tcExc.getMessage());
        }
        return
        txInfo.userBackPage == null ? defaultPageSuccess : txInfo.userBackPage;  
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
    throws Exception
    {
        transaction_info txInfo = buildTransactionInfo(req, resp);
        req.setAttribute(Constants.KEY_CCTX_SUM, ""+(txInfo.cost*txInfo.qtty));
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
    private boolean refreshRetCode(HttpServletRequest req, transaction_info txi)
    {
        String rcString = req.getParameter(RETKEY_IRESULT);
        if( rcString == null || rcString.trim().length() == 0 ) {
            return txi.rcVeriSign == null; 
        }
        
        int rc = -1;
        try { rc = Integer.parseInt(rcString); } catch(Exception ignore) {}

        if( rc != RCINT_APPROVED ) {
            txi.rcVeriSign = req.getParameter(RETKEY_SRESULT) + ", rc=" + rc;
        }
        else {
            txi.rcVeriSign = null;
        }
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
        transaction_info txInfo;
        txInfo = (transaction_info)currentTransactions.get(transactionKey(req));
        if( txInfo == null ) {
            throw new Exception("there is not transaction in progress");
        }
        
        if( ! refreshRetCode(req, txInfo) ) {
            return false;
        }
        
        // store information into the DB
        InitialContext icEJB = null;
        Transaction dbTx = null;
        try {
            icEJB = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);
            dbTx = Util.beginTransaction();
            Purchase purchaseTable = (
                (PurchaseHome)icEJB.lookup(PurchaseHome.EJB_REF_NAME)
            ).create();
            long purchaseID;
            purchaseID = purchaseTable.createPurchase(
                txInfo.companyID,
                txInfo.productID,
                txInfo.contactID,
                txInfo.qtty * txInfo.cost
            );
            if( txInfo.start != 0 ) {
                purchaseTable.setStartDate(purchaseID, new Date(txInfo.start));
            }
            if( txInfo.end != 0 ) {
                purchaseTable.setEndDate(purchaseID, new Date(txInfo.end));
            }
            //purchaseTable.setSumPaid(purchaseID, txInfo.sum);
            dbTx.commit();
            log.debug("CcTx completed");
        }
        catch(Exception e) {
            if( dbTx != null ) {
                dbTx.rollback();
            }
            throw e;
        }
        finally {
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
    private transaction_info buildTransactionInfo(
        HttpServletRequest req,
        HttpServletResponse resp
    )
    throws Exception
    {
        transaction_info txInfo = new transaction_info(req, resp);
        currentTransactions.put(transactionKey(req), txInfo);
        log.debug("CcTx started");
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
        if( key == null || key.trim().length() == 0 ) {
            key = req.getSession(true).toString();
        }
        return key;
    }

    /**
     * Class to encapsulate CC transaction reladed information. 
     *
     * @author djFD molc@mail.ru
     * @version 1.02
     *
     */
    private static class transaction_info {
        String userBackPage = null;

        long productID = -1;
        long unitTypeID = -1;
        long contactID = -1;
        
        long companyID = -1;

        int qtty = 0;
        double cost = 0;

        long start = 0;
        long end = 0;
        String rcVeriSign = null;
        Exception tcExc = null;

        /**
         * Creates CC transaction info bundle based on given request/response
         * pair. 
         * 
         * @param req must have 'prod-id' & 'utype-id' parameters set
         * @param resp used to get uathentification token which in turn, is used
         * to decide what company is involved into transaction
         * 
         * @throws NamingException errors when trying to get EJBs
         * @throws RemoteException errors when trying to get EJBs / working with
         * EJBs
         * @throws CreateException errors when trying to get remote EJBs
         * 
         * @throws Exception there is certain inconsistency in CC transaction
         * information
         */
        private transaction_info(HttpServletRequest req, HttpServletResponse resp)  
        throws NamingException, RemoteException, CreateException, Exception
        {
            productID = Long.parseLong(req.getParameter(KEY_PRODUCT_ID));
            unitTypeID = Long.parseLong(req.getParameter(KEY_UNITTYPE_ID));
            userBackPage = req.getParameter(KEY_RETPAGE);
            if( userBackPage != null && userBackPage.trim().length() == 0 ) {
                userBackPage = null;
            }

            // find out purchase parameters
            SessionPersistor store = new SessionPersistor(
                req.getSession(true)
            );
            contactID = (new BasicAuthentication(store, req, resp))
                .getActiveUser().getId();
                
            InitialContext icEJB = null;
            try {
                icEJB = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);
                // check if there is such product
                Product productTable = (
                    (ProductHome)icEJB.lookup(ProductHome.EJB_REF_NAME)
                ).create();
                cost = productTable.getCost(productID);
                if( cost <= 0 ) {
                    throw new Exception("No valid product found for ID given");
                }

                Unit unitTable = (
                    (UnitHome)icEJB.lookup(UnitHome.EJB_REF_NAME)
                ).create();
                qtty = unitTable.getNumUnits(productID, unitTypeID);
                if( qtty <= 0 ) {
                    throw new Exception("No valid unit found for ID given");
                }

                Contact contactTable = (
                    (ContactHome)icEJB.lookup(ContactHome.EJB_REF_NAME)
                ).create();
                companyID = contactTable.getCompanyId(contactID);

                // calculate start date / end date
                int field = -1;
                String unitName;
                unitName = unitTable.getUnitDescription(productID, unitTypeID);
                if( "day".equalsIgnoreCase(unitName) ) {
                    field = Calendar.DAY_OF_MONTH;
                }
                else if( "week".equalsIgnoreCase(unitName) ) {
                    field = Calendar.MONTH;
                }
                else if( "year".equalsIgnoreCase(unitName) ) {
                    field = Calendar.YEAR;
                }

                if( field != -1 ) {
                    Calendar calendar = Calendar.getInstance();
                    start = calendar.getTime().getTime();
                    calendar.add(field, qtty);
                    end = calendar.getTime().getTime();
                }
                verify();
            }
            finally {
                Util.closeIC(icEJB);
            }
        }
        
        /**
         * Verifies if productID, unitTypeID, contactID, companyID, cost
         * and, qtty fields in thansaction info class are ok. If not, then
         * throws Exception.
         * 
         * @throws Exception when there is/are error(s) in transaction info
         * fields preventing transaction from completion.
         */
        private void verify() throws Exception {
            String msg = "";
            if( productID <= 0 ) msg += "illegal product ID\n"; 
            if( unitTypeID <= 0 ) msg += "illegal unit type ID\n";
            if( contactID <= 0 ) {
                msg += "illegal contact ID\n";
            }
            else if( companyID <= 0 ) {
                msg += "illegal company ID\n";
            }
            if( qtty <= 0 ) msg += "illegal unit qtty\n";
            if( cost <= 0 ) msg += "illegal product cost\n";
            if( cost * qtty <= 0.01 ) msg += "illegal total amount\n";
            
            if( msg.length() != 0 ) {
                throw new Exception(msg);
            }
        }
    }
}
