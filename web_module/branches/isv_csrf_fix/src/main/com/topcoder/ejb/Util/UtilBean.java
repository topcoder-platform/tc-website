package com.topcoder.ejb.Util;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.IdGeneratorClient;

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
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(150);
            long newLinkId = IdGeneratorClient.getSeqId("LINK_SEQ");
            log.debug("NEW_LINK_ID=" + newLinkId);
            query.append(" INSERT");
            query.append(" INTO");
            query.append(" link_hit (");
            query.append(" link_id");
            query.append(" ,link");
            query.append(" ,refer");
            query.append(" ,timestamp");
            query.append(" )");
            query.append(" VALUES (?,?,?,CURRENT)");
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, newLinkId);
            ps.setString(2, link);
            ps.setString(3, refer);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            DBMS.close(ps);
            DBMS.close(rs);
            DBMS.close(conn);
        }
    }


}
