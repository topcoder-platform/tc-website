package com.topcoder.utilities;

import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import java.util.Map;
import java.util.Iterator;
import java.util.TreeSet;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 19, 2005
 */
public class HandleChars {
    public static void main(String[] args) {
        try {
            String query = "select handle from user";
            QueryRequest qr = new QueryRequest();
            qr.addQuery("handles", query);
            QueryDataAccess da = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Map m = da.getData(qr);
            ResultSetContainer rsc = (ResultSetContainer)m.get("handles");
            TreeSet set = new TreeSet();
            String handle = null;
            ResultSetContainer.ResultSetRow row = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                handle = row.getStringItem("handle");
                for (int i=0; i<handle.length(); i++) {
                    set.add(new Character(handle.charAt(i)));
                }
            }

            for (Iterator it = set.iterator(); it.hasNext();) {
                Character ch = (Character)it.next();
                if (ch.charValue()>127) {
                    System.out.print("[\\u"+(int)ch.charValue()+"]");
                } else {
                    System.out.print(ch.toString());
                }
                System.out.println("");

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

}
