package com.topcoder.web.corp.model;

import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.ejb.product.Product;
import com.topcoder.web.ejb.product.ProductHome;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.ContactHome;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.controller.TransactionServlet;
import com.topcoder.shared.util.TCContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.ejb.CreateException;
import java.rmi.RemoteException;
import java.util.Calendar;


public class TransactionInfo {
    private String userBackPage = null;

    private long productID = -1;
    private long contactID = -1;

    private long companyID = -1;

    private int qtty = 0;
    private double cost = 0;

    private long start = 0;
    private long end = 0;
    private String rcVeriSign = null;
    private Exception tcExc = null;
    private String terms = null;
    private boolean agreed = false;

    public TransactionInfo() {
        terms = "";
    }

    /**
     * Creates CC transaction info bundle based on given request/response
     * pair.
     *
     * @param req must have 'prod-id' & 'utype-id' parameters set
     * @param resp used to get uathentification token which in turn, is used
     * to decide what company is involved into transaction
     *
     * @throws javax.naming.NamingException errors when trying to get EJBs
     * @throws java.rmi.RemoteException errors when trying to get EJBs / working with
     * EJBs
     * @throws javax.ejb.CreateException errors when trying to get remote EJBs
     *
     * @throws Exception there is certain inconsistency in CC transaction
     * information
     */
    public TransactionInfo(HttpServletRequest req, HttpServletResponse resp)
            throws NamingException, RemoteException, CreateException, Exception {
        productID = Long.parseLong(req.getParameter(TransactionServlet.KEY_PRODUCT_ID));
        userBackPage = req.getParameter(TransactionServlet.KEY_RETPAGE);
        if (userBackPage != null && userBackPage.trim().length() == 0) {
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
            icEJB = (InitialContext) TCContext.getInitial();
            // check if there is such product
            Product productTable = (
                    (ProductHome) icEJB.lookup(ProductHome.EJB_REF_NAME)
                    ).create();
            cost = productTable.getCost(productID);
            if (cost <= 0) {
                throw new Exception("No valid product found for ID given");
            }

            qtty = productTable.getNumUnits(productID);
            if (qtty <= 0) {
                throw new Exception("No valid unit found for ID given");
            }

            Contact contactTable = (
                    (ContactHome) icEJB.lookup(ContactHome.EJB_REF_NAME)
                    ).create();
            companyID = contactTable.getCompanyId(contactID);

            // calculate start date / end date
            int field = -1;
            String unitName;
            unitName = productTable.getUnitTypeDesc(productID);
            if ("day".equalsIgnoreCase(unitName)) {
                field = Calendar.DAY_OF_MONTH;
            } else if ("week".equalsIgnoreCase(unitName)) {
                field = Calendar.MONTH;
            } else if ("year".equalsIgnoreCase(unitName)) {
                field = Calendar.YEAR;
            }

            if (field != -1) {
                Calendar calendar = Calendar.getInstance();
                start = calendar.getTime().getTime();
                calendar.add(field, qtty);
                end = calendar.getTime().getTime();
            }
            verify();
        } finally {
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
        if (productID <= 0) msg += "illegal product ID\n";
        if (contactID <= 0) {
            msg += "illegal contact ID\n";
        } else if (companyID <= 0) {
            msg += "illegal company ID\n";
        }
        if (qtty <= 0) msg += "illegal unit qtty\n";
        if (cost <= 0) msg += "illegal product cost\n";
        if (cost * qtty <= 0.01) msg += "illegal total amount\n";

        if (msg.length() != 0) {
            throw new Exception(msg);
        }
    }


    public String getUserBackPage() {
        return userBackPage;
    }

    public void setUserBackPage(String userBackPage) {
        this.userBackPage = userBackPage;
    }

    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public long getContactID() {
        return contactID;
    }

    public void setContactID(long contactID) {
        this.contactID = contactID;
    }

    public long getCompanyID() {
        return companyID;
    }

    public void setCompanyID(long companyID) {
        this.companyID = companyID;
    }

    public int getQtty() {
        return qtty;
    }

    public void setQtty(int qtty) {
        this.qtty = qtty;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public long getStart() {
        return start;
    }

    public void setStart(long start) {
        this.start = start;
    }

    public long getEnd() {
        return end;
    }

    public void setEnd(long end) {
        this.end = end;
    }

    public String getRcVeriSign() {
        return rcVeriSign;
    }

    public void setRcVeriSign(String rcVeriSign) {
        this.rcVeriSign = rcVeriSign;
    }

    public Exception getTcExc() {
        return tcExc;
    }

    public void setTcExc(Exception tcExc) {
        this.tcExc = tcExc;
    }

    public String getTerms() {
        return terms;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }

    public boolean hasAgreed() {
        return agreed;
    }

    public void setAgreed(boolean agreed) {
        this.agreed = agreed;
    }
}


