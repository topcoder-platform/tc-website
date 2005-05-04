package com.topcoder.util.idgenerator.bean;

import java.sql.SQLException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.DB;

/**
 * The bean implementation for the id generator bean.  
 * 
 * @version 1.0  
 * @author Timur Zambalayev
 */ 
public class IdGenBean implements SessionBean {

    /**
     * A default constructor.
     */ 
    public IdGenBean() {
    }
    
    /**
     * No-op method required by the SessionBean interface. 
     * 
     * @param sessionContext    a SessionContext interface for the instance.
     */ 
    public void setSessionContext(SessionContext sessionContext) {
    }

    /**
     * No-op method required by the SessionBean interface.
     */ 
    public void ejbRemove() {
    }

    /**
     * No-op method required by the SessionBean interface.
     */ 
    public void ejbActivate() {
    }

    /**
     * No-op method required by the SessionBean interface.
     */ 
    public void ejbPassivate() {
    }

    /**
     * The method is called when the instance is being created. 
     * 
     * @throws IdGenException   if there is an id generator problem.
     */ 
    public void ejbCreate() throws IdGenException {
        synchronized (IdGenerator.class) {
            if (!IdGenerator.isInitialized()) {
                try {
                    Context context=new InitialContext();
                    DataSource dataSource=(DataSource) context.lookup("java:comp/env/jdbc/DefaultDS");
                    String dbClassName=(String) context.lookup("java:comp/env/DBClassName");
                    DB db=(DB) (Class.forName(dbClassName)).newInstance();
                    String tableName=(String) context.lookup("java:comp/env/tableName");
                    String userDefColumnName=(String) context.lookup("java:comp/env/userDefColumnName");
                    String highValueColumnName=(String) context.lookup("java:comp/env/highValueColumnName");
                    long maxHi=((Long) context.lookup("java:comp/env/maxHi")).longValue();
                    int maxLo=((Integer) context.lookup("java:comp/env/maxLo")).intValue();
                    boolean autoInit=((Boolean) context.lookup("java:comp/env/autoInit")).booleanValue();
                    IdGenerator.init(db, dataSource, tableName, userDefColumnName, highValueColumnName, maxHi, maxLo, autoInit);
                } catch (NamingException e) {
                    throw new IdGenException(""+e);
                } catch (InstantiationException e) {
                    throw new IdGenException(""+e);
                } catch (IllegalAccessException e) {
                    throw new IdGenException(""+e);
                } catch (ClassNotFoundException e) {
                    throw new IdGenException(""+e);
                }
            }
        }
    }

    /**
     * Returns the next id.
     *  
     * @return the next id.
     * @throws SQLException     if a database access error occurs.
     */ 
    public long nextId() throws SQLException {
        return IdGenerator.nextId();
    }

    /**
     * Returns the next id for the given table id.
     *  
     * @param tableId           the table/sequence name. 
     * @return the next id.
     * @throws SQLException     if a database access error occurs.
     */ 
    public long nextId(String tableId) throws SQLException {
        return IdGenerator.nextId(tableId);
    }
}
