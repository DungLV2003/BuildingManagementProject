package com.javaweb.repository.custom;

import org.springframework.stereotype.Repository;

@Repository
public interface AssignmentBuildingRepositoryCustom {

    void deleteAssignmentBuilding(Long buildingId);
}
