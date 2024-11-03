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
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class LogginAOP {
	// [ log cannot be resolbed ] 에러 해결법
	// 프로젝트에 포함된 Maven Dependaencies > lombok.jar 찾기 (Maven 3.9.9 기준 lombok-1.18.34.jar로 되어있음)
	// 우클릭 > Run As > Java Application
	// 인스톨 실행 > 설치 경로 설정 > Spring이 깔려있는 폴더의 STS.ini 파일 선택. (ex. sts-3.9.13.RELEASE/STS.ini)
	// 선택 후 STS와 이클립스 두 가지가 경로에 나타난다면 정상적으로 선택된 겁니다. (이클립스가 뜨지 않으면 따로 이클립스 설치 폴더 > ini 파일 추가)
	// 인스톨이 완료되면 Project > Clean 또는 Maven > Update Project 실행 (순서대로 둘 다 하는 것을 추천)
	// ※ 해당 오류는 소스를 새로 받을 때마다 랜덤하게 일어날 수 있으므로 해결 방법을 꼭 숙지해두세요.
	
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
		log.info("Parameter     :  " + Arrays.toString(args));
	}
	
	@AfterReturning(value = "cut()", returning = "obj")
	public void afterReturn(JoinPoint joinPoint, Object obj) {
		log.info("=============================END=================================");
		log.info("Object     :  " + obj);
	}
	
	@Around("cut()")
	public Object displayLogInfo(ProceedingJoinPoint pJoinPoint) throws Throwable {
		long start = System.currentTimeMillis();// 0
		
		Object result = pJoinPoint.proceed(); // 원래 해야되는 기능을 실행해준다.
		
		long end = System.currentTimeMillis(); // 10
		
		long pTime = end - start;
		
		log.info("-----------------------------------------------------------------");
		log.info("Information      : " + pJoinPoint.getSignature());
		log.info("Processing Time  : " + pTime + "ms");
		
		return result;
	}
}