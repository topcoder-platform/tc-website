package com.topcoder.web.email.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.servlet.EmailConstants;
import com.topcoder.web.email.servlet.TaskRouter;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.Serializable;

/**
 * Task bean to collect login information
 *
 * @author    Eric Ellingson
 * @version   1.0
 *
 */

public class LoginTask
        implements Task, Serializable {
    private static Logger log = Logger.getLogger(LoginTask.class);

    public TaskRouter perform(HttpServlet servlet,
                              HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException, ServletException {
        // redirect to the main menu
        return new TaskRouter(EmailConstants.LOGIN_PAGE);
    }
}
