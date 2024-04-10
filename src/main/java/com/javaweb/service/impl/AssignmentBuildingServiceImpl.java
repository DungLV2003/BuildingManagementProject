package com.javaweb.service.impl;

import com.javaweb.converter.AssignmentBuildingConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {

    @Autowired
    private BuildingService buildingService;

    @Autowired
    AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private AssignmentBuildingConverter assignmentBuildingConverter;

    @Override
    @Transactional
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<AssignmentBuildingEntity> assignmentBuildingEntityList = assignmentBuildingConverter.toAssignmentBuildingEntity(assignmentBuildingDTO);
        assignmentBuildingRepository.deleteAssignmentBuilding(assignmentBuildingDTO.getBuildingId());
        if(!assignmentBuildingEntityList.isEmpty()){
            for(AssignmentBuildingEntity assignmentBuildingEntity : assignmentBuildingEntityList){
                assignmentBuildingRepository.saveAndFlush(assignmentBuildingEntity);
            }
        }
    }
}
