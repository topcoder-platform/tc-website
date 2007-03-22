package com.topcoder.ejb.Util;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UtilBean extends BaseEJB {

    private static Logger log = Logger.getLogger(UtilBean.class);

    public void incrementSponsorHitCount(String link, String refer)
            throws RemoteException {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        javax.naming.Context ctx = null;
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(150);
            ctx = TCContext.getInitial();
            javax.naming.Context env = (javax.naming.Context) ctx.lookup("java:comp/env");
            int seq = ((java.lang.Integer) env.lookup("LINK_SEQ")).intValue();
            /*********************************************************/
            query.append(" EXECUTE PROCEDURE nextval(?)");
            /*********************************************************/
            ps = conn.prepareStatement(query.toString());
            query.delete(0, 150);
            ps.setInt(1, seq);
            rs = ps.executeQuery();
            ps.clearParameters();
            if (rs.next()) {
                int newLinkId = rs.getInt(1);
                log.debug("NEW_LINK_ID=" + newLinkId);
                /*********************************************************/
                query.append(" INSERT");
                query.append(" INTO");
                query.append(" link_hit (");
                query.append(" link_id");
                query.append(" ,link");
                query.append(" ,refer");
                query.append(" ,timestamp");
                query.append(" )");
                query.append(" VALUES (?,?,?,CURRENT)");
                /*********************************************************/
                DBMS.close(ps);
                ps = conn.prepareStatement(query.toString());
                ps.setInt(1, newLinkId);
                ps.setString(2, link);
                ps.setString(3, refer);
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            DBMS.close(ps);
            DBMS.close(rs);
            DBMS.close(conn);
            ApplicationServer.close(ctx);
        }
    }


}
