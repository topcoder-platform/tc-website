package com.topcoder.utilities.querymover;

import com.topcoder.web.query.bean.*;
import com.topcoder.web.query.bean.QueryBean;
import com.topcoder.web.query.bean.InputBean;
import com.topcoder.web.query.bean.QueryInputBean;
import com.topcoder.web.query.ejb.QueryServices.*;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.ejb.CreateException;
import javax.transaction.*;
import java.rmi.RemoteException;
import java.util.*;

public class QueryMover {
    private static Logger log = Logger.getLogger(QueryMover.class);

//    private static final String sourceDataSourceName = "JTS_OLTP";
//    private static final String targetDataSourceName = "JTS_HS_OLTP";

    private static final String sourceDataSourceName = "DW";
    private static final String targetDataSourceName = "HS_DW";

    private static final String sourceContextFactory = "weblogic.jndi.WLInitialContextFactory";
    private static final String targetContextFactory = "weblogic.jndi.WLInitialContextFactory";
    private static final String sourceContextURL = "t3://172.16.20.41:7030";
    //prod
    //private static final String targetContextURL = "t3://jma-cluster.topcoder.com:7030";
    //qa
    private static final String targetContextURL = "t3://172.16.212.51:7030";

    private Query sourceQ;
    private QueryInput sourceQI;
    private CommandQuery sourceCQ;
    private Command sourceC;
    private Input sourceI;
    private CommandGroup sourceCG;

    private Query targetQ;
    private QueryInput targetQI;
    private CommandQuery targetCQ;
    private Command targetC;
    private Input targetI;
    private CommandGroup targetCG;

    // keys are source id's, values are target id's
    private HashMap inputMap = new HashMap();

    // keys are target id's, values are source id's
    private HashMap queryMap = new HashMap();

    // keys are target id's, values are source id's
    private HashMap commandMap = new HashMap();


