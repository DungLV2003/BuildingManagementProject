package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BuildingRepositoryCustom {
    List<BuildingEntity> searchBuilding(BuildingSearchRequest buildingSearchRequest);

}
