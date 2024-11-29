package com.cs.workdream.planner.service;

import com.cs.workdream.planner.model.dao.PlannerDao;
import com.cs.workdream.planner.model.vo.Planner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlannerServiceImpl implements PlannerService {

    private final PlannerDao plannerDao;

    @Autowired
    public PlannerServiceImpl(PlannerDao plannerDao) {
        this.plannerDao = plannerDao;
    }

    @Override
    public void addPlanner(Planner planner) {
        plannerDao.insertPlanner(planner);
    }

    @Override
    public List<Planner> getPlannersByUserNo(Long userNo) {
        return plannerDao.selectPlannersByUserNo(userNo);
    }

    @Override
    public Planner getPlannerById(Long eventId) {
        return plannerDao.selectPlannerById(eventId);
    }

    @Override
    public void updatePlanner(Planner planner) {
        plannerDao.updatePlanner(planner);
    }

    @Override
    public void deletePlanner(Long eventId) {
        plannerDao.softDeletePlanner(eventId);
    }
}