    public static void main(String args[]) {
        QueryMover q = new QueryMover();
        UserTransaction utx = null;
        Context ctx = null;
        try {
            q.initSource();
            q.initTarget();
            ctx = TCContext.getContext(targetContextFactory, targetContextURL);
            utx = (UserTransaction) ctx.lookup("javax.transaction.UserTransaction");
            utx.begin();
            for (int i = 0; i < args.length; i++) {
                long command = Long.parseLong(args[i]);
                q.moveCommand(command);
            }
            utx.commit();
        } catch (SecurityException e) {
            try {
                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
            } catch (SystemException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } catch (IllegalStateException e) {
            try {
                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
            } catch (SystemException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } catch (NamingException e) {
            try {
                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
            } catch (SystemException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } catch (RemoteException e) {
            try {
                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
            } catch (SystemException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } catch (NotSupportedException e) {
            e.printStackTrace();
        } catch (SystemException e) {
            e.printStackTrace();
        } catch (RollbackException e) {
            e.printStackTrace();
        } catch (HeuristicMixedException e) {
            e.printStackTrace();
        } catch (HeuristicRollbackException e) {
            e.printStackTrace();
        } catch (CreateException e) {
            e.printStackTrace();
        }
    }

    //figure out which command group to move
    //figure out which queries to move
    //figure out which inputs to move

    //move command
    //if command desc exists print message and update
    //else insert command from source db
    /**
     *
     * @param sourceCommandId
     */
    private void moveCommand(long sourceCommandId) throws RemoteException {
        try {
            CommandBean sourceCommand = new CommandBean(sourceCommandId,
                    sourceC.getCommandDesc(sourceCommandId), sourceC.getCommandGroupId(sourceCommandId));
            CommandGroupBean sourceCommandGroup = new CommandGroupBean(sourceCommand.getCommandGroupId(),
                    sourceCG.getCommandGroupName(sourceCommand.getCommandGroupId()));
            CommandGroupBean targetCommandGroup = findCommandGroup(targetCG,
                    sourceCommandGroup.getCommandGroupDesc());
            CommandBean targetCommand = findCommand(targetC, sourceCommand.getCommandDesc());

            int newCommandGroupId = 0;

            /* it's a new command. */
            if (targetCommand == null) {
                log.info("command " + sourceCommand.getCommandDesc() + " not found, creating...");
                long newCommandId = targetC.createCommand(sourceCommand.getCommandDesc(),
                        (int) sourceCommand.getCommandId());

                /* it's a new command group */
                if (targetCommandGroup == null) {
                    log.info("command group " + sourceCommandGroup.getCommandGroupDesc() + " not found, creating...");
                    newCommandGroupId = targetCG.createCommandGroup(sourceCommandGroup.getCommandGroupDesc());
                    targetC.setCommandGroupId(newCommandId, newCommandGroupId);
                } else {
                    log.info("command group " + sourceCommandGroup.getCommandGroupDesc() + " found, updating command...");
                    targetC.setCommandGroupId(newCommandId, targetCommandGroup.getCommandGroupId());
                }
                commandMap.put(new Long(newCommandId), new Long(sourceCommandId));
                moveQueries(sourceCommandId);
                moveCommandQueries(newCommandId);
            } else {
                commandMap.put(new Long(targetCommand.getCommandId()), new Long(sourceCommandId));
                moveQueries(sourceCommandId);
                moveCommandQueries(targetCommand.getCommandId());
            }
        } catch (RemoteException e) {
            e.printStackTrace();
            throw e;
        }
    }

    /**
     *
     * @param sourceCommandId
     * @throws java.rmi.RemoteException
     */
    private void moveQueries(long sourceCommandId) throws RemoteException {
        ArrayList sourceQueries = getQueriesForCommand(sourceCQ, sourceQ, sourceCommandId);
        QueryBean targetQuery = null;
        QueryBean sourceQuery = null;

        for (int i = 0; i < sourceQueries.size(); i++) {
            sourceQuery = (QueryBean) sourceQueries.get(i);
            targetQuery = findQuery(targetQ, sourceQuery.getName());
            if (targetQuery == null) {
                log.info("query " + sourceQuery.getName() + " not found, creating");
                long newQueryId = targetQ.createQuery(sourceQuery.getText(), sourceQuery.getName(),
                        sourceQuery.isRanking() ? 1 : 0);
                if (sourceQuery.isRanking()) {
                    targetQ.setColumnIndex(newQueryId, sourceQuery.getColumnIndex());
                }
                queryMap.put(new Long(newQueryId), new Long(sourceQuery.getQueryId()));
                moveInputs(newQueryId);
                moveQueryInputs(newQueryId);
            } else {
                log.info("query " + ((QueryBean) sourceQueries.get(i)).getName() + " found, updating");
                targetQ.setText(targetQuery.getQueryId(), sourceQuery.getText());
                targetQ.setRanking(targetQuery.getQueryId(), sourceQuery.isRanking() ? 1 : 0);
                if (sourceQuery.isRanking()) {
                    targetQ.setColumnIndex(targetQuery.getQueryId(), sourceQuery.getColumnIndex());
                }
                queryMap.put(new Long(targetQuery.getQueryId()), new Long(sourceQuery.getQueryId()));
                moveInputs(targetQuery.getQueryId());
                moveQueryInputs(targetQuery.getQueryId());
            }
        }
    }

    /**
     *
     * @param targetQueryId the query id of the target
     * @throws java.rmi.RemoteException
     */
    private void moveInputs(long targetQueryId) throws RemoteException {
        ArrayList sourceInputs = getInputsForQuery(sourceQI,
                ((Long) queryMap.get(new Long(targetQueryId))).longValue());
        InputBean targetInput = null;
        InputBean sourceInput = null;

        for (int i = 0; i < sourceInputs.size(); i++) {
            sourceInput = (InputBean) sourceInputs.get(i);
            targetInput = findInput(targetI, sourceInput.getInputCode());
            if (targetInput == null) {
                log.info("input " + sourceInput.getInputCode() + " not found, creating");
                long newInputId = targetI.createInput(sourceInput.getInputCode(),
                        sourceInput.getDataTypeId(), sourceInput.getInputDesc());
                inputMap.put(new Long(sourceInput.getInputId()), new Long(newInputId));
            } else {
                log.info("input " + sourceInput.getInputCode() + " found, updating");
                targetI.setDataTypeId(targetInput.getInputId(), sourceInput.getDataTypeId());
                targetI.setInputDesc(targetInput.getInputId(), sourceInput.getInputDesc());
                inputMap.put(new Long(sourceInput.getInputId()), new Long(targetInput.getInputId()));
            }
        }
    }


    /**
     * move
     * @param targetCommandId
     * @throws java.rmi.RemoteException
     */
    private void moveCommandQueries(long targetCommandId) throws RemoteException {
        //remove all the command query entries for this command
        QueryBean qb = null;
        for (Iterator it = getQueriesForCommand(targetCQ, targetQ, targetCommandId).iterator(); it.hasNext();) {
            log.info("deleting command query record command id: " + targetCommandId + " query id: " + qb.getQueryId());
            qb = (QueryBean) it.next();
            targetCQ.removeCommandQuery(targetCommandId, qb.getQueryId());
        }

        long sourceCommandId = ((Long) commandMap.get(new Long(targetCommandId))).longValue();
        for (Iterator it = getQueriesForCommand(sourceCQ, sourceQ, sourceCommandId).iterator(); it.hasNext();) {
            qb = (QueryBean) it.next();
            long sourceQueryId = qb.getQueryId();
            long targetQueryId = ((Long) getKey(queryMap, new Long(sourceQueryId))).longValue();
            log.info("creating command query record command id: " + targetCommandId + " query id: " + targetQueryId);
            targetCQ.createCommandQuery(targetCommandId, targetQueryId);
            targetCQ.setSortOrder(targetCommandId, targetQueryId,
                    sourceCQ.getSortOrder(sourceCommandId, sourceQueryId));
        }
    }

    /**
     *
     * @param targetQueryId
     * @throws java.rmi.RemoteException
     */
    private void moveQueryInputs(long targetQueryId) throws RemoteException {
        long sourceQueryId = ((Long) queryMap.get(new Long(targetQueryId))).longValue();
        QueryInputBean qib = null;

        //remove all the current query input records for the given query
        for (Iterator it = getQueryInputs(targetQI, targetQueryId).iterator(); it.hasNext();) {
            qib = (QueryInputBean) it.next();
            log.info("deleting query input record query id: " + targetQueryId + " input id: " + qib.getInputId());
            targetQI.removeQueryInput(targetQueryId, qib.getInputId());
        }

        for (Iterator it = getQueryInputs(sourceQI, sourceQueryId).iterator(); it.hasNext();) {
            qib = (QueryInputBean) it.next();
            long sourceInputId = qib.getInputId();
            long targetInputId = ((Long) inputMap.get(new Long(sourceInputId))).longValue();

            log.info("creating query input record query id: " + targetQueryId + " input id: " + targetInputId);
            targetQI.createQueryInput(targetQueryId, targetInputId);
            targetQI.setSortOrder(targetQueryId, targetInputId,
                    sourceQI.getSortOrder(sourceQueryId, sourceInputId));
            boolean isOptional = sourceQI.getOptional(sourceQueryId, sourceInputId) == 'Y';
            targetQI.setOptional(targetQueryId, targetInputId, isOptional ? 'Y' : 'N');
            if (isOptional) {
                targetQI.setDefaultValue(targetQueryId, targetInputId,
                        sourceQI.getDefaultValue(sourceQueryId, sourceInputId));
            }

        }
    }


    /**
     *
     * @param qi
     * @param queryId
     * @return
     * @throws java.rmi.RemoteException
     */
    private ArrayList getQueryInputs(QueryInput qi, long queryId) throws RemoteException {
        ResultSetContainer queryInputs = qi.getInputsForQuery(queryId);
        ArrayList ret = new ArrayList(queryInputs.size());
        ResultSetContainer.ResultSetRow row = null;

        QueryInputBean qib = null;
        for (Iterator it = queryInputs.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            qib = new QueryInputBean();
            qib.setQueryId(queryId);
            qib.setInputId(((Long) row.getItem("input_id").getResultData()).longValue());
            qib.setSortOrder(((Integer) row.getItem("sort_order").getResultData()).intValue());
            qib.setOptional(((Integer) row.getItem("optional").getResultData()).intValue() == 1);
            if (qib.isOptional()) {
                qib.setDefaultValue((String) row.getItem("defalt_value").getResultData());
            }
            ret.add(qib);
        }
        return ret;
    }


    /**
     *
     * @param cq
     * @param q
     * @param commandId
     * @return
     * @throws java.rmi.RemoteException
     */
    private ArrayList getQueriesForCommand(CommandQuery cq, Query q, long commandId) throws RemoteException {
        ArrayList ret = null;
        QueryBean query = null;
        ResultSetContainer queryList = cq.getQueriesForCommand(commandId);
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = queryList.iterator(); it.hasNext();) {
            ret = new ArrayList(queryList.size());
            row = (ResultSetContainer.ResultSetRow) it.next();
            query = new QueryBean();
            query.setQueryId(((Long) row.getItem("query_id").getResultData()).longValue());
            query.setName(q.getName(query.getQueryId()));
            query.setColumnIndex(q.getColumnIndex(query.getQueryId()));
            query.setText(q.getText(query.getQueryId()));
            query.setRanking(q.getRanking(query.getQueryId()) == 1);
            ret.add(query);
        }
        return ret;
    }

    /**
     *
     * @param qi
     * @param queryId
     * @return
     * @throws java.rmi.RemoteException
     */
    private ArrayList getInputsForQuery(QueryInput qi, long queryId) throws RemoteException {
        ArrayList ret = null;
        InputBean input = null;
        ResultSetContainer inputList = qi.getInputsForQuery(queryId);
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = inputList.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            ret = new ArrayList(inputList.size());
            input = new InputBean();
            input.setInputId(((Long) row.getItem("input_id").getResultData()).longValue());
            input.setDataTypeId(((Integer) row.getItem("data_type_id").getResultData()).intValue());
            input.setInputDesc((String) row.getItem("input_desc").getResultData());
            input.setInputCode((String) row.getItem("input_code").getResultData());
            ret.add(input);
        }
        return ret;
    }

    /**
     *
     * @param i
     * @param code
     * @return
     * @throws java.rmi.RemoteException
     */
    private InputBean findInput(Input i, String code) throws RemoteException {
        ResultSetContainer inputList = null;
        InputBean ret = null;

        inputList = i.getAllInputs();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = inputList.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("input_code").getResultData().equals(code)) {
                ret = new InputBean();
                ret.setInputId(((Long) row.getItem("input_id").getResultData()).longValue());
                ret.setDataTypeId(i.getDataTypeId(ret.getInputId()));
                ret.setInputCode(i.getInputCode(ret.getInputId()));
                ret.setInputDesc(i.getInputDesc(ret.getInputId()));
            }
        }
        return ret;

    }

