import java.util.*;
import com.topcoder.web.stat.bean.*;
import com.topcoder.web.stat.common.*;

/**
 * This program is used to unit test the data retrieval bean
 * and statistics EJB component.  <p> 
 * 
 * To run this program, you will need to determine several 
 * pieces of information.
 * <li> Which command you want to run.  This should be one of 
 * the entries in the command.command_desc column.
 * <li> What inputs the various queries executed by this 
 * command need.  These can be identified with the
 * following SQL statement: <p>
 * SELECT i.input_code, <br>
 * qi.optional, <br>
 * i.data_type_id, <br>
 * qi.default_value, <br>
 * qi.query_id <br>
 * FROM command c, command_query_xref cqx, input_lu i, query_input qi <br>
 * WHERE c.command_desc = ? <br>
 * AND cqx.command_id = c.command_id <br>
 * AND cqx.query_id = qi.query_id <br>
 * AND qi.input_id = i.input_id <p>
 * 
 * where ? represents the command you identified above.  Any inputs 
 * which do not have an optional flag of "Y" are required
 * and must be passed in as arguments.  See the <tt>StatisticsQueries</tt>
 * class for an explanation of the input data type ID's.
 * <li> Valid values for the required inputs found above.  These
 * must be determined by examination of the data in the data
 * warehouse. <p>
 * <li> The name of the result table you wish to have printed out
 * when the data is retrieved.  Each query executed by your selected
 * command will have a corresponding result table, which is named 
 * with the value of the query.name column for that particular query.
 * 
 * <p> Once you have collected the above information, you can run
 * the program with the following command: <p>
 * 
 * java BeanTest c=&lt;command_desc&gt; (input_code=value)* &lt;result_table_name&gt; <p>
 *
 * For example, round statistics for the most recent round can be
 * retrieved with: <p>
 *
 * java BeanTest c=round_stats "Round Statistics Data" <p>
 *
 * while NDBronson's member profile can be retrieved with: <p>
 *
 * java BeanTest c=member_profile cr=152073 "Coder Data" <p>
 *
 * Upon execution, the program will print out data and elapsed time if 
 * everything executed successfully, report "no container found" indicating
 * that data was retrieved successfully but no result table with the
 * indicated name exists, or print an exception stack trace.
 *
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 */

public class BeanTest {
    private void test(String args[]) {
        DataRetrievalBean drb = new DataRetrievalBean();
        HashMap hm = new HashMap(), resultMap = null;
        for (int i=0; i<args.length-1; i++) {
            String key = args[i].substring(0,args[i].indexOf("="));
            String value = args[i].substring(args[i].indexOf("=")+1);
            hm.put(key,value);
        }
        long startTime = System.currentTimeMillis();
        try {
            resultMap = (HashMap) drb.getData(new StatRequestBean(hm));
            ResultSetContainer rsc = (ResultSetContainer) resultMap.get(args[args.length-1]);
            if (rsc == null) {
                System.out.println("Ouch!  No container found.");
            } else {
                System.out.println("Success ... " + rsc.getRowCount() + " rows returned");
                long endTime = System.currentTimeMillis();
                for (int i=0; i<rsc.getRowCount(); i++) {
                    for (int j=0; j<rsc.getColumnCount(); j++) {
                        System.out.print(rsc.getItem(i,j).toString() + ",");
                    }
                    System.out.println();
                }
                System.out.println("Elapsed time before printing data (ms): " + (endTime - startTime));
            }
        } catch (Exception e) {
            System.out.println("Ouch!  Caught an exception");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
        BeanTest bt = new BeanTest();
        bt.test(args);
    }
}

