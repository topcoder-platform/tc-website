package	com.topcoder.web.TCES.ejb;

import	java.sql.Connection;
import	java.sql.PreparedStatement;
import	java.sql.Statement;
import	java.sql.SQLException;
import	java.sql.ResultSet;
import	java.rmi.RemoteException;
import	java.io.ByteArrayInputStream;
import	java.io.InputStream;
import	java.io.IOException;
import	java.sql.Date;
import	java.text.DecimalFormat;
import	java.util.Hashtable;
import	java.util.Vector;
import	java.util.Enumeration;
import	javax.ejb.*;
import	javax.naming.*;
import	javax.sql.DataSource;
import	com.topcoder.web.TCES.ejb.Contact;
import	com.topcoder.web.tces.common.Lookup;

/**
 * This is the implementation of the Contact class.
 * @see com.topcoder.web.TCES.ejb.Contact
 * @author Phil Selby, June 12th, 2002
 */

public class ContactBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	CoderHome	coderHome = null;
	CountryHome	countryHome = null;
	StateHome	stateHome = null;

	public Lookup getStateList() throws RemoteException, SQLException {
		State	stateBean = null;

		try {
			stateBean = stateHome.create();
			return( stateBean.listStateCodeStateName() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public Lookup getCountryList() throws RemoteException, SQLException {
		Country	countryBean = null;

		try {
			countryBean = countryHome.create();
			return( countryBean.listCountryCodeCountryName() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void ejbCreate() {
		try {
			Context	context = new InitialContext();
			coderHome = (CoderHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.Coder" );
			countryHome = (CountryHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.Country" );
			stateHome = (StateHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.State" );
		}
		catch( NamingException e ) {
			throw new EJBException( e );
		}
	}

	public void ejbRemove() {
		coderHome = null;
		countryHome = null;
		stateHome = null;
	}

	public void setSessionContext( SessionContext context ) {
		this.context = context;
	}

	public void ejbActivate() {
	}

	public void ejbPassivate() {
	}
}
