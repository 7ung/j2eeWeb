/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 *
 * @author Stevie
 */
@Configuration
@EnableWebMvc
@ComponentScan("com.se313h21.j2eeweb.repositories")
@EnableJpaRepositories(basePackages = "com.se313h21.j2eeweb.repositories", entityManagerFactoryRef = "emf")
@EnableTransactionManagement
public class Config  {

    @Bean
    public DataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource(
            "jdbc:mysql://localhost:3306/j2ee_db", "root", "0918280427");
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
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

//        JpaTransactionManager txManager = new JpaTransactionManager();
//        txManager.setEntityManagerFactory(entityManagerFactory());
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan("com.se313h21.j2eeweb.repositories");
        sessionFactory.setHibernateProperties(additionalProperties());
        sessionFactory.afterPropertiesSet();
        txManager.setSessionFactory(sessionFactory.getObject());
        return txManager;
    }

    Properties additionalProperties() {
        Properties properties = new Properties();
//        properties.setProperty("hibernate.hbm2ddl.auto", "create-drop");
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        return properties;
    }
    
}
