//package com.tuean.security;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@Configuration
//// @EnableWebSecurity = @EnableWebMVCSecurity + Extra features
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//	@Autowired
//	private AuthService authService;
//
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		//		// Users in memory.
//		//		auth.inMemoryAuthentication().withUser("user").password("123456").roles("USER");
//		//		auth.inMemoryAuthentication().withUser("admin").password("123456").roles("ADMIN");
//		//		auth.inMemoryAuthentication().withUser("root").password("123456").roles("ADMIN", "DBA");
//
//		// For User in database.
//		auth.userDetailsService(authService);
//	}
//
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		//		http.csrf().disable();
//		//
//		//		// The pages does not require login
//		//		http.authorizeRequests().antMatchers("/", "/home", "/login", "/logout").permitAll();
//		//
//		//		// For ADMIN only.
//		//		http.authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')");
//		//
//		//		// When the user has logged in as XX. But access a page that requires role YY,
//		//		// AccessDeniedException will throw.
//		//		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
//		//
//		//		// Config for Login Form
//		//		http.authorizeRequests().and().formLogin()//
//		//				.loginProcessingUrl("/j_spring_security_check")// Submit URL
//		//				.loginPage("/login")//
//		//				.defaultSuccessUrl("/")//
//		//				.usernameParameter("email").passwordParameter("password");
//	}
//
//}
