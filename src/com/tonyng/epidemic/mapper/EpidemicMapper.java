package com.tonyng.epidemic.mapper;

import com.tonyng.epidemic.beans.EpidemicDetailInfo;
import com.tonyng.epidemic.beans.EpidemicInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface EpidemicMapper {
    /**
     * 保存疫情记录
     * @param epidemicInfo
     * @return
     */
    @Insert(value = "INSERT INTO epidemics(province_id,data_year,data_month,data_day,affirmed,suspected,isolated,cured,dead,user_id,input_date) " +
            "VALUES(#{provinceId},#{dataYear},#{dataMonth},#{dataDay},#{affirmed},#{suspected},#{isolated},#{cured},#{dead},#{userId},#{inputDate})")
    int saveInfo(EpidemicInfo epidemicInfo);

    @Select(value = "SELECT e1.province_id,e1.data_year,e1.data_month,e1.data_day,e1.affirmed,e1.suspected,e1.isolated,e1.cured,e1.dead,temp.province_name,temp.affirmed_total,temp.suspected_total,temp.isolated_total,temp.cured_total,temp.dead_total " +
            "FROM epidemics e1 RIGHT OUTER JOIN (SELECT e.province_id,ANY_VALUE(p.province_name) province_name,ANY_VALUE(SUM(e.affirmed)) affirmed_total,ANY_VALUE(SUM(e.suspected)) suspected_total,ANY_VALUE(SUM(e.isolated)) isolated_total,ANY_VALUE(SUM(e.cured)) cured_total,ANY_VALUE(SUM(e.dead)) dead_total " +
            "FROM epidemics e RIGHT OUTER JOIN provinces p ON e.province_id=p.province_id " +
            "GROUP BY e.province_id) temp ON e1.province_id=temp.province_id " +
            "WHERE e1.data_year=#{year} " +
            "AND e1.data_month=#{month} " +
            "AND e1.data_day=#{day} ")
    List<EpidemicDetailInfo> findLatestData(Map<String, Short> condition);
}
