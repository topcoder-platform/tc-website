package com.topcoder.web.corp.model;

import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.ejb.product.*;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.ContactHome;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.controller.TransactionServlet;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.security.User;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.security.NotAuthorizedException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.ejb.CreateException;
import java.rmi.RemoteException;
import java.util.Calendar;
import java.util.Iterator;
import java.sql.Date;


public class TransactionInfo {
    private String userBackPage = null;

    private long productID = -1;
    private long contactID = -1;

    private long companyID = -1;

    private int qtty = 0;
    private double cost = 0;

    private String rcVeriSign = null;
    private Exception tcExc = null;
    private String terms = null;
    private boolean agreed = false;

    private static final int TIME_UNIT_TYPE_ID = 1;

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
            throws NamingException, RemoteException, CreateException, NotAuthorizedException, Exception {
        productID = Long.parseLong(req.getParameter(TransactionServlet.KEY_PRODUCT_ID));
        userBackPage = req.getParameter(TransactionServlet.KEY_RETPAGE);
        if (userBackPage != null && userBackPage.trim().length() == 0) {
            userBackPage = null;
        }

        // find out purchase parameters
        SessionPersistor store = new SessionPersistor(
                req.getSession(true)
        );
        User user = new BasicAuthentication(store, req, resp).getUser();
        if (user.isAnonymous()) {
            throw new NotAuthorizedException("User not logged in: " + user.getId());
        } else {
            contactID = user.getId();
        }

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

            ProductUnit productUnit = ((ProductUnitHome) icEJB.lookup(ProductUnitHome.EJB_REF_NAME)).create();
            qtty = productUnit.getNumUnits(productID, getUnitIdByType(TIME_UNIT_TYPE_ID, productID));

            if (qtty <= 0) {
                throw new Exception("No valid unit found for ID given");
            }


            Contact contactTable = (
                    (ContactHome) icEJB.lookup(ContactHome.EJB_REF_NAME)
                    ).create();
            companyID = contactTable.getCompanyId(contactID);

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

    /**
     * figures out what unit is associated with the given product
     * for the given unit_type_id.  it will return the first
     * unit_id that matches those criteria.
     * @param unitTypeId
     * @param productId
     * @return
     * @throws NamingException
     * @throws CreateException
     * @throws RemoteException
     */
    private long getUnitIdByType(int unitTypeId, long productId)
            throws NamingException, CreateException, RemoteException {
        long ret = -1;
        InitialContext icEJB = null;
        try {
            ProductUnit productUnit = ((ProductUnitHome) icEJB.lookup(ProductUnitHome.EJB_REF_NAME)).create();
            ResultSetContainer unitList = productUnit.getUnits(productId);
            ResultSetContainer.ResultSetRow row = null;
            for (Iterator it = unitList.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getItem("unit_type_id").getResultData().equals(new Integer(unitTypeId))) {
                    ret = ((Long) row.getItem("unit_id").getResultData()).longValue();
                }
            }
        } finally {
            Util.closeIC(icEJB);
        }
        return ret;
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

    public Date getEnd(Date start) throws NamingException, CreateException, RemoteException, Exception {
        InitialContext icEJB = null;
        Date ret = null;
        try {
            icEJB = (InitialContext) TCContext.getInitial();
            // check if there is such product
            Unit unit = ((UnitHome) icEJB.lookup(UnitHome.EJB_REF_NAME)).create();

            // calculate start date / end date
            int field = -1;
            String unitName = unit.getUnitDesc(getUnitIdByType(TIME_UNIT_TYPE_ID, productID));
            if ("day".equalsIgnoreCase(unitName)) {
                field = Calendar.DAY_OF_MONTH;
            } else if ("week".equalsIgnoreCase(unitName)) {
                field = Calendar.WEEK_OF_YEAR;
            } else if ("year".equalsIgnoreCase(unitName)) {
                field = Calendar.YEAR;
            } else if ("month".equalsIgnoreCase(unitName)) {
                field = Calendar.MONTH;
            }

            if (field != -1) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(start);
                calendar.add(field, qtty);
                ret = new Date(calendar.getTime().getTime());
            }
        } finally {
            Util.closeIC(icEJB);
        }
        return ret;
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


