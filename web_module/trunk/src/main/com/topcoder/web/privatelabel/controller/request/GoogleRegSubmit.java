package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.security.UserPrincipal;

public class GoogleRegSubmit extends FullRegSubmit {

    protected void setNextPage() {
        if (isEligible()) {
            setNextPage(Constants.GOOGLE_REG_SUCCESS_PAGE);
        } else {
            throw new RuntimeException("impossible, isEligible returned false, fix the code");
        }
        setIsNextPageInContext(true);
    }

    protected void handleActivation(SimpleRegInfo info, UserPrincipal newUser) throws TCWebException {
        try {
            User user = (User)createEJB(getInitialContext(), User.class);
            StringBuffer buf = new StringBuffer(1000);

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("TopCoder Google Activation");

            buf.append("wanna activate your account? click here:\n\n");
            buf.append("http://");
            buf.append(ApplicationServer.SERVER_NAME);
            SessionInfo sInfo = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            buf.append(sInfo.getServletPath());
            buf.append("?");
            buf.append(Constants.MODULE_KEY);
            buf.append("=");
            buf.append(Constants.GOOGLE_ACTIVATION);
            buf.append("&");
            buf.append(Activate.ACTIVATION_CODE);
            buf.append("=");
            buf.append(user.getActivationCode(newUser.getId(), db));
            buf.append("&");
            buf.append(Constants.COMPANY_ID);
            buf.append("=");
            buf.append(regInfo.getCompanyId());


            mail.setBody(buf.toString());
            mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            log.info("sent registration email to " + info.getEmail());
            EmailEngine.send(mail);


        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
