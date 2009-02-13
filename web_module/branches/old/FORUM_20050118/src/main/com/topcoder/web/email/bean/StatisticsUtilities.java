package com.topcoder.web.email.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.servlet.EmailConstants;

import javax.servlet.ServletException;
import java.util.*;

/**
 * Utilities for running statistics queries.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 */

public class StatisticsUtilities {
    private static Logger log = Logger.getLogger(StatisticsUtilities.class);

    /**
     * Runs a statistics query and returns the result map.
     *
     * @param commandName    the name of the stats command
     * @param inputMap    the Map of command inputs
     *
     * @return Map        the result Map
     */

    public static Map runStatsQuery(String commandName, Map inputMap)
            throws ServletException {
        DataAccessInt dai = null;
        Request dataRequest = null;
        Map resultMap = null;
        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest = new Request(inputMap);
            dataRequest.setContentHandle(commandName);
            resultMap = dai.getData(dataRequest);
            return resultMap;
        } catch (Exception e) {
            log.error("Error running stats query", e);
            throw new ServletException(e.toString());
        }

    }


    /**
     * Returns the name of a stats query.
     *
     * @param commandId    id of the desired command
     *
     * @return String    the name of the command
     */

    public static String getCommandName(int commandId)
            throws ServletException {
        try {
            Map inputMap = new HashMap();
            inputMap.put("ci", String.valueOf(commandId));

            // run query, get results
            Map resultMap = StatisticsUtilities.runStatsQuery(EmailConstants.QUERY_DESCRIPTION_COMMAND, inputMap);

            ResultSetContainer rsc = (ResultSetContainer) resultMap.get(EmailConstants.QUERY_DESCRIPTION_RESULT);
            if (rsc.size() > 0) {
                TCResultItem command_desc = rsc.getItem(0, 0);

                return String.valueOf(command_desc);
            } else {
                return "Error looking up query name";
            }
        } catch (Exception e) {
            log.error("Error getting command description", e);
            throw new ServletException(e.toString());
        }

    }


    /**
     * Returns the input parameters required for a stats query as a Set of
     * CommandInput objects.
     *
     * @param commandId    the id of the desired stats command
     *
     * @return Set        Set of CommandInput's - one for each input parameter
     */

    public static Set getCommandInputs(int commandId)
            throws ServletException {
        Set commandInputSet = new HashSet();

        try {
            Map inputMap = new HashMap();
            // command id parameter
            inputMap.put("ci", String.valueOf(commandId));

            // run query, get results
            Map resultMap = StatisticsUtilities.runStatsQuery(EmailConstants.QUERY_METADATA_COMMAND, inputMap);
            ResultSetContainer resultSetContainer = (ResultSetContainer) resultMap.get(EmailConstants.QUERY_METADATA_RESULT);

            for (int i = 0; i < resultSetContainer.size(); i++) {
                CommandInput commandInput = new CommandInput();

                TCResultItem input_id = resultSetContainer.getItem(i, 0);
                TCResultItem input_code = resultSetContainer.getItem(i, 1);
                TCResultItem input_desc = resultSetContainer.getItem(i, 2);

                commandInput.setId(input_id.toString());
                commandInput.setCode(input_code.toString());
                commandInput.setDescription(input_desc.toString());

                commandInputSet.add(commandInput);
            }
        } catch (Exception e) {
            log.error("Error getting command metadata", e);
            throw new ServletException(e.toString());
        }

        return commandInputSet;
    }


    /**
     * Returns a Map of all stats queries (mapped from Integer id to String name).
     *
     * @return Map    Map of all queries, mapped from Integer id to String name
     */

    public static Map getCommandMap()
            throws ServletException {
        Map commandMap = new HashMap();

        try {
            // no inputs..
            Map inputMap = new HashMap();

            // run query, get results
            Map resultMap = StatisticsUtilities.runStatsQuery(EmailConstants.EMAIL_QUERIES_COMMAND, inputMap);

            ResultSetContainer rsc = (ResultSetContainer) resultMap.get(EmailConstants.EMAIL_QUERIES_RESULT);
            for (int i = 0; i < rsc.size(); i++) {
                TCResultItem command_id = rsc.getItem(i, 0);
                TCResultItem command_desc = rsc.getItem(i, 1);

                commandMap.put(new Integer(command_id.toString()), command_desc.toString());
            }
        } catch (Exception e) {
            log.error("Error getting command listing", e);
            throw new ServletException(e.toString());
        }

        return commandMap;

    }


}
