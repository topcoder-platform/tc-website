/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * <p>A processor for the requests for update the details for the quote/banner for current user profile.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class SaveMemberProfileQuoteBannerSettings extends BaseProcessor {

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for getting the total earnings for member
     * profile.</p>
     */
    private static final String UPDATE_QUOTE_BANNER_SQL
        = "UPDATE coder SET display_quote = ?, quote_location = ?, quote_color = ?, display_banner = ?, " +
          "       banner_style = ?, quote = ? WHERE coder_id = ?";

    /**
     * <p>Constructs new <code>SaveMemberProfileQuoteBannerSettings</code> instance. This implementation does
     * nothing.</p>
     */
    public SaveMemberProfileQuoteBannerSettings() {
    }

    /**
     * <p>Handles the incoming request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void businessProcessing() throws Exception {
        String displayQuote = getRequest().getParameter("isDisplayQuote");
        String quoteText = getRequest().getParameter("quoteTxt");
        String quoteLocation = getRequest().getParameter("quoteLocation");
        String quoteColor = getRequest().getParameter("quoteTextColorSelect");
        String displayBanner = getRequest().getParameter("isDisplayBanner");
        String bannerStyle = getRequest().getParameter("bannerStyle");
        String yVal = getRequest().getParameter("yVal");
        String xVal = getRequest().getParameter("xVal");
        long currentUserId = getUser().getId();

        PreparedStatement stmt = null;
        Connection connOltp = null;
        try {
            connOltp = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
            stmt = connOltp.prepareStatement(UPDATE_QUOTE_BANNER_SQL);
            stmt.setInt(1, "1".equals(displayQuote) ? 1 : 0);
            if ("ct".equals(quoteLocation)) {
                stmt.setString(2, quoteLocation + " " + xVal + " " + yVal);
            } else {
                stmt.setString(2, quoteLocation);
            }
            stmt.setString(3, quoteColor);
            stmt.setInt(4, "1".equals(displayBanner) ? 1 : 0);
            stmt.setString(5, bannerStyle);
            stmt.setString(6, quoteText);
            stmt.setLong(7, currentUserId);
            int updateCount = stmt.executeUpdate();
            if (updateCount != 1) {
                throw new MemberNotFoundException(String.valueOf(currentUserId));
            } else {
                setNextPage("/memberProfileQuoteBannerSaved.jsp");
                setIsNextPageInContext(true);
            }
        } finally {
            ViewMemberProfile.close(stmt);
            ViewMemberProfile.close(connOltp);
        }
    }
}
