package com.helloworks.spring.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.helloworks.spring.member.model.vo.Member;

@Aspect
@Component
public class AfterRetuningAspect {

	private static final Logger logger = LoggerFactory.getLogger(AfterRetuningAspect.class);
	
	@AfterReturning(pointcut="execution(* com.helloworks.spring..*ServiceImpl.login*(..))", returning = "returnObj") // ~.login*(..) : pointcut을 로그인으로 시작하는 모든 메소드에 걸어줌
	public void loggerAdvice(JoinPoint joinpoint, Object returnObj) {
		
		if(returnObj instanceof Member) {
			Member m = (Member)returnObj;
				if(m.getUserId().equals("admin")) {
					logger.info("[log] : CEO님 환영합니다.");
				} else {
					logger.info("[log] : " + m.getUserId() + "로그인 성공 ~!!");
				}
		}
	}
}
