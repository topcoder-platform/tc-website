package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.*;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

import java.util.List;

/**
 * Finds an user to reset his password.
 * If zero or more than one users are found with the provided data, it goes back to the recover password page and
 * asks for more data.
 * If exactly one user is found, it redirects to secret question if he doesn't use his registered address anymore
 * or to RecoverEmail processor if he does.
 *
 * @author cucu
 */
public class FindUser extends ShortHibernateProcessor {

    public static final String LOST_EMAIL = "le";
    public static final String GOOD_EMAIL = "ge";
    public static final String NEEDS_HANDLE = "nh";
    public static final String SECRET_QUESTION = "sq";
    public static final String HAS_MAIL_ACCESS = "ma";
    public static final String ERROR_HANDLE = "errha";
    public static final String ERROR_INFO = "errin";


    protected void dbProcessing() throws TCWebException {
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));
        String firstName = StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME));
        String lastName = StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME));
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));
        boolean hasMailAccess = "true".equals(getRequest().getParameter(HAS_MAIL_ACCESS));

        User user = null;

        if ("".equals(handle) && "".equals(firstName) && "".equals(lastName) && "".equals(email)) {
            addError(ERROR_HANDLE, "You must fill in at least one field to search on");
        } else {
            if (handle.length() > 0) {
                user = DAOUtil.getFactory().getUserDAO().find(handle, true, false);
                if (user == null) {
                    addError(ERROR_HANDLE, "Username not found");
                }
            } else {
                List l = DAOUtil.getFactory().getUserDAO().find(handle, firstName, lastName, email);

                if (l.size() == 0) {
                    addError(ERROR_INFO, "No user was found with that information");
                } else if (l.size() > 1) {
                    addError(ERROR_INFO, "More than one user found.");
                    addError(ERROR_INFO, "Please provide additional information.");
                } else {
                    user = (User) l.get(0);
                }
            }
        }


        if (!hasMailAccess && user != null && user.getSecretQuestion() == null) {
            addError(ERROR_INFO, "You don't have a secret question. ");
            addError(ERROR_INFO, "Password recovery is not possible.");
        }

        if (hasErrors()) {
            setDefault(Constants.HANDLE, handle);
            setDefault(Constants.FIRST_NAME, firstName);
            setDefault(Constants.LAST_NAME, lastName);
            setDefault(Constants.EMAIL, email);
            getRequest().setAttribute(HAS_MAIL_ACCESS, String.valueOf(hasMailAccess));

            setNextPage(Constants.RECOVER_PASSWORD);
            setIsNextPageInContext(true);
            return;
        }

        if (hasMailAccess) {
            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=RecoverEmail&"
                    + Constants.CODER_ID + "=" + user.getId());

            setIsNextPageInContext(false);

        } else {
            getRequest().setAttribute(SECRET_QUESTION, StringUtils.htmlEncode(user.getSecretQuestion().getQuestion()));
            getRequest().setAttribute(Constants.CODER_ID, user.getId().toString());
            setNextPage(Constants.SECRET_QUESTION);
            setIsNextPageInContext(true);
        }
    }


}
