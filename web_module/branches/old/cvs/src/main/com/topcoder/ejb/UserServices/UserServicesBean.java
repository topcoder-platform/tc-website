package com.topcoder.ejb.UserServices;

import java.sql.*;
import javax.naming.*;
import javax.ejb.*;
import java.util.*;
import java.rmi.RemoteException;
import com.topcoder.common.web.data.*;
import com.topcoder.common.*;


public class UserServicesBean implements EntityBean  {


  protected EntityContext ctx; 
  protected Properties props;
  protected User user;
  final static boolean VERBOSE = false;


  ///////////////////////////////////////////////////////////////           
  public UserServicesBean ()  {  }
  ///////////////////////////////////////////////////////////////           
     
                      
  ///////////////////////////////////////////////////////////////           
  public User getUser () throws RemoteException {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:getUser() called ...");
    return this.user;
  }
 
       
  ///////////////////////////////////////////////////////////////           
  public void setUser ( User user ) throws RemoteException  {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:setUser(Coder) called ...\n");
    try{
      this.user = user;
    } catch (Exception ex) {
      throw new RemoteException("ejb.User.UserServicesBean:setUser:failed:\n", ex);
    }
  }
    




     //
     //  Private methods
     //
 

  ///////////////////////////////////////////////////////////////           
  private void activate ( User user ) throws RemoteException  {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:activate(User) called...\n");
    user.setStatus ( "A" );
    setUser ( user );
  }
 
  
  ///////////////////////////////////////////////////////////////           
  private void inactivate ( User user ) throws RemoteException {
  ///////////////////////////////////////////////////////////////           
    if (VERBOSE) System.out.println("ejb.User.UserServicesBean:inactivate(User) called...\n");
    user.setStatus ( "I" ); 
    setUser ( user );
  }

  



     // 
     //  EJB-required methods 
     // 
  
    
  /** 
  * This process is called activation, and it indicates that the container is associating the bean 
  * with a specific EJB object and a specific primary key. 
  */
  ///////////////////////////////////////////////////////////////           
  public void ejbActivate () throws RemoteException  { 
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:ejbActivate() called...");
  }


  /**
  *  The passivate method is called by the container.  It releases held resources 
  *  for in order to disassociate the bean from a specific EJB object and a specific primary key.
  */
  ///////////////////////////////////////////////////////////////           
  public void ejbPassivate () throws RemoteException  {  
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:ejbPassivate() called... ");
  }


  /**
  *   Sets coder to inactive based on a status flag.
  */
  ///////////////////////////////////////////////////////////////           
  public void ejbRemove () throws RemoteException {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:ejbRemove() called...");
    Integer pk = new Integer(0);
    try {
      pk = (Integer) ctx.getPrimaryKey();
      UserDb.inactivateUser ( pk.intValue() );
    } catch (Exception ex) {
      throw new RemoteException("ejb.User.UserServicesBean:ejbRemove:"+pk.intValue()+":failed:\n", ex);
    }
  }
 
 
  /**
  *  The ejbLoad method is called by the container.  It updates the in-memory entity
  *  bean object to reflect the current value stored in the database.
  */
  ///////////////////////////////////////////////////////////////           
  public void ejbLoad () throws RemoteException {
  ///////////////////////////////////////////////////////////////           
    Log.msg ( VERBOSE, "ejb.User.UserServicesBean:ejbLoad() called... " );
    try {
      Integer pk = (Integer) ctx.getPrimaryKey();
      User newUser = new User();
      newUser.setUserId ( pk.intValue() );
      UserDb.loadUser ( newUser );
      setUser ( newUser );
    } catch ( Exception ex ) {
      throw new RemoteException ( "ejb.User.UserServicesBean:ejbLoad:failed:\n", ex );
    }
  }

      
  /**
  *  Called from the Container.  Updates the database to reflect the current values of this
  *  in-memory entity bean instance.
  */
  ///////////////////////////////////////////////////////////////           
  public void ejbStore () throws RemoteException {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:ejbStore() called... ");
    try {
      UserDb.updateUser ( this.user );
    } catch (Exception ex) {
      throw new RemoteException("ejb.User.UserServicesBean:ejbStore:failed:\n", ex);
    }
  }

               
  /**
  *  The setEntityContext method associates this bean instance with a particular context.
  */
  ///////////////////////////////////////////////////////////////           
  public void setEntityContext ( EntityContext ctx ) throws RemoteException {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:setEntityContext() called...");
    this.ctx = ctx;
  }

         
  /**
  *  The unsetEntityContext method disassociates this bean instance with a particular
  *  context environment.
  */
  ///////////////////////////////////////////////////////////////           
  public void unsetEntityContext ()  throws RemoteException {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:unsetEntityContext() called...");
    this.ctx = null;
  }          

       
  /**
  *  Called after ejbCreate().  Now, the Bean can retrieve its EJB Object from its
  *  context, and pass it as a 'this' argument.
  */
  ///////////////////////////////////////////////////////////////           
  public void ejbPostCreate ( User user ) throws RemoteException  {  
  ///////////////////////////////////////////////////////////////           
   Log.msg(VERBOSE,"ejb.User.UserServicesBean:ejbPostCreate() called...");
  }

         
  ///////////////////////////////////////////////////////////////           
  public Integer ejbCreate ( User newUser ) throws CreateException, RemoteException  {
  ///////////////////////////////////////////////////////////////           
    Integer result = null;
    Log.msg ( VERBOSE,"ejb.User.UserServicesBean:ejbCreate() called..." );
    try {
      UserDb.insertUser ( newUser );
      setUser ( newUser );
      result = new Integer ( newUser.getUserId() );
    } catch ( Exception ex )  {
      throw new CreateException ( "ejb.User.UserServicesBean:ejbCreate():failed:\n"+ex );
    } 
    return result;
  }
  
  
  ///////////////////////////////////////////////////////////////           
  public Integer ejbFindByPrimaryKey ( Integer key ) throws FinderException, RemoteException  {
  ///////////////////////////////////////////////////////////////           
    Log.msg(VERBOSE,"ejb.User.UserServicesBean:ejbFindByPrimaryKey() called...");
    try {
      UserDb.getExistingUserId ( key );
    } catch ( Exception ex )  {
      ex.printStackTrace();
      throw new FinderException("ejb.User.UserServicesBean:ejbFindByPrimaryKey:"+key.intValue()+":failed:\n"+ex);
    } 
    return key;
  }


}
