package com.topcoder.shared.dataAccess;

import java.util.*;
import java.math.*;
import java.rmi.*;
import java.sql.*;
import java.text.*;
import javax.sql.DataSource;
import javax.naming.Context;
import com.topcoder.shared.util.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.TCResourceBundle;

/** 
 * 
 * The class which handles the retrieving of data.
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.5  2002/05/09 03:19:22  steveb
 *           SB -- added check for STRING data type
 *
 *           Revision 1.4  2002/04/03 21:38:41  apps
 *           no message
 *
 *           Revision 1.3  2002/04/03 16:27:17  steveb
 *           SB -- changed name of default data source
 *
 *           Revision 1.2  2002/04/03 04:14:48  steveb
 *           SB configured to allow connections to different DataSources
 *
 *           Revision 1.1.2.2  2002/04/01 22:43:10  apps
 *           SB altered to fix bean structure
 *
 *           Revision 1.1.2.1  2002/04/01 18:00:38  apps
 *           SB  added stat directory for Statistics ejb and related common classes
 *
 *           Revision 1.1.2.2  2002/03/19 01:22:45  gpaul
 *           changed query_input to query_input_xref
 *
 *           Revision 1.1.2.1  2002/03/16 20:18:54  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.4  2002/03/12 06:25:25  dpecora
 *           Remove time dependency in queries
 *
 *           Revision 1.3  2002/03/12 06:05:21  dpecora
 *           Fix any exceptions caused by null database values
 *
 *           Revision 1.2  2002/03/06 11:31:54  dpecora
 *           - Add nr parameter support
 *
 *           Revision 1.1  2002/03/05 16:14:37  dpecora
 *           - Renamed and relocated EJB
 *           - Query mods to fix up stuff broken by iron_man changes
 *
 *           Revision 1.14  2002/02/27 10:35:25  dpecora
 *           A number of changes:
 *           - Added support for required input arguments to default input queries
 *           - Added support for data sorting prior to row selection
 *           - Removed exception printout from data retrieval bean; it was a duplicate
 *           of the EJB exception printout info
 *           - Added scrolling by room for round statistics
 *           - Various other query modifications
 *
 *           Revision 1.13  2002/02/19 07:12:53  dpecora
 *           Add sort functionality driven from URL
 *
 *           Revision 1.12  2002/02/13 08:35:22  dpecora
 *           Add javadocs, implement ranklists
 *
 *           Revision 1.11  2002/02/12 03:41:56  dpecora
 *           IR replies, add a space into the ejb exception for "query info
 *           missing from DB"
 *
 *           Revision 1.10  2002/02/11 23:40:37  dpecora
 *           *** empty log message ***
 *
 *           Revision 1.9  2002/02/11 11:13:26  dpecora
 *           Change ejb to use command descriptions instead of command id as input,
 *           rework some of the queries
 *
 *           Revision 1.8  2002/02/08 22:34:58  dpecora
 *           Get rid of EJB exceptions, better exception messaging if a problem does
 *           occur, move Conversion.makePretty into StringUtilities
 *
 *           Revision 1.7  2002/02/07 10:28:31  dpecora
 *           Minor bug fixes
 *
 *           Revision 1.6  2002/02/06 12:31:17  dpecora
 *           A couple minor fixes
 *
 *           Revision 1.5  2002/02/06 11:58:29  dpecora
 *           Got the EJB running successfully.  Also updated the scripts to put the
 *           data in the various query tables, in response to various table structure
 *           changes and column renaming.
 *
 *           Revision 1.4  2002/02/06 05:43:23  tbone
 *           my bad, dummy me forgot about rmic
 *
 *           Revision 1.3  2002/02/06 04:19:53  tbone
 *           made a change to the interfacing, making implementation a runtime choice
 *
 * @author  Dave Pecora
 * @see     ResultSetContainer
 */

public class DataRetriever implements DataRetrieverInt {
    private static final boolean VERBOSE = true;
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    /* Keeps track of the most recent query run, for exception handling purposes */
    private StringBuffer query;
    private final static String DEFAULT_DATA_SOURCE = "DW";
    private TCResourceBundle dataBundle = new TCResourceBundle("DataAccess");

