package com.topcoder.utilities.pacts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.NoReferencePayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;

/**
 * 
 * @author pulky
 * @version 1.0
 */
public class PayRoyalties extends DBUtility {
    
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    
	protected void runUtility() throws Exception {
		PactsClientServices  ejb = (PactsClientServices) createEJB();
        
        StringBuffer query2 = new StringBuffer(200);
        query2.append("select user_id from user ");
        query2.append("where handle_lower = ?");

        StringBuffer query = new StringBuffer(200);
        query.append("select handle, amount, description, royalty_date ");
        query.append("from royalty_temp");
        
        PreparedStatement psSelRoyalty = prepareStatement("informixoltp", query.toString());
        PreparedStatement psSelUsers = prepareStatement("informixoltp", query2.toString());
        
        ResultSet rs = null;
        ResultSet rs2 = null;
        try {
            rs = psSelRoyalty.executeQuery();
            int i = 0;
            StringBuffer result = new StringBuffer(); 
            for (; rs.next(); i++) {
                psSelUsers.clearParameters();
                psSelUsers.setString(1, (rs.getString("handle")).toLowerCase());
                rs2 = psSelUsers.executeQuery();

                boolean hasUniqueUserId = false;
                long userId = 0;
                while (rs2.next()) {
                    if (hasUniqueUserId) {
                        log.debug("ERROR: could not resolve handle: " + rs.getString("handle"));
                        log.debug("    +--- amount: " + rs.getDouble("amount"));
                        log.debug("    +--- description: " + rs.getString("description"));
                        log.debug("    +--- date: " + rs.getDate("royalty_date"));
                        hasUniqueUserId = false;
                    } else {
                        hasUniqueUserId = true;
                    }
                    userId = rs2.getLong("user_id");
                }

                if (hasUniqueUserId) { 
                    if (onlyAnalyze.equalsIgnoreCase("false")) {
                        BasePayment bp = ejb.addPayment(new NoReferencePayment(
                                BasePayment.ROYALTY_PAYMENT,
                                userId,
                                rs.getDouble("amount"),
                                rs.getString("description"),
                                rs.getDate("royalty_date")));
                        
                        result.append("&payment_id=" + bp.getId());
                    } else {
                        log.debug("add payment: " + userId + " (" + rs.getString("handle") + ") : " + rs.getDouble("amount"));
                    }
                }
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
            log.debug(result.toString());
        } finally {
            DBMS.close(rs2);
            DBMS.close(rs);
            DBMS.close(psSelRoyalty);
            DBMS.close(psSelUsers);
        }
	}


    public static Object createEJB() throws NamingException, Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
    }
    
    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
        	onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");

        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the PayRoyalties.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PayRoyalties:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        fatal_error();
    }



}
