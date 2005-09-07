package com.topcoder.ejb.UserServices;

import com.topcoder.common.web.data.User;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.*;
import java.util.Properties;


public class UserServicesBean implements EntityBean {


    protected EntityContext ctx;
    protected Properties props;
    protected User user;
    private static final Logger log = Logger.getLogger(UserServicesBean.class);

    public UserServicesBean() {
    }


    public User getUser() {
        return this.user;
    }


    public void setUser(User user) {
        try {
            this.user = user;
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }





    //
    //  Private methods
    //


    private void activate(User user) {
        user.setStatus("A");
        setUser(user);
    }


    private void inactivate(User user) {
        log.debug("ejb.User.UserServicesBean:inactivate(User) called...\n");
        user.setStatus("I");
        setUser(user);
    }





    //
    //  EJB-required methods
    //


    /**
     * This process is called activation, and it indicates that the container is associating the bean
     * with a specific EJB object and a specific primary key.
     */
    public void ejbActivate() {
    }


    /**
     *  The passivate method is called by the container.  It releases held resources
     *  for in order to disassociate the bean from a specific EJB object and a specific primary key.
     */
    public void ejbPassivate() {
    }


    /**
     *   Sets coder to inactive based on a status flag.
     */
    public void ejbRemove() {
        Long pk = new Long(0);
        try {
            pk = (Long) ctx.getPrimaryKey();
            UserDb.inactivateUser(pk.intValue());
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }


    /**
     *  The ejbLoad method is called by the container.  It updates the in-memory entity
     *  bean object to reflect the current value stored in the database.
     */
    public void ejbLoad() {
        try {
            log.debug("UserServicesBean.ejbLoad called...");
            Long pk = (Long) ctx.getPrimaryKey();
            User newUser = new User();
            newUser.setUserId(pk.longValue());
            UserDb.loadUser(newUser);
            setUser(newUser);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }


    /**
     *  Called from the Container.  Updates the database to reflect the current values of this
     *  in-memory entity bean instance.
     */
    public void ejbStore() {
        try {
            log.debug("UserServicesBean.ejbStore called...");
            UserDb.updateUser(this.user);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }


    /**
     *  The setEntityContext method associates this bean instance with a particular context.
     */
    public void setEntityContext(EntityContext ctx) {
        this.ctx = ctx;
    }


    /**
     *  The unsetEntityContext method disassociates this bean instance with a particular
     *  context environment.
     */
    public void unsetEntityContext() {
        this.ctx = null;
    }


    /**
     *  Called after ejbCreate().  Now, the Bean can retrieve its EJB Object from its
     *  context, and pass it as a 'this' argument.
     */
    public void ejbPostCreate(User user) {
    }


    public Long ejbCreate(User newUser) throws CreateException {
        Long result = null;
        try {
            UserDb.insertUser(newUser);
            setUser(newUser);
            result = new Long(newUser.getUserId());
        } catch (Exception ex) {
            throw new CreateException("ejbCreate():failed:\n" + ex);
        }
        return result;
    }


    public Long ejbFindByPrimaryKey(Long key) throws FinderException {
        try {
            UserDb.getExistingUserId(key);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new FinderException("ejbFindByPrimaryKey:" + key + ":failed:\n" + ex);
        }
        return key;
    }


}
