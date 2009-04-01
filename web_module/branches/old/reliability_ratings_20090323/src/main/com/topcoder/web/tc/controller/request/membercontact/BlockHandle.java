package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * This method is called when the user requests a handle to be blocked.
 * It looks up the id for the handle, and if not found lefts the attribute as null.
 * Despite his name, it doesn't do the actual blocking of the handle.
 *
 * @author cucu
 *
 */
public class BlockHandle extends ShortHibernateProcessor {

    public static final String HANDLE = "handle";
    public static final String ID = "id";

    protected void dbProcessing() throws Exception {
        String handle = getRequest().getParameter(HANDLE);
        User blockUser  = DAOUtil.getFactory().getUserDAO().find(handle, true, true);

        if (blockUser != null && blockUser.getCoder() != null) {
            getRequest().setAttribute(ID, blockUser.getId());
            getRequest().setAttribute(HANDLE, blockUser.getHandle());
        } else {
            getRequest().setAttribute(HANDLE, handle);
        }
        setNextPage(Constants.BLOCK_HANDLE);
        setIsNextPageInContext(true);
    }

}
