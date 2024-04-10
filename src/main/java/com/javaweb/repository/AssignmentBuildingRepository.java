package com.javaweb.repository;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.AssignmentBuildingRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AssignmentBuildingRepository extends JpaRepository<AssignmentBuildingEntity, Long>, AssignmentBuildingRepositoryCustom {

    void deleteAssignmentBuildingEntityByBuildingEntity(BuildingEntity buildingEntity);

}
