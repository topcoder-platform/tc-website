package com.topcoder.web.common.datafeed;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


/**
 * Data Feed based on ResultSetContainer.
 * 
 * @author Cucu
 *
 */
public class RSCDataFeed extends RSCBaseDataFeed {

    private CommandRunner commandRunner = null;
    private String query;
   
    /**
     * Create a Data Feed based on ResultSetContainer.
     * 
     * @param rootTag tag that wraps all the rsc rows.
     * @param rowTag tag for each row of the rsc.
     * @param cr CommandRunner to be executed for retrieving the ResultSetContainer
     * @param query name of the query that the ResultSetContainer uses.
     */
    public RSCDataFeed(String rootTag, String rowTag, CommandRunner cr, String query) {
        super(rootTag, rowTag);
        this.commandRunner = cr;
        this.query = query;
    }

    /**
     * Get a ResultSetContainer with the data of the query and commands specified in the constructor.
     */
    protected ResultSetContainer getRSC(ResultSetContainer.ResultSetRow parentRow) throws Exception{
        return (ResultSetContainer) commandRunner.getData().get(query);
    }
    
}
