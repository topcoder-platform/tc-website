package com.topcoder.utilities.querymover;

import com.topcoder.web.query.bean.*;
import com.topcoder.web.ejb.query.Query;
import com.topcoder.web.ejb.query.QueryInput;
import com.topcoder.web.ejb.query.CommandQuery;
import com.topcoder.web.ejb.query.Command;
import com.topcoder.web.ejb.query.Input;
import com.topcoder.web.ejb.query.CommandGroup;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.ejb.CreateException;
import java.rmi.RemoteException;
import java.util.*;

public class QueryMover {
    private static Logger log = Logger.getLogger(QueryMover.class);

//    private static final String sourceDSN = "JTS_OLTP";
//    private static final String targetDSN = "JTS_HS_OLTP";

//    private static final String sourceDSN = "HS_DW";
//    private static final String targetDSN = "DW";

    private static final String sourceDSN = "OLTP";
    private static final String targetDSN = "OLTP";

    private static final String sourceContextFactory = "weblogic.jndi.WLInitialContextFactory";
    private static final String targetContextFactory = "weblogic.jndi.WLInitialContextFactory";
    private static final String sourceContextURL = "t3://172.16.20.41:7030";
//    private static final String sourceContextURL = "t3://172.16.20.41:8030";
    //prod
    //private static final String targetContextURL = "t3://jma-cluster.topcoder.com:7030";
    //qa
    private static final String targetContextURL = "t3://192.168.12.51:7032";

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
//        UserTransaction utx = null;
        Context ctx = null;
        try {
            q.initSource();
            log.info("source init complete");
            q.initTarget();
            log.info("target init complete");
            ctx = TCContext.getContext(targetContextFactory, targetContextURL);
//            utx = (UserTransaction) ctx.lookup("javax.transaction.UserTransaction");
//            utx.begin();
            for (int i = 0; i < args.length; i++) {
                long command = Long.parseLong(args[i]);
                q.moveCommand(command);
            }
//            utx.commit();
        } catch (SecurityException e) {
            try {
//                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
//            } catch (SystemException e1) {
//                e1.printStackTrace();
            }
            e.printStackTrace();
        } catch (IllegalStateException e) {
            try {
//                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
//            } catch (SystemException e1) {
//                e1.printStackTrace();
            }
            e.printStackTrace();
        } catch (NamingException e) {
            try {
//                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
//            } catch (SystemException e1) {
//                e1.printStackTrace();
            }
            e.printStackTrace();
        } catch (RemoteException e) {
            try {
//                utx.rollback();
            } catch (IllegalStateException e1) {
                e1.printStackTrace();
            } catch (SecurityException e1) {
                e1.printStackTrace();
//            } catch (SystemException e1) {
//                e1.printStackTrace();
            }
            e.printStackTrace();
/*
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
*/
        } catch (CreateException e) {
            e.printStackTrace();
        } catch (Exception e) {
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
                    sourceC.getCommandDesc(sourceCommandId, sourceDSN), sourceC.getCommandGroupId(sourceCommandId, sourceDSN));
            CommandGroupBean sourceCommandGroup = new CommandGroupBean(sourceCommand.getCommandGroupId(),
                    sourceCG.getCommandGroupName(sourceCommand.getCommandGroupId(), sourceDSN));
            CommandGroupBean targetCommandGroup = findCommandGroup(targetCG,
                    sourceCommandGroup.getCommandGroupDesc(), targetDSN);
            CommandBean targetCommand = findCommand(targetC, sourceCommand.getCommandDesc(), targetDSN);


            int newCommandGroupId = 0;