    public DataRetriever(Connection conn) {
      this.conn = conn;
    }

    private void closeObject(Object o) {
        if (o == null) 
            return;
        try {
            if (o instanceof ResultSet)
                ((ResultSet)o).close();
            else if (o instanceof PreparedStatement)
                ((PreparedStatement)o).close();
            else if (o instanceof Connection)
                ((Connection)o).close();
        } catch (Exception e) {
            try {
                System.out.println( "Statistics EJB:  Error closing " + o.getClass());
                System.out.println( e.getMessage());
            } catch (Exception ex) {}
        }
    }

    private void closeConnections() {
        closeObject(rs);
        closeObject(ps);
        closeObject(conn);
        rs = null;
        ps = null;
        conn = null;
    }

    private void handleException(Exception e, String lastQuery, Map inputs) {
        try {
            System.out.println( "Statistics EJB: Exception caught: " + e.toString());
            System.out.println( "The last query run was: ");
            System.out.println( lastQuery);
            System.out.println( "Function inputs were: ");
            Iterator i = inputs.keySet().iterator();
            while (i.hasNext()) {
                String key = (String)i.next();
                String value = (String)inputs.get(key);
                System.out.println( "Input code: " + key + " --- Input value: " + value);
            }
            System.out.println( "Exception details:");
            if (e instanceof SQLException)
                DBMS.printSqlException(true, (SQLException)e);
            else
                e.printStackTrace();
        } catch (Exception ex) {}
        closeConnections();
    }

