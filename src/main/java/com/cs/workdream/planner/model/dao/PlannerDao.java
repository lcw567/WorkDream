package com.cs.workdream.planner.model.dao;

import com.cs.workdream.planner.model.vo.Planner;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PlannerDao {

    // MyBatis 매퍼 XML의 네임스페이스 설정
    private static final String NAMESPACE = "com.cs.workdream.planner.model.dao.PlannerDao";

    @Autowired
    private SqlSession sqlSession;

    /**
     * 새로운 이벤트를 데이터베이스에 추가합니다.
     * @param planner 추가할 이벤트 정보
     */
    public void insertPlanner(Planner planner) {
        sqlSession.insert(NAMESPACE + ".insertPlanner", planner);
    }

    /**
     * 특정 사용자의 모든 활성화된 이벤트를 조회합니다.
     * @param userNo 사용자 번호
     * @return 사용자의 이벤트 리스트
     */
    public List<Planner> selectPlannersByUserNo(Long userNo) {
        return sqlSession.selectList(NAMESPACE + ".selectPlannersByUserNo", userNo);
    }

    /**
     * 특정 이벤트 ID에 해당하는 이벤트를 조회합니다.
     * @param eventId 이벤트 ID
     * @return 조회된 이벤트 정보
     */
    public Planner selectPlannerById(Long eventId) {
        return sqlSession.selectOne(NAMESPACE + ".selectPlannerById", eventId);
    }

    /**
     * 기존 이벤트 정보를 업데이트합니다.
     * @param planner 업데이트할 이벤트 정보
     */
    public void updatePlanner(Planner planner) {
        sqlSession.update(NAMESPACE + ".updatePlanner", planner);
    }

    /**
     * 특정 이벤트를 소프트 삭제(STATUS 변경)합니다.
     * @param eventId 삭제할 이벤트 ID
     */
    public void softDeletePlanner(Long eventId) {
        sqlSession.update(NAMESPACE + ".softDeletePlanner", eventId);
    }
}
