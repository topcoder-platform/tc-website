package com.topcoder.web.privatelabel.controller.request.dcreg;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.controller.request.FullReg;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * Date: Jan 21, 2004
 */
public class Reg extends FullReg {

    protected void setNextPage() {
        setNextPage(Constants.DC_REG_PAGE);
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
        if (hasRequestParameter(Constants.CODER_TYPE)) {
            String sCoderType = getRequestParameter(Constants.CODER_TYPE);
            ((FullRegInfo)ret).setCoderType(Integer.parseInt(sCoderType == null ? "-1" : sCoderType));
        }

        return ret;
    }

    /**
     * override to extend so that it checks to make sure we are checking for coder_type to
     * be included in the request
     * @param info
     * @throws TCWebException
     */
    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);
        FullRegInfo fullInfo = (FullRegInfo)info;
        if (!(fullInfo.getCoderType()==Constants.STUDENT || fullInfo.getCoderType()==Constants.PROFESSIONAL)) {
            throw new TCWebException("invalid request, didn't include coder_type_id");
        }

    }

}
