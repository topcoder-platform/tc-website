package com.topcoder.web.corp;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.transaction.SystemException;
import javax.transaction.Transaction;
import javax.transaction.TransactionManager;

import com.topcoder.shared.util.logging.Logger;


/**
 * Helper class to be used in scope of application   
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Util {
    private static final Logger log = Logger.getLogger(Util.class);
    
    /**
     * Begins new Transaction. To give EJB to work in the managed transactional
     * environment they must have &lt;transaction-type&gt; Container&lt;
     * /transaction-type&gt; in deployment descriptor (DD) and, (optionally)
     * have per-method transactions modes set in assembly descriptor of DD.
     * 
     * @return Transaction newly started transaction
     * 
     * @throws NamingException There were some problems when trying to find
     * remote tarnsaction manager
     * @throws SystemException most probably there was failure trying to start
     * transaction in the DB
     */
    public static Transaction beginTransaction()
    throws NamingException, SystemException
    {
        InitialContext ic = null;
        try {
            ic = new InitialContext(Constants.JTA_CONTEXT_ENVIRONMENT);
            TransactionManager tm;
            tm = (TransactionManager)ic.lookup(Constants.JTA_TX_MANAGER);
            ic.close();
            return tm.getTransaction();
        }
        finally {
            closeIC(ic);
        }
    }
    
    /**
     *
     * @param ic
     */
    public static void closeIC(InitialContext ic) {
        if( ic == null ) return;
        try {
            ic.close();
        }
        catch(Exception e) {
            log.error("Can't close initial context "+ic);
        }
    }
    
}
