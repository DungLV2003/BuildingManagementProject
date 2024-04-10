package com.javaweb.service.impl;

import com.javaweb.converter.AssignmentBuildingConverter;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private AssignmentBuildingConverter assignmentBuildingConverter;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Override
    public ResponseDTO listStaff(Long buildingId) {
        ResponseDTO responseDTO = new ResponseDTO();

        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");

        List<AssignmentBuildingEntity> assignBuildingEntities = buildingEntity.getAssignBuildingEntities();

        List<UserEntity> staffAssginment = new ArrayList<>();

        for(AssignmentBuildingEntity it : assignBuildingEntities){
            staffAssginment.add(it.getUserEntity());
        }

        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();

        for(UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssginment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<ResponseDTO> typeCodes(List<String> typeCode) {
        List<ResponseDTO> result = new ArrayList<>();

        for(Map.Entry<String, String> it : TypeCode.type().entrySet()){
            ResponseDTO responseDTO = new ResponseDTO();
            if(typeCode != null && typeCode.contains(it.getKey())){
                responseDTO.setData(it);
                responseDTO.setMessage("checked");
            }
            else{
                responseDTO.setData(it);
                responseDTO.setMessage("");
            }
            result.add(responseDTO);
        }

        return result;
    }

    @Override
    public List<BuildingSearchResponse> searchBuilding(BuildingSearchRequest buildingSearchRequest) {

        List<BuildingEntity> buildingEntities = buildingRepository.searchBuilding(buildingSearchRequest);

        List<BuildingSearchResponse> result = new ArrayList<>();

        for(BuildingEntity it : buildingEntities){
            BuildingSearchResponse buildingSearchResponse = buildingSearchResponseConverter.toBuildingSearchResponse(it);
            result.add(buildingSearchResponse);
        }

        return result;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();

        BuildingDTO buildingDTO = buildingConverter.convertBuildingDTO(buildingEntity);

        return buildingDTO;
    }

    @Override
    public BuildingEntity getById(Long id) {
        return buildingRepository.findById(id).get();
    }

    @Override
    public void save(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        buildingRepository.save(buildingEntity);
        if(buildingEntity.getId() > 0) rentAreaRepository.deleteRentAreaEntitiesByBuildingEntity(buildingEntity);
        rentAreaRepository.saveAll(buildingEntity.getRentAreaEntities());
    }

    @Override
    public void deleteBuildingByIds(List<Long> ids) {
        for(Long id : ids){
            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
            rentAreaRepository.deleteRentAreaEntitiesByBuildingEntity(buildingEntity);
            assignmentBuildingRepository.deleteAssignmentBuildingEntityByBuildingEntity(buildingEntity);
            buildingRepository.deleteById(id);
        }
    }

}
