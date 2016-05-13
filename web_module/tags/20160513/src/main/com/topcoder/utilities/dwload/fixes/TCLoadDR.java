package com.topcoder.utilities.dwload.fixes;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.GregorianCalendar;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.dwload.TCLoadTCS;

/**
 * Does a full load of the Digital Run related tables.
 * 
 * @author Cucu
 *
 */
public class TCLoadDR extends TCLoadTCS {
    
    private static Logger log = Logger.getLogger(TCLoadTCS.class);
    
    @Override
    public void performLoad() throws Exception {

        log.info("Full load of Digital Run");
        
        try {            
            // Reload project results after 4 may
            fLastLogTime = new Timestamp(new GregorianCalendar(2007,4,4).getTime().getTime());

            doLoadProjectResults();
            
            fLastLogTime = new Timestamp(new GregorianCalendar(1980,0,1).getTime().getTime());
            doLoadSeason();
            
            doLoadStage();
            
            doLoadStageResults();
            
//            doLoadSeasonResults();
            
            doClearCache();

            log.info("Digital Run succesfully loaded!");
            
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
