/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <strong>Purpose</strong>:
 * Utility to migrate old terms of use schema
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v1.0)
 */
public class TermsOfUseMigrationTool extends DBUtility {

    /**
     * Runs the TermsOfUseMigrationTool.
     *
     * This method will get each terms text and will update the title column to the first 50 characters.
     *
     * @throws Exception if any error occurs.
     */
    public void runUtility() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;

        List<Integer> keys = new ArrayList<Integer>();
        List<String> titles = new ArrayList<String>();

        try {
            psSel = prepareStatement("common_oltp", "SELECT terms_of_use_id, terms_text FROM terms_of_use where title is null");
            rs = psSel.executeQuery();
            while (rs.next()) {
                String terms_text = DBMS.getTextString(rs, 2);

                if (terms_text != null) {
                    keys.add(rs.getInt(1));
                    titles.add(terms_text.substring(0, terms_text.length() > 50 ? 50 : terms_text.length()));
                }
            }

            int count = 0;
            if (keys.size() > 0) {
                psUpd = prepareStatement("common_oltp", "update terms_of_use set title = ? where terms_of_use_id = ?");
                for (int i = 0; i < keys.size(); i++) {
                    psUpd.clearParameters();
                    psUpd.setString(1, titles.get(i));
                    psUpd.setInt(2, keys.get(i));

                    count += psUpd.executeUpdate();
                }
            }
            log.info("Migration succeded. " + count + " row processed.");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("TermsOfUseMigrationTool failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(psSel);
            DBMS.close(psUpd);
        }
    }

    /**
     * Show usage of the TermsOfUseMigrationTool.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("TermsOfUseMigrationTool:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -sourcedb URL : URL of database.\n");
        fatal_error();
    }
}
