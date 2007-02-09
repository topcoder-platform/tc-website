package com.topcoder.web.common.datafeed;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class RSCDataFeed extends RSCBaseDataFeed {

    private CommandRunner commandRunner = null;
    private String query;
        
    public RSCDataFeed(String rootTag, String rowTag, CommandRunner cr, String query) {
        super(rootTag, rowTag);
        this.commandRunner = cr;
        this.query = query;
    }

    protected ResultSetContainer getRSC(ResultSetContainer.ResultSetRow parentRow) throws Exception{
        return (ResultSetContainer) commandRunner.getData().get(query);
    }
    
}
