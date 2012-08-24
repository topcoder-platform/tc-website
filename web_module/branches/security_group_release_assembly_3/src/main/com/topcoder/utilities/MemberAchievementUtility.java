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
 * <p>
 * Change log for version 1.1 (Release Assembly - TopCoder Achievement System
 * Update v1.0)
 * <ul>
 * <li>Add earn_date column</li>
 * <li>Many methods get re-factored.</li>
 * </ul>
 * </p>
 * 
 * @author leo_lol, TCSASSEMBLER
 * @version 1.1
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
    private static final String SQL_LOAD_ACHIEVEMENT_RULE = "SELECT user_achievement_rule_id, user_achievement_rule_sql_file, db_schema FROM user_achievement_rule WHERE is_automated = 't'";

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
     * @return A List of AchievementRuleRow records containing all achievement
     *         rule IDs, file names and DB Schemas.
     * @throws Exception
     */
    private List<AchievementRuleRow> loadAchievementRules() throws Exception {
        final String signature = CLASS_NAME + ".loadAchievementRule()";
        logEntrance(signature);
        final long start = logStart(signature);
        List<AchievementRuleRow> achievementRules = new ArrayList<AchievementRuleRow>();

        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            pst = prepareStatement(TCS_DW, SQL_LOAD_ACHIEVEMENT_RULE);

            logSQL(SQL_LOAD_ACHIEVEMENT_RULE);

            rs = pst.executeQuery();
            String basePath = getSQLFileBasePath();
            AchievementRuleRow row = null;
            while (rs.next()) {
                row = new AchievementRuleRow();
                row.setId(rs.getLong("user_achievement_rule_id"));
                row.setFileName(readSQLFile(basePath + rs.getString("user_achievement_rule_sql_file")));
                row.setDbSchema(rs.getString("db_schema"));
                achievementRules.add(row);
            }
            logExit(signature, achievementRules);
            logEnd(signature, start);
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
            throw new Exception("MemberAchievementUtility failed!\n" + e.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
        }
        return achievementRules;
    }

    /**
     * <p>
     * This method would return a collection of user_id that is qualified for
     * the given achievement rule.
     * </p>
     * 
     * @param rule
     *            the specified achievement rule
     * @param dbSchema
     *            The DB Schema this SQL would runs against.
     * @return a collection of user IDs.
     * @throws Exception
     *             If there is any error.
     */
    private Map<Long, Date> filterUser(String rule, String dbSchema) throws Exception {
        final String signature = CLASS_NAME + ".filterUser(String rule, String dbSchema)";
        logEntrance(signature, new String[]{"rule", "dbSchema"}, new String[]{rule, dbSchema});
        logSQL(rule);
        final long start = logStart(signature);
        Map<Long, Date> userIdDateMap = new HashMap<Long, Date>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            if (TCS_CATALOG.equals(dbSchema)) {
                pst = prepareStatement(TCS_CATALOG, rule);
            } else if (TCS_DW.equals(dbSchema)) {
                pst = prepareStatement(TCS_DW, rule);
            }

            rs = pst.executeQuery();
            while (rs.next()) {
                userIdDateMap.put(rs.getLong("user_id"), rs.getDate("earned_date"));
            }
            logEnd(signature, start);
            logUserInfo(userIdDateMap);
            return userIdDateMap;
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
        log.info("Enter " + signature);
        if (null != paraName) {
            log.info("Parameter{" + paraName + ":" + paramValue + "}");
        }
    }

    /**
     * <p>
     * This method would log the entrance of a method with multiple parameters.
     * </p>
     * 
     * @param signature
     *            Signature of the method.
     * @param paraNames
     *            Names of the parameter
     * @param paramValues
     *            values of the parameter
     */
    private void logEntrance(String signature, String[] paraNames, Object[] paramValues) {
        log.info("Enter " + signature);
        if (null != paraNames && null != paramValues && paraNames.length > 0 
                && paraNames.length == paramValues.length) {
            StringBuilder sb = new StringBuilder(100);
            sb.append("Parameter {");
            final int len = paraNames.length;
            for (int i = 0; i < len - 1; i++) {
                sb.append(paraNames[i]).append(":").append(paramValues[i]).append(", ");
            }
            sb.append(paraNames[len - 1]).append(":").append(paramValues[len - 1]).append("}");
            log.info(sb.toString());
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
        log.info("Enter " + signature);
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
        log.info("Exit " + signature + ".\n Returning " + ret);

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
        log.info("Exit " + signature);
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
        log.info("Executing: " + sql);
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
        log.info(signature + " starts at: " + DATE_FORMAT.format(new Date(start)));

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
        final long end = System.currentTimeMillis();
        log.info(signature + " ends at: " + DATE_FORMAT.format(new Date(end)) + ".\n It approximately costs "
                + (end - start) + " ms");

    }

    /**
     * <p>
     * This method logs a collection of user IDs that are being working on in
     * INFO level.
     * </p>
     * 
     * @param userIds
     *            a collection of user Id-Date map being logged down.
     */
    private void logUserInfo(Map<Long, Date> userIdDateMap) {
        if (null != userIdDateMap && !userIdDateMap.isEmpty()) {
            log.info("The following User ID(s) are involved: ");
            StringBuilder sb = new StringBuilder("{");
            int count = 0;
            for (Map.Entry<Long, Date> entry : userIdDateMap.entrySet()) {
                sb.append(entry.getKey()).append(":").append(DATE_FORMAT.format(entry.getValue())).append(", ");
                if ((++count) % 10 == 0) {
                    sb.append("\n");
                }
            }
            // remove the last unused comma
            if (sb.length() > 2) {
                if (sb.charAt(sb.length() - 1) == '\n' && sb.length() > 3) {
                    sb = sb.delete(sb.length() - 3, sb.length());
                } else {
                    sb = sb.delete(sb.length() - 2, sb.length());
                }
            }
            sb.append("}");
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
     *            represented by memberAchievementRuleId
     * @param memberAchievementRuleId
     *            The Id of the achievement gained by userIds.
     * @throws Exception
     *             If there is any error.
     */
    private void assignAchievements(Map<Long, Date> userIdDateMap, long memberAchievementRuleId) throws Exception {
        final String signature = CLASS_NAME + ".assignAchievements()";
        logEntrance(signature);
        logUserInfo(userIdDateMap);
        final long start = logStart(signature);

        if (null == userIdDateMap || userIdDateMap.size() == 0) {
            return;
        }

        PreparedStatement pst = null;
        PreparedStatement pstClean = null;

        try {

            List<Long> existingUserIds = findUserID(memberAchievementRuleId);
            logSQL(SQL_INSERT_ACHIEVEMENT);
            pst = prepareStatement(TCS_DW, SQL_INSERT_ACHIEVEMENT);
            for (Map.Entry<Long, Date> entry : userIdDateMap.entrySet()) {
                if (existingUserIds.contains(entry.getKey())) {
                    existingUserIds.remove(entry.getKey());
                    continue;
                }
                pst.setLong(1, entry.getKey());
                pst.setLong(2, memberAchievementRuleId);
                pst.setDate(3, entry.getValue());
                pst.executeUpdate();
            }

            logSQL(SQL_CLEAN_ACHIEVEMENT);
            pstClean = prepareStatement(TCS_DW, SQL_CLEAN_ACHIEVEMENT);
            for (long userId : existingUserIds) {
                pstClean.setLong(1, userId);
                pstClean.setLong(2, memberAchievementRuleId);
                pstClean.executeUpdate();
            }
            logExit(signature);
            logEnd(signature, start);
        } catch (BatchUpdateException e) {
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

        List<AchievementRuleRow> achievementRules = loadAchievementRules();

        long achievementRuleId = 0;
        Map<Long, Date> userIdDateMap = null;
        for (AchievementRuleRow row : achievementRules) {
            achievementRuleId = row.getId();
            userIdDateMap = filterUser(row.getFileName(), row.getDbSchema());
            assignAchievements(userIdDateMap, achievementRuleId);
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

        if (params.contains("path")) {
            setUsageError("Please specify -path");
        }
    }

}

/**
 * <p>
 * This class represents the achievement rule info.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> It's mutable and not thread safe.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
class AchievementRuleRow {
    /**
     * Id of the achievement.
     */
    private long id;

    /**
     * Achievement file name.
     */
    private String fileName;

    /**
     * DB Schema
     */
    private String dbSchema;

    /**
     * <p>
     * Getter of id field.
     * </p>
     * 
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Setter of id field.
     * </p>
     * 
     * @param id
     *            the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * <p>
     * Getter of fileName field.
     * </p>
     * 
     * @return the fileName
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * <p>
     * Setter of fileName field.
     * </p>
     * 
     * @param fileName
     *            the fileName to set
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * <p>
     * Getter of dbSchema field.
     * </p>
     * 
     * @return the dbSchema
     */
    public String getDbSchema() {
        return dbSchema;
    }

    /**
     * <p>
     * Setter of dbSchema field.
     * </p>
     * 
     * @param dbSchema
     *            the dbSchema to set
     */
    public void setDbSchema(String dbSchema) {
        this.dbSchema = dbSchema;
    }
}
