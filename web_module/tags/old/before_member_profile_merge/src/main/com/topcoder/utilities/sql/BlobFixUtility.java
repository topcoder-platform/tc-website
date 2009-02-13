/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <strong>Purpose</strong>:
 * Utility to fix blob columns.
 *
 * This utility retrieves a row from the db and gets a blob column within. It searches for the
 * specifies regex, replaces it with the new passed value and updates it to the database.
 *
 * @author pulky
 * @version 1.0.0
 */
public class BlobFixUtility extends DBUtility{
    /**
     * This variable holds the blob column name.
     */
    private String blobColumn = null;

    /**
     * This variable holds the table name.
     */
    private String table = null;

    /**
     * This variable holds the regex to search for.
     */
    private String regex = null;

    /**
     * This variable holds the replace text to apply.
     */
    private String replaceText = null;

    /**
     * Runs the BlobFixUtility.
     *
     * Retrieves a row from the db applying the specified filter and gets the blob column within.
     * It searches for the specifies regex within the blob text, replaces all matches with the new
     * passed value and updates it to the database.
     */
    public void runUtility() throws Exception {
        int retVal = 0;

        List whereColumns = new ArrayList();
        List whereValues = new ArrayList();
        for (Enumeration e = params.keys() ; e.hasMoreElements() ;) {
            String key = (String) e.nextElement();
            whereColumns.add(key);
            whereValues.add(params.get(key));
            log.debug("Column: " + key + ", value: " + params.get(key));
        }

        PreparedStatement psSel = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer where = new StringBuffer(100);
        StringBuffer query = null;

        try {
            for (int i = 0; i < whereColumns.size(); i++) {
                if (i == 0) {
                    where.append(" WHERE ");
                } else {
                    where.append(" AND ");
                }

                where.append(whereColumns.get(i));
                where.append(" = ?");
            }

            query = new StringBuffer(100);
            query.append("SELECT ");
            query.append(blobColumn);
            query.append(" FROM ");
            query.append(table);
            query.append(where);

            log.debug("selectStatement: " + query.toString());
            psSel = prepareStatement("topcoder_dw", query.toString());

            for (int i = 0; i < whereColumns.size(); i++) {
                psSel.setString(i + 1, (String)whereValues.get(i));
                log.debug("param (" + i + 1 + ") : " + (String)whereValues.get(i));
            }

            rs = psSel.executeQuery();
            if (rs.next()) {
                log.debug("Row found");

                String problem_text = DBMS.getTextString(rs, 1);

                log.debug("Blob content:" + problem_text);

                if (rs.next()) {
                    // cant return more than one result
                    throw new Exception("Conditions should determine a unique row");
                }

                problem_text = problem_text.replaceAll(regex, replaceText);

                log.debug("regex:" + regex);
                log.debug("replaceText:" + replaceText);
                log.debug("Updated Blob:" + problem_text);

                query = new StringBuffer(100);
                query.append("UPDATE ");
                query.append(table);
                query.append(" SET ");
                query.append(blobColumn);
                query.append(" = ? ");
                query.append(where);

                psUpd = prepareStatement("topcoder_dw", query.toString());
                log.debug("updateStatement: " + query.toString());

                psUpd.setBytes(1, DBMS.serializeTextString(problem_text));

                for (int i = 0; i < whereColumns.size(); i++) {
                    psUpd.setString(i + 2, (String)whereValues.get(i));
                    log.debug("param (" + (i + 2) + ") : " + (String)whereValues.get(i));
                }

                retVal = psUpd.executeUpdate();
                if (retVal != 1) {
                    throw new Exception("Incorrect number of updates: " + retVal);
                } else {
                    log.info("Operation succeded.");
                }
            } else {
                throw new Exception("Row not found");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("BlobFixUtility failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(psSel);
            DBMS.close(psUpd);
        }
    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        blobColumn = (String) params.get("blobColumn");
        if (blobColumn == null)
            setUsageError("Please specify a blobColumn.\n");

        params.remove("blobColumn");

        table = (String) params.get("table");
        if (table == null)
            setUsageError("Please specify a table.\n");

        params.remove("table");

        regex = (String) params.get("regex");
        if (regex == null)
            setUsageError("Please specify a regex.\n");

        params.remove("regex");

        replaceText = (String) params.get("replaceText");
        if (replaceText == null)
            setUsageError("Please specify a replaceText.\n");

        params.remove("replaceText");

        log.debug("blobColumn : " + blobColumn);
        log.debug("table : " + table);
        log.debug("regex : " + regex);
        log.debug("replaceText : " + replaceText);

    }

    /**
     * Show usage of the BlobFixUtility.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("BlobFixUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -sourcedb URL : URL of source database.\n");
        sErrorMsg.append("   -table name : table name to update.\n");
        sErrorMsg.append("   -blobColumn name : Blob column name to update.\n");
        sErrorMsg.append("   -regex text : regex to apply to the blob data.\n");
        sErrorMsg.append("   -replaceText text : Text to use to replace substrings that matches regex.\n");
        fatal_error();
    }
}
