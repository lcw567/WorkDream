package com.cs.workdream.planner.service;

import com.cs.workdream.planner.model.vo.Planner;
import java.util.List;

public interface PlannerService {
    void addPlanner(Planner planner);
    List<Planner> getPlannersByUserNo(Long userNo);
    Planner getPlannerById(Long eventId);
    void updatePlanner(Planner planner);
    void deletePlanner(Long eventId);
}
