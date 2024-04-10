package com.javaweb.repository.custom.impl;

import com.javaweb.repository.custom.AssignmentBuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

@Repository
@Transactional
public class AssignmentBuildingRepositoryCustomImpl implements AssignmentBuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void deleteAssignmentBuilding(Long buildingId) {
        StringBuilder sql = new StringBuilder("DELETE FROM assignmentbuilding WHERE assignmentbuilding.buildingid = " + buildingId);

        Query query = entityManager.createNativeQuery(sql.toString());
        query.executeUpdate();
    }
}
