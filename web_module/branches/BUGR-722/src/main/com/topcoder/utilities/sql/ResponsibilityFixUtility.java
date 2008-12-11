/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
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
 * Utility to add default responsibilities for design project's r_user_role rows.
 *
 * This utility will add default responsibilities for r_user_roles rows of design projects.
 *
 * @author pulky
 * @version 1.0.0
 */
public class ResponsibilityFixUtility extends DBUtility {
    /**
     * This variable holds the start date to analyze.
     */
    //private String startDate = null;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    /**
     * Runs the ResponsibilityFixUtility.
     *
     * The utility will add default responsibilities for r_user_roles rows of design projects.
     *
     */
    public void runUtility() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psUpd = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(200);
            query.append("select project_id, r_user_role_v_id, r_resp_id, login_id from r_user_role where  ");
            query.append("r_role_id = 3 and cur_version = 1 and (r_resp_id is null or r_resp_id in (4, 5, 6)) ");
            //query.append("and modify_date > ? ");
            //query.append("and project_id in (22894700) ");
            query.append("order by project_id, r_resp_id desc");
            psSel = prepareStatement("tcs_catalog", query.toString());
            //psSel.setString(1, startDate);

            query = new StringBuffer(200);
            query.append("update r_user_role set r_resp_id = ? ");
            query.append("where r_user_role_v_id = ?");
            psUpd = prepareStatement("tcs_catalog", query.toString());

            rs = psSel.executeQuery();
            long lastProject = 0;
            List  respList = new ArrayList();
            log.debug("");
            log.debug("-----------------------------------------------");
            String logDebug = "";
            boolean skipProject = false;
            boolean fixed = false;
            for (int i = 1; rs.next(); i++ ) {

                if (lastProject != rs.getLong("project_id")) {
                    if (!skipProject) {
                        if (respList.size() > 0) {
                            throw new Exception("Error!, not all responsibilities updated.");
                        }
                    }

                    if (fixed) {
                        log.debug(logDebug);
                        fixed = false;
                    }
                    logDebug = "";

                    respList.clear();
                    respList.add("4");
                    respList.add("5");
                    respList.add("6");

                    lastProject = rs.getLong("project_id");

                    logDebug += "Fixing project: " + lastProject + "\n";
                    skipProject = false;
                }

                if (!skipProject) {
                    String rRespId = rs.getString("r_resp_id");
                    if (rRespId != null) {
                        if (!respList.contains(rRespId)) {
                            throw new Exception("Error!, resp_id already used: " + rRespId);
                        }

                        respList.remove(rRespId);
                        //log.debug("Skipping resp_id = " + rRespId);
                    } else {
                        if (rs.getString("login_id") != null) {
                            logDebug += "Warning!, resp_id null, login_id not null! r_user_role_v_id: " + rs.getLong("r_user_role_v_id") + "\n";
                            logDebug += "Project skipped!" + "\n";
                            fixed = true;
                            skipProject = true;
                        } else {

                            if (respList.size() == 0) {
                                throw new Exception("Error!, no resp_id left.");
                            }

                            rRespId = (String)respList.get(0);
                            respList.remove(rRespId);

                            psUpd.clearParameters();
                            psUpd.setString(1, rRespId);
                            psUpd.setLong(2, rs.getLong("r_user_role_v_id"));
                            if (!onlyAnalyze.equalsIgnoreCase("true")) {
                                psUpd.executeUpdate();
                                logDebug += "r_user_role_v_id: " + rs.getLong("r_user_role_v_id") + " Fixed with resp_id = " + rRespId + "\n";
                            } else {
                                logDebug += "r_user_role_v_id: " + rs.getLong("r_user_role_v_id") + " Would have been assigned with resp_id = " + rRespId + "\n";
                            }
                            fixed = true;
                        }
                    }
                }
            }
            DBMS.close(rs);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("ResponsibilityFixUtility failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psSel);
            DBMS.close(rs);
            DBMS.close(psUpd);
        }
    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

/*        startDate = (String) params.get("startDate");
        if (startDate == null)
            setUsageError("Please specify a startDate.\n");

        params.remove("startDate");*/

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null)
            setUsageError("Please specify a onlyAnalyze.\n");

        params.remove("onlyAnalyze");

        //log.debug("startDate : " + startDate);
        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the ResponsibilityFixUtility.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ResponsibilityFixUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -sourcedb URL : URL of source database.\n");
        //sErrorMsg.append("   -startDate : the start date to analyze..\n");
        sErrorMsg.append("   -onlyAnalyze : wheter to just analyze without updates.\n");
        fatal_error();
    }
}
