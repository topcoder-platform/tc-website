package com.topcoder.web.ejb.idgeneratorclient;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * The Client which uses the IdGenerator component to generate
 * an long sequence id for any sequence name in the Screening Database
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$
 *          Dec 23, 2002 6:44:37 PM
 */
public class IdGeneratorClient {

    private static Logger log = Logger.getLogger(IdGeneratorClient.class);


    /**
     * Uses the IdGenerator class to retrieve a sequence value for the
     * sequence name given. Will initialize the IdGenerator if not initialized
     * yet.
     *
     * @param seqName
     * @return The next sequence val. -1 if there is an exception thrown
     *         or other error retrieving the sequence id.
     */

    public static long getSeqId(String seqName) throws SQLException, NamingException {
        log.debug("getSeqId(String) called");
        return getSeqId(seqName, DBMS.COMMON_OLTP_DATASOURCE_NAME);
    }

    public static long getSeqId(String seqName, String dataSourceName) throws NamingException, SQLException {
        log.debug("getSeqId(String, String) called");
        long retVal = -1;
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();
            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(),
                        (DataSource) ctx.lookup(dataSourceName),
                        "sequence_object",
                        "name",
                        "current_value",
                        9999999999L,
                        1,
                        true);
            }
            retVal = IdGenerator.nextId(seqName);
        } finally {
            TCContext.close(ctx);
        }
        //System.out.println("retVal = " + retVal);
        return retVal;
    }

}