    /**
     * returns the query that matches the given name, or null if it doesn't exist
     * @param q
     * @param name
     * @return
     * @throws java.rmi.RemoteException
     */
    private QueryBean findQuery(Query q, String name) throws RemoteException {
        ResultSetContainer queryList = null;
        QueryBean ret = null;

        queryList = q.getAllQueries(false);
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = queryList.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("name").getResultData().equals(name)) {
                ret = new QueryBean();
                ret.setQueryId(((Long) row.getItem("query_id").getResultData()).longValue());
                ret.setName(q.getName(ret.getQueryId()));
                ret.setColumnIndex(q.getColumnIndex(ret.getQueryId()));
                ret.setText(q.getText(ret.getQueryId()));
                ret.setRanking(q.getRanking(ret.getQueryId()) == 1);
            }
        }
        return ret;
    }

    /**
     * returns a com.topcoder.utilities.querymover.CommandGroupBean that has the same name as the parameter using the
     * ejb provided.  returns null if not found.
     * @param cg
     * @param name
     * @return
     */
    private CommandGroupBean findCommandGroup(CommandGroup cg, String name) throws RemoteException {
        CommandGroupBean ret = null;

        ResultSetContainer rsc = cg.getAllCommandGroups();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("command_group_name").getResultData().equals(name)) {
                ret = new CommandGroupBean(((Integer) row.getItem("command_group_id").getResultData()).intValue(),
                        (String) row.getItem("command_group_name").getResultData());
            }
        }
        return ret;
    }

    /**
     * returns a com.topcoder.utilities.querymover.CommandBean that has the same desc as the parameter using the
     * ejb provided.  returns null if not found.
     * @param c
     * @param desc
     * @return
     */
    private CommandBean findCommand(Command c, String desc) throws RemoteException {
        CommandBean ret = null;
        ResultSetContainer rsc = c.getCommandList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("command_desc").getResultData().equals(desc)) {
                ret = new CommandBean(((Long) row.getItem("command_id").getResultData()).longValue(),
                        (String) row.getItem("command_desc").getResultData(),
                        ((Integer) row.getItem("command_group_id").getResultData()).intValue());
            }
        }
        return ret;
    }

    /**
     * finds the key in the given map for the specified value.
     * should not be run on a map where the values are not distinct.
     * @param m
     * @param value
     * @return
     */
    private Object getKey(Map m, Object value) {
        Map.Entry me = null;
        Object ret = null;
        for (Iterator it = m.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (me.getValue().equals(value)) {
                ret = me.getKey();
            }
        }
        return ret;
    }


    /**
     *
     */
    private void initTarget() throws RemoteException, CreateException, NamingException {
        Context ctx = TCContext.getContext(targetContextFactory, targetContextURL);

        QueryHome qHome = (QueryHome) ctx.lookup(ApplicationServer.Q_QUERY);
        targetQ = qHome.create();
        targetQ.setDataSource(targetDataSourceName);

        QueryInputHome qiHome = (QueryInputHome) ctx.lookup(ApplicationServer.Q_QUERY_INPUT);
        targetQI = qiHome.create();
        targetQI.setDataSource(targetDataSourceName);

        CommandQueryHome cqHome = (CommandQueryHome) ctx.lookup(ApplicationServer.Q_COMMAND_QUERY);
        targetCQ = cqHome.create();
        targetCQ.setDataSource(targetDataSourceName);

        CommandHome cHome = (CommandHome) ctx.lookup(ApplicationServer.Q_COMMAND);
        targetC = cHome.create();
        targetC.setDataSource(targetDataSourceName);

        InputHome iHome = (InputHome) ctx.lookup(ApplicationServer.Q_INPUT);
        targetI = iHome.create();
        targetI.setDataSource(targetDataSourceName);

        CommandGroupHome cgHome = (CommandGroupHome) ctx.lookup(ApplicationServer.Q_COMMAND_GROUP);
        targetCG = cgHome.create();
        targetCG.setDataSource(targetDataSourceName);
    }

    /**
     *
     */
    private void initSource() throws RemoteException, NamingException, CreateException {
        Context ctx = TCContext.getContext(sourceContextFactory, sourceContextURL);

        QueryHome qHome = (QueryHome) ctx.lookup(ApplicationServer.Q_QUERY);
        sourceQ = qHome.create();
        sourceQ.setDataSource(sourceDataSourceName);

        QueryInputHome qiHome = (QueryInputHome) ctx.lookup(ApplicationServer.Q_QUERY_INPUT);
        sourceQI = qiHome.create();
        sourceQI.setDataSource(sourceDataSourceName);

        CommandQueryHome cqHome = (CommandQueryHome) ctx.lookup(ApplicationServer.Q_COMMAND_QUERY);
        sourceCQ = cqHome.create();
        sourceCQ.setDataSource(sourceDataSourceName);

        CommandHome cHome = (CommandHome) ctx.lookup(ApplicationServer.Q_COMMAND);
        sourceC = cHome.create();
        sourceC.setDataSource(sourceDataSourceName);

        InputHome iHome = (InputHome) ctx.lookup(ApplicationServer.Q_INPUT);
        sourceI = iHome.create();
        sourceI.setDataSource(sourceDataSourceName);

        CommandGroupHome cgHome = (CommandGroupHome) ctx.lookup(ApplicationServer.Q_COMMAND_GROUP);
        sourceCG = cgHome.create();
        sourceCG.setDataSource(sourceDataSourceName);

    }
}
