package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.BaseProcessor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
abstract class Base extends BaseProcessor {


    protected void businessProcessing() throws Exception {
        registrationProcessing();
    }

    abstract protected void registrationProcessing() throws Exception;
}
