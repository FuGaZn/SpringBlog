package com.fjx.blog.spring.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@MapperScan("com.fjx.blog.spring.mapper")
public class MyBatisConfig {

    @Autowired
    PropertiesConfig propertiesConfig;

    @Bean
    public DataSource dataSource(PropertiesConfig propertiesConfig) {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUsername(propertiesConfig.getUsername());
        dataSource.setPassword(propertiesConfig.getPassword());
        dataSource.setUrl(propertiesConfig.getUrl());
        dataSource.setDriverClassName(propertiesConfig.getDriver());
       // dataSource.setUsername("root");
      //  dataSource.setPassword("161250049");
       // dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/springblog");
       // dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        return dataSource;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception  {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource(propertiesConfig));
        return sessionFactory.getObject();
    }

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager(dataSource);
        return dataSourceTransactionManager;

    }


    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer = new PropertySourcesPlaceholderConfigurer();
        return propertySourcesPlaceholderConfigurer;
    }

}
