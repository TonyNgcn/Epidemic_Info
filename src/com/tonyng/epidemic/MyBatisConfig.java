package com.tonyng.epidemic;

import com.tonyng.epidemic.controller.UserController;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.io.IOException;

@Configuration
@MapperScan(basePackages = "com.tonyng.epidemic.mapper")
public class MyBatisConfig {

    public static Logger logger=Logger.getLogger(MyBatisConfig.class);

    //配置数据源
    @Bean(name = "dataSource",destroyMethod = "close")
    public BasicDataSource basicDataSource(){
        BasicDataSource dataSource=new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        //JDBC8.0驱动需要加时区信息?serverTimezone=GMT%2B8&useSSL=false
        dataSource.setUrl("jdbc:mysql://localhost/epidemic?serverTimezone=GMT%2B8&useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("2020");

        dataSource.setInitialSize(3);
        dataSource.setMaxTotal(50);
        dataSource.setMaxIdle(1);
        dataSource.setMaxWaitMillis(4000);
        dataSource.setDefaultAutoCommit(false);

        return dataSource;
    }

    @Bean
    public SqlSessionFactory sessionFactory(DataSource dataSource){
        SqlSessionFactoryBean factoryBean=new SqlSessionFactoryBean();
        SqlSessionFactory factory=null;

        //设置使用的数据源
        factoryBean.setDataSource(dataSource);

        //设置xml文件中类所在的包
        factoryBean.setTypeAliasesPackage("com.tonyng.epidemic.beans");

        //为了让mybatis自动把下划线分割的类名转换为驼峰表示的属性名
        org.apache.ibatis.session.Configuration configuration=new org.apache.ibatis.session.Configuration();
        configuration.setMapUnderscoreToCamelCase(true);
        factoryBean.setConfiguration(configuration);

        //设置映射xml文件路径
        try {
            Resource[] resources=new PathMatchingResourcePatternResolver().getResources("classpath:com/tonyng/epidemic/mapper/*Mapper.xml");
            factoryBean.setMapperLocations(resources);
            factory=factoryBean.getObject();
        } catch (Exception e) {
            logger.error("解析映射xml文件时异常："+e.getMessage());
        }

        return factory;
    }
}
