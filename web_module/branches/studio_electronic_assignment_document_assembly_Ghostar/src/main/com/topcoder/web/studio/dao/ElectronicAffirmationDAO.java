package com.topcoder.web.studio.dao;

import java.util.List;

import com.topcoder.web.studio.model.ElectronicAffirmation;

/**
 * DAO define class
 * @author Vitta
 */
public interface ElectronicAffirmationDAO {
	void saveOrUpdate(ElectronicAffirmation entity);
    ElectronicAffirmation find(Integer id);
}
