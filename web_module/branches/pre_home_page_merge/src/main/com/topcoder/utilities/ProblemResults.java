package com.topcoder.utilities;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;

import java.util.*;
import java.io.*;

public class ProblemResults {
    private static final String usage = "usage: ProblemResults <round_id> <file_name>";
    private static final String colDelim = "|";
    private static final String rowDelim = "\n";
    private static final int FAILED = 160;
    private static final int PASSED = 150;

    public static void main(String[] args) {
        int round = -1;
        String fileName = "out.txt";

        if (args.length < 1 || args.length > 2) {
            System.out.println(usage);
        } else {
            try {
                round = Integer.parseInt(args[0]);
            } catch (Exception e) {
                System.out.println("gimme a real number, fool!");
                System.exit(1);
            }
            if (args.length > 1 && args[1] != null && args[1].length() > 0) {
                fileName = args[1];
            }
        }

        QueryRequest qr = null;
        DataAccessInt dai = null;
        Map resultMap = null;

        try {
            qr = new QueryRequest();
            qr.addQuery("PassedData", getQuery(PASSED, round));
            qr.addQuery("FailedData", getQuery(FAILED, round));
            dai = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            resultMap = dai.getData(qr);
            ResultSetContainer mapRsc = (ResultSetContainer)resultMap.get("PassedData");
            System.out.println("************************************************************************************");
            System.out.println("********************************PASSED**********************************************");
            System.out.println("************************************************************************************");
            System.out.println(mapRsc.toString(rowDelim, colDelim));
            System.out.println("************************************************************************************");
            System.out.println("********************************FAILED**********************************************");
            System.out.println("************************************************************************************");
            PrintWriter writer = new PrintWriter(new FileOutputStream(fileName));
            writer.print(mapRsc.toString(rowDelim, colDelim));
            mapRsc = (ResultSetContainer)resultMap.get("FailedData");
            writer.print(mapRsc.toString(rowDelim, colDelim));
            System.out.println(mapRsc.toString(rowDelim, colDelim));

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    
        System.exit(0);
    }


    private static String getQuery(int status, int round) { 
        StringBuffer query = new StringBuffer(500);
        query.append(    " SELECT u.handle ");
        query.append(         " , p.name ");
        query.append(         " , cs.points ");
        query.append(         " , csl.status_desc ");
        if (status == FAILED) {
            query.append(         " ,(SELECT stc.args ");
            query.append(             " FROM system_test_result str ");
            query.append(                " , system_test_case stc ");
            query.append(            " WHERE str.component_id = stc.component_id ");
            query.append(              " AND str.test_case_id = stc.test_case_id ");
            query.append(              " AND stc.component_id = stc.component_id ");
            query.append(              " AND str.coder_id = cs.coder_id ");
            query.append(              " AND str.round_id = cs.round_id ");
            query.append(              " AND str.component_id = cs.component_id ");
            query.append(              " AND succeeded = 0) AS args ");
            query.append(         " ,(SELECT stc.expected_result ");
            query.append(             " FROM system_test_result str ");
            query.append(                " , system_test_case stc ");
            query.append(            " WHERE str.component_id = stc.component_id ");
            query.append(              " AND str.test_case_id = stc.test_case_id ");
            query.append(              " AND stc.component_id = stc.component_id ");
            query.append(              " AND str.coder_id = cs.coder_id ");
            query.append(              " AND str.round_id = cs.round_id ");
            query.append(              " AND str.component_id = cs.component_id ");
            query.append(              " AND succeeded = 0) AS expected ");
            query.append(         " ,(SELECT str.received ");
            query.append(             " FROM system_test_result str ");
            query.append(                " , system_test_case stc ");
            query.append(            " WHERE str.component_id = stc.component_id ");
            query.append(              " AND str.test_case_id = stc.test_case_id ");
            query.append(              " AND stc.component_id = stc.component_id ");
            query.append(              " AND str.coder_id = cs.coder_id ");
            query.append(              " AND str.round_id = cs.round_id ");
            query.append(              " AND str.component_id = cs.component_id ");
            query.append(              " AND succeeded = 0) AS received ");
        } else {
            query.append(     " , '' AS args ");
            query.append(     " , '' AS expected ");
            query.append(     " , '' AS received ");
        }
        query.append(      " FROM component_state cs ");
        query.append(         " , user u ");
        query.append(         " , problem p ");
        query.append(         " , component c ");
        query.append(         " , component_status_lu csl ");
        query.append(     " WHERE cs.coder_id = u.user_id ");
        query.append(       " AND c.problem_id = p.problem_id ");
        query.append(       " AND cs.component_id = c.component_id ");
        query.append(       " AND cs.status_id = csl.component_status_id ");
        query.append(       " AND cs.status_id = " + status);
        query.append(       " AND cs.round_id = " + round);
        query.append(     " ORDER BY handle");
        return query.toString();
    }
}
