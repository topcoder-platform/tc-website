package com.topcoder.web.common.dao;

import java.io.Serializable;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 27, 2007
 */
public interface GenericDAO<T, ID extends Serializable> {

    void saveOrUpdate(T entity);

    void delete(T entity);

    T find(ID id);

    List<T> findAll();

}
