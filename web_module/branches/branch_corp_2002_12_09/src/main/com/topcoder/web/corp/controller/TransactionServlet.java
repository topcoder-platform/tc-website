package com.topcoder.web.corp.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.Hashtable;

import javax.naming.InitialContext;
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
 * My comments/description/notes go here
 * 
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
    
    private static final String FRMKEY_TX_UID   = "USER1";
    
    private static final String RETKEY_IRESULT  = "RESULT";
    private static final String RETKEY_SRESULT  = "RESPMSG";
    
    public static final String OP_TX_BEGIN      = "begin";
    public static final String OP_TX_COMMIT     = "commit";
    public static final String OP_TX_STATUS     = "status";
    
    private static final int    RCINT_APPROVED  = 0;

    private static final String RCSTR_ACCEPTED = "accept";
    private static final String RCSTR_REJECTED = "reject";
    private static final String KEY_EXCEPTION  = "caught-exception";
    
    private static final String TX_PAGE_ACCEPT = "/Tx/Accepted.jsp"; 
    private static final String TX_PAGE_REJECT = "/Tx/Rejected.jsp";
    
    /**
     * op=begin&prod-id=IDNUM&utype-id=UTID will start transaction
     * op=commit will issued by VeriSign to acknowledge transaction
     * 
     * 200 ok means that transaction was accepted by TC. Thus, VeriSign will
     * complete it. Other return codes will roll transaction back.
     * 
     * before returning rc 200 OK to verisign, TC DB is populated with
     * transaction data
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
                req.getRequestDispatcher(retPage).forward(req, resp);
            }
            catch(Exception e) {
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(TX_PAGE_REJECT).forward(req, resp);
            }
        }
        else if( OP_TX_BEGIN.equals(op) ) {
            try {
                txBegin(req, resp);
            }
            catch(Exception e) { // possible parameters are wrong
                e.printStackTrace();
                req.setAttribute(KEY_EXCEPTION, e);
                req.getRequestDispatcher(TX_PAGE_REJECT).forward(req, resp);
            }
            req.getRequestDispatcher("/Tx/helper_form.jsp").forward(req, resp);
        }
        else if( OP_TX_COMMIT.equals(op) ) {
            try {
                log.debug("CcTx commit successful ["+txCommit(req, resp)+"]");
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
            throw new ServletException("post op "+op+" not supported");
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
            txInfo.userBackPage == null ? TX_PAGE_ACCEPT : txInfo.userBackPage;  
    } 

    /**
     * 
     * @param req
     * @param resp
     * @throws Exception
     */
    private void txBegin(HttpServletRequest req, HttpServletResponse resp)
    throws Exception
    {
        transaction_info txInfo = buildTransactionInfo(req, resp);
        req.setAttribute(Constants.KEY_CCTX_LOGIN, Constants.CCTX_LOGIN);
        req.setAttribute(Constants.KEY_CCTX_PARTNER, Constants.CCTX_PARTNER);
        req.setAttribute(Constants.KEY_CCTX_CONFIRM, Constants.CCTX_CONFIRM);
        req.setAttribute(Constants.KEY_CCTX_URL, Constants.CCTX_URL);
        req.setAttribute(Constants.KEY_CCTX_TYPE, "S");
        req.setAttribute(Constants.KEY_CCTX_SUM, ""+(txInfo.cost*txInfo.qtty));
        return;
    }

    /**
     * Return true if transaction is approved 
     * @param req
     * @param txi
     * @return boolean
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
     * 
     * @param req
     * @param resp
     * @return boolean
     * @throws Exception
     */
    private boolean txCommit(HttpServletRequest req, HttpServletResponse resp)
    throws Exception
    {
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
     * 
     * @param req
     * @param resp
     * @return tx
     * @throws Exception
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
     * 
     * @param req
     * @return String
     */    
    private String transactionKey(HttpServletRequest req) {
        String key = req.getParameter(FRMKEY_TX_UID);
        if( key == null || key.trim().length() == 0 ) {
            key = req.getSession(true).toString();
        }
        return key;
    }

    /**
     *
     * My comments/description/notes go here
     *
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
        
        private transaction_info(HttpServletRequest req, HttpServletResponse resp)  
        throws Exception
        {
            productID = Long.parseLong(req.getParameter(KEY_PRODUCT_ID));
            unitTypeID = Long.parseLong(req.getParameter(KEY_UNITTYPE_ID));
            userBackPage = req.getParameter(KEY_RETPAGE);
            if( userBackPage != null && userBackPage.trim().length() == 0 ) {
                userBackPage = null;
            }

            // find out purchase parameters
            SessionPersistor store = SessionPersistor.getInstance(
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
                String unitName = unitTable.getUnitDescription(unitTypeID);
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
                boolean prodFound;
                verify();
            }
            finally {
                Util.closeIC(icEJB);
            }
        }
        
        /**
         * 
         * @throws Exception
         */
        void verify() throws Exception {
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
