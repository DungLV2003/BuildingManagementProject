package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BuildingService {

    ResponseDTO listStaff(Long buildingId);

    List<ResponseDTO> typeCodes(List<String> typeCode);

    List<BuildingSearchResponse> searchBuilding(BuildingSearchRequest buildingSearchRequest);

    BuildingDTO findById(Long id);

    BuildingEntity getById(Long id);

    void save(BuildingDTO buildingDTO);

    void deleteBuildingByIds(List<Long> ids);


}
