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
 * This is the home processor of Badge Administrator Tool.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public class BadgeAdminHome extends BaseBadgeProcessor {

    /**
     * This field represents the qualified name of this class.
     */
    private String CLASS_NAME = BadgeAdminHome.class.getName();

    /**
     * This method searches across database for the given handle in a fuzzy way.
     * 
     * @param handle
     *            partial handle to search.
     * @return An list of handles that matches the provided partial handle.
     * @throws Exception
     *             If there is any error.
     */
    private List<String> fuzzySearchHandles(String handle) throws Exception {
        final String SQL_QUERY_HANDLES_FUZZY = "SELECT handle FROM user WHERE handle_lower LIKE LOWER(?)";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<String> handles = null;

        try {
            conn = DBMS.getConnection(DBMS.COMMON_OLTP_DATASOURCE_NAME);
            pst = conn.prepareStatement(SQL_QUERY_HANDLES_FUZZY);
            pst.setString(1, "%" + handle + "%");
            rs = pst.executeQuery();
            handles = new ArrayList<String>();
            while (rs.next()) {
                handles.add(rs.getString("handle"));
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            log.error(e.getMessage(), e);
        } finally {
            DBMS.close(rs);
            DBMS.close(pst);
            DBMS.close(conn);
        }
        return handles;
    }

    /**
     * <p>
     * This method would perform main business logics.
     * </p>
     * 
     * @throws Exception
     *             if there is any DB interacting error.
     */
    @Override
    protected void businessProcessing() throws Exception {
        final String signature = CLASS_NAME + "#dbProcessing()";
        log.debug("Enter " + signature);

        if (!hasPermission()) {
            return;
        }

        // prepare to retrieve handle using fuzzy search.
        TCRequest request = getRequest();

        String handle = request.getParameter("handle");
        if (null != handle && 0 < handle.trim().length()) {
            List<String> foundHandles = fuzzySearchHandles(handle);
            request.setAttribute(BadgeAdminToolConstants.MATCHING_HANDLES_KEY, foundHandles);
        }

        setNextPage("/badgeAdminTool/home.jsp");
        setIsNextPageInContext(true);

        log.debug("Exit " + signature);
    }
}
