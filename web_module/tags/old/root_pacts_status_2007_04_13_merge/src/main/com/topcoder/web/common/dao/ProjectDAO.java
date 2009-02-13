package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.comp.Project;

/**
 * 
 * @author Cucu
 */
public interface ProjectDAO {

    public Project find(Long id);
    
    public List<Project> find(Integer statusId, Integer categoryId);
}
