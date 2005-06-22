package com.topcoder.dde.submission;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.bean.IdGenException;
import com.topcoder.util.idgenerator.bean.LocalIdGen;
import com.topcoder.util.idgenerator.bean.LocalIdGenHome;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: May 7, 2003
 * Time: 12:00:18 AM
 * To change this template use Options | File Templates.
 */
public class BaseBean implements SessionBean {

    public static Connection getConnection() throws SQLException, NamingException {

        return getDataSource().getConnection();
    }

    public static DataSource getDataSource() throws NamingException {

        return (DataSource) getContext().lookup("java:comp/env/jdbc/DefaultDS");
    }

    private static Context getContext() throws NamingException {

        return new InitialContext();
    }

    static {
        try {
            IdGenerator.init(getDataSource());
        } catch (NamingException e) {
            System.err.println("Unable to initialize IdGenerator!");
            e.printStackTrace();
        } catch (IllegalStateException e) {
            //IdGenerator already initialized
        }
    }

    public void setSessionContext(SessionContext sessionContext) throws EJBException, RemoteException {
    }

    public void ejbCreate() throws CreateException {
    }

    public void ejbRemove() throws EJBException, RemoteException {
    }

    public void ejbActivate() throws EJBException, RemoteException {
    }

    public void ejbPassivate() throws EJBException, RemoteException {
    }

    public long getNewId() throws SQLException, CreateException, NamingException, IdGenException {

        Context context = new InitialContext();
        LocalIdGenHome localIdGenHome = (LocalIdGenHome) context.lookup(LocalIdGenHome.EJB_REF_NAME);
        LocalIdGen localIdGen = localIdGenHome.create();
        long id = localIdGen.nextId();
        return id;
    }
}
