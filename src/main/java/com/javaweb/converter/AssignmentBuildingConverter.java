package com.javaweb.converter;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AssignmentBuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserConverter userConverter;

    public List<AssignmentBuildingEntity> toAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO){
        List<AssignmentBuildingEntity> assignmentBuildingEntityList = new ArrayList<>();

        if(!assignmentBuildingDTO.getStaffs().isEmpty()){
            for(Long staffId : assignmentBuildingDTO.getStaffs()){
                AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();

                BuildingEntity buildingEntity = buildingService.getById(assignmentBuildingDTO.getBuildingId());
                UserEntity userEntity = userConverter.convertToEntity(userService.findUserById(staffId));

                assignmentBuildingEntity.setBuildingEntity(buildingEntity);
                assignmentBuildingEntity.setUserEntity(userEntity);

                assignmentBuildingEntityList.add(assignmentBuildingEntity);
            }
        }

        return assignmentBuildingEntityList;
    }
}
