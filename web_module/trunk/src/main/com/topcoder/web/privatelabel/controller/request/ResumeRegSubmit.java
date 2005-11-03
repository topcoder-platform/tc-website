package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.data.State;
import com.topcoder.common.web.data.Country;

import javax.transaction.TransactionManager;
import javax.transaction.Status;
import javax.rmi.PortableRemoteObject;
import java.util.Map;
import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public abstract class ResumeRegSubmit extends FullRegSubmit {


    //todo wack this crap when we have fixed the regular site to not use the transactional db for contact info
    //don't need to reimplement commit here at that point
    protected long commit(SimpleRegInfo regInfo) throws TCWebException {

        long userId = super.commit(regInfo);
        try {

            ResumeRegInfo info = (ResumeRegInfo) regInfo;
            if (info.hasResume()) {
                int fileType = -1;

                if (info.getResume().length == 0)
                    addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
                else {
                    //fileType = Integer.parseInt(file.getParameter("fileType"));
                    Map types = getFileTypes(transDb);
                    if (types.containsKey(info.getResumeContentType())) {
                        log.debug("FOUND TYPE");
                        fileType = ((Long) types.get(info.getResumeContentType())).intValue();
                    } else {
                        log.debug("DID NOT FIND TYPE " + info.getResumeContentType());
                    }
                    ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                    resumeServices.putResume(userId, fileType, info.getResumeFileName(), info.getResume(), transDb);
                }
            }

            if (((Coder) createEJB(getInitialContext(), Coder.class)).exists(userId, DBMS.OLTP_DATASOURCE_NAME)) {
                TransactionManager tm = null;
                try {
                    UserServicesHome userHome = (UserServicesHome) PortableRemoteObject.narrow(getInitialContext().lookup(
                                    UserServicesHome.class.getName()),
                                    UserServicesHome.class);

                    UserServices userEJB = userHome.findByPrimaryKey(new Long(userId));
                    com.topcoder.common.web.data.User u = userEJB.getUser();

                    u.setPassword(regInfo.getPassword());
                    CoderRegistration c = (CoderRegistration) u.getUserTypeDetails().get("Coder");
                    c.setFirstName(regInfo.getFirstName());
                    c.setLastName(regInfo.getLastName());
                    c.setMiddleName(regInfo.getMiddleName());
                    u.setEmail(regInfo.getEmail());
                    c.setHomeAddress1(regInfo.getAddress1());
                    c.setHomeAddress2(regInfo.getAddress2());
                    c.setHomeCity(regInfo.getCity());
                    State s = new State();
                    s.setStateCode(regInfo.getStateCode());
                    c.setHomeState(s);
                    c.setHomeZip(regInfo.getZip());
                    Country co = new Country();
                    co.setCountryCode(regInfo.getCountryCode());
                    c.setHomeCountry(co);
                    c.setModified("U");

                    u.getUserTypeDetails().put("Coder", c);

                    u.setModified("U");

                    tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                    tm.begin();
                    userEJB.setUser(u);
                    tm.commit();
                } catch (Exception e) {
                    try {
                        if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                            tm.rollback();
                        }
                    } catch (Exception te) {
                        throw new TCWebException(e);
                    }
                    throw new TCWebException(e);
                }
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        return userId;
    }

    protected abstract void handleActivation(SimpleRegInfo info, long userId) throws TCWebException;

}

