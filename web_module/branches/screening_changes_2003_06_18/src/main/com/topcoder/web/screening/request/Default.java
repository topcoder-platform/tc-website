package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.Transaction;
import com.topcoder.web.ejb.session.Session;
import com.topcoder.web.ejb.session.SessionHome;
import com.topcoder.web.ejb.session.SessionSegment;
import com.topcoder.web.ejb.session.SessionSegmentHome;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.model.EmailInfo;
import com.topcoder.web.screening.model.SessionInfo;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.UserTransaction;
import java.sql.Timestamp;
import java.util.Map;

public class Default extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        setNextPage(Constants.DEFAULT_PAGE);
        setIsNextPageInContext(true);
    }
}
