package com.topcoder.common.web.util;

import com.topcoder.common.web.data.Contest;
import com.topcoder.common.web.data.Modifiable;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

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
