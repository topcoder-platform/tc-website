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

    public static void main(String[] args) {
        int round = -1;
        String fileName = "out.txt";
        StringBuffer query = null;

        if (args.length < 1 || args.length > 2) {
            System.out.println(usage);
        } else {
            try {
                round = Integer.parseInt(args[0]);
            } catch (Exception e) {
                System.out.println("gimme a real number, fool!");
                System.exit(1);
            }
            if (args[1] != null && args[1].length() > 0) {
                fileName = args[1];
            }
        }

        query = new StringBuffer(500); 
        query.append(    " SELECT u.handle ");
        query.append(         " , p.name ");
        query.append(         " , cs.points ");
        query.append(         " , csl.status_desc ");
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
        query.append(      " FROM component_state cs ");
        query.append(         " , user u ");
        query.append(         " , problem p ");
        query.append(         " , component c ");
        query.append(         " , component_status_lu csl ");
        query.append(     " WHERE cs.coder_id = u.user_id ");
        query.append(       " AND c.problem_id = p.problem_id ");
        query.append(       " AND cs.component_id = c.component_id ");
        query.append(       " AND cs.status_id = csl.component_status_id ");
        query.append(       " AND cs.status_id in (150, 160) ");
        query.append(       " AND cs.round_id = " + round);
        query.append(     " ORDER BY handle");

        QueryRequest qr = null;
        DataAccessInt dai = null;
        Map resultMap = null;

        try {
            qr = new QueryRequest();
            qr.addQuery("Data", query.toString());
                                
            dai = new QueryDataAccess((javax.sql.DataSource)TCContext.getInitial().lookup(DBMS.OLTP_DATASOURCE_NAME));
            resultMap = dai.getData(qr);
       
            ResultSetContainer mapRsc = (ResultSetContainer)resultMap.get("Data");
 
            PrintWriter writer = new PrintWriter(new FileOutputStream(fileName));
            writer.print(mapRsc.toString(rowDelim, colDelim));

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    
        System.exit(0);
    }

}
