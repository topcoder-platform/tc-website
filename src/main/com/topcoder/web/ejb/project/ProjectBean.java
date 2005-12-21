package com.topcoder.web.ejb.project;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.roomresult.RoomResultBean;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import javax.naming.InitialContext;
import javax.ejb.EJBException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public class ProjectBean extends BaseEJB {
    private static Logger log = Logger.getLogger(RoomResultBean.class);

    public void updateForLock(long projectId, String dataSource) {
        log.debug("lock called on project " + projectId);
        String query = "update project set project_id = project_id where project_id = ? and cur_version = 1";

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query);
            ps.setLong(1, projectId);
            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw(new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

    }

}
