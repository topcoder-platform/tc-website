package com.topcoder.web.privatelabel.controller.request.amazon;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.VerizonRegInfo;
import com.topcoder.web.privatelabel.controller.request.FullReg;
import com.topcoder.web.common.TCWebException;

import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.*;
import com.topcoder.web.corp.Util;

/**
 * @author dok
 * Date: Jan 21, 2004
 */
public class Reg extends FullReg {

    protected void setNextPage() {
        setNextPage(Constants.AMAZON_REG_PAGE);
        setIsNextPageInContext(true);
    }
/*
    protected void registrationProcessing() throws TCWebException {
        try {
            if (getAuthentication().getUser().isAnonymous()) {
                 throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
            }

            TCSubject tcUser = Util.retrieveTCSubject(getAuthentication().getActiveUser().getId());
            Authorization authorization = new TCSAuthorization(tcUser);

            if (!authorization.hasPermission(new ClassResource(this.getClass()))) {
                //redirect
                throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
            }

            super.registrationProcessing();
        } catch (PermissionException pe) {
            throw pe;
        } catch (TCWebException we) {
            throw we;
        } catch(Exception e) {
            throw new TCWebException(e);
        }
    }
*/
    /**
     * we're really just lookin to add the population of the coder type
     * @return
     * @throws Exception
     */
    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        if (!(ret instanceof FullRegInfo)) {
            throw new TCWebException("hmm, we got a SimpleRegInfo object when it should have been Full");
        }
        //we have two "events", one for students, and one for pros.
        //conveniently, the event_id matches with the appropriate coder type id
        //we'll use that fact below, but it could be "fixed"
/*        if (ret.getEventId()==Constants.STUDENT) {
            ((FullRegInfo)ret).setCoderType(Constants.STUDENT);
        } else if (ret.getEventId()==Constants.PROFESSIONAL) {
            ((FullRegInfo)ret).setCoderType(Constants.PROFESSIONAL);
        } else {
            throw new TCWebException("hmm, we got an event id that does not map to a coder type");
        }
*/
        if (!hasError(Constants.COUNTRY_CODE)) {
            if (ret.getCountryCode() == null || ret.getCountryCode().length() == 0)
                ret.setCountryCode("840");
        }

        return ret;
    }


}
