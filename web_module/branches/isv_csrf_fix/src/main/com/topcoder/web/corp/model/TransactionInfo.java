package com.topcoder.web.corp.model;

import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.security.NotAuthorizedException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.controller.TransactionServlet;
import com.topcoder.web.ejb.product.Product;
import com.topcoder.web.ejb.product.ProductHome;
import com.topcoder.web.ejb.product.ProductUnit;
import com.topcoder.web.ejb.product.ProductUnitHome;
import com.topcoder.web.ejb.product.Unit;
import com.topcoder.web.ejb.product.UnitHome;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.ContactHome;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


public class TransactionInfo implements Serializable {
    private String userBackPage = null;

    private long productID = -1;
    private long buyerID = -1;

    private long companyID = -1;

    private int qtty = 0;
    private double cost = 0;

    private String tcExc = null;
    private String terms = null;
    private long termsId = 0;
    private boolean agreed = false;
    private boolean fromEligibleCountry = false;
    private Set rolesPerProduct = null;

    private static final int TIME_UNIT_TYPE_ID = 1;

    public TransactionInfo() {
        terms = "";
    }

    /**
     * Creates CC transaction info bundle based on given request/response
     * pair.
     *
     * @param req  must have 'prod-id' & 'utype-id' parameters set
     * @param resp used to get uathentification token which in turn, is used
     *             to decide what company is involved into transaction
     * @throws javax.naming.NamingException errors when trying to get EJBs
     * @throws java.rmi.RemoteException     errors when trying to get EJBs / working with
     *                                      EJBs
     * @throws javax.ejb.CreateException    errors when trying to get remote EJBs
     * @throws Exception                    there is certain inconsistency in CC transaction
     *                                      information
     */
    public TransactionInfo(HttpServletRequest req, HttpServletResponse resp)
            throws NamingException, RemoteException, CreateException,
            NotAuthorizedException, Exception {
        productID = Long.parseLong(req.getParameter(TransactionServlet.KEY_PRODUCT_ID));

        // find out purchase parameters
        SessionPersistor store = new SessionPersistor(req.getSession(true));
        TCRequest tcRequest = HttpObjectFactory.createRequest(req);
        TCResponse tcResponse = HttpObjectFactory.createUnCachedResponse(resp);
        User user = new BasicAuthentication(store, tcRequest, tcResponse, BasicAuthentication.MAIN_SITE).getUser();
        if (user.isAnonymous()) {
            throw new NotAuthorizedException("User not logged in: " + user.getId());
        } else {
            buyerID = user.getId();
        }

        InitialContext icEJB = null;
        try {
            icEJB = TCContext.getInitial();
            // check if there is such product
            Product productTable = ((ProductHome) icEJB.lookup(ProductHome.EJB_REF_NAME)).create();
            cost = productTable.getCost(productID);
            if (cost <= 0) {
                throw new Exception("No valid product found for ID given");
            }
            termsId = productTable.getTermsOfUseId(productID);

            userBackPage = productTable.getRedirectionURL(productID);

            ProductUnit productUnit = ((ProductUnitHome) icEJB.lookup(ProductUnitHome.EJB_REF_NAME)).create();
            qtty = productUnit.getNumUnits(productID, getUnitIdByType(TIME_UNIT_TYPE_ID, productID));

            //TODO this is bad.  it should not require a length of time for all products.
            //TODO this will required changing what is inserted into the purchase table also
            if (qtty <= 0) {
                throw new Exception("No unit found for product: " + productID +
                        " unit type: " + TIME_UNIT_TYPE_ID);
            }


            Contact contactTable = ((ContactHome) icEJB.lookup(ContactHome.EJB_REF_NAME)).create();
            companyID = contactTable.getCompanyId(buyerID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);

            UserTermsOfUseDao userTerms = TermsOfUseUtil.getUserTermsOfUseDao();
            agreed = userTerms.hasTermsOfUse(buyerID, termsId);

            setRolesPerProduct(productID);

            verify();
        } finally {
            Util.closeIC(icEJB);
        }
    }

    public Object[] createCachable() {
        Object[] ret = new Object[12];
        int i=0;
        ret[i++]=userBackPage;
        ret[i++]=productID;
        ret[i++]=buyerID;
            ret[i++]=companyID;
            ret[i++]=qtty;
            ret[i++]=cost;
            ret[i++]=tcExc;
            ret[i++]=terms;
            ret[i++]=termsId;
            ret[i++]=agreed;
            ret[i++]=fromEligibleCountry;
            ret[i++]=rolesPerProduct;
        return ret;
    }

