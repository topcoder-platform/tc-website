package com.topcoder.common.web.util;

import com.topcoder.common.web.data.Contest;
import com.topcoder.common.web.data.Modifiable;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.data.User;
import com.topcoder.common.web.error.TCException;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.transaction.Status;
import javax.transaction.TransactionManager;
import javax.rmi.PortableRemoteObject;
import java.util.*;

public final class Data {
    private static Logger log = Logger.getLogger(Data.class);
    private static boolean hasBeenInitialized = false;

    public static final void stabilizeModifiableList(List modifiableList)
            throws Exception {
        try {
            if (modifiableList != null) {
                for (int i = 0; i < modifiableList.size(); i++) {
                    Modifiable modifiableObj =
                            (Modifiable) modifiableList.get(i);
                    if (modifiableObj.getModified().equals("D")) {
                        modifiableList.remove(modifiableObj);
                    } else {
                        modifiableObj.setAllModifiedStable();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.util.stablilizeModifiableList:ERROR:\n" + e);
        }
    }


    public static void saveUser(Navigation nav) throws TCException {
        Context ctx = null;
        TransactionManager tm = null;
        try {
            ctx = TCContext.getInitial();
            UserServicesHome userHome = (UserServicesHome) PortableRemoteObject.narrow(ctx.lookup(
                            UserServicesHome.class.getName()),
                            UserServicesHome.class);

            Long key = new Long(nav.getUser().getUserId());
            UserServices userEJB = userHome.findByPrimaryKey(key);

            tm = (TransactionManager)ctx.lookup(ApplicationServer.TRANS_MANAGER);
            tm.begin();
            userEJB.setUser(nav.getUser());
            tm.commit();
            nav.setUser(userEJB.getUser());
        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (tm!= null && tm.getStatus() == Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
            } catch (Exception te) {
                StringBuffer msg = new StringBuffer(300);
                msg.append("common.DBMS:saveUser:");
                msg.append("failed to roll back transaction.\n");
                msg.append("MSG: ");
                msg.append(te.getMessage());
                msg.append("\n");
                te.printStackTrace();
            }
            throw new TCException("common.DBMS:saveUser:ERROR:" + e.getMessage());
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
    }

    public static void loadUser(Navigation nav) throws TCException {
        log.debug("load user called");

        User user = null;
        if (nav.getUser() == null) {
            user = new User();
            nav.setUser(user);
        } else {
            user = nav.getUser();
        }
        if (user.getUserId() == 0 && nav.getUserId() > 0) {
            Context ctx = null;
            try {
                ctx = TCContext.getInitial();
                log.debug("looking for " + UserServicesHome.class.getName() + " in jndi");
                UserServicesHome userHome = (UserServicesHome) PortableRemoteObject.narrow(ctx.lookup(
                                UserServicesHome.class.getName()),
                                UserServicesHome.class);
                UserServices userEJB = userHome.findByPrimaryKey(new Long(nav.getUserId()));
                user = userEJB.getUser();
                nav.setUser(user);
                log.debug("tc: user loaded from entity bean");
            } catch (Exception e) {
                throw new TCException("tc:processCommands:ERROR READING DATABASE\n" + e);
            } finally {
                if (ctx != null) {
                    try {
                        ctx.close();
                    } catch (Exception ignore) {
                    }
                }
            }
        }
    }


    public static RecordTag getDynamicContestInfo(ArrayList contests) throws Exception {
        RecordTag result = new RecordTag("Contests");
        try {
            for (int i = 0; i < contests.size(); i++) {
                Contest contest = (Contest) contests.get(i);
                RecordTag contestTag = contest.getXML();
                TimeZone tz = TimeZone.getDefault();
                if (tz.inDaylightTime(contest.getContestStart())) {
                    contestTag.addTag(new ValueTag("ShortDaylight", "EDT"));
                    contestTag.addTag(new ValueTag("LongDaylight", "Eastern Daylight Time"));
                } else {
                    contestTag.addTag(new ValueTag("ShortDaylight", "EST"));
                    contestTag.addTag(new ValueTag("LongDaylight", "Eastern Standard Time"));
                }
                result.addTag(contestTag);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("processContest.getContestPhases:ERROR:" + e);
        }
        return result;
    }


    public static void initializeDataTypes() throws Exception {
        QueryRequest qr = null;
        DataAccessInt dai = null;
        Map resultMap = null;

        if (!hasBeenInitialized) {
            qr = new QueryRequest();
            qr.addQuery("Mappings", "SELECT data_type_id, language_id, display_value " +
                    "FROM data_type_mapping");
            qr.addQuery("Types", "SELECT data_type_id, data_type_desc FROM data_type");
            dai = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            resultMap = dai.getData(qr);

            ResultSetContainer mapRsc = (ResultSetContainer) resultMap.get("Mappings");

            HashMap mappings = new HashMap();

            for (int i = 0; i < mapRsc.size(); i++) {
                String dataTypeId = mapRsc.getItem(i, "data_type_id").toString();
                String languageId = mapRsc.getItem(i, "language_id").toString();
                String desc = mapRsc.getItem(i, "display_value").toString();
                HashMap mapping = (HashMap) mappings.get(new Integer(dataTypeId));

                if (mapping == null) {
                    mapping = new HashMap();
                    mappings.put(new Integer(dataTypeId), mapping);
                }
                mapping.put(new Integer(languageId), desc);
            }

            ResultSetContainer typeRsc = (ResultSetContainer) resultMap.get("Types");
            for (int i = 0; i < typeRsc.size(); i++) {
                int dataTypeId = Integer.parseInt(typeRsc.getItem(i, "data_type_id").toString());
                new DataType(
                        dataTypeId,
                        typeRsc.getItem(i, "data_type_desc").toString(),
                        (HashMap) mappings.get(new Integer(dataTypeId)));
            }
            hasBeenInitialized = true;
        }
    }
}
