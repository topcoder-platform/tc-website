/**
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.BatchUpdateException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <p>
 * This achievement utility tool will run periodically to check what
 * achievements members accomplished and store these information so it can be
 * easily pulled by member profiles.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong>This class is supposed to run in single thread
 * mode.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0 (Release Assembly - TopCoder Achievement System)
 */
public class MemberAchievementUtility extends DBUtility {

    /**
     * <p>
     * This field represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = MemberAchievementUtility.class.getName();

    /**
     * <p>
     * SQL to remove all previous achievements to reflect latest achievement.
     * <p>
     */
    private static final String SQL_CLEAN_ACHIEVEMENT = "DELETE FROM user_achievement_xref WHERE user_id = ? AND user_achievement_rule_id = ?";

    /**
     * <p>
     * SQL to insert achievement items.
     * </p>
     */
    private static final String SQL_INSERT_ACHIEVEMENT = "INSERT INTO user_achievement_xref(user_id, user_achievement_rule_id, create_date) VALUES (?, ?, ?)";

    /**
     * <p>
     * This SQL is to query existing user_id for a given achievement rule.
     * </p>
     */
    private static final String SQL_QUERY_EXISING_USERS_PER_ACHIEVEMENT = "SELECT user_id FROM user_achievement_xref WHERE user_achievement_rule_id = ?";

    /**
     * <p>
     * SQL to query achievement rules.
     * </p>
     */
    private static final String SQL_LOAD_ACHIEVEMENT_RULE = "SELECT user_achievement_rule_id, user_achievement_rule_sql_file FROM user_achievement_rule";

    /**
     * <p>
     * Constants to define tcs_catalog database schema to operate on.
     * </p>
     */
    private static final String TCS_CATALOG = "tcs_catalog";

    /**
     * <p>
     * Constants to define tcs_dw database schema to operate on.
     * </p>
     */
    private static final String TCS_DW = "tcs_dw";

    /**
     * <p>
     * Instance of {@link SimpleDateFormat} to better format time while logging.
     * </p>
     */
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S");
    
    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public MemberAchievementUtility() {
        super();
    }

