package com.topcoder.web.studio.dao;

import java.util.List;

import com.topcoder.web.studio.dto.Project;

/**
 * @author Cucu
 */
public interface ProjectDAO {

    public Project find(Integer id);

    public List<Project> find(Integer statusId, Integer categoryId);
}
