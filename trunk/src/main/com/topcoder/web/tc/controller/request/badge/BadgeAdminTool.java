/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.badge;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCRequest;

/**
 * <p>
 * This class would retrieve all badges earned by a given handle.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> It's mutable and not thread safe.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public class BadgeAdminTool extends BaseBadgeProcessor {

    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = BadgeAdminTool.class.getName();

    /**
     * SQL to query badges.
     */
    private static final String SQL_QUERY_BADGE = "SELECT uax.user_achievement_rule_id AS achievement_id, uax.create_date AS earned_date, "
            + "uar.user_achievement_name AS achievement_name, uar.is_automated AS is_automated, "
            + "uat.user_achievement_type_desc AS achievement_type_desc "
            + "FROM user_achievement_xref AS uax "
            + "JOIN user_achievement_rule AS uar ON uar.user_achievement_rule_id = uax.user_achievement_rule_id "
            + "JOIN user_achievement_type_lu AS uat ON uar.user_achievement_type_id = uat.user_achievement_type_id "
            + "WHERE uax.user_id = ?";

    /**
     * <p>
     * This method would grabs all badges from tcs_dw:user_achievement_xref
     * table.
     * </p>
     */
    @Override
    protected void businessProcessing() throws Exception {
        final String signature = CLASS_NAME + "#dbProcessing()";
        log.debug("Enter " + signature);
        
        if(!hasPermission()) {
            return;
        }

        TCRequest request = getRequest();
        String handle = request.getParameter("handle");
        if (null == handle || handle.trim().length() == 0) {
            setNextPage("/tc?" + BadgeAdminToolConstants.MODULE_KEY + "=BadgeAdminHome");
            setIsNextPageInContext(true);
            return;
        }
        long userId = retrieveUserId(handle);
        request.setAttribute("handle", handle);
        request.setAttribute("userId", userId);
        
        List<BadgeDTO> badges = retrieveBadges(userId);
        request.setAttribute(BadgeAdminToolConstants.EARNED_BADGES_KEY, badges);
        setNextPage("/badgeAdminTool/tool.jsp");
        setIsNextPageInContext(true);

        log.debug("Exit " + signature);
    }

    /**
     * This method would retrieve all badges/achievements earned by the given
     * handle.
     * 
     * @param handle
     *            whose badges to query.
     * @return A list of {@link BadgeDTO} that are earned.
     * @throws Exception
     *             If there is any error.
     */
    private List<BadgeDTO> retrieveBadges(long userId) throws Exception {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<BadgeDTO> badges = null;
        try {
            conn = DBMS.getConnection(DBMS.TCS_DW_DATASOURCE_NAME);
            pst = conn.prepareStatement(SQL_QUERY_BADGE);
            pst.setLong(1, userId);
            rs = pst.executeQuery();
            badges = new ArrayList<BadgeDTO>();
            while (rs.next()) {
                BadgeDTO badge = new BadgeDTO();
                badge.setAchievementId(rs.getLong("achievement_id"));
                badge.setAchievementName(rs.getString("achievement_name"));
                badge.setAchievementType(rs.getString("achievement_type_desc"));
                badge.setEarnedDate(rs.getDate("earned_date"));
                badges.add(badge);
            }
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
            DBMS.printException(e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
            DBMS.close(conn);
        }
        return badges;
    }
}
