package com.topcoder.utilities.dwload.fixes;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.GregorianCalendar;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.dwload.TCLoadTCS;

/**
 * Does a full load of scorecard questions.
 * Created to fix rounding problems in weights.
 * 
 * @author Cucu
 *
 */
public class TCLoadTCSScorecards extends TCLoadTCS {
    
    private static Logger log = Logger.getLogger(TCLoadTCS.class);
    
    @Override
    public void performLoad() throws Exception {
        fLastLogTime = new Timestamp(new GregorianCalendar(1980,0,1).getTime().getTime());

        log.info("Full load of scorecard questions");
        
        try { 
            // the templates are needed first
            doLoadScorecardTemplate();
            
            doLoadScorecardQuestion();
            
            doClearCache();
            
            log.info("scorecard questions succesfully loaded!");
            
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            setReasonFailed(("Load failed.\n" + sqle.getMessage()));
            throw sqle;
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            throw ex;
        }
            
    }
}
