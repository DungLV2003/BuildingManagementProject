package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long staffId = buildingSearchRequest.getStaffId();

        if (staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding asb ON asb.buildingid = b.id ");
        }

    }

    public static void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {

        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();

            for (Field item : fields) {
                item.setAccessible(true);
                String name = item.getName();

                if (!name.equals("staffId") && !name.equals("typeCode")
                        && !name.startsWith("area") && !name.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchRequest);
                    if (value != null && !value.equals("")) {
                        if (item.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND b." + name + " = " + value + " ");
                        } else {
                            where.append(" AND b." + name + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            where.append(" AND asb.staffid = " + staffId);
        }

        Long rentAreaTo = buildingSearchRequest.getAreaTo();
        Long rentAreaFrom = buildingSearchRequest.getAreaFrom();

        if(rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea ra WHERE b.id = ra.buildingid ");

            if (rentAreaFrom != null) {
                where.append(" AND ra.value >= " + rentAreaFrom + " ");
            }
            if (rentAreaTo != null) {
                where.append(" AND ra.value <= " + rentAreaTo + " ");
            }

            where.append(" ) ");
        }

        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();

        if (rentPriceFrom != null || rentPriceTo != null) {

            if (rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom + " ");
            }
            if (rentPriceTo != null) {
                where.append(" AND b.rentprice <= " + rentPriceTo + " ");
            }

        }

        if (buildingSearchRequest.getTypeCode() != null && !buildingSearchRequest.getTypeCode().isEmpty()) {

            where.append(" AND (");
            String sql = buildingSearchRequest.getTypeCode().stream().map(it -> "b.type LIKE " + "'%" + it + "%' ")
                    .collect(Collectors.joining(" OR "));
            where.append(sql + " ) ");
        }
    }

    @Override
    public List<BuildingEntity> searchBuilding(BuildingSearchRequest buildingSearchRequest) {

        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");

        joinTable(buildingSearchRequest, sql);

        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);

        where.append(" GROUP BY b.id;");

        sql.append(where);

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList();
    }

}
