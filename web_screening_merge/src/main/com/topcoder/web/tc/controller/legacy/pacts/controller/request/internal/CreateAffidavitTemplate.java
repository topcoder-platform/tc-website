package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 11, 2005
 */
public class CreateAffidavitTemplate extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {

        //get affidavit text
        //get affidavit type

        try {
            setNextPage(INTERNAL_CREATE_AFFIDAVIT);
            setIsNextPageInContext(true);

            if (!StringUtils.checkNull(getRequest().getParameter(AFFIDAVIT_TEXT)).equals("") &&
                    !StringUtils.checkNull(getRequest().getParameter(AFFIDAVIT_TYPE_ID)).trim().equals("")) {
                DataInterfaceBean bean = new DataInterfaceBean();
                bean.createAffidavitTemplate(Integer.parseInt(getRequest().getParameter(AFFIDAVIT_TYPE_ID)),
                        getRequest().getParameter(AFFIDAVIT_TEXT));
                addError(AFFIDAVIT_TEXT, "Success");
            } else {
                addError(AFFIDAVIT_TEXT, "Text must not be null and you must select an affidavit type");
            }
        } catch (NumberFormatException e) {
            addError(AFFIDAVIT_TEXT, "Please select an affidavit type");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
