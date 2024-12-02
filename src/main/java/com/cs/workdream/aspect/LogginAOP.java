package com.cs.workdream.aspect;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class LogginAOP {
	
	@Pointcut("execution(* com.cs.workdream..controller.*.*(..) )")
	private void cut() {}
	
	@Before("cut()")
	public void before(JoinPoint joinPoint) {
		MethodSignature methodSignature = (MethodSignature)joinPoint.getSignature();
		java.lang.reflect.Method method = methodSignature.getMethod();
		
		Object[] args = joinPoint.getArgs();
		
		log.info("=============================START=================================");
		log.info("------------------------API Controller-----------------------------");
		log.info("Information     :  " + methodSignature);
		log.info("Method Name     :  " + method);
		log.info("Parameter     :  " + Arrays.toString(args) + "\n");
	}
	
	@AfterReturning(value = "cut()", returning = "obj")
	public void afterReturn(JoinPoint joinPoint, Object obj) {
		log.info("=============================END=================================");
		log.info("Object     :  " + obj + "\n");
	}
	
	@Around("cut()")
	public Object displayLogInfo(ProceedingJoinPoint pJoinPoint) throws Throwable {
		long start = System.currentTimeMillis();// 0
		
		Object result = pJoinPoint.proceed();
		
		long end = System.currentTimeMillis(); // 10
		
		long pTime = end - start;
		
		log.info("-----------------------------------------------------------------");
		log.info("Information      : " + pJoinPoint.getSignature());
		log.info("Processing Time  : " + pTime + "ms");
		
		return result;
	}
}