/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletContext;
import javax.sql.DataSource;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 *
 * @author huynphu
 */
@Configuration
@EnableWebMvc
@ComponentScan("com.se313h21.j2eeweb.repositories")
@EnableJpaRepositories(basePackages = "com.se313h21.j2eeweb.repositories", entityManagerFactoryRef = "emf")
@EnableTransactionManagement
public class Config {
    
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = 
                (DriverManagerDataSource) ContextLoader.getCurrentWebApplicationContext().getBean("dataSource");
        return dataSource;
    }
    
    @Bean(name = "emf")
    public EntityManagerFactory entityManagerFactory() {

        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        vendorAdapter.setShowSql(false);
        vendorAdapter.setGenerateDdl(false);
        vendorAdapter.setDatabasePlatform("org.hibernate.dialect.MySQL5Dialect");

        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setJpaVendorAdapter(vendorAdapter);
        factory.setPackagesToScan("com.se313h21.j2eeweb.repositories");
        factory.setDataSource(dataSource());
        factory.setPersistenceUnitName("com.se313h21_j2eeweb_war_1.0-SNAPSHOTPU");
        factory.setPersistenceProvider(new HibernatePersistenceProvider());
        //factory.setBeanClassLoader(ClassLoader.getSystemClassLoader());
        factory.setJpaProperties(additionalProperties());
        factory.afterPropertiesSet();
        return factory.getObject();
    }
    
    @Bean
    public PlatformTransactionManager transactionManager() throws IOException {

        HibernateTransactionManager txManager = new HibernateTransactionManager();
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan("com.se313h21.j2eeweb.model");
        sessionFactory.setHibernateProperties(additionalProperties());
        sessionFactory.afterPropertiesSet();
        txManager.setSessionFactory(sessionFactory.getObject());
        return txManager;
    }
    
    Properties additionalProperties() {
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        properties.setProperty("hibernate.transaction.jta.platform", "org.hibernate.service.jta.platform.internal.SunOneJtaPlatform");
        properties.setProperty("hibernate.connection.isolation", "8");
//        properties.setProperty("connection.useUnicode", "yes");
//        properties.setProperty("connection.characterEncoding", "utf-8");
//        properties.setProperty("hibernate.transaction.factory_class", "org.hibernate.transaction.JTATransactionFactory" );
        return properties;
    }
}
