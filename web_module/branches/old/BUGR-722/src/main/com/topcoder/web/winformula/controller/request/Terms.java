package com.topcoder.web.winformula.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.winformula.Constants;

/**
 * @author dok
 * @version $Revision: 72012 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public class Terms extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        Integer termsId = new Integer(StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID)));
        TermsOfUse terms = DAOUtil.getFactory().getTermsOfUse().find(termsId);
        getResponse().setStatus(200);
        getResponse().setContentType("text/html");
        getResponse().getWriter().print(terms.getText());
        getResponse().flushBuffer();
    }
}
