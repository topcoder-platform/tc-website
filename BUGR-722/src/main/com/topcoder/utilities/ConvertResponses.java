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
 * @version $Revision: 56357 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 17, 2007
 */
public class ConvertResponses {
    private final String query = "select response, rowid from response where response is not null";
    private static final Logger log = Logger.getLogger(CheckResponseSize.class);

    public static void main(String[] args) {
        ConvertResponses c = new ConvertResponses();
        try {
            c.doit();
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }

    }

    private final String update = "update response set response_l = ? where rowid = ?";

    private void doit() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        try {
            conn = conn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty("INFORMIX_CONNECT_STRING")).getConnection();
            ps = conn.prepareStatement(query);
            ps1 = conn.prepareStatement(update);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                ps1.clearParameters();
                ps1.setString(1, DBMS.getTextString(rs, 1));
                ps1.setLong(2, rs.getLong(2));
                count += ps1.executeUpdate();
                if (count % 25 == 0) {
                    log.debug(count + " rows done");
                }
            }
        } finally {
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(ps1);
            DBMS.close(conn);
        }
    }
}
