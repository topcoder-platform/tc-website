/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.web.common.ShortHibernateProcessor;

/**
 * <p></p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class EditTheme extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        setNextPage("/my_home/themePreference.jsp");
        setIsNextPageInContext(true);
    }
}
