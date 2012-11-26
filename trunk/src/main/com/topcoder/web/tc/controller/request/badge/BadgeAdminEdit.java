/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.badge;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCRequest;

/**
 * <p>
 * This processor would be used to manually assign badges to a given handle.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public class BadgeAdminEdit extends BaseBadgeProcessor {

    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = BadgeAdminEdit.class.getName();

    /**
     * SQL to query achievement rule IDs that could be edited.
     */
    private static final String SQL_QUERY_EDITABLE_RULE_IDS = "SELECT user_achievement_rule_id as rule_id FROM user_achievement_rule "
            + "WHERE is_automated = 'f'";

    /**
     * SQL to query existing earned achievements.
     */
    private static final String SQL_QUERY_EXISTING_ACHIEVEMENT_ID = "SELECT user_achievement_rule_id AS rule_id FROM user_achievement_xref WHERE user_id = ?";

    /**
     * SQL to manually assign achievement;
     */
    private static final String SQL_ASSIGN_ACHIEVEMENT = "INSERT INTO user_achievement_xref(user_id, user_achievement_rule_id, create_date, auto_loaded) VALUES (?, ?, ?, 'f')";

    /**
     * SQL to manually remove achievement badges;
     */
    private static final String SQL_REMOVE_ACHIEVEMENT = "DELETE FROM user_achievement_xref WHERE user_id = ? AND user_achievement_rule_id = ?";

    /**
     * <p>
     * This method overrides logics from super class.
     * </p>
     * 
     * @throws Exception
     *             if there is any
     */
    @Override
    protected void businessProcessing() throws Exception {
        final String signature = CLASS_NAME + "#businessProcessing()";
        log.debug("Enter " + signature);

        if (!hasPermission()) {
            return;
        }

        TCRequest request = getRequest();

        String handle = request.getParameter("handle");
        if (null == handle || handle.trim().length() == 0) {
            addError(ERRORS_KEY, "Handle is required");
            return;
        }

        String[] ruleIdsInString = request.getParameterValues(BadgeAdminToolConstants.RULE_ID_KEY);

        if (null != ruleIdsInString && ruleIdsInString.length > 0) {
            Long[] ruleIds = new Long[ruleIdsInString.length];
            for (int i = 0; i < ruleIds.length; i++) {
                ruleIds[i] = Long.parseLong(ruleIdsInString[i].trim());
            }

            List<Long> editableIds = retrieveEditableRuleIds();

            if (!validateAchievementRulesEditable(ruleIds, editableIds)) {
                addError(ERRORS_KEY, "Achievement rules attempted to assign must be editable");
            }

            long userId = retrieveUserId(handle);

            List<Long> earnedAchievementIds = retrieveEarnedBadgeIds(userId);

            for (int i = 0; i < ruleIds.length; i++) {
                if (null != ruleIds[i] && null != earnedAchievementIds && earnedAchievementIds.contains(ruleIds[i])) {
                    earnedAchievementIds.remove(ruleIds[i]);
                    ruleIds[i] = null;
                }
            }

            assignBadge(ruleIds, userId, editableIds);

            removeBadge(earnedAchievementIds, userId, editableIds);

            setNextPage("/tc?" + BadgeAdminToolConstants.MODULE_KEY + "=BadgeAdminTool&handle=" + handle);
            setIsNextPageInContext(true);
        } else {
            addError(ERRORS_KEY, "Rule IDs to assign are required");
        }
        log.debug("Exit " + signature);
    }

    /**
     * This method checks if the given array of rules may be manually assigned.
     * 
     * @param ruleIds
     *            IDs of rules to check.
     * @param editableIds
     *            List of edit-able IDs.
     * @return true if and only if all of them could be manually assigned; false
     *         otherwise.
     * @throws Exception
     *             if there is any error.
     */
    private boolean validateAchievementRulesEditable(Long[] ruleIds, List<Long> editableIds) throws Exception {
        if (null == ruleIds || ruleIds.length == 0) {
            return false;
        }
        boolean allEditable = true;
        for (Long id : ruleIds) {
            if (!editableIds.contains(id)) {
                allEditable = false;
            }
        }
        return allEditable;
    }

    /**
     * This method retrieves all manually assignable rule IDs.
     * 
     * @return a List of assignable rule IDs.
     * @throws Exception
     *             if there is any error.
     */
    private List<Long> retrieveEditableRuleIds() throws Exception {
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(DBMS.TCS_DW_DATASOURCE_NAME);
            st = conn.createStatement();
            rs = st.executeQuery(SQL_QUERY_EDITABLE_RULE_IDS);
            List<Long> editableIds = new ArrayList<Long>();
            while (rs.next()) {
                editableIds.add(rs.getLong("rule_id"));
            }

            return editableIds;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            log.error(e.getMessage(), e);
        } finally {
            DBMS.close(rs);
            DBMS.close(st);
            DBMS.close(conn);
        }
        return null;
    }

    /**
     * This method returns a {@link List} of IDs that the provided user has
     * already earned.
     * 
     * @param userId
     * @return A list of earned badge ID.
     */
    private List<Long> retrieveEarnedBadgeIds(long userId) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<Long> earnedAchievementIds = null;
        try {
            conn = DBMS.getConnection(DBMS.TCS_DW_DATASOURCE_NAME);
            pst = conn.prepareStatement(SQL_QUERY_EXISTING_ACHIEVEMENT_ID);
            pst.setLong(1, userId);
            rs = pst.executeQuery();

            earnedAchievementIds = new ArrayList<Long>();

            while (rs.next()) {
                earnedAchievementIds.add(rs.getLong("rule_id"));
            }
            return earnedAchievementIds;
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            log.error(e.getMessage(), e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
            DBMS.close(conn);
        }
        return null;
    }

    /**
     * This method would assign achievement to the user. Note we do NOT use
     * batch operation here because tcs_dw is not log-enabled.
     * 
     * @param ruleIds
     *            User achievement rule IDs. This parameter may contain many
     *            null elements.
     * @param userId
     *            the user ID.
     * @param editableIds
     *            List of edit-able IDs.
     * @throws Exception
     *             If there is any error.
     */
    private void assignBadge(Long[] ruleIds, long userId, List<Long> editableIds) throws Exception {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(DBMS.TCS_DW_DATASOURCE_NAME);
            pst = conn.prepareStatement(SQL_ASSIGN_ACHIEVEMENT);
            Date date = new Date(System.currentTimeMillis());
            for (int i = 0; i < ruleIds.length; i++) {
                if (null != ruleIds[i] && editableIds.contains(ruleIds[i])) {
                    pst.setLong(1, userId);
                    pst.setLong(2, ruleIds[i]);
                    pst.setDate(3, date);
                    pst.executeUpdate();
                }
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            log.error(e.getMessage(), e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
            DBMS.close(conn);
        }
    }

    /**
     * This method would assign achievement to the user. Note we do NOT use
     * batch operation here because tcs_dw is not log-enabled.
     * 
     * @param ruleIds
     *            User achievement rule IDs. This parameter may contain many
     *            null elements.
     * @param userId
     *            the user ID.
     * @param editableIds
     *            List of edit-able IDs.
     * @throws Exception
     *             If there is any error.
     */
    private void removeBadge(List<Long> ruleIds, long userId, List<Long> editableIds) throws Exception {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(DBMS.TCS_DW_DATASOURCE_NAME);
            pst = conn.prepareStatement(SQL_REMOVE_ACHIEVEMENT);
            for (Long ruleId : ruleIds) {
                if (editableIds.contains(ruleId)) {
                    pst.setLong(1, userId);
                    pst.setLong(2, ruleId);
                    pst.executeUpdate();
                }
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            log.error(e.getMessage(), e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
            DBMS.close(conn);
        }
    }
}
