package com.topcoder.web.screening.request;

import java.util.Map;
import java.util.HashMap;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class BuildCandidateList extends BaseProcessor {
    private static final String QUERY_KEY = "candidateList"; //move to constants
    private static final String DATA_SOURCE = "OLTP_SCREENING"; //move to constants
    private static final String FORWARD_URL = "/candidate/candidateList.jsp"; //move to constants

    private Request dataRequest;
    
    public BuildCandidateList()
    {
        dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, QUERY_KEY);

    }

    public void process() throws Exception {

        /*
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup("some ds"), 
                                        DataSource.class);
        Connection con = ds.getConnection();
        PreparedStatement statement = 
            con.prepareStatement(shouldbeindao);

        //get results and add it to the 
        ResultSet rs = statement.executeQuery();
        result = new ResultSetContainer(rs);
        */

        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(DATA_SOURCE),
                                        DataSource.class);
        DataAccess dAccess = new DataAccess(ds);
        Map map = dAccess.getData(dataRequest);

        if(map != null && map.size() == 1)
        {
            ResultSetContainer result = (ResultSetContainer)map.get(QUERY_KEY);
            ServletRequest request = getRequest();
            request.setAttribute("list", result);
        }

        setNextPage(FORWARD_URL);
        setNextPageInContext(true);
    }
}
