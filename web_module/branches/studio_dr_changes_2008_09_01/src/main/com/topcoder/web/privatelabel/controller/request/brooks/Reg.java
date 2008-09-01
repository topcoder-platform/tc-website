package com.topcoder.web.privatelabel.controller.request.brooks;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullReg;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

/**
 * @author dok
 * Date: Jan 21, 2004
 */
public class Reg extends FullReg {

    protected void setNextPage() {
        setNextPage(Constants.BROOKS_REG_PAGE);
        setIsNextPageInContext(true);
    }

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
                ret.setCountryCode("356");
        }

        return ret;
    }


}
