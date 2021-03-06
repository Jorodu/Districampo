package com.boraji.tutorial.spring.config;

import com.boraji.tutorial.spring.service.UserDetailsServiceImp;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Bean
  public UserDetailsService userDetailsService() {
    return new UserDetailsServiceImp();
  }
  
  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  };
  
  @Bean
  public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
  }
  
  /*@Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
  }*/
  
  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception  {
      //auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
      auth.authenticationProvider(authenticationProvider());
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
      http
    .authorizeRequests().antMatchers("/views").hasAnyRole("ADMIN", "USER")
    .and()
    .authorizeRequests().antMatchers("/login", "/resource/**", "/views/home").permitAll()
    .and()
    .formLogin().loginPage("/login").usernameParameter("username").passwordParameter("password").permitAll()
    .loginProcessingUrl("/doLogin")
    .successForwardUrl("/postLogin")
    .failureUrl("/loginFailed")
    .and()
    .logout().logoutUrl("/doLogout").logoutSuccessUrl("/logout").permitAll()
    .and()
    .csrf().disable();      
  }
  
  @Override
  public void configure(WebSecurity web) throws Exception {
        web.ignoring()        
        .antMatchers("/resources/**");
        //.antMatchers("/**");
  }  
}
