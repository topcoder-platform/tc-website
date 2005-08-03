/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.File;
import java.io.IOException;
import java.io.FileReader;
import java.io.BufferedReader;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;
import com.topcoder.apps.screening.DbHelper;

/**
 * <strong>Purpose</strong>:
 * Checks if the personal information exists in the submission.
 *
 * @author WishingBone
 * @version 1.0
 */
public class PersonalInfoRule implements ScreeningRule {

    /**
     * <strong>Purpose</strong>:
     * Screen the submission. Both the file and the root directory are given. Screening responses
     * are written to the ScreeningLogger instance.
     *
     * @param file the file to screen.
     * @param root the root dir of the extracted submission.
     * @param logger the logger to write responses to.
     */
    public boolean screen(File file, File root, ScreeningLogger logger) {
        try {
            Map infos = fetchInfos(logger.getSubmissionVId());
            matchFile(root, infos, logger);
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Failed to match personal information.", ResponseCode.PERSONAL_INFO));
        }
        return true;
    }

    /**
     * <strong>Purpose</strong>:
     * Match info in a specific file / dir.
     *
     * @param root the target file to match.
     * @param infos the info mapping.
     * @logger the logger to write responses to.
     */
    private void matchFile(File root, Map infos, ScreeningLogger logger) throws IOException {
        if (!root.exists()) {
            return;
        }
        File[] files = root.listFiles();
        Map lowers = new HashMap();
        for (Iterator itr = infos.keySet().iterator(); itr.hasNext();) {
            String key = (String) itr.next();
            lowers.put(key.toLowerCase(), key);
        }

        for (int i = 0; i < files.length; ++i) {
            if (files[i].isDirectory()) {
                matchFile(files[i], infos, logger);
            } else if (files[i].length() > 0) {
                String[] matches = matchFile(files[i], lowers);
                for (int j = 0; j < matches.length; ++j) {
                    String info = (String) lowers.get(matches[j]);
                    String name = (String) infos.get(info);
                    logger.log(new SimpleScreeningData(
                            files[i].getName() + " contains " +
                            name + " (" +
                            info + ").", ResponseCode.PERSONAL_INFO));
                }
            }
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Match info in a specific file.
     *
     * @param file the target file to match.
     * @param infos the info mapping.
     */
    private String[] matchFile(File file, Map infos) throws IOException {
        List matches = new ArrayList();
        BufferedReader br = new BufferedReader(new FileReader(file));
        try {
            for (;;) {
                String line = br.readLine();
                if (line == null) {
                    break;
                }
                line = line.toLowerCase();
                for (Iterator itr = infos.keySet().iterator(); itr.hasNext();) {
                    String key = (String) itr.next();
                    if (!matches.contains(key) && line.indexOf(key) >= 0) {
                        matches.add(key);
                    }
                }
            }
        } finally {
            br.close();
        }
        return (String[]) matches.toArray(new String[matches.size()]);
    }

    /**
     * <strong>Purpose</strong>:
     * Get a mapping of personal infos, which includes email, first name, last name and handle for this release.
     *
     * @param submissionId the submission id.
     *
     * @return a mapping from names to personal infos.
     */
    private Map fetchInfos(long submissionVId) throws SQLException {
        Map infos = new HashMap();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            long userId = -1;
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement(
                    "SELECT submitter_id FROM submission WHERE submission_v_id = ?");
            stmt.setLong(1, submissionVId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                userId = rs.getLong(1);
                rs.close();
                stmt.close();

                stmt = conn.prepareStatement(
                        "SELECT first_name, last_name, handle FROM user WHERE user_id = ?");
                stmt.setLong(1, userId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    infos.put(rs.getString(1), "first name");
                    infos.put(rs.getString(2), "last name");
                    infos.put(rs.getString(3), "handle");
                }
                rs.close();
                stmt.close();

                stmt = conn.prepareStatement(
                        "SELECT address FROM email WHERE user_id = ?");
                stmt.setLong(1, userId);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    infos.put(rs.getString(1), "email address");
                }
            }
        } finally {
            DbHelper.dispose(conn, stmt, rs);
        }

        return infos;
    }

}
