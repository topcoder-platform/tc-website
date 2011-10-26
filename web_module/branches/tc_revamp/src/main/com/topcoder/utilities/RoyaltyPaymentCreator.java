package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.NoReferencePayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;

import javax.naming.NamingException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author dok
 * @version $Revision: 58252 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 7, 2007
 */
public class RoyaltyPaymentCreator {
    private static Logger log = Logger.getLogger(RoyaltyPaymentCreator.class);

    public static void main(String[] args) {
        RoyaltyPaymentCreator a = new RoyaltyPaymentCreator();
        try {
            a.doit();
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    private void doit() throws Exception {
        StringBuffer query = new StringBuffer(200);
        query.append("select user_id, amount, description, royalty_date ");
        query.append("from royalty_temp");

        Connection conn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty("INFORMIX_CONNECT_STRING")).getConnection();
log.debug("got connection");
        PreparedStatement psSelRoyalties = conn.prepareStatement(query.toString());

		PactsClientServices pcs = createEJB();

        log.debug("Processing royalties:");

        ResultSet rs = null;
        try {
            rs = psSelRoyalties.executeQuery();
            int i = 1;
            for (; rs.next(); i++) {
                pcs.addPayment(new NoReferencePayment(
                        BasePayment.ROYALTY_PAYMENT,
                        rs.getLong("user_id"),
                        rs.getDouble("amount"),
                        rs.getString("description"),
                        rs.getDate("royalty_date")));
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelRoyalties);
        }

    }


    public static PactsClientServices createEJB() throws NamingException, Exception {
		InitialContext ctx = null;
		try {
			ctx = TCContext.getInitial();
		log.debug(ctx.toString());
        return (PactsClientServices) BaseProcessor.createEJB(ctx, PactsClientServices.class);
/*
        Context initial = new InitialContext();
        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome)
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
*/
		} finally {
			ApplicationServer.close(ctx);
		}
    }

}
