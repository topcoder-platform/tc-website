package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.util.idgenerator.bean.IdGenException;
import com.topcoder.util.idgenerator.bean.LocalIdGen;
import com.topcoder.util.idgenerator.bean.LocalIdGenHome;

import javax.ejb.CreateException;
import javax.ejb.EntityBean;
import javax.ejb.EntityContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.SQLException;

/**
 * The base class for the DDE entity bean implementations.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
abstract class DDEBaseEntityBean implements EntityBean {

    /**
     * Creates a new instance.
     */
    DDEBaseEntityBean() {
    }

    public final void setEntityContext(EntityContext entityContext) {
    }

    public final void unsetEntityContext() {
    }

    public final void ejbStore() {
    }

    public final void ejbLoad() {
    }

    public final void ejbActivate() {
    }

    public final void ejbPassivate() {
    }

    public final void ejbRemove() {
    }

    /**
     * Gets the id (primary key).
     *
     * @return id.
     */
    public abstract Long getId();

    /**
     * Sets the id (primary key).
     *
     * @param id    id (primary key).
     */
    public abstract void setId(Long id);

    private long getNewPrimaryKey() throws CreateException {
        try {
            Context context = new InitialContext();
            LocalIdGenHome localIdGenHome = (LocalIdGenHome) context.lookup(LocalIdGenHome.EJB_REF_NAME);
            LocalIdGen localIdGen = localIdGenHome.create();
            long id = localIdGen.nextId();
            return id;
        } catch (NamingException e) {
            throw new CreateException("" + e);
        } catch (IdGenException e) {
            throw new CreateException("" + e);
        } catch (SQLException e) {
            throw new CreateException("" + e);
        }
    }

    /**
     * Sets the primary key (the id generator is used).
     *
     * @throws CreateException      an application level error occurred during the create operation.
     */
    final void setPrimaryKey() throws CreateException {
        setPrimaryKey(getNewPrimaryKey());
    }

    /**
     * Sets the primary key.
     *
     * @param id    id (primary key).
     */
    final void setPrimaryKey(long id) {
        setId(new Long(id));
    }

}