    /**
     * <p>
     * This method would simply find out all existing achievement winner's ID
     * per achievement rule.
     * </p>
     * 
     * @param ruleId
     *            the ID of the rule to filter.
     * @return List of user ID.
     */
    private List<Long> findUserID(long ruleId) {
        final String signature = CLASS_NAME + ".findUserID(long ruleId)";
        logEntrance(signature, "ruleId", ruleId);
        final long start = logStart(signature);
        List<Long> userIds = new ArrayList<Long>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            logSQL(SQL_QUERY_EXISING_USERS_PER_ACHIEVEMENT);
            pst = prepareStatement(TCS_DW, SQL_QUERY_EXISING_USERS_PER_ACHIEVEMENT);
            pst.setLong(1, ruleId);
            rs = pst.executeQuery();
            while (rs.next()) {
                userIds.add(rs.getLong("user_id"));
            }
            logEnd(signature, start);
            logExit(signature, userIds);
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
        }
        return userIds;
    }

    /**
     * <p>
     * This method would load all SQLs which will be used to assign
     * achievements.
     * </p>
     * 
     * @return A map containing all achievement ID and the
     * @throws Exception
     */
    private Map<Long, String> loadAchievementRule() throws Exception {
        final String signature = CLASS_NAME + ".loadAchievementRule()";
        logEntrance(signature);
        final long start = logStart(signature);
        Map<Long, String> resultMap = new HashMap<Long, String>();

        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            pst = prepareStatement(TCS_DW, SQL_LOAD_ACHIEVEMENT_RULE);

            logSQL(SQL_LOAD_ACHIEVEMENT_RULE);

            rs = pst.executeQuery();
            String basePath = getSQLFileBasePath();
            while (rs.next()) {
                resultMap.put(rs.getLong("user_achievement_rule_id"), readSQLFile(basePath
                        + rs.getString("user_achievement_rule_sql_file")));
            }
            logExit(signature, resultMap);
            logEnd(signature, start);
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
            throw new Exception("MemberAchievementUtility failed!\n" + e.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
        }
        return resultMap;
    }

    /**
     * <p>
     * This method would return a collection of user_id that is qualified for
     * the given achievement rule.
     * </p>
     * 
     * @param rule
     *            the specified achievement rule
     * @return a collection of user IDs.
     * @throws Exception
     *             If there is any error.
     */
    private List<Long> filterUser(String rule) throws Exception {
        final String signature = CLASS_NAME + ".filterUser(String rule)";
        logEntrance(signature, "rule", rule);
        logSQL(rule);
        final long start = logStart(signature);
        List<Long> userIDs = new ArrayList<Long>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = prepareStatement(TCS_CATALOG, rule);
            rs = pst.executeQuery();
            while (rs.next()) {
                userIDs.add(rs.getLong("user_id"));
            }
            logEnd(signature, start);
            logUserIDs(userIDs);
            return userIDs;
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
            throw new Exception("MemberAchievementUtility failed!\n" + e.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
        }
    }

    /**
     * <p>
     * This method would return location that storing the SQLs for filtering
     * qualified achievement winners.
     * </p>
     * 
     * @return Location of the folder that storing achievement files.
     */
    private String getSQLFileBasePath() {
        String basePath = (String) params.get("path");

        if (null == basePath) {
            setUsageError("Missing required -xmlfile command option");
        }

        if (!basePath.endsWith("/")) {
            basePath += "/";
        }

        return basePath;
    }

    /**
     * <p>
     * This method would read SQL statement from specified file.
     * </p>
     * 
     * @param path
     *            location of the file storing SQL.
     * @return SQL the SQL statement.
     */
    private String readSQLFile(String path) throws IOException {
        final String signature = CLASS_NAME + ".loadSingleSQL(String path)";
        logEntrance(signature, "path", path);
        StringBuilder sb = new StringBuilder();
        File f = new File(path);

        if (!f.exists() || !f.canRead()) {
            throw new IOException("The specified file does not exist or is not accessible");
        }

        BufferedReader br = new BufferedReader(new FileReader(f));
        String line = "";
        while (null != (line = br.readLine())) {
            sb.append(line).append(" ");
        }
        br.close();
        logExit(signature, sb.toString());
        return sb.toString();
    }

    /**
     * <p>
     * This method would log the entrance of a method.
     * </p>
     * 
     * @param signature
     *            Signature of the method.
     * @param paraName
     *            Name of the parameter
     * @param paramValue
     *            value of the parameter
     */
    private void logEntrance(String signature, String paraName, Object paramValue) {
        if (log.isInfoEnabled()) {
            log.info("Enter " + signature);
            if (null != paraName) {
                log.info("Parameter{" + paraName + ":" + paramValue + "}");
            }
        }
    }

    /**
     * <p>
     * This method would log the entrance of a method.
     * </p>
     * 
     * @param signature
     */
    private void logEntrance(String signature) {
        if (log.isInfoEnabled()) {
            log.info("Enter " + signature);
        }
    }

    /**
     * <p>
     * This method would log the exit of a method.
     * </p>
     * 
     * @param signature
     * @param ret
     *            Return value of the method.
     */
    private void logExit(String signature, Object ret) {
        if (log.isInfoEnabled()) {
            log.info("Exit " + signature + ".\n Returning " + ret);
        }
    }

    /**
     * <p>
     * This method would log the exit of a method.
     * </p>
     * 
     * @param signature
     * @param ret
     *            Return value of the method.
     */
    private void logExit(String signature) {
        if (log.isInfoEnabled()) {
            log.info("Exit " + signature);
        }
    }

    /**
     * <p>
     * This method would log down SQL statements executed/will be executed.
     * </p>
     * 
     * @param sql
     *            The SQL statement.
     */
    private void logSQL(String sql) {
        if (log.isInfoEnabled()) {
            log.info("Executing: " + sql);
        }
    }

    /**
     * <p>
     * This method would log down the start time in milliseconds.
     * </p>
     * 
     * @param signature
     *            Signature of the method.
     * @return time in milliseconds.
     */
    private long logStart(String signature) {
        final long start = System.currentTimeMillis();
        if (log.isInfoEnabled()) {
            log.info(signature + " starts at: " + DATE_FORMAT.format(new Date(start)));
        }
        return start;
    }

    /**
     * <p>
     * This method would log down the ending time of the execution, as well as
     * rough cost time.
     * </p>
     * 
     * @param signature
     * @param start
     */
    private void logEnd(String signature, long start) {
        if (log.isInfoEnabled()) {
            final long end = System.currentTimeMillis();
            log.info(signature + " ends at: " + DATE_FORMAT.format(new Date(end)) + ".\n It approximately costs "
                    + (end - start) + " ms");
        }
    }

    /**
     * <p>
     * This method logs a collection of user IDs that are being working on in
     * INFO level.
     * </p>
     * 
     * @param userIds
     *            a collection of user IDs being logged down.
     */
    private void logUserIDs(List<Long> userIds) {
        if (log.isInfoEnabled() && null != userIds && !userIds.isEmpty()) {
            log.info("The following User ID(s) are involved: ");
            StringBuilder sb = new StringBuilder("[");
            int len = userIds.size();
            for (int i = 1; i < len; i++) {
                sb.append(userIds.get(i - 1)).append(", ");
                if (i % 120 == 0) {
                    sb.append("\n");
                }
            }
            sb.append(userIds.get(len - 1)).append("]");
            log.info(sb.toString());
        }
    }

    /**
     * <p>
     * This method would add achievement records into user_achievement_xref in
     * {@link #TCS_DW} in batch processing manner.
     * </p>
     * 
     * @param userIds
     *            Collections of user_id that has got the achievement
     *            represented by memberAchievementRoleId
     * @param memberAchievementRoleId
     *            The Id of the achievement gained by userIds.
     * @throws Exception
     *             If there is any error.
     */
    private void assignAchievements(List<Long> userIds, long memberAchievementRoleId) throws Exception {
        final String signature = CLASS_NAME + ".assignAchievements()";
        logEntrance(signature);
        logUserIDs(userIds);
        final long start = logStart(signature);

        if (null == userIds || userIds.size() == 0) {
            return;
        }

        PreparedStatement pst = null;
        PreparedStatement pstClean = null;
        
        try {
            
            List<Long> existingUserIds = findUserID(memberAchievementRoleId);
            logSQL(SQL_INSERT_ACHIEVEMENT);
            pst = prepareStatement(TCS_DW, SQL_INSERT_ACHIEVEMENT);
            Date currentTime = new Date(System.currentTimeMillis());
            
            for (long userId : userIds) {
                if(existingUserIds.contains(userId)) {
                    existingUserIds.remove(userId);
                    continue;
                }
                pst.setLong(1, userId);
                pst.setLong(2, memberAchievementRoleId);
                pst.setDate(3, currentTime);
                pst.executeUpdate();
            }
            
            logSQL(SQL_CLEAN_ACHIEVEMENT);
            pstClean = prepareStatement(TCS_DW, SQL_CLEAN_ACHIEVEMENT);
            for(long userId:existingUserIds) {
                pstClean.setLong(1, userId);
                pstClean.setLong(2, memberAchievementRoleId);
                pstClean.executeUpdate();
            }
            logExit(signature);
            logEnd(signature, start);
        } catch(BatchUpdateException e) {
            pst.getConnection().rollback();
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
            throw new Exception("MemberAchievementUtility#Batch execution failed!\n" + e.getMessage());
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
            throw new Exception("MemberAchievementUtility failed!\n" + e.getMessage());
        } finally {
            DBMS.close(pst);
            DBMS.close(pstClean);
        }
    }

    /**
     * <p>
     * This implementation would first clean up existing achievement and re-fill
     * with latest data.
     * </p>
     * 
     * @throws Exception
     *             If there is any error.
     */
    @Override
    protected void runUtility() throws Exception {
        final String signature = CLASS_NAME + ".runUtility()";
        logEntrance(signature);
        final long start = logStart(signature);

        Map<Long, String> map = loadAchievementRule();

        long achievementRoleId = 0;
        List<Long> userIds = null;
        for (Map.Entry<Long, String> entry : map.entrySet()) {
            achievementRoleId = entry.getKey();
            userIds = filterUser(entry.getValue());
            assignAchievements(userIds, achievementRoleId);
        }

        logEnd(signature, start);
        logExit(signature);
    }

    /**
     * <p>
     * Show usage of the DBUtility.
     * <p/>
     * 
     * @param msg
     *            The error message.
     */
    @Override
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("MemberAchievementUtility:\n");
        sErrorMsg
                .append("   The following parameters should be included in the XML or the command line besides connections setting");
        sErrorMsg.append("   -path : location of the SQL files.\n");
        fatal_error();
    }

    /**
     * <p>
     * Process validation of input parameters.
     * </p>
     */
    @Override
    protected void processParams() {
        super.processParams();
        
        if(params.contains("path")) {
            setUsageError("Please specify -path");
        }
    }
    
    
}