    public TransactionInfo(Object[] cached) {
        TransactionInfo ret = new TransactionInfo();
        int i=0;
        ret.userBackPage= (String) cached[i++];
        ret.productID =(Long)cached[i++];
        ret.buyerID=(Long)cached[i++];
            ret.companyID=(Long)cached[i++];
            ret.qtty=(Integer)cached[i++];
            ret.cost=(Double)cached[i++];
            ret.tcExc=(String)cached[i++];
            ret.terms=(String)cached[i++];
            ret.termsId=(Long)cached[i++];
            ret.agreed=(Boolean)cached[i++];
            ret.fromEligibleCountry=(Boolean)cached[i++];
            ret.rolesPerProduct=(Set)cached[i++];

    }



    /**
     * Verifies if productID, unitTypeID, contactID, companyID, cost
     * and, qtty fields in thansaction info class are ok. If not, then
     * throws Exception.
     *
     * @throws Exception when there is/are error(s) in transaction info
     *                   fields preventing transaction from completion.
     */
    private void verify() throws Exception {
        String msg = "";
        if (productID <= 0) msg += "illegal product ID\n";
        if (buyerID <= 0) {
            msg += "illegal contact ID\n";
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
     *
     * @param unitTypeId
     * @param productId
     * @return
     * @throws NamingException
     * @throws CreateException
     * @throws RemoteException
     */
    private long getUnitIdByType(int unitTypeId, long productId)
            throws Exception, CreateException, RemoteException {
        long ret = -1;
        InitialContext icEJB = null;
        try {
            icEJB = TCContext.getInitial();
            ProductUnit productUnit = ((ProductUnitHome) icEJB.lookup(ProductUnitHome.EJB_REF_NAME)).create();
            ResultSetContainer unitList = productUnit.getUnits(productId);
            if (unitList.size() == 0) {
                throw new Exception("No units exist for product: " + productId);
            }
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

//    public void setUserBackPage(String userBackPage) {
//        this.userBackPage = userBackPage;
//    }

    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public long getBuyerID() {
        return buyerID;
    }

    public void setContactID(long contactID) {
        this.buyerID = contactID;
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
            icEJB = TCContext.getInitial();
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

    public String getTcExc() {
        return tcExc;
    }

    public void setTcExc(String tcExc) {
        this.tcExc = tcExc;
    }

    public String getTerms() {
        return terms;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }

    public long getTermsId() {
        return termsId;
    }

    public void setTermsId(long termsId) {
        this.termsId = termsId;
    }

    public boolean hasAgreed() {
        return agreed;
    }

    public void setAgreed(boolean agreed) {
        this.agreed = agreed;
    }

    public boolean isFromEligibleCountry() {
        return fromEligibleCountry;
    }

    public void setFromEligibleCountry(boolean fromEligibleCountry) {
        this.fromEligibleCountry = fromEligibleCountry;
    }

    /**
     * by djFD 03/19/2003
     * <p/>
     * Returns the roles to be assigned upon successful product purchase
     * completion.
     *
     * @return Set a set of role IDs (RolePrincipal encapsulated)
     */
    public Set getRolesPerProduct() {
        return rolesPerProduct;
    }

    /**
     * by djFD 03/19/2003
     * <p/>
     * Sets the rolesPerProduct based on productID given. Query tool along
     * with CachedDataAccess is used to retrieve it.
     *
     * @param productID an ID of product of interest
     */
    private void setRolesPerProduct(long productID)
            throws NamingException, Exception {
        Request dataRequest = new Request();
        ResultSetContainer rsc = null;
        rolesPerProduct = new HashSet();
        DataAccessInt dai = new CachedDataAccess(DBMS.CORP_OLTP_DATASOURCE_NAME);
        dataRequest.setContentHandle("cmd-roles-per-product");
        dataRequest.setProperty("prodID", "" + productID);
        Map resultMap = dai.getData(dataRequest);
        rsc = (ResultSetContainer) resultMap.get("qry-roles-per-product");
        for (int i = 0; i < rsc.size(); ++i) {
            TCResultItem roleID = rsc.getItem(i, "role_id");
            String roleDescr = (String) rsc.getItem(i, "description").getResultData();
            long id;
            switch (roleID.getType()) {
                case TCResultItem.LONG:
                    id = ((Long) roleID.getResultData()).longValue();
                    break;

                case TCResultItem.INT:
                    id = ((Integer) roleID.getResultData()).longValue();
                    break;

                case TCResultItem.BIGDECIMAL:
                    id = ((BigDecimal) roleID.getResultData()).longValue();
                    break;

                default:
                    throw new Exception("unsupported data type was returned" +
                            roleID.getResultData().getClass().getName());
            }
            rolesPerProduct.add(new RolePrincipal(roleDescr, id));
        }
    }



}
