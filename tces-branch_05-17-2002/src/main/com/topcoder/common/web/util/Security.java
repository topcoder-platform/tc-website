package com.topcoder.common.web.util;

import java.util.*;
import com.topcoder.common.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.error.*;
import javax.naming.*;
import com.topcoder.ejb.AuthenticationServices.*;


public class Security {

  public static AccessLevel STAFF_ACCESS_LEVEL      = new AccessLevel(99,"Staff","S");
  public static Sector      CODER_SITE_SECTOR       = new Sector(1,"Coder Site","S");



  ///////////////////////////////////////////////////////////////
  public static void insertSectorAccess ( int sectorId, int userId, String authorized )
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Context ctx = null;
    try {
      ctx = TCContext.getInitial();
      AuthenticationServicesHome home = 
        (AuthenticationServicesHome) ctx.lookup ( ApplicationServer.AUTHENTICATION_SERVICES );
      AuthenticationServices auth = home.create();
      auth.insertSectorAccess ( sectorId, userId, authorized );
    } catch ( Exception e ) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer(1000);
      msg.append("common.web.util.Security:insertSectorAccess:ERROR:\n");
      try {
        WebPage error = new WebPage ( "Parameters"   );
        error.addTag ( new ValueTag("SectorId",sectorId)     );
        error.addTag ( new ValueTag("UserId",userId)         );
        error.addTag ( new ValueTag("Authorized",authorized) );
        msg.append ( error.getXML(2) );
      } catch ( Exception ignore ) {}
      msg.append ( e.getMessage() );
      throw new TCException ( msg.toString() );
    } finally {
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  public static void insertSectorAgreement ( int sectorId, int userId )
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Context ctx = null;
    try {
      ctx = TCContext.getInitial();
      AuthenticationServicesHome home = 
        (AuthenticationServicesHome) ctx.lookup ( ApplicationServer.AUTHENTICATION_SERVICES );
      AuthenticationServices auth = home.create();
      auth.insertSectorAgreement ( sectorId, userId );
    } catch ( Exception e ) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer(1000);
      msg.append("common.web.util.Security:insertSectorAgreement:ERROR:\n");
      try {
        WebPage error = new WebPage ( "Parameters"   );
        error.addTag ( new ValueTag("SectorId",sectorId)     );
        error.addTag ( new ValueTag("UserId",userId)         );
        msg.append ( error.getXML(2) );
      } catch ( Exception ignore ) {}
      msg.append ( e.getMessage() );
      throw new TCException ( msg.toString() );
    } finally {
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  public static boolean agreed ( int sectorId, int userId )
    throws TCException {
  ///////////////////////////////////////////////////////////////
    boolean result = false;
    Context ctx    = null;
    try {
      ctx = TCContext.getInitial();
      AuthenticationServicesHome home = 
        (AuthenticationServicesHome) ctx.lookup ( ApplicationServer.AUTHENTICATION_SERVICES );
      AuthenticationServices auth = home.create();
      result = auth.agreed ( sectorId, userId );
    } catch ( Exception e ) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer(1000);
      msg.append("common.web.util.Security:insertSectorAccess:ERROR:\n");
      try {
        WebPage error = new WebPage ( "Parameters"   );
        error.addTag ( new ValueTag("SectorId",sectorId)     );
        error.addTag ( new ValueTag("UserId",userId)         );
        msg.append ( error.getXML(2) );
      } catch ( Exception ignore ) {}
      msg.append ( e.getMessage() );
      throw new TCException ( msg.toString() );
    } finally {
      if ( ctx != null ) { try { ctx.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


  ///////////////////////////////////////////////////////////////
  public static Permission getSectorPermission (
    Sector sector, PermissionAssignee assignee
    ) throws TCException {
  ///////////////////////////////////////////////////////////////
    Permission result = new Permission();
    result.setSector ( sector );
    result.setSId ( assignee.getSId() );
    try {
      if ( isStaff(assignee) ) {
        result.setAccessLevel ( STAFF_ACCESS_LEVEL );
      } else {
        ArrayList permissions = assignee.getPermissions();
        for (int i=0; i < permissions.size(); i++) {
          Permission listPermission = (Permission) permissions.get(i);
          if (listPermission.getSector().getSectorId() == sector.getSectorId() ) {
            int listLevel = listPermission.getAccessLevel().getAccessLevelId();
            int currentLevel = result.getAccessLevel().getAccessLevelId();
            if ( listLevel > currentLevel ) {
              result.setAccessLevel( listPermission.getAccessLevel() );
            }
          }
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer(1000);
      msg.append("common.web.util.Security:getSectorPermission:ERROR:\n");
      try {
        WebPage error = new WebPage ( "Parameters" );
        error.addTag ( sector.getXML() );
        error.addTag ( assignee.getXML() );
        msg.append ( error.getXML(2) );
      } catch ( Exception ignore ) {}
      msg.append ( e.getMessage() );
      throw new TCException ( msg.toString() );
    }
    return result;
  }


  ///////////////////////////////////////////////////////////////
  public static boolean isStaff ( PermissionAssignee assignee ) {
  ///////////////////////////////////////////////////////////////
    boolean result = false;
    ArrayList groups = assignee.getGroups();
    if ( groups != null ) {
      for ( int i = 0; i < groups.size(); i++ ) {
        GroupUser groupUser = (GroupUser) groups.get(i);
        if ( groupUser.getGroup().getGroupId() == OLTP.STAFF_GROUP_ID ) {
          result = true;
          break;
        }
      }
    }
    return result;
  }


}
