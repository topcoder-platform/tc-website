package com.topcoder.web.ejb.country;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.topcoder.shared.util.logging.Logger;

/**
 * Country manager implementation
 * 
 * @author djFD molc@mail.ru<br>
 */
public class CountryMgrBean implements SessionBean {
	private static final Logger log = Logger.getLogger(CountryMgrBean.class);
	private static final String dataSourceName = "CORP_OLTP";
	
    private SessionContext context;

	/**
	 * corresponding method to CountryMgrHome.create()
	 */    
	public void ejbCreate() {
	}

	/**
	 * @see javax.ejb.SessionBean#ejbActivate()
	 */
	public void ejbActivate() throws EJBException, RemoteException { }

	/**
	 * @see javax.ejb.SessionBean#ejbPassivate()
	 */
	public void ejbPassivate() throws EJBException, RemoteException { }

	/**
	 * @see javax.ejb.SessionBean#ejbRemove()
	 */
	public void ejbRemove() throws EJBException, RemoteException { }

	/**
	 * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
	 */
	public void setSessionContext(SessionContext ctx)
	throws EJBException, RemoteException
	{
		context = ctx;
	}

	/**
	 * Helper method to close opened contexts, prepared statements, connections
	 * 
	 * @param ic
	 */
	private void closeItems(InitialContext ic, PreparedStatement pstmt, Connection c) {
		if( ic != null ) {
			try {
				ic.close();
			}
			catch(NamingException ne) {
				log.error("Cant close initial context");
			}
		}
		if( pstmt != null ) {
			try {
				pstmt.close();
			}
			catch(SQLException sqle) {
				log.error("Cant close prepared sql statement");
			}
		}
		if( c != null ) {
			try {
				c.close();
			}
			catch(SQLException sqle) {
				log.error("Cant close db connection");
			}
		}
	}
    
	/**
	 * @see com.topcoder.web.ejb.country.CountryMgr#create(java.lang.String, java.lang.String)
	 */
	public Country create(String countryCode, String countryName)
	throws RemoteException, EJBException
	{
		log.debug("create [" + countryCode + ", " + countryName + "]");

		PreparedStatement pstmt = null;
		Connection conn = null;
		InitialContext ic = null;
		DataSource ds = null;

		try {
			ic = new InitialContext();
            log.debug("user transaction "+ic.lookup("javax/transaction/UserTransaction"));
			ds = (DataSource)ic.lookup(dataSourceName);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("insert into country(country_code, country_name) values (?, ?)");
			pstmt.setString(1, countryCode);
			pstmt.setString(2, countryName);
			int rc = pstmt.executeUpdate();
		}
		catch(SQLException sqle) {
            sqle.printStackTrace();
			throw new EJBException(sqle.getMessage());
		}
		catch(NamingException ne) {
            ne.printStackTrace();
			throw new EJBException(ne.getMessage());
		}
		finally {
			closeItems(ic, pstmt, conn);
		}
		return new CountryImpl(countryCode, countryName);
	}

	

	/**
	 * Prepares array of countries to be returned
	 * 
	 * @see com.topcoder.web.ejb.country.CountryMgr#listByCode(java.lang.String)
	 */
	private Country [] listIt(boolean byCode, String theKey)
	throws RemoteException, EJBException
	{
		log.debug((byCode ? "listByCode" : "listByName")+": countryCode [" + theKey + "]");

        PreparedStatement pstmt = null;
        Connection conn = null;
		InitialContext ic = null;
        DataSource ds = null;
		ResultSet rs = null;
		Vector ret = new Vector();
		
        try {
	        ic = new InitialContext();
            log.debug("user transaction "+ic.lookup("javax/transaction/UserTransaction"));
	        ds = (DataSource)ic.lookup(dataSourceName);
	        conn = ds.getConnection();
	        if( byCode ) {
		        pstmt = conn.prepareStatement("select country_code, country_name from country where country_code like ?");
	        }
	        else {
	        	pstmt = conn.prepareStatement("select country_code, country_name from country where country_name like ?");
	        }
	        pstmt.setString(1, theKey);
	        rs = pstmt.executeQuery();
	        while( rs.next() ) {
				ret.add(new CountryImpl(rs.getString(1), rs.getString(2)));
	        }
        }
        catch(SQLException sqle) {
            sqle.printStackTrace();
        	throw new EJBException(sqle.getMessage());
        }
        catch(NamingException ne) {
            ne.printStackTrace();
        	throw new EJBException(ne.getMessage());
        }
        finally {
        	closeItems(ic, pstmt, conn);
        }
        Country [] reta = new Country [ret.size()];
		return (Country [])ret.toArray(reta);
	}

	/**
	 * @see com.topcoder.web.ejb.country.CountryMgr#listByName(java.lang.String)
	 */
	public Country [] listByName(String countryName)
	throws RemoteException, EJBException {
		return listIt(false, countryName);
	}

	/**
	 * @see com.topcoder.web.ejb.country.CountryMgr#listByName(java.lang.String)
	 */
	public Country [] listByCode(String countryCode)
	throws RemoteException, EJBException
	{
		return listIt(true, countryCode);
	}
}