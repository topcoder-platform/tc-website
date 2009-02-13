/*
 * Created on Jul 12, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author mtong
 *         <p/>
 *         Forwards to the TopCoder Forums change log. Currently restricted to admins.
 */
public class ChangeLog extends ForumsProcessor {
    protected static Logger log = Logger.getLogger(BaseProcessor.class);

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        if (!ForumsUtil.isAdmin(user)) {
            setNextPage("?module=Main");
            setIsNextPageInContext(false);
            return;
        }

        setNextPage("/changelog.jsp");
        setIsNextPageInContext(true);
    }
}