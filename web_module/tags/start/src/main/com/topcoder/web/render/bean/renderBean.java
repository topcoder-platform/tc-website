package com.topcoder.web.render.bean;

import	java.beans.*;
import	java.util.StringTokenizer;
import	com.topcoder.web.render.ejb.*;
import	com.topcoder.common.TCContext;
import	javax.ejb.CreateException;
import	javax.naming.*;
import	java.rmi.RemoteException;
import	java.sql.SQLException;


public class renderBean implements RenderIfc {

	WebContentHome	contentHome;
	SectorFileHome	fileHome;

	public renderBean() throws NamingException {
		Object	obj = null;

		Context	ctx = TCContext.getInitial();
		obj = ctx.lookup( "com.topcoder.web.render.ejb.WebContent" );
		contentHome = (WebContentHome) javax.rmi.PortableRemoteObject.narrow( obj, WebContentHome.class );
		obj = ctx.lookup( "com.topcoder.web.render.ejb.SectorFile" );
		fileHome = (SectorFileHome) javax.rmi.PortableRemoteObject.narrow( obj, SectorFileHome.class );
	}

	public String getContent( String str ) throws RemoteException,
	  CreateException, SQLException {
		WebContent	client = contentHome.create();
		String		keys = client.findByContentName( str );
		StringTokenizer	st = new StringTokenizer( keys );
		int		key;

		if( ! st.hasMoreTokens() )
			return( null );
		try {
			key = Integer.parseInt( st.nextToken() );
		}
		catch( NumberFormatException e ) {
			return( null );
		}
		return( client.getContent( new Integer( key ) ).toString() );
	}

	public String getFileURL( int sectorId ) throws RemoteException,
	CreateException, SQLException {
		return( fileHome.create().getLink( new Integer( sectorId ) ) );
	}
}
