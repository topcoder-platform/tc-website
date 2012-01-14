//////////////////////
public class notify {
//////////////////////


  /////////////////////////////////////////////////////////////////////
  public static void main ( String[] args ) {
  /////////////////////////////////////////////////////////////////////
    if ( args.length != 1 ) return;
    javax.naming.Context ctx = null;
    java.sql.Connection conn = null;
    java.sql.ResultSet rs = null;
    java.sql.PreparedStatement ps = null;
    java.util.Hashtable ht = new java.util.Hashtable();
    ht.put ( javax.naming.Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory" );
    ht.put ( javax.naming.Context.PROVIDER_URL, "t3://"+args[0]+":7030" );
    try {
      ctx = new javax.naming.InitialContext ( ht );
      javax.sql.DataSource ds = ( javax.sql.DataSource ) ctx.lookup ( "OLTP" );
      conn = ds.getConnection();
      java.sql.PreparedStatement[] insert = { 
        conn.prepareStatement("INSERT INTO coder_notify (coder_id, notify_id) VALUES ( ?, 1 )")
        ,conn.prepareStatement("INSERT INTO coder_notify (coder_id, notify_id) VALUES ( ?, 2 )")
        ,conn.prepareStatement("INSERT INTO coder_notify (coder_id, notify_id) VALUES ( ?, 3 )")
        ,conn.prepareStatement("INSERT INTO coder_notify (coder_id, notify_id) VALUES ( ?, 4 )")
        ,conn.prepareStatement("INSERT INTO coder_notify (coder_id, notify_id) VALUES ( ?, 5 )")
      };
      java.sql.PreparedStatement nonePs = conn.prepareStatement ( "INSERT INTO coder_notify (coder_id, notify_id) VALUES ( ?, 0 )" );
      java.sql.PreparedStatement del = conn.prepareStatement ( "DELETE FROM coder_notify" );
      del.executeUpdate();
      System.out.println ( "coder_notify truncated" );
      StringBuffer buf = new StringBuffer ( 300 );
      buf.append ( " SELECT");
      buf.append (   " u.user_id");
      buf.append (   " ,c.notify");
      buf.append ( " FROM");
      buf.append (   " user u");
      buf.append (   " ,coder c");
      buf.append ( " WHERE");
      buf.append (   " u.status IN ('A','U')");
      buf.append (   " AND u.user_id = c.coder_id");
      ps = conn.prepareStatement ( buf.toString() );
      rs = ps.executeQuery();
      while ( rs.next() )
      {
        int coderId = rs.getInt ( 1 );
        String notify = rs.getString ( 2 );
        if ( notify != null ) 
        {
          if ( notify.equals("Y") )
          { 
            for ( int i = 0; i < insert.length; i++ ) 
            {
              insert[i].setInt ( 1, coderId );
              insert[i].executeUpdate();
              insert[i].clearParameters();
            }
          } 
          else
          {
            nonePs.setInt ( 1, coderId );
            nonePs.executeUpdate();
            nonePs.clearParameters();
          }
        }
        System.out.print(".");
      }
      // CLOSING
      for ( int i = 0; i < insert.length; i++ ) 
      {
        insert[i].close();
      }
      nonePs.close();
    } catch ( Exception e ) {
      e.printStackTrace();
    } finally {
      if ( ps != null ) { try { ps.close(); } catch ( Exception ignore ) {}  }
      if ( rs != null ) { try { rs.close(); } catch ( Exception ignore ) {}  }
      if ( conn != null ) { try { conn.close(); } catch ( Exception ignore ) {}  }
      if ( ctx != null ) { try { ctx.close(); } catch ( Exception ignore ) {}  }
    }
  }

}

