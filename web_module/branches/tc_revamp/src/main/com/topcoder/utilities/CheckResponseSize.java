package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision: 56336 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 17, 2007
 */
public class CheckResponseSize {
    private final String query = "select response from response where response is not null";
    private static final Logger log = Logger.getLogger(CheckResponseSize.class);
    public static void main(String[] args) {
        CheckResponseSize c = new CheckResponseSize();
        try {
            c.doit();
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }

    }

    private void doit() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            conn = conn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty("INFORMIX_CONNECT_STRING")).getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            int max = 0;
            while (rs.next()) {
                int newMax = Math.max(max, rs.getString(1).length());
                if (newMax!=max) {
                    log.info("new max is " + newMax);
                    max = newMax;
                }
            }
        } finally {
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(conn);
        }
    }
}
