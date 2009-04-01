package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.comp.Project;

import java.util.List;

/**
 * @author Cucu
 */
public interface ProjectDAO {

    public Project find(Integer id);

    public List<Project> find(Integer statusId, Integer categoryId);
}
