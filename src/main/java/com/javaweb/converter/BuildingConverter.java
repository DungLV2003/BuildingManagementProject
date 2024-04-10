package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.BuildingRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BuildingRepository buildingRepository;

    public BuildingDTO convertBuildingDTO(BuildingEntity buildingEntity){
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);

        List<RentAreaEntity> listRentAreaEntities = buildingEntity.getRentAreaEntities();

        String rentAreas = listRentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));

        buildingDTO.setRentArea(rentAreas);

        if(buildingEntity.getTypeCode() != null && !buildingEntity.getTypeCode().equals("")){
            String[] typeCodes = buildingEntity.getTypeCode().split(",");
            buildingDTO.setTypeCode(Arrays.asList(typeCodes));
        }

        return buildingDTO;
    }

    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);

        String typeCode = String.join(",", buildingDTO.getTypeCode());
        buildingEntity.setTypeCode(typeCode);

        if(!buildingDTO.getRentArea().isEmpty() && buildingDTO.getRentArea() != null){
            String[] rentAreas = buildingDTO.getRentArea().split(",");

            List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

            for(String item : rentAreas){
                item = item.trim();
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setBuildingEntity(buildingEntity);
                rentAreaEntity.setValue(Integer.parseInt(item));
                rentAreaEntities.add(rentAreaEntity);
            }

            buildingEntity.setRentAreaEntities(rentAreaEntities);
        }

        return buildingEntity;
    }
}