    /**
     * In addition to checking correctness of the input, we're also preventing
     * a clever user who knows how this system works from embedding SQL in the 
     * input.  If we ever need to add string input support at a later time, this
     * should be explicitly checked for.
     */
    private boolean validateInput(String input, int dataType) {
        if (dataType == dataBundle.getIntProperty("INTEGER_INPUT", 1001)) {
            try {
                BigInteger b = new BigInteger(input);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else if (dataType == dataBundle.getIntProperty("DECIMAL_INPUT", 1002)) {
            try {
                BigDecimal b = new BigDecimal(input);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else if (dataType == dataBundle.getIntProperty("DATE_INPUT", 1003)) {
            try {
                // Check that what we have first in the string is a valid date,
                // in the expected yyyy-mm-dd format.
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                sdf.setLenient(false);
                ParsePosition pp = new ParsePosition(0);
                java.util.Date dt = sdf.parse(input, pp);

                // Check for the presence of unwanted stuff after it
                if (pp.getIndex() < input.length())
                    return false;

                // Passed checks OK
                return true;
            } catch (Exception e) {
                return false;
            }
        } else if (dataType == dataBundle.getIntProperty("STRING_INPUT", 1005)) {
            try {
                // Check position of reserved characters
                int inputDelimiterPos = input.indexOf ( dataBundle.getProperty("INPUT_DELIMITER", "@") );
                int defaultMarkerPos = input.indexOf ( dataBundle.getProperty("SPECIAL_DEFAULT_MARKER", "$") );
                // Check for the presence of unwanted stuff
                if ( inputDelimiterPos > -1 || defaultMarkerPos > -1 )
                    return false;

                // Passed checks OK
                return true;
            } catch (Exception e) {
                return false;
            }
        } else if (dataType == dataBundle.getIntProperty("SORT_DIRECTION_INPUT", 1004)) {
            String s = input.trim().toUpperCase();
            return (s.equals("ASC") || s.equals("DESC"));
        }
        
        // Unknown input type!
        return false;
    }

    private String runDefaultInputQuery(String defaultQueryId, Map inputs) throws Exception {
        // Before running, check to see if this special query has already been 
        // run this time around.
        String input = (String)inputs.get(defaultQueryId);
        if (input != null)
            return input;

        int specialQueryId = Integer.parseInt(defaultQueryId.substring(1));

        query = new StringBuffer(300);
        query.append("SELECT text FROM query WHERE query_id=");
        query.append(specialQueryId);
        ps = conn.prepareStatement(query.toString());
        rs = ps.executeQuery();
        if (!rs.next())
            throw new Exception("Query text for query ID " + specialQueryId + " missing from DB");
        String specialQuery = DBMS.getTextString(rs, 1);
        rs.close();
        rs = null;
        ps.close();
        ps = null;

        int i,j;
        // For default input queries, all inputs are required to avoid circularity hassles.
        // Thus the substitution process is not table-based (no query_input_xref entries here).
        // It is assumed that inputs have already passed validation in executeCommand(),
        // which should be the case if the input resolution order is specified properly in
        // query_input_xref.
        while ((i=specialQuery.indexOf(dataBundle.getProperty("INPUT_DELIMITER", "@"))) >= 0) {
            j=specialQuery.indexOf(dataBundle.getProperty("INPUT_DELIMITER", "@"), i+1);
            if (j<0)
                throw new Exception("Unterminated input in default input query " + defaultQueryId);
            String inputCode = specialQuery.substring(i+1, j);
            String inputValue = (String)inputs.get(inputCode);
            if (inputValue == null)
                throw new Exception("Missing required input " + inputCode + 
                                          " for default input query " + defaultQueryId);
            String oldStr = specialQuery.substring(i, j+1);
            specialQuery = StringUtilities.replace(specialQuery, oldStr, inputValue);
        }

        // Save query for exception handling
        query = new StringBuffer(specialQuery);
        ps = conn.prepareStatement(specialQuery);
        rs = ps.executeQuery();
        if (!rs.next())
            throw new Exception("Default input query " + defaultQueryId + 
                                      " did not return a value");
        input = rs.getString(1);
        rs.close();
        rs = null;
        ps.close();
        ps = null;

        // If input is still null, we're hosed - this indicates
        // some problem with the DW data or the default input
        // query.
        if (input == null)
            throw new Exception("Default input query " + defaultQueryId + 
                                      " did not return a value");

        // Save this result to avoid query rerunning
        inputs.put(defaultQueryId, input);
        return input;
    }

    /** 
     * The function which does the actual retrieval of statistics data.  Returns a
     * <tt>Map</tt> in which each key is a <tt>String</tt> representing
     * a query name, and each value is a <tt>ResultSetContainer</tt> containing the
     * data returned by that query.
     *
     * @param      inputs  A map of inputs to this command.  Each key in this map
     *                     is a valid input code in DataAccess.properties, and
     *                     each value is a <tt>String</tt> containing the value passed in
     *                     for the given input code.  One key-value pair must
     *                     contain a valid command description as specified in the
     *                     "command" table.
     * @throws      Exception If some problem is encountered while executing
     *                              the queries specified by the passed-in command.
     * @return      The statistical data requested by the command.
     */
    public Map executeCommand(Map inputs) throws Exception {
        String commandDesc = (String) inputs.get(dataBundle.getProperty("COMMAND", "c"));
        if (commandDesc == null)
            throw new Exception("Missing command description");
        
        int i, rowcount;
        query = null;
        ArrayList qid;
        int queryIdList[];
        HashMap queryTextMap, queryNameMap, querySortMap, queryStartRow, queryEndRow, resultMap;

        // Get the list of queries to execute, and the names and texts of the queries
        try {
            query = new StringBuffer(300);
            query.append("SELECT cqx.query_id, ");
            query.append(" q.text, ");
            query.append(" q.name, ");
            query.append(" q.ranking, ");
            query.append(" q.column_index, ");
            query.append(" cqx.sort_order ");
            query.append("FROM command c, query q, command_query_xref cqx ");
            query.append("WHERE c.command_desc = ? ");
            query.append("AND cqx.command_id = c.command_id ");
            query.append("AND q.query_id = cqx.query_id ");
            query.append("ORDER BY cqx.sort_order ASC ");
            Context ctx = TCContext.getInitial();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, commandDesc);
            rs = ps.executeQuery();
            rowcount = 0;
            qid = new ArrayList();
            queryTextMap = new HashMap();
            queryNameMap = new HashMap();
            querySortMap = new HashMap();
            while (rs.next()) {
                rowcount++;
                Integer tempId = new Integer(rs.getInt(1));
                qid.add(tempId);
                queryTextMap.put(tempId, DBMS.getTextString(rs, 2));
                queryNameMap.put(tempId, rs.getString(3));
                int isRanking = rs.getInt(4);
                if (isRanking == 1)
                    querySortMap.put(tempId, new Integer(rs.getInt(5)));
            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            queryIdList = new int[rowcount];
            for (i=0; i<rowcount; i++) {
                queryIdList[i] = ((Integer)qid.get(i)).intValue();
            }
        } catch(Exception e) {
            handleException(e, query.toString(), inputs);
            throw new Exception("Invalid command: " + commandDesc);
        }

        // Now get the inputs of the queries
        try {
            if (queryIdList.length == 0) {
                throw new Exception("Query information for command " + commandDesc + 
                                          " missing from DB");
            }
            queryStartRow = new HashMap();
            queryEndRow = new HashMap();

            // Get all at once to avoid multiple DB hits.
            query = new StringBuffer(300);
            query.append("SELECT i.input_code, ");
            query.append(" qi.optional, ");
            query.append(" i.data_type_id, ");
            query.append(" qi.default_value, ");
            query.append(" qi.query_id, ");
            query.append(" qi.sort_order ");
            query.append("FROM command c, command_query_xref cqx, input_lu i, query_input_xref qi ");
            query.append("WHERE c.command_desc = ? ");
            query.append("AND cqx.command_id = c.command_id ");
            query.append("AND cqx.query_id = qi.query_id ");
            query.append("AND qi.input_id = i.input_id ");
            query.append("ORDER BY qi.query_id ASC, qi.sort_order ASC ");
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, commandDesc);
            rs = ps.executeQuery();

            // Put these in a result set container to avoid requiring the
            // connection to have two open prepared statements at the same
            // time.  
            ResultSetContainer rsc = new ResultSetContainer(rs);

            rs.close();
            rs = null;
            ps.close();
            ps = null;
            rowcount = rsc.getRowCount();

            for (i=0; i<rowcount; i++) {
                String inputCode = rsc.getItem(i,0).toString();
                String optional = rsc.getItem(i,1).toString();
                int dataType = Integer.parseInt(rsc.getItem(i,2).toString());
                String defaultValue = rsc.getItem(i,3).toString();
                Integer tempId = new Integer(rsc.getItem(i,4).toString());
                String input = (String)inputs.get(inputCode);

                if (input == null) {
                    if (!optional.equals("Y")) {
                        throw new Exception("Missing required query input: " + inputCode);
                    }

                    // Any special default value processing goes here
                    if (defaultValue.startsWith(dataBundle.getProperty("SPECIAL_DEFAULT_MARKER", "$"))) {
                        // Runs an database query to get the input value.
                        input = runDefaultInputQuery(defaultValue, inputs);
                    } else {
                        // Simple fixed default value
                        input = defaultValue;
                    }

                    // Add to inputs list; other inputs may depend on this value.
                    inputs.put(inputCode, input);
                } // end input fillin

                // Remove leading/trailing input whitespace
                input = input.trim();

                if (!validateInput(input, dataType))
                    throw new Exception("Invalid data for input " + inputCode +": " + input);
                
                if (inputCode.equals(dataBundle.getProperty("START_RANK", "sr"))) {
                    queryStartRow.put(tempId, new Integer(input));
                    continue;
                } else if (inputCode.equals(dataBundle.getProperty("END_RANK", "er")) ||
                           inputCode.equals(dataBundle.getProperty("NUMBER_RECORDS", "nr"))) {
                    queryEndRow.put(tempId, new Integer(input));
                    continue;
                } 
                
                // Sort columns represent user-requested sorts on a particular
                // column.  They can be used in two different ways:  to
                // instruct the database to do a sort on a column via an
                // ORDER BY @sc@ clause, or to instruct the EJB to do the
                // sort on the ResultSetContainer after the data has been
                // retrieved.  Both must be supported because sometimes you
                // want to do a sort by a column before choosing a part 
                // of the data to display (as with earnings history when sorting
                // by amount of money paid) while other times you want to choose
                // a part of the data to display before doing a sort (as with
                // highest submission accuracy when sorting by coder handle).
                //
                // Unfortunately ResultSetContainer columns are 0-based and
                // database columns are 1-based.  To improve transparency for
                // the front-end coder, we add one to the input here so that
                // it's always 0-based from the front end's perspective (and
                // from the perspective of default sort column arguments in
                // the query_input database).
                if (inputCode.equals(dataBundle.getProperty("SORT_COLUMN", "sc"))) {
                    int colValue = Integer.parseInt(input);
                    colValue++;
                    input = new String("" + colValue);
                }

                String old = dataBundle.getProperty("INPUT_DELIMITER", "@") + inputCode + 
                    dataBundle.getProperty("INPUT_DELIMITER", "@");
                String queryText = (String) queryTextMap.get(tempId);
                queryText = StringUtilities.replace(queryText, old, input);
                queryTextMap.put(tempId, queryText);
            } // end loop over query inputs

            // Check we filled in all the inputs.
            for (i=0; i<queryIdList.length; i++) {
                String queryText = (String) queryTextMap.get(new Integer(queryIdList[i]));
                if(queryText.indexOf(dataBundle.getProperty("INPUT_DELIMITER", "@"))>=0)
                    throw new Exception("Query input entries missing from database: " + queryText);
            }
        } catch(Exception e) {
            handleException(e, query.toString(), inputs);
            throw e;
        }

        // At this point we've built all queries to run.  
        // Execute them and fill the ResultSetContainers.
        String queryText="", queryName="";
        String sortQueryName = (String) inputs.get(dataBundle.getProperty("SORT_QUERY", "sq"));
        String sortQueryCol = (String) inputs.get(dataBundle.getProperty("SORT_COLUMN", "sc"));
        String sortDir = (String) inputs.get(dataBundle.getProperty("SORT_DIRECTION", "sd"));
        boolean sortCalled = (sortQueryName != null && sortQueryCol != null);
        try {
            resultMap = new HashMap();
            for (i=0; i<queryIdList.length; i++) {
                Integer lookup = new Integer(queryIdList[i]);
                queryText = (String) queryTextMap.get(lookup);
                queryName = (String) queryNameMap.get(lookup);
                Integer ranklistCol = (Integer) querySortMap.get(lookup);
                int startRow, endRow;
                Integer tempInt = (Integer) queryStartRow.get(lookup);
                if (tempInt == null)
                    startRow = 1;
                else
                    startRow = tempInt.intValue();
                tempInt = (Integer) queryEndRow.get(lookup);
                if (tempInt == null)
                    endRow = Integer.MAX_VALUE;
                else
                    endRow = tempInt.intValue();
                ps = conn.prepareStatement(queryText);
                rs = ps.executeQuery();
                // Call different constructors depending on if we have to
                // generate a ranklist column or not.
                ResultSetContainer rsc;
                if (ranklistCol == null)
                    rsc = new ResultSetContainer(rs, startRow, endRow);
                else
                    rsc = new ResultSetContainer(rs, startRow, endRow, ranklistCol.intValue());
                rs.close();
                rs = null;
                ps.close();
                ps = null;

                // Sort if necessary
                if (sortCalled && queryName.equals(sortQueryName)) {
                    int col = Integer.parseInt(sortQueryCol);
                    boolean ascending = true;
                    if (sortDir != null && sortDir.equals("desc"))
                        ascending = false;
                    if (rsc.isValidColumn(col))
                        rsc.sortByColumn(col, ascending);
                }

                resultMap.put(queryName, rsc);
            }
        } catch(Exception e) {
            handleException(e, queryText, inputs);
            throw new Exception("Error while retrieving query data");
        }

        // Done!
        closeConnections();
        return resultMap;
    }
}

