package com.topcoder.web.screening.request;

import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.model.ProblemInfo;

public class PopulateProblemDetail extends BaseProcessor {
    private Request problemDetail;

    public PopulateProblemDetail() {
        problemDetail = new Request();
        problemDetail.setProperty(DataAccessConstants.COMMAND,
                Constants.PROBLEM_DETAIL_COMMAND);
    }

    public void process() throws Exception {
        ServletRequest request = getRequest();
        String problemId = request.getParameter(Constants.PROBLEM_ID);
        if(problemId == null) {
            throw new ScreeningException("Problem ID not set");
        }
        ProblemInfo info = new ProblemInfo();
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(Constants.DATA_SOURCE),
                                        DataSource.class);
        DataAccess dAccess = new DataAccess(ds);

        problemDetail.setProperty("pid", problemId);
        Map map = dAccess.getData(problemDetail);
        if(map != null) {
            //set stuff
            ResultSetContainer rsc = (ResultSetContainer)
                        map.get(Constants.PROBLEM_INFO_QUERY_KEY);
        }

        request.setAttribute(Constants.PROBLEM_INFO, info);
        setNextPage(Constants.PROBLEM_DETAIL_PAGE);
        setNextPageInContext(true);
    }
}
