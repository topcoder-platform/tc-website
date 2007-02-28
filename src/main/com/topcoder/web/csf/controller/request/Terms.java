package com.topcoder.web.csf.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.csf.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public class Terms extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        log.debug("start");
        Integer termsId = new Integer(StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID)));
        log.debug("1");
        TermsOfUse terms = DAOUtil.getFactory().getTermsOfUse().find(termsId);
        log.debug("2");
        getResponse().setStatus(200);
        log.debug("3");
        getResponse().setContentType("text/html");
        log.debug("4");
        getResponse().getWriter().print(terms.getText());
        log.debug("5");
        getResponse().flushBuffer();
        log.debug("6");
    }
}
