package com.poly.shop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.poly.shop.controller")
public class WebConfig implements WebMvcConfigurer {
    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resource = new InternalResourceViewResolver();
        resource.setPrefix("/WEB-INF/templates/");
        resource.setSuffix(".jsp");
        return resource;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("/resources/static/css/");
        registry.addResourceHandler("/js/**").addResourceLocations("/resources/static/js/");
        registry.addResourceHandler("/image/**").addResourceLocations("/resources/static/images/");
        registry.addResourceHandler("/plugins/**").addResourceLocations("/resources/static/plugins/");
        registry.addResourceHandler("/bootstrap/**").addResourceLocations("/resources/static/bootstrap/");
    }
}
