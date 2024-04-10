package com.javaweb.controller.admin;

import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private UserService userService;

    @Autowired
    private BuildingService buildingService;

    @GetMapping("/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");

        List<BuildingSearchResponse> buildingSearchResponseList = buildingService.searchBuilding(buildingSearchRequest);

        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("buildingList", buildingSearchResponseList);
        mav.addObject("listStaff", userService.getStaffs());
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());
        return mav;
    }

    @GetMapping("/admin/building-edit")
    public ModelAndView buildingAdd(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");

        List<ResponseDTO> typeCodes = buildingService.typeCodes(buildingDTO.getTypeCode());

        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", typeCodes);
        return mav;
    }

    @GetMapping("/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");

        BuildingDTO buildingDTO = buildingService.findById(id);
        List<ResponseDTO> typeCodes = buildingService.typeCodes(buildingDTO.getTypeCode());

        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", typeCodes);
        return mav;
    }

}
