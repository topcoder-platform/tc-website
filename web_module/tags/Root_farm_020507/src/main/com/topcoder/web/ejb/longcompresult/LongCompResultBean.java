package com.topcoder.web.ejb.longcompresult;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public class LongCompResultBean extends BaseEJB {
    private static Logger log = Logger.getLogger(LongCompResultBean.class);

    public void createLongCompResult(long roundId, long coderId, String dataSource) {
        log.debug("createLongCompResult called... " + roundId + " " + coderId);
        insert("long_comp_result", new String[] {"round_id", "coder_id"},
                new String[] {String.valueOf(roundId), String.valueOf(coderId)}, dataSource);
    }

    public void setPointTotal(long roundId, long coderId, double pointTotal, String dataSource)  {
        log.debug("setPointTotal called... " + roundId + " " + coderId + " " + pointTotal);
        update("long_comp_result", new String[] {"point_total"}, new String[] {String.valueOf(pointTotal)},
                new String[] {"round_id", "coder_id"},
                new String[] {String.valueOf(roundId), String.valueOf(coderId)}, dataSource);
    }
    public void setAttended(long roundId, long coderId, boolean attended, String dataSource)  {
        log.debug("setAttended called... " + roundId + " " + coderId + " " + attended);
        update("long_comp_result", new String[] {"attended"}, new String[] {attended?"Y":"N"},
                new String[] {"round_id", "coder_id"},
                new String[] {String.valueOf(roundId), String.valueOf(coderId)}, dataSource);
    }

    public double getPointTotal(long roundId, long coderId, String dataSource)  {
        log.debug("getPointTotal called... " + roundId + " " + coderId);
        return selectDouble("long_comp_result", "point_total", new String[] {"round_id", "coder_id"},
            new String[] {String.valueOf(roundId),String.valueOf(coderId)}, dataSource).doubleValue();
    }

    public boolean getAttended(long roundId, long coderId, String dataSource)  {
        log.debug("getAttended called... " + roundId + " " + coderId);
        return "Y".equals(selectString("long_comp_result", "attended", new String[] {"round_id", "coder_id"},
            new String[] {String.valueOf(roundId), String.valueOf(coderId)}, dataSource));

    }

    public boolean exists(long roundId, long coderId, String dataSource) {
            log.debug("exists called... user_id=" + coderId + " roundId=" + roundId);

            Context ctx = null;
            PreparedStatement ps = null;
            Connection conn = null;
            ResultSet rs = null;
            try {
                conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

                ps = conn.prepareStatement("SELECT '1' FROM long_comp_result WHERE coder_id = ? AND round_id = ?");
                ps.setLong(1, coderId);
                ps.setLong(2, roundId);

                rs = ps.executeQuery();
                return rs.next();
            } catch (SQLException sqe) {
                DBMS.printSqlException(true, sqe);
                throw new EJBException("SQLException exists coder_id=" + coderId+ " roundId=" + roundId);
            } catch (Exception e) {
                throw new EJBException("Exception exists coder_id=" + coderId + " roundId=" + roundId + ":\n" + e.getMessage());
            } finally {
                close(rs);
                close(ps);
                close(conn);
                close(ctx);
            }

    }

}