            /* it's a new command. */
            if (targetCommand == null) {
                /* it's a new command group */
                if (targetCommandGroup == null) {
                    log.info("command group " + sourceCommandGroup.getCommandGroupDesc() + " not found, creating...");
                    newCommandGroupId = targetCG.createCommandGroup(sourceCommandGroup.getCommandGroupDesc(), targetDSN);
                } else {
                    log.debug("target command group : " + targetCommandGroup.toString());
                    newCommandGroupId = targetCommandGroup.getCommandGroupId();
                }

                log.info("command " + sourceCommand.getCommandDesc() + " not found, creating...");
                long newCommandId = targetC.createCommand(sourceCommand.getCommandDesc(),
                        newCommandGroupId, targetDSN);

                commandMap.put(new Long(newCommandId), new Long(sourceCommandId));
                moveQueries(sourceCommandId);
                moveCommandQueries(newCommandId);
            } else {
                log.info("command " + sourceCommand.getCommandDesc() + " found, updating...");
                if (targetCommandGroup == null) {
                    log.info("command group " + sourceCommandGroup.getCommandGroupDesc() + " not found, creating...");
                    newCommandGroupId = targetCG.createCommandGroup(sourceCommandGroup.getCommandGroupDesc(), targetDSN);
                } else {
                    log.debug("target command group : " + targetCommandGroup.toString());
                    newCommandGroupId = targetCommandGroup.getCommandGroupId();
                }
                targetC.setCommandGroupId(targetCommand.getCommandId(), newCommandGroupId, targetDSN);
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
        ArrayList sourceQueries = getQueriesForCommand(sourceCQ, sourceQ, sourceCommandId, sourceDSN);
        QueryBean targetQuery = null;
        QueryBean sourceQuery = null;

        for (int i = 0; i < sourceQueries.size(); i++) {
            sourceQuery = (QueryBean) sourceQueries.get(i);
            targetQuery = findQuery(targetQ, sourceQuery.getName(), targetDSN);
            if (targetQuery == null) {
                log.info("query " + sourceQuery.getName() + " not found, creating");
                long newQueryId = targetQ.createQuery(sourceQuery.getText(), sourceQuery.getName(),
                        sourceQuery.isRanking() ? 1 : 0, targetDSN);
                if (sourceQuery.isRanking()) {
                    targetQ.setColumnIndex(newQueryId, sourceQuery.getColumnIndex(), targetDSN);
                }
                queryMap.put(new Long(newQueryId), new Long(sourceQuery.getQueryId()));
                moveInputs(newQueryId);
                moveQueryInputs(newQueryId);
            } else {
                log.info("query " + ((QueryBean) sourceQueries.get(i)).getName() + " found, updating");
                targetQ.setText(targetQuery.getQueryId(), sourceQuery.getText(), targetDSN);
                targetQ.setRanking(targetQuery.getQueryId(), sourceQuery.isRanking() ? 1 : 0, targetDSN);
                if (sourceQuery.isRanking()) {
                    targetQ.setColumnIndex(targetQuery.getQueryId(), sourceQuery.getColumnIndex(), targetDSN);
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
                ((Long) queryMap.get(new Long(targetQueryId))).longValue(), sourceDSN);
        InputBean targetInput = null;
        InputBean sourceInput = null;

        for (int i = 0; i < sourceInputs.size(); i++) {
            sourceInput = (InputBean) sourceInputs.get(i);
            targetInput = findInput(targetI, sourceInput.getInputCode(), targetDSN);
            if (targetInput == null) {
                log.info("input " + sourceInput.getInputCode() + " not found, creating");
                long newInputId = targetI.createInput(sourceInput.getInputCode(),
                        sourceInput.getDataTypeId(), sourceInput.getInputDesc(), targetDSN);
                inputMap.put(new Long(sourceInput.getInputId()), new Long(newInputId));
            } else {
                log.info("input " + sourceInput.getInputCode() + " found, updating");
                targetI.setDataTypeId(targetInput.getInputId(), sourceInput.getDataTypeId(), targetDSN);
                targetI.setInputDesc(targetInput.getInputId(), sourceInput.getInputDesc(), targetDSN);
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
        for (Iterator it = getQueriesForCommand(targetCQ, targetQ, targetCommandId, targetDSN).iterator(); it.hasNext();) {
            qb = (QueryBean) it.next();
            log.info("deleting command query record command id: " + targetCommandId + " query id: " + qb.getQueryId());
            targetCQ.removeCommandQuery(targetCommandId, qb.getQueryId(), targetDSN);
        }

        long sourceCommandId = ((Long) commandMap.get(new Long(targetCommandId))).longValue();
        for (Iterator it = getQueriesForCommand(sourceCQ, sourceQ, sourceCommandId, sourceDSN).iterator(); it.hasNext();) {
            qb = (QueryBean) it.next();
            long sourceQueryId = qb.getQueryId();
            long targetQueryId = ((Long) getKey(queryMap, new Long(sourceQueryId))).longValue();
            log.info("creating command query record command id: " + targetCommandId + " query id: " + targetQueryId);
            targetCQ.createCommandQuery(targetCommandId, targetQueryId, targetDSN);
            targetCQ.setSortOrder(targetCommandId, targetQueryId,
                    sourceCQ.getSortOrder(sourceCommandId, sourceQueryId, sourceDSN), targetDSN);
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
        for (Iterator it = getQueryInputs(targetQI, targetQueryId, targetDSN).iterator(); it.hasNext();) {
            qib = (QueryInputBean) it.next();
            log.info("deleting query input record query id: " + targetQueryId + " input id: " + qib.getInputId());
            targetQI.removeQueryInput(targetQueryId, qib.getInputId(), targetDSN);
        }

        for (Iterator it = getQueryInputs(sourceQI, sourceQueryId, sourceDSN).iterator(); it.hasNext();) {
            qib = (QueryInputBean) it.next();
            long sourceInputId = qib.getInputId();
            log.debug("inputMap: " + inputMap.toString());
            long targetInputId = ((Long) inputMap.get(new Long(sourceInputId))).longValue();

            log.info("creating query input record query id: " + targetQueryId + " input id: " + targetInputId);
            targetQI.createQueryInput(targetQueryId, targetInputId, targetDSN);
            targetQI.setSortOrder(targetQueryId, targetInputId,
                    sourceQI.getSortOrder(sourceQueryId, sourceInputId, sourceDSN), targetDSN);
            boolean isOptional = sourceQI.getOptional(sourceQueryId, sourceInputId, sourceDSN) == 'Y';
            targetQI.setOptional(targetQueryId, targetInputId, isOptional ? 'Y' : 'N', targetDSN);
            if (isOptional) {
                targetQI.setDefaultValue(targetQueryId, targetInputId,
                        sourceQI.getDefaultValue(sourceQueryId, sourceInputId, sourceDSN), targetDSN);
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
    private ArrayList getQueryInputs(QueryInput qi, long queryId, String dsn) throws RemoteException {
        ResultSetContainer queryInputs = qi.getInputsForQuery(queryId, dsn);
        ArrayList ret = new ArrayList(queryInputs.size());
        ResultSetContainer.ResultSetRow row = null;

        QueryInputBean qib = null;
        for (Iterator it = queryInputs.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            qib = new QueryInputBean();
            qib.setQueryId(queryId);
            qib.setInputId(((Long) row.getItem("input_id").getResultData()).longValue());
            qib.setSortOrder(((Integer) row.getItem("sort_order").getResultData()).intValue());
            qib.setOptional((row.getItem("optional").getResultData()).equals("Y"));
            if (qib.isOptional()) {
                qib.setDefaultValue((String) row.getItem("default_value").getResultData());
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
    private ArrayList getQueriesForCommand(CommandQuery cq, Query q, long commandId, String dsn) throws RemoteException {
        log.debug("getQueriesForCommand: commandid: " + commandId + " datasource: " + dsn);
        if (cq == null) {
            log.debug("my command query bean is null");
        } else if (q == null) {
            log.debug("my query bean is null");
        }
        ArrayList ret = null;
        QueryBean query = null;
        ResultSetContainer queryList = cq.getQueriesForCommand(commandId, dsn);
        ResultSetContainer.ResultSetRow row = null;
        ret = new ArrayList(queryList.size());
        for (Iterator it = queryList.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            query = new QueryBean();
            query.setQueryId(((Long) row.getItem("query_id").getResultData()).longValue());
            query.setName(q.getName(query.getQueryId(), dsn));
            query.setColumnIndex(q.getColumnIndex(query.getQueryId(), dsn));
            query.setText(q.getText(query.getQueryId(), dsn));
            query.setRanking(q.getRanking(query.getQueryId(), dsn) == 1);
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
    private ArrayList getInputsForQuery(QueryInput qi, long queryId, String dsn) throws RemoteException {
        ArrayList ret = null;
        InputBean input = null;
        ResultSetContainer inputList = qi.getInputsForQuery(queryId, dsn);
        ResultSetContainer.ResultSetRow row = null;
        ret = new ArrayList(inputList.size());
        for (Iterator it = inputList.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
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
    private InputBean findInput(Input i, String code, String dsn) throws RemoteException {
        ResultSetContainer inputList = null;
        InputBean ret = null;

        inputList = i.getAllInputs(dsn);
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = inputList.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("input_code").getResultData().equals(code)) {
                ret = new InputBean();
                ret.setInputId(((Long) row.getItem("input_id").getResultData()).longValue());
                ret.setDataTypeId(i.getDataTypeId(ret.getInputId(), dsn));
                ret.setInputCode(i.getInputCode(ret.getInputId(), dsn));
                ret.setInputDesc(i.getInputDesc(ret.getInputId(), dsn));
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
    private QueryBean findQuery(Query q, String name, String dsn) throws RemoteException {
        ResultSetContainer queryList = null;
        QueryBean ret = null;

        queryList = q.getAllQueries(false, dsn);
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = queryList.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("name").getResultData().equals(name)) {
                ret = new QueryBean();
                ret.setQueryId(((Long) row.getItem("query_id").getResultData()).longValue());
                ret.setName(q.getName(ret.getQueryId(), dsn));
                ret.setColumnIndex(q.getColumnIndex(ret.getQueryId(), dsn));
                ret.setText(q.getText(ret.getQueryId(), dsn));
                ret.setRanking(q.getRanking(ret.getQueryId(), dsn) == 1);
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
    private CommandGroupBean findCommandGroup(CommandGroup cg, String name, String dsn) throws RemoteException {
        CommandGroupBean ret = null;

        ResultSetContainer rsc = cg.getAllCommandGroups(dsn);
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
    private CommandBean findCommand(Command c, String desc, String dsn) throws RemoteException {
        CommandBean ret = null;
        ResultSetContainer rsc = c.getCommandList(dsn);
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
    private void initTarget() throws Exception {
        InitialContext ctx = (InitialContext) TCContext.getContext(targetContextFactory, targetContextURL);

        targetQ = (Query) BaseProcessor.createEJB(ctx, Query.class);
        targetQI = (QueryInput) BaseProcessor.createEJB(ctx, QueryInput.class);
        targetCQ = (CommandQuery) BaseProcessor.createEJB(ctx, CommandQuery.class);
        targetC = (Command) BaseProcessor.createEJB(ctx, Command.class);
        targetI = (Input) BaseProcessor.createEJB(ctx, Input.class);
        targetCG = (CommandGroup) BaseProcessor.createEJB(ctx, CommandGroup.class);
    }

    /**
     *
     */
    private void initSource() throws Exception {
        try {
            InitialContext ctx = (InitialContext) TCContext.getContext(sourceContextFactory, sourceContextURL);

            sourceQ = (Query) BaseProcessor.createEJB(ctx, Query.class);
            sourceQI = (QueryInput) BaseProcessor.createEJB(ctx, QueryInput.class);
            sourceCQ = (CommandQuery) BaseProcessor.createEJB(ctx, CommandQuery.class);
            sourceC = (Command) BaseProcessor.createEJB(ctx, Command.class);
            sourceI = (Input) BaseProcessor.createEJB(ctx, Input.class);
            sourceCG = (CommandGroup) BaseProcessor.createEJB(ctx, CommandGroup.class);
        } catch (NamingException e) {
            e.printStackTrace();
            throw e;
        } catch (CreateException e) {
            e.printStackTrace();
            throw e;
        } catch (RemoteException e) {
            e.printStackTrace();
            throw e;
        }

    }
}
