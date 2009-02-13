/*
 * Created on July 5, 2006
 */
package com.topcoder.web.forums.controller.request.winformula;

import com.jivesoftware.forum.RatingManager;
import com.jivesoftware.forum.RatingManagerFactory;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.controller.request.ForumsProcessor;

/**
 * @author mtong
 *         <p/>
 *         Administrative tool providing utilities not included in Jive.
 */
public class Admin extends ForumsProcessor {
    protected static Logger log = Logger.getLogger(BaseProcessor.class);

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        if (!ForumsUtil.isAdmin(user)) {
            setNextPage(getSessionInfo().getServletPath() + "?module=Main");
            setIsNextPageInContext(false);
            return;
        }

        log.info(user.getUsername() + " has accessed the admin tool.");

        // process command
        String command = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ADMIN_COMMAND));
        if (!command.equals("")) {
            log.info(user.getUsername() + " running command: " + command);
        }

        if (command.equals(ForumConstants.ADMIN_ENABLE_RATINGS)) {
            RatingManager ratingManager = RatingManagerFactory.getInstance(authToken);
            if (!ratingManager.isRatingsEnabled()) {
                ratingManager.setRatingsEnabled(true);
            }
            if (ratingManager.getRatingFromScore(1) == null) {
                ratingManager.createRating(1, "negative");
            }
            if (ratingManager.getRatingFromScore(2) == null) {
                ratingManager.createRating(2, "positive");
            }
        }

        setNextPage("/admin.jsp");
        setIsNextPageInContext(true);
    }
